-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (__emp_no____) ___emp_no__,
___first_name___,
___last_name___,
__birthdate____

INTO emp_tab_csv
FROM ___emloyees____
ORDER BY _____, _____ DESC;

DELIVERABLE 1

SELECT sp.emp_no, sp.first_name, sp.last_name, st.title, st.from_date, st.to_date
INTO retirement_titles
FROM employees as sp
INNER JOIN sub_titles as st
ON sp.emp_no = st.emp_no
WHERE sp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY sp.emp_no ASC;

SELECT DISTINCT ON(emp_no) emp_no, first_name, last_name, title 
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT(*), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

DELIVERABLE 2

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date 
INTO dist_emp
FROM employees
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31';

SELECT DISTINCT ON (emp_no) emp_no, from_date, to_date 
INTO dist_de
FROM dept_emp
WHERE to_date = '9999-01-01';

SELECT DISTINCT ON (emp_no) emp_no, title 
INTO dist_titl
FROM titles;

SELECT di.emp_no, di.first_name, di.last_name, di.birth_date, de.from_date, de.to_date 
INTO dst_emp_de
FROM dist_emp as di
INNER JOIN dist_de as de
ON di.emp_no = de.emp_no;

SELECT ded.emp_no, ded.first_name, ded.last_name, ded.birth_date, ded.from_date, ded.to_date, dt.title 
INTO ment_elig
FROM dist_titl as dt
INNER JOIN dst_emp_de as ded
ON dt.emp_no = ded.emp_no
ORDER BY emp_no ASC;
