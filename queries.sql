CREATE TABLE MEAL_ORDER (
  ID INT AUTO_INCREMENT,
  NAME VARCHAR(255),
  PRICE DOUBLE,
  CALORIES INT,
  TIME_ORDERED_MEAL TIMESTAMP,
  PRIMARY KEY(ID)
);

INSERT INTO MEAL_ORDER(NAME, PRICE, CALORIES, TIME_ORDERED_MEAL)
VALUES ('Spaghetti alla bolognese', 12.99, 600, NOW()),
('Grilled Chicken Sandwich', 8.99, 400, NOW()),
('Pasta al pesto', 10.99, 550, NOW()),
('Steak and Mash', 19.99, 800, NOW()),
('Sushi Platter', 15.99, 700, NOW()),
('Spaghetti alla bolognese', 12.99, 600, DATE_ADD(NOW(), INTERVAL 2 HOUR)),
('Sushi Platter', 15.99, 700, DATE_ADD(NOW(), INTERVAL 2 HOUR)),
('Sushi Platter', 15.99, 700, DATE_ADD(NOW(), INTERVAL 3 HOUR)),
('Pasta al pesto', 10.99, 550, DATE_ADD(NOW(), INTERVAL 3 HOUR));


1.
SELECT NAME, COUNT(*) AS number_of_orders
FROM MEAL_ORDER
GROUP BY NAME;

2.
SELECT NAME, PRICE, SUM(PRICE)
FROM MEAL_ORDER
WHERE PRICE > 15;

3.
SELECT NAME, CALORIES, COUNT(*) AS meal_lot_calories
FROM MEAL_ORDER
WHERE CALORIES > 500
GROUP BY NAME;

4.
SELECT SUM(PRICE) AS TOTAL_WITH_S
FROM MEAL_ORDER
WHERE NAME LIKE '%S%';

5.
SELECT *
FROM MEAL_ORDER
WHERE LOWER(NAME) LIKE '%s%';

6.
SELECT NAME, COUNT(*) AS ORDER_BEFORE_18
FROM MEAL_ORDER
WHERE TIME_ORDERED_MEAL < '2023-07-31 18:00:00'
GROUP BY NAME
ORDER BY TIME_ORDERED_MEAL DESC;