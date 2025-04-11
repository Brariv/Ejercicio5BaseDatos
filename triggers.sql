--Find the syntaxis in a stackoverdflow forum

-- Pretty straight foward ngl
CREATE OR REPLACE FUNCTION delete_wishlist() RETURNS trigger AS
$$
BEGIN
   DELETE FROM users_wishlisted WHERE user_id = OLD.id;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- for user delete
CREATE OR REPLACE FUNCTION delete_product() RETURNS trigger AS
$$
BEGIN
   DELETE FROM products WHERE seller_id = OLD.id;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- 
CREATE OR REPLACE FUNCTION check_stock() RETURNS trigger AS
$$
BEGIN
   IF (SELECT stock FROM products WHERE id = NEW.product_id) < NEW.quantity THEN
       RAISE EXCEPTION 'Not enough stock for product ID %', NEW.product_id;
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_product_stock() RETURNS trigger AS
$$
BEGIN
   UPDATE products
   SET stock = stock - NEW.quantity
   WHERE id = NEW.product_id;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION check_individual_stock() RETURNS trigger AS
$$
BEGIN
   IF NEW.stock < 0 THEN
       RAISE EXCEPTION 'Cannot set stock to negative value for product ID %', NEW.id;
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Made for when u change from seller to buyer
CREATE OR REPLACE FUNCTION delete_products_on_sale() RETURNS trigger AS
$$
BEGIN
   IF NEW.sale_state = 'Payed' THEN
       DELETE FROM products
       WHERE seller_id IN (
           SELECT u.id
           FROM users u
           JOIN cart c ON c.id = NEW.cart_id
           WHERE u.cart_id = c.id
       );
   END IF;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- When you delete a user that is a buyer, all their wishlists are deleted
CREATE OR REPLACE FUNCTION delete_wishlist() RETURNS trigger AS
$$
BEGIN
   IF OLD.role = 'Buyer' THEN
       DELETE FROM users_wishlisted
       WHERE user_id = OLD.id;
   END IF;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- When you delete a user that is a seller, all their products are deleted
CREATE OR REPLACE FUNCTION delete_product() RETURNS trigger AS
$$
BEGIN
   IF OLD.role = 'Seller' THEN
       DELETE FROM products
       WHERE seller_id = OLD.id;
   END IF;
   RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- DELETE TRIGGERS

CREATE TRIGGER delete_wishlists
BEFORE DELETE ON users
FOR EACH ROW
EXECUTE PROCEDURE delete_wishlist();

CREATE TRIGGER delete_products
AFTER DELETE ON users
FOR EACH ROW
EXECUTE PROCEDURE delete_product();

-- INSERT TRIGGERS

CREATE TRIGGER check_stocks
BEFORE INSERT ON product_cart
FOR EACH ROW
EXECUTE PROCEDURE check_stock();

CREATE TRIGGER change_product_stocks
AFTER INSERT ON product_cart
FOR EACH ROW
EXECUTE PROCEDURE change_product_stock();

-- UPDATE TRIGGERS

CREATE TRIGGER update_stocks
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE PROCEDURE check_individual_stock();


CREATE TRIGGER rol_change
AFTER UPDATE ON sale
FOR EACH ROW
EXECUTE PROCEDURE delete_products_on_sale();


-- TRUNCATE TRIGGERS
CREATE TRIGGER truncate_wishlists
BEFORE TRUNCATE ON users
FOR EACH ROW
EXECUTE PROCEDURE delete_wishlist();

CREATE TRIGGER truncate_products
BEFORE TRUNCATE ON users
FOR EACH ROW
EXECUTE PROCEDURE delete_product();
