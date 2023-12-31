Ashmal Anis 19K-0305
Sec:H
Task 1-5
---------------------------------------------------------------------------------------------------------------
Task#01: Write a query to list the name, job name, department name, salary of the employees according to the department in ascending order.

SELECT E.FIRST_NAME, E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.SALARY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;

---------------------------------------------------------------------------------------------------------------
Task#02: Write a query to list the department where at least two employees are working.

SELECT COUNT(E.EMPLOYEE_ID) AS "NUM OF EMPLOYEES", D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID)>=2;

---------------------------------------------------------------------------------------------------------------
Task#03: Fetch all the records where salary of employee is less than the lower salary.

SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.JOB_ID
FROM EMPLOYEES E1, JOBS J
WHERE E1.JOB_ID = J.JOB_ID AND E1.SALARY < J.MIN_SALARY;

---------------------------------------------------------------------------------------------------------------
Task#04: Write a query to list the name, job name, annual salary, department id, department name and city who
earn 60000 in a year or not working as an ANALYST.

SELECT E.FIRST_NAME, E.LAST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY * 12 AS "ANNUAL SALARY", E.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID AND E.JOB_ID= J.JOB_ID
AND ((E.SALARY*12) = 60000 OR J.JOB_TITLE <> 'Analyst');

---------------------------------------------------------------------------------------------------------------
Task#05 Write a query to print details of the employees who are also Managers.

SELECT DISTINCT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, E1.JOB_ID, E1.DEPARTMENT_ID
FROM EMPLOYEES E1, EMPLOYEES E2 WHERE E2.MANAGER_ID = E1.EMPLOYEE_ID;

---------------------------------------------------------------------------------------------------------------

Task#06: List department number, Department name for all the departments in which there are no employees in the department.

SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID= D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID)=0;
------------------------------------------------------------------------------------

Task#07: Display employee name, salary, department name where all employees has matching department as well as employee does not have any
departments.

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS "EMPLOYEE NAME", E.SALARY, D.DEPARTMENT_NAME 
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

------------------------------------------------------------------------------------
Task#08: Display name, job ID, department name, street address and city of the employee in which there is no state province.

SELECT E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.STREET_ADDRESS, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID
AND L.STATE_PROVINCE IS NULL;
------------------------------------------------------------------------------------

Task#09: Write an SQL query to show records from one table that another table does not have.

SELECT LOCATION_ID FROM LOCATIONS MINUS SELECT LOCATION_ID FROM DEPARTMENTS;
--Another possibility
SELECT LOCATION_ID FROM DEPARTMENTS MINUS SELECT LOCATION_ID FROM LOCATIONS;

------------------------------------------------------------------------------------

Task#10: Display all employees who belong to country US but not belongs to state province Washington.

SELECT E.FIRST_NAME, E.LAST_NAME, L.STATE_PROVINCE, L.COUNTRY_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = 'US' AND L.STATE_PROVINCE <> 'Washington';
------------------------------------------------------------------------------------