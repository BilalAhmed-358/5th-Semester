--1. Write a query to list the name, job name, department name, salary of the
--employees according to the department in ascending order.
select  e.first_name, j.job_title, d.department_name, e.salary 
from employees e, jobs j, departments d 
where e.job_id=j.job_id and e.department_id=d.department_id 
order by d.department_id;
--2. Write a query to list the department where at least two employees are working.
select department_id ,count(department_id) 
from employees 
group by department_id
having count(*)>=2;
--3. Fetch all the records where salary of employee is less than the lower salary.
select e.first_name,e.salary,e.job_id,j.job_title
from employees e, jobs j 
where e.job_id=j.job_id and e.salary< j.min_salary;
--4. Write a query to list the name, job name, annual salary, department id,
--department name and city who earn 60000 in a year or not working as an ANALYST.
select e.first_name, j.job_title, e.salary*12 , e.department_id, d.department_name, l.city
from employees e, jobs j, departments d, locations l
where e.job_id=j.JOB_ID and  e.department_id=d.department_id and d.location_id=l.location_id and (e.salary*12>'60000' or  j.job_title != 'ANALYIST' );
--5. Write a query to print details of the employees who are also Managers.
select DISTINCT e.* 
from employees e , employees m
where e.employee_id=m.manager_id;
--6. List department number, Department name for all the departments in which
--there are no employees in the department.
select d.department_id , d.department_name , count(e.department_id)
from departments d left outer join employees e 
on e.department_id=d.department_id
group by d.DEPARTMENT_ID, d.department_name
having count(e.DEPARTMENT_ID)=0;
--7. Display employee name, salary, department name where all employees has
--matching department as well as employee does not have any departments.
select e.FIRST_NAME , e.salary, d.department_name 
from EMPLOYEES e left outer join DEPARTMENTS d
on e.department_id=d.DEPARTMENT_ID ;
--8. Display name, job ID, department name, street address and city of the
--employee in which there is no state province.
select e.first_name,j.job_id, d.department_name, l.street_address , l.city 
from employees e, jobs j, departments d, locations l
where e.department_id=d.DEPARTMENT_ID and e.job_id=j.job_id and d.LOCATION_ID=l.LOCATION_ID and l.state_province is null;
--9. Write an SQL query to show records from one table that another table does not have.
select e.department_id,e.employee_id 
from employees e 
left join departments d on d.department_id=e.department_id 
where e.DEPARTMENT_ID is null ;
--10.Display all employees who belong to country US but not belongs to state province Washington.
select e.* 
from employees e,locations l,departments d 
where e.DEPARTMENT_ID=d.DEPARTMENT_ID and d.location_id=l.LOCATION_ID and l.COUNTRY_ID='US' and l.STATE_PROVINCE !='Washington';