select *FROM JOBS;
select MIN_SALARY, MAX_SALARY from JOBS where JOB_TITLE='President';
select * from EMPLOYEES where SALARY=2000;
select JOB_ID from EMPLOYEES where SALARY>=15000;
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID from EMPLOYEES where LAST_NAME='King';
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID=50;
select PHONE_NUMBER from EMPLOYEES where DEPARTMENT_ID=80 AND MANAGER_ID=100;
select * from EMPLOYEES where FIRST_NAME='John' OR FIRST_NAME='Neena' OR FIRST_NAME='Lency';
select * from LOCATIONS where  COUNTRY_ID='IT';
select CITY from LOCATIONS where  COUNTRY_ID!='IN' OR COUNTRY_ID!='CH';
select JOB_ID,JOB_TITLE FROM JOBS WHERE MIN_SALARY>8000 AND MIN_SALARY<15000;
select PHONE_NUMBER FROM EMPLOYEES WHERE DEPARTMENT_ID='90' AND JOB_ID!='ITPROG';
select * FROM EMPLOYEES WHERE HIRE_DATE>'12-DEC-07';
select * FROM EMPLOYEES WHERE HIRE_DATE>'12-DEC-07' AND DEPARTMENT_ID=100;
select * FROM EMPLOYEES WHERE HIRE_DATE>'12-DEC-07' AND DEPARTMENT_ID!=100;