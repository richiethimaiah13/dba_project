-- Insert sample users
INSERT INTO users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('admin', 'admin@example.com');

-- Insert sample products
INSERT INTO products (name, price, stock_quantity, category) VALUES
('Laptop', 999.99, 10, 'Electronics'),
('Smartphone', 699.99, 15, 'Electronics'),
('Desk Chair', 199.99, 5, 'Furniture');

-- Insert sample orders
INSERT INTO orders (user_id, status) VALUES
(1, 'completed'),
(2, 'pending'),
(1, 'shipped');

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 999.99),
(1, 3, 2, 199.99),
(2, 2, 1, 699.99);
