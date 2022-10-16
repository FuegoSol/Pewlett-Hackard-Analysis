-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______

--INTO nameyourtable
--FROM _______
--WHERE _______
--ORDER BY _____, _____ DESC;



-- Deliverable 1: Retiring Employees by Title


-- Retrieve Employee.emp_no, firse_name, and last_name
-- titles.titles, from_date, and to_date

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.titles,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no;

-- Remove duplicates and keep only most recent title for each employee
-- exclude employees that have already left the company by filtering to_date = 9999-01-01
-- export to unique_titles.csv

SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	titles,
	from_date,
	to_date
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC;

SELECT COUNT (titles)
	titles
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.titles
ORDER BY COUNT(titles) DESC;


--Deliverable 2: Mentorship



SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.titles
	
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
RIGHT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
























