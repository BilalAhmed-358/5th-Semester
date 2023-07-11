-- Task 01

SELECT E.FIRST_NAME || ' '||E.LAST_NAME AS NAME, J.JOB_TITLE AS JOB, D.DEPARTMENT_NAME, E.SALARY 
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID  AND E.JOB_ID=J.JOB_ID
ORDER BY D.DEPARTMENT_NAME ASC;

-- Task 02

SELECT E.DEPARTMENT_ID AS "DEPT. ID", D.DEPARTMENT_NAME AS "DEPT. NAME", 
COUNT(E.DEPARTMENT_ID) AS "COUNT OF EMPLOYEES"
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*)>=2
ORDER BY e.department_id;

-- Task 03

SELECT * FROM employees e, jobs j
WHERE e.job_id=j.JOB_ID;

-- Task 04

SELECT E.FIRST_NAME AS NAME, J.JOB_TITLE AS "JOB TITLE", 
    E.SALARY*12 AS "ANNUAL SALARY",
    E.DEPARTMENT_ID AS "DEPT ID", D.DEPARTMENT_NAME AS "DEPT NAME",
    L.CITY AS "CITY"
    FROM EMPLOYEES E, JOBS J, LOCATIONS L, DEPARTMENTS D
    WHERE E.JOB_ID=J.JOB_ID AND E.DEPARTMENT_ID=D.DEPARTMENT_ID AND D.LOCATION_ID=L.LOCATION_ID AND (E.SALARY*12 >6000 OR J.JOB_TITLE != 'ANALYST');
    
-- Task 05

SELECT unique *
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.EMPLOYEE_ID=M.MANAGER_ID;

-- Task 06

select d.department_id as "Dept. Id", d.department_name as "Dept. Name"
,count(e.department_id ) as "Count of Employees"
from departments d left join employees e
on d.DEPARTMENT_ID=e.department_id
group by d.department_id, d.department_name
having count(e.DEPARTMENT_ID)=0;


-- Task 07

select e.FIRST_NAME as "Name" , e.salary as "Salary"  , d.department_name as "Department Name"
from EMPLOYEES e  inner join DEPARTMENTS d
on e.department_id=d.DEPARTMENT_ID ;

-- Task 08

select e.first_name, j.job_id, d.department_name,l.street_address, l.city
from employees e, jobs j, departments d, locations l
where e.DEPARTMENT_ID=d.DEPARTMENT_ID and e.job_id=j.job_id
and l.LOCATION_ID=d.location_id and l.STATE_PROVINCE is null;


-- Task 09

select * from employees e 
left join departments d on  e.department_id=d.department_id
where e.DEPARTMENT_ID is null;

-- Task 10

select * 
from employees e, locations l, departments d
where e.DEPARTMENT_ID=d.DEPARTMENT_ID and l.LOCATION_ID=d.LOCATION_ID
and l.country_id ='US' and l.state_province!= 'Washington';

