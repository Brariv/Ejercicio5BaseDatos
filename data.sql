INSERT INTO cart (total_price) VALUES
(80.29), (57.49), (85.75), (60.60), (48.99),
(75.28), (59.97), (34.90), (66.50), (67.19),
(64.58), (53.00), (76.50), (55.60), (64.74),
(63.28), (49.98), (34.90), (44.10), (74.18),
(55.27), (42.48), (50.60), (60.00), (48.00),
(67.00), (50.00), (45.00), (52.50), (78.20);

INSERT INTO users (username, password_with_salt, cart_id, role) VALUES
('ana_artesana', 'hashed_pass_1',  1, 'Buyer'),
('carlos_creativo', 'hashed_pass_2',  2, 'Buyer'),
('diana_diy', 'hashed_pass_3',  3, 'Buyer'),
('pablo_pintor', 'hashed_pass_4',  4, 'Buyer'),
('lucia_luces', 'hashed_pass_5',  5, 'Buyer'),
('miguel_manos', 'hashed_pass_6',  6, 'Buyer'),
('sofia_scrap', 'hashed_pass_7',  7, 'Buyer'),
('raul_retro', 'hashed_pass_8',  8, 'Buyer'),
('elena_estilo', 'hashed_pass_9',  9, 'Buyer'),
('jorge_jardin', 'hashed_pass_10',  10, 'Buyer');

INSERT INTO users (username, password_with_salt, cart_id, role) VALUES
('vendedor_arte1', 'hashed_seller_1', 11, 'Seller'),
('vendedor_arte2', 'hashed_seller_2', 12, 'Seller'),
('vendedor_arte3', 'hashed_seller_3', 13, 'Seller'),
('vendedor_arte4', 'hashed_seller_4', 14, 'Seller'),
('vendedor_arte5', 'hashed_seller_5', 15, 'Seller');

INSERT INTO products (name, price, stock, description, seller_id) VALUES
('Kit de bordado floral', 25.99, 10, 'Incluye hilos, agujas y telas con patrones florales.', 11),
('Set de acuarelas artesanales', 18.50, 20, 'Acuarelas hechas a mano con pigmentos naturales.', 12),
('Velas aromáticas DIY', 15.00, 30, 'Kit para hacer velas aromáticas.', 13),
('Pintura en cerámica', 22.00, 8, 'Decora cerámica desde casa.', 14),
('Macramé para principiantes', 12.75, 15, 'Todo lo necesario para macramé.', 15),
('Papel reciclado artesanal', 9.99, 50, 'Paquete de papeles ecológicos.', 11),
('Caja de scrapbooking vintage', 19.99, 25, 'Recortes, stickers y cintas.', 12),
('Tintes naturales para tela', 17.45, 18, 'Kit para teñido natural.', 13),
('Pulseras de cuentas DIY', 14.25, 35, 'Cuentas y elásticos para pulseras.', 14),
('Pinturas acrílicas artesanales', 21.99, 12, 'Pinturas artesanales para arte.', 15),
('Tejido con agujas circulares', 28.30, 5, 'Para comenzar a tejer.', 11),
('Mini telar de madera', 26.50, 7, 'Telar portátil.', 12),
('Letras de madera para decorar', 11.00, 40, 'Letras decorativas.', 13),
('Cuerdas teñidas artesanalmente', 16.60, 22, 'Cuerdas de algodón únicas.', 14),
('Kit de origami avanzado', 13.40, 45, 'Papeles especiales y guías.', 15);


INSERT INTO product_cart (product_id, cart_id, quantity) VALUES
(1, 1, 2), (2, 2, 1), (3, 3, 1), (4, 4, 2), (5, 5, 1),
(6, 6, 3), (7, 7, 2), (8, 8, 1), (9, 9, 2), (10, 10, 1),
(11, 11, 1), (12, 12, 2), (13, 13, 3), (14, 14, 1), (15, 15, 2),
(1, 16, 1), (2, 17, 2), (3, 18, 1), (4, 19, 1), (5, 20, 3),
(6, 21, 1), (7, 22, 1), (8, 23, 2), (9, 24, 3), (10, 25, 1),
(11, 26, 1), (12, 27, 2), (13, 28, 1), (14, 29, 1), (15, 30, 3);

INSERT INTO cart (total_price) VALUES
(80.29), (57.49), (85.75), (60.60), (48.99),
(75.28), (59.97), (34.90), (66.50), (67.19),
(64.58), (53.00), (76.50), (55.60), (64.74),
(63.28), (49.98), (34.90), (44.10), (74.18),
(55.27), (42.48), (50.60), (60.00), (48.00),
(67.00), (50.00), (45.00), (52.50), (78.20);

INSERT INTO sale (cart_id, sale_state, total_price) VALUES
(1, 'Payed', 80.29),
(2, 'Pending', 57.49),
(3, 'Payed', 85.75),
(4, 'Payed', 60.60),
(5, 'Pending', 48.99),
(6, 'Payed', 75.28),
(7, 'Payed', 59.97),
(8, 'Pending', 34.90),
(9, 'Payed', 66.50),
(10, 'Payed', 67.19),
(11, 'Payed', 64.58),
(12, 'Pending', 53.00),
(13, 'Payed', 76.50),
(14, 'Payed', 55.60),
(15, 'Payed', 64.74),
(16, 'Payed', 63.28),
(17, 'Pending', 49.98),
(18, 'Payed', 34.90),
(19, 'Payed', 44.10),
(20, 'Payed', 74.18),
(21, 'Pending', 55.27),
(22, 'Payed', 42.48),
(23, 'Payed', 50.60),
(24, 'Payed', 60.00),
(25, 'Pending', 48.00),
(26, 'Payed', 67.00),
(27, 'Pending', 50.00),
(28, 'Payed', 45.00),
(29, 'Pending', 52.50),
(30, 'Payed', 78.20);

INSERT INTO users_wishlisted (product_id, user_id) VALUES
(1,3), (1,4), (1,5);

