Ashmal Anis 
19k-0305 Sec:H Lab 03

Task#01: Create a new user using SQL command Line and grant privileges. We are using this user to
create our own database with related tables, which we are working on in lab#03.
------------------------------------------------

Task#02: Create table Jobs and job_History (ignore foreign keys relations) same fields as given in HR
Schema in which job_ID is considered as primary key in jobs table.

CREATE TABLE JOBS(
    JOB_ID VARCHAR2(10) PRIMARY_KEY,
    JOB_TITLE VARCHAR2(35) NOT NULL,
    MIN_SALARY NUMBER(6),
    MAX_SALARY NUMBER(6)
);

CREATE TABLE JOB_HISTORY(
    EMPLOYEE_ID NUMBER PRIMARY KEY,
    START_DATE DATE NOT NULL,
    CONSTRAINT CHECK_START_DATE CHECK(START_DATE < END_DATE),
    CONSTRAINT CHECK_LAST_DATE CHECK(END_DATE > START_DATE),
    JOB_ID, VARCHAR2(10) NOT NULL,
    DEPARTMENT_ID NUMBER(4)
);
------------------------------------------------

Task#03: Change the data type of ‘job_ID’ from character to numeric in Jobs table.(Like IT_Prog-&gt;101).

ALTER TABLE JOBS MODIFY JOB_ID NUMBER;
DESC JOBS;
------------------------------------------------

Task#04: Write a SQL statement to add job_id column in job_history table as foreign key referencing to the primary key job_id of jobs table.

--since we know datatype in jobs of job_id has been modified, modify it in job history too.
ALTER TABLE JOB_HISTORY MODIFY JOB_ID NUMBER;
ALTER TABLE JOB_HISTORY ADD FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID);
DESC JOB_HISTORY;
------------------------------------------------
Task#05: Insert a new row in jobs table having all the attributes and the job_ID should update in job_History table as well.

INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES (1001, 'MANAGER', 10000,50000);

INSERT INTO JOB_HISTORY(EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
VALUES (2001, '13-SEP-16', '22-SEP-21',1001, 90);

SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
------------------------------------------------
Task#06: Add Column Job_Nature in Jobs table.

ALTER TABLE JOBS ADD JOB_NATURE VARCHAR2(20);
DESC JOBS;

------------------------------------------------
Task#07: Create replica of employee table.

CREATE TABLE EMPLOYEES AS SELECT * FROM hr.EMPLOYEES WHERE 1=2;
SELECT * FROM EMPLOYEES;

---------------------------------------

Task#08: Write a SQL statement to add employee_id column in job_history table as foreign key 
referencing to the primary key employee_id of employees table.

ALTER TABLE JOB_HISTORY ADD FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID);
---------------------------------------

Task#09: Drop column Job_Nature.

ALTER TABLE JOBS DROP COLUMN JOB_NATURE;
----------------------------------------

Task#10: ALTER table EMPLOYEE created in question 5 and apply the constraint CHECK on
First_Name attribute such that ENAME should always be inserted in capital letters.

ALTER TABLE EMPLOYEE
ADD CONSTRAINT ENAME CHECK (FIRST_NAME = UPPER(FIRST_NAME));

DESC EMPLOYEE;
----------------------------------------

Task#11: ALTER table EMPLOYEE created in question 5 and apply the constraint on SALary attribute
such that no two salaries of the employees should be similar.(Hint Unique)

ALTER TABLE EMPLOYEE ADD CONSTRAINT UNIQUE_SAL UNIQUE(SALARY);
----------------------------------------

Task#12: ALTER table Employee created in question 5 and apply constraint on Phone_No such that Phone_No should not be entered empty (Hint modify).

ALTER TABLE EMPLOYEE MODIFY PHONE_NUMBER VARCHAR2(20) NOT NULL;
----------------------------------------

Task#13: Write a SQL statement to insert one row into the table employees.

INSERT INTO EMPLOYEE
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) 
VALUES(0305, 'ASHMAL','VAYANI','k190305@nu.edu.pk','+923130211111','12-SEP-21',1001,75000,10,90,105);

SELECT * FROM EMPLOYEE;
----------------------------------------

Task#14: Write a SQL statement to change the salary of employee to 8000 who’s ID is 105, if the existing salary is less than 1+000.

UPDATE EMPLOYEE SET SALARY = 8000 WHERE (EMPLOYEE_ID=105 AND SALARY < 1000);
----------------------------------------

Task#15: Write a SQL statement to add a primary key for a combination of columns employee_id and
job_id in employees table, give the reason why this command is showing error.

ALTER TABLE EMPLOYEE
ADD CONSTRAINT PRIMARY_KEY PRIMARY KEY(EMPLOYEE_ID, JOB_ID);

Error: A table can have only one primary key, in this case we are trying to make a composite key but there already exists a primary key
in employee table, we can not just directly add new key without deleting existing one.
----------------------------------------

Task#16: Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.

CREATE INDEX indx_job_id ON JOB_HISTORY (JOB_ID);
----------------------------------------

Task#17: Write a SQL statement to remove employees table.

DROP TABLE EMPLOYEE;