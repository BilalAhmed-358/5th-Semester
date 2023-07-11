Lab#02 Tasks
Ashmal Anis 19K-0305 Sec: H

1) Print an employee name (first letter capital) and job title (lower Case)
SELECT INITCAP(FIRST_NAME), LOWER(JOB_TITLE) FROM EMPLOYEES, JOBS;
------------
2) Display employee name and job title together, length of employee name and the numeric position of letter A in employee name, for all employees who are in sales.
SELECT FIRST_NAME || '-' || JOB_TITLE AS NAME_DESIGNATION, LENGTH(FIRST_NAME) AS LENGTH , instr(FIRST_NAME, 'a') AS OCCURRENCE  FROM EMPLOYEES, JOBS;
------------
3) For all employees employed for more than 100 months, display the employee number, hire date, number of months employed, first Friday after hire date and last day of the month hired.
SELECT EMPLOYEE_ID, HIRE_DATE, ABS(MONTHS_BETWEEN(START_DATE,END_DATE)) AS MONTHS_EMPLOYEED, 
NEXT_DAY(HIRE_DATE, 'FRIDAY') AS FIRST_FRIDAY, LAST_DAY(HIRE_DATE) AS LAST_DAY FROM EMPLOYEES, JOB_HISTORY
WHERE ABS(MONTHS_BETWEEN(START_DATE,END_DATE))>100;
------------
4) Comparing the hire dates for all employees who started in 2003, display the employee number, hire date, and month started using the conversion and date functions.
SELECT EMPLOYEE_ID, TO_DATE(HIRE_DATE) AS HIRE_DATE, EXTRACT(MONTH FROM HIRE_DATE) FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2003;
------------
5) To display the employee number, the month number and year of hiring.
SELECT EMPLOYEE_ID, EXTRACT(MONTH FROM HIRE_DATE) AS MONTH_HIRED, EXTRACT(YEAR FROM HIRE_DATE) AS YEAR_HIRED FROM EMPLOYEES;
------------
6) To display the employee’s name and hire date for all employees. The hire date appears as 16 September, 2021.
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE = '16-SEP-21';
------------
7) Display the salary of employee STEVEN with $ sign preceded.
SELECT TO_CHAR(SALARY,'$99999') AS SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Steven';
------------
8) Find the next ‘Monday’ considering today’s date as date.
SELECT NEXT_DAY(SYSDATE,'Monday') FROM DUAL;
------------
9) List all Employees who have an ‘A’ in their last names.
SELECT * FROM EMPLOYEES WHERE LOWER(LAST_NAME) LIKE '%a%';  --to check both 'A' and 'a' in last name
------------
10) Show all employees’ last three letters of first name.
SELECT FIRST_NAME, SUBSTR(FIRST_NAME,-3,3) AS LAST_INITIALS FROM EMPLOYEES;
------------
11) To display the employee number, name, salary of employee before and after 15% increment in the yearly salary. Name the calculated new salary as “Incremented
Salary”. Do calculate the difference between before and after salaries & name this amount as “Incremented Amount”.

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY AS SALARY_BEFORE, SALARY*0.15+SALARY AS INCREMENTED_SALARY,
(SALARY+(SALARY*0.15)) - SALARY  AS INCREMENTED_AMOUNT FROM EMPLOYEES; 
------------
12) List the name, hire date, and day of the week (labeled DAY) on which job was started. Order the result by day of week starting with Monday.
SELECT FIRST_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE, 'DY') as HIRE_DAY FROM EMPLOYEES ORDER BY TO_CHAR(HIRE_DATE-1, 'D') ASC;
------------
13) Display the department and manager id wise avg commission for all employees. Round the commission up to 1 decimals.
SELECT AVG(ROUND(COMMISSION_PCT,1)) AS AVG_COMMISSION, DEPARTMENT_ID, MANAGER_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID, MANAGER_ID;