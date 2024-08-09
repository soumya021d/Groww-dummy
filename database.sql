CREATE TABLE portfolio (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  quantity INT,
  value NUMERIC
);

INSERT INTO portfolio (name, quantity, value) VALUES
('Stock A', 10, 1500.00),
('Stock B', 5, 3000.00),
('Stock C', 20, 1000.00);
