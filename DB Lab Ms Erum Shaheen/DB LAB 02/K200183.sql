-- TASK 01
select employee_id from EMPLOYEES;
SELECT FIRST_NAME FROM EMPLOYEES;
-- TASK 02
SELECT HIRE_DATE AS JOINING_DATE FROM EMPLOYEES ;
-- TASK 03
SELECT FIRST_NAME||' '||LAST_NAME AS FULL_NAME FROM EMPLOYEES;
--TASK 04
SELECT * FROM EMPLOYEES WHERE SALARY>20000 AND SALARY<30000;

-- Task 05
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID>=60 AND DEPARTMENT_ID<=100;

-- TASK 06
SELECT * FROM LOCATIONS WHERE CITY='Toronto' OR CITY='Hiroshima' OR CITY='Sydney'; 

-- Task 07

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%ll%';

-- Task 08

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT=NULL;

-- TASK 09

SELECT * FROM EMPLOYEES ORDER BY SALARY desc;

-- Task 10

SELECT INITCAP(FIRST_NAME)||' '||INITCAP(LAST_NAME) AS "Name" ,LOWER(JOB_ID) AS "Job Title"  FROM EMPLOYEES;

-- Task 11

SELECT FIRST_NAME||' '||LAST_NAME||' '||JOB_ID AS "Name and Job Title", LENGTH(FIRST_NAME)+LENGTH(LAST_NAME)+1 AS "Length of Employee Name", INSTR(FIRST_NAME,'A') AS "Position of letter A" FROM EMPLOYEES WHERE DEPARTMENT_ID=80;

-- Task 12

SELECT EMPLOYEE_ID AS "Employee ID", HIRE_DATE AS "Hire Date", EXTRACT(MONTH FROM HIRE_DATE) AS "Month Started" FROM EMPLOYEES WHERE EXTRACT(YEAR FROM HIRE_DATE)>=2003;

-- Task 13

SELECT EMPLOYEE_ID AS "EMPLOYEE NUMBER", EXTRACT(MONTH FROM HIRE_DATE) AS "MONTH NUMBER", EXTRACT(YEAR FROM HIRE_DATE) AS "YEAR OF HIRING" FROM EMPLOYEES;

-- Task 14

SELECT first_name||' '||last_name AS "EMPLOYEE NAME", TO_CHAR(HIRE_DATE,'DD MONTH, YYYY') AS "HIRE DATE" FROM EMPLOYEES;

-- TASK 15

SELECT first_name||' '||last_name AS "EMPLOYEE NAME", TO_CHAR(SALARY, '$99999') FROM EMPLOYEES WHERE FIRST_NAME='Neena';

-- Task 16

SELECT NEXT_DAY(sysdate, 'Monday') FROM EMPLOYEES;

-- Task 17

SELECT * FROM EMPLOYEES WHERE INSTR(LAST_NAME,'A')>0;
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%A%';

-- Task 18

SELECT FIRST_NAME AS "First Name", SUBSTR(FIRST_NAME,LENGTH(FIRST_NAME)-2,LENGTH(FIRST_NAME)) AS "LAST 3 LETTERS FROM FIRST NAME" FROM EMPLOYEES;

-- Task 19

SELECT * FROM EMPLOYEES WHERE MONTHS_BETWEEN(sysdate,HIRE_DATE)>100;

-- Task 20

SELECT EMPLOYEE_ID AS "EMPLOYEE ID", FIRST_NAME|| ' '||LAST_NAME AS "EMPLOYEE NAME", SALARY AS "SALARY BEFORE INCREMENT", SALARY+SALARY*(.15) AS "SALARY AFTER INCREMENT", (SALARY+SALARY*(.15))-SALARY AS "INCREMENT AMOUNT"  FROM EMPLOYEES;

-- Task 21

SELECT FIRST_NAME|| ' '||LAST_NAME AS "EMPLOYEE NAME", HIRE_DATE AS "HIRE DATE", TO_CHAR(HIRE_DATE,'DAY') AS "DAY OF HIRE" FROM EMPLOYEES ORDER BY TO_CHAR(HIRE_DATE-1,'D');

-- Task 22

SELECT DEPARTMENT_ID AS "DEPARTMENT ID", MANAGER_ID AS "MANAGER ID", ROUND(COMMISSION_PCT,1) AS COMMISSION FROM EMPLOYEES ORDER BY COMMISSION ASC;

-- Task 23

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT>0 AND (DEPARTMENT_ID!=90 OR DEPARTMENT_ID!=100);

-- Task 24

SELECT * FROM EMPLOYEES WHERE EXTRACT(YEAR FROM HIRE_DATE)=2010;

-- Task 25
SELECT * FROM JOBS;
SELECT * FROM JOBS WHERE MIN_SALARY>8000 AND MAX_SALARY<15000 ;

-- Task 26

SELECT FIRST_NAME AS "FIRST NAME", LAST_NAME AS "LAST NAME", JOB_ID AS "JOB ID" FROM EMPLOYEES WHERE (EMPLOYEE_ID BETWEEN 100 AND 150) AND (DEPARTMENT_ID BETWEEN 90 AND 100);

-- Task 27

SELECT FIRST_NAME|| ' '||LAST_NAME AS "EMPLOYEE NAME", SALARY AS "SALARY", COMMISSION_PCT AS "COMMISSION", SALARY+(SALARY*COMMISSION_PCT) AS "TOTAL SALARY" FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL ;