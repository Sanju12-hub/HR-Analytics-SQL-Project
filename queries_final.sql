-- ==================== BASIC QUERIES ====================
-- Fetch all employees
SELECT * FROM employees;

-- Fetch all departments
SELECT * FROM departments;

-- Fetch employees with salary greater than average salary
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Fetch employees who work in the same department as Alice
SELECT name
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE name='Alice');

-- Fetch top paid employee per department
WITH dept_salary_rank AS (
    SELECT e.*, RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM employees e
)
SELECT employee_id, name, salary, department_id
FROM dept_salary_rank
WHERE rnk = 1;

-- Fetch employees hired per year
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS num_employees
FROM employees
GROUP BY hire_year
ORDER BY hire_year DESC;

-- ==================== JOINS ====================
-- Fetch employee name & their department name
SELECT e.name, d.department_name
FROM employees e
JOIN departments d USING (department_id);

-- Fetch employees who never had a performance review
SELECT e.name
FROM employees e
LEFT JOIN performance_reviews p USING (employee_id)
WHERE p.review_id IS NULL;

-- Fetch average rating per department
SELECT d.department_name, AVG(p.rating) AS avg_rating
FROM performance_reviews p
JOIN employees e USING (employee_id)
JOIN departments d USING (department_id)
GROUP BY d.department_name;

-- ==================== WINDOW FUNCTIONS ====================
-- Fetch cumulative bonus per employee
SELECT e.name, p.bonus_amount,
       SUM(p.bonus_amount) OVER (PARTITION BY e.employee_id ORDER BY p.review_date) AS cumulative_bonus
FROM employees e
JOIN performance_reviews p USING (employee_id);

-- ==================== VIEWS ====================
-- Fetch top performers (using the view created earlier)
create or replace view Top_Performers as
select e.*, p.rating, p.bonus_amount from employees e
join performance_reviews p using (employee_id)
where rating = 5;
-- SELECT * FROM Top_Performers;

-- ==================== TRIGGERS & PROCEDURES ====================
-- Call the Extra_bonus procedure to apply bonus updates
CALL Extra_bonus();

