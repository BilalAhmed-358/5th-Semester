Ashmal Anis
19K-0305
Lab-09
*************************************
Task#01)
set serveroutput on;
ACCEPT emp_ID EMPLOYEES.EMPLOYEE_ID%type PROMPT 'Please Enter Your Employee ID: '
DECLARE
  emp_ID EMPLOYEES.EMPLOYEE_ID%type;
  emp_salary EMPLOYEES.SALARY%type;
  bonus_amount REAL;
BEGIN
  emp_ID := &emp_ID;
  SELECT SALARY INTO emp_salary FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_ID;
  IF(emp_salary<1000) THEN
    bonus_amount := emp_salary*0.1;
  ELSIF (emp_salary>=1000 AND emp_salary<=1500) THEN
    bonus_amount := emp_salary*0.15;
  ELSE
    bonus_amount := emp_salary*0.20;
  dbms_output.put_line('Bonus Amount: ' || bonus_amount);
  END IF;
END;

----------------------------------
Task#02: 
--Thought the task says update where commission_pct is null but it won't update so changed is null to is not null
set serveroutput on;
ACCEPT emp_ID EMPLOYEES.EMPLOYEE_ID%type PROMPT 'Please Enter Your Employee ID: '
DECLARE
  emp_ID EMPLOYEES.EMPLOYEE_ID%type;
  emp_comm EMPLOYEES.COMMISSION_PCT%type;
  emp_sal EMPLOYEES.SALARY%type;
BEGIN
  emp_ID := &emp_ID;
  SELECT SALARY, COMMISSION_PCT INTO emp_sal, emp_comm FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_ID;
  IF(emp_comm IS NOT NULL) THEN
    UPDATE EMPLOYEES SET SALARY = emp_sal+emp_comm WHERE EMPLOYEE_ID = emp_ID;
  END IF;
  dbms_output.put_line('Updated Salary!');
END;
-----------------------------------

Task#03:
set serveroutput on;
DECLARE
  dep_name DEPARTMENTS.DEPARTMENT_NAME%type;
  dep_id DEPARTMENTS.DEPARTMENT_ID%type := 30;
BEGIN
    SELECT DISTINCT DEPARTMENTS.DEPARTMENT_NAME INTO dep_name FROM EMPLOYEES INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
    WHERE DEPARTMENTS.DEPARTMENT_ID = dep_id;
    dbms_output.put_line('Department Name : ' || dep_name);
END;
-----------------------------------
Task#04: 

set serveroutput on;
CREATE OR REPLACE PROCEDURE FIND_NATURE(dep_id in NUMBER)
IS 
BEGIN
    for c in (SELECT DISTINCT JOB_TITLE FROM EMPLOYEES, DEPARTMENTS, JOBS WHERE EMPLOYEES.JOB_ID = JOBS.JOB_ID 
        and employees.department_id = departments.department_id and departments.department_id = dep_id)
    loop
        dbms_output.put_line('Nature of the Job = ' || c.JOB_TITLE);
    end loop;
END;
EXEC FIND_NATURE(20);

--------------------
Task#05:

set serveroutput on;
CREATE OR REPLACE PROCEDURE CHECK_SALARY(dep_id in NUMBER)
IS 
BEGIN
    for c in (SELECT DISTINCT EMPLOYEE_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = dep_id)
    loop
        dbms_output.put_line('Salary of the employee ' || c.EMPLOYEE_ID || ' is : ' || c.SALARY);
    end loop;
END;
EXEC CHECK_SALARY(20);

--------------------
Task#06:

set serveroutput on;
CREATE OR REPLACE PROCEDURE UPDATE_SALARY(emp_no in NUMBER)
IS 
emp_salary EMPLOYEES.SALARY%type;
BEGIN
    SELECT SALARY INTO emp_salary FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_no;
    UPDATE EMPLOYEES SET SALARY = emp_salary+ (emp_salary*0.10) WHERE EMPLOYEE_ID = emp_no;
    dbms_output.put_line('Salary of the employee ' || emp_no || ' updated!');
END;
EXEC UPDATE_SALARY(100);

--------------------
Task#07:

set serveroutput on;
CREATE OR REPLACE PROCEDURE ADD_SALARY(dept_no in NUMBER)
IS 
emp_salary EMPLOYEES.SALARY%type;
BEGIN
    for c in (SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = dept_no)
    LOOP
        IF(c.SALARY > 5000) THEN
            UPDATE EMPLOYEES SET SALARY = c.SALARY + 1000 WHERE EMPLOYEE_ID = c.EMPLOYEE_ID;
            dbms_output.put_line('Salary of the employee ' || c.EMPLOYEE_ID || ' updated!');
        END IF;
    END LOOP;
END;
EXEC ADD_SALARY(20);

--------------------
Task#08:
a)
CREATE OR REPLACE VIEW EMP_DESIGNATION(JOB_ID, COUNT_EMPLOYEES) AS 
SELECT JOB_ID, COUNT(JOB_ID) AS COUNT_EMPLOYEES FROM EMPLOYEES GROUP BY JOB_ID;
SELECT * FROM EMP_DESIGNATION;

b.
CREATE OR REPLACE VIEW DISPLAY_EMPLOYEE(EMPLOYEE_ID, EMPLOYEE_NAME, DEPARTMENT_ID, DEPARTMENT_NAME)
AS SELECT E.EMPLOYEE_ID, E.FIRST_NAME || ' ' || E.LAST_NAME AS empname, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND lower(E.FIRST_NAME) <> 'king';
SELECT * FROM DISPLAY_EMPLOYEE;

c.
CREATE OR REPLACE VIEW  DISPLAY_EMPLOYEES(EMPLOYEE_ID, EMPLOYEE_NAME, DEPARTMENT_ID, DEPARTMENT_NAME)
AS SELECT E.EMPLOYEE_ID, E.FIRST_NAME || ' ' || E.LAST_NAME AS empname, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
SELECT * FROM DISPLAY_EMPLOYEES;

--------------------
Task#09:

set serveroutput on;
DECLARE
    VAR1 INTEGER;
    VAR2 INTEGER;
    VAR3 INTEGER;
BEGIN
    VAR1 := &VAR1;
    VAR2 := &VAR2;
    VAR3 := VAR1 + VAR2;
    dbms_output.put_line('Total Sum: ' || VAR3);
END;

--------------------
Task#10:

set serveroutput on;
DECLARE
    VAR1 INTEGER;
    VAR2 INTEGER;
    TOTAL INTEGER:=0;
BEGIN
    VAR1 := &VAR1;
    VAR2 := &VAR2;
    for c in VAR1 .. VAR2
    LOOP
        TOTAL:=TOTAL+c;
    END LOOP;
    dbms_output.put_line('Total Sum: ' || TOTAL);
END;

--------------------
Task#11:

set serveroutput on;
DECLARE
    employee_no EMPLOYEES.EMPLOYEE_ID%type;
    employee_name EMPLOYEES.FIRST_NAME%type;
    employee_hire_date EMPLOYEES.HIRE_DATE%type;
    employee_department_name DEPARTMENTS.DEPARTMENT_NAME%type;
BEGIN
    employee_no := &employee_no;
    SELECT E.EMPLOYEE_ID, E.FIRST_NAME || ' ' || E.LAST_NAME,  E.HIRE_DATE, D.DEPARTMENT_NAME INTO employee_no, 
    employee_name, employee_hire_date, employee_department_name
    FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.EMPLOYEE_ID = employee_no;
    dbms_output.put_line('Employee Id: ' || employee_no || ' , Employee Name: ' || employee_name || ' , Hire Date: ' || employee_hire_date || ' ,Department Name: ' || employee_department_name);
END;

--------------------
Task#12:
-- we can definitely use integer here and reverse the number through modulus and stuff, but I found it easy this way.

set serveroutput on;
DECLARE
    PALINDROME VARCHAR(20);
    REVERSE_NUMBER VARCHAR(20);
BEGIN 
    PALINDROME := &PALINDROME;
    SELECT REVERSE(PALINDROME) INTO REVERSE_NUMBER FROM DUAL;
    IF(PALINDROME = REVERSE_NUMBER) THEN
        dbms_output.put_line('The number ' ||PALINDROME|| ' is palindrome.');
    ELSE
        dbms_output.put_line('The number ' ||PALINDROME|| ' is not palindrome.');
    END IF;
END;

--------------------
Task#13:
--having some trouble inserting the phone number, the syntax and code looks fine.

set serveroutput on;
DECLARE
    emp_id  EMPLOYEES.EMPLOYEE_ID%type;
    emp_first EMPLOYEES.FIRST_NAME%type;
    emp_last EMPLOYEES.LAST_NAME%type;
    emp_email EMPLOYEES.EMAIL%type;
    emp_phone EMPLOYEES.PHONE_NUMBER%type;
    emp_hire EMPLOYEES.HIRE_DATE%type;
    emp_job_id EMPLOYEES.JOB_ID%type;
    emp_salary EMPLOYEES.SALARY%type;
    emp_comm EMPLOYEES.COMMISSION_PCT%type;
    emp_manager_id EMPLOYEES.MANAGER_ID%type;
    emp_depno EMPLOYEES.DEPARTMENT_ID%type;
    emp_depart_name DEPARTMENTS.DEPARTMENT_NAME%type;
    emp_location_id DEPARTMENTS.LOCATION_ID%type;
BEGIN
    emp_id := &emp_id;
    emp_first := &emp_first;
    emp_last := &emp_last;
    emp_email := &emp_email;
    emp_phone := &emp_phone;
    emp_hire := &emp_hire;
    emp_job_id := &emp_job_id;
    emp_salary := &emp_salary;
    emp_comm := &emp_comm;
    emp_manager_id := &emp_manager_id;
    emp_depno := &emp_depno;
    emp_depart_name := &emp_depart_name;
    emp_location_id := &emp_location_id;
    INSERT INTO EMPLOYEES (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct, manager_id,department_id) 
        VALUES (emp_id,emp_first,emp_last,emp_email,emp_phone,emp_hire,emp_job_id,emp_salary,emp_comm,emp_manager_id,emp_depno)
    INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
        VALUES(emp_depno,emp_depart_name,emp_manager_id,emp_location_id);
    dbms_output.put_line('Record for Employee # : '|| emp_id || ' entered!');
END;

-----------------------------------
Task#14:

set serveroutput on;
DECLARE
    emp_salary EMPLOYEES.SALARY%type:=0;
    emp_first_name EMPLOYEES.FIRST_NAME%type;
    emp_last_name EMPLOYEES.LAST_NAME%type;
    emp_employee_id EMPLOYEES.EMPLOYEE_ID%type := 7499;
    emp_manager_id EMPLOYEES.MANAGER_ID%type := 7499;
BEGIN
    SELECT MANAGER_ID INTO emp_manager_id FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_employee_id;
    WHILE(emp_salary <= 2500)
    LOOP
        SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY INTO emp_employee_id, emp_first_name, emp_last_name, emp_salary
        FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_employee_id;
    END LOOP;
    dbms_output.put_line('The Employe who is higher in chain of command: ' || emp_first_name || ' ' || emp_last_name || ' with salary: ' || emp_salary);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('Record with employee id: ' || emp_employee_id || ' does not exists.');
END;

-----------------------------------
Task#15:

set serveroutput on;
DECLARE
    START_ NUMBER := 1;
    END_ NUMBER := 100;
    SUM_ NUMBER := 0;
BEGIN
    FOR c in START_ .. END_
    LOOP
        SUM_ := SUM_+ c;
    END LOOP;
    dbms_output.put_line('The Total Sum : ' || SUM_);
END;
    
    
    
Declare
n_count number;
e_id employees.EMPLOYEE_ID%type := 1100;
Begin
Select count(1) into n_count from employees Where EMPLOYEE_ID = e_id;
if n_count > 0 then
dbms_output.put_line('record already exists.');
else
INSERT INTO employees
(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)

VALUES (e_id,'Bruce','Austin','DAUSTIN7','590.423.4569','25-JUN-
05','IT_PROG',6000,0.2,100,60);

dbms_output.put_line('record inserted with Employee ID: ' ||e_id);
end if;
End;
