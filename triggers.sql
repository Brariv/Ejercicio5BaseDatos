CREATE OR REPLACE FUNCTION delete_wishlist() RETURNS trigger AS
$$BEGIN
   DELETE FROM users_wishlisted WHERE users_wishlisted = OLD.id;
   RETURN NULL;
END;$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_wishlists
   BEFORE DELETE ON users FOR EACH ROW
   EXECUTE PROCEDURE delete_wishlist();

