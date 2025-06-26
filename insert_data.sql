-- Insert departments
INSERT INTO departments (department_id, department_name, manager_name) VALUES
(1, 'Finance', 'Alice Smith'),
(2, 'HR', 'Brian Lee'),
(3, 'Sales', 'Chloe Chen'),
(4, 'IT', 'David White');

-- Insert employees
INSERT INTO employees (employee_id, name, department_id, salary, hire_date) VALUES
(1, 'Alice', 3, 55876.00, '2022-05-10'),
(2, 'Bob', 2, 37274.00, '2018-03-07'),
(3, 'Charlie', 3, 76570.00, '2024-05-09'),
(4, 'Diana', 3, 73335.00, '2019-01-12'),
(5, 'Ethan', 2, 67932.00, '2024-05-28'),
(6, 'Fiona', 4, 55819.00, '2024-04-11'),
(7, 'George', 2, 78976.00, '2024-05-19'),
(8, 'Hannah', 4, 76318.00, '2020-07-27'),
(9, 'Ian', 4, 87682.00, '2022-03-17'),
(10, 'Jade', 3, 63714.00, '2020-09-22'),
(11, 'Kunal', 3, 74575.00, '2020-06-19'),
(12, 'Lily', 2, 86196.00, '2021-01-16'),
(13, 'Mona', 1, 75451.00, '2021-11-12'),
(14, 'Nikhil', 2, 42942.00, '2022-07-12'),
(15, 'Olivia', 2, 80245.00, '2018-02-12'),
(16, 'Priya', 2, 70547.00, '2019-09-06'),
(17, 'Quincy', 3, 60003.00, '2018-03-18'),
(18, 'Ravi', 1, 56278.00, '2020-04-13'),
(19, 'Sophia', 3, 72952.00, '2023-05-15'),
(20, 'Tanmay', 4, 49836.00, '2020-05-01');

-- Insert performance reviews
INSERT INTO performance_reviews (review_id, employee_id, review_date, rating, bonus_amount) VALUES
(1, 1, '2022-02-03', 3.6, 2638),
(2, 1, '2022-09-10', 3.6, 4300),
(3, 2, '2023-06-15', 4.5, 4648),
(4, 2, '2019-09-25', 3.1, 1765),
(5, 2, '2021-06-08', 4.7, 4877);
