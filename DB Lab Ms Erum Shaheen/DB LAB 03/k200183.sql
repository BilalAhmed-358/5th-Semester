-- Task 01

create user bilal identified by bilal;
alter user bilal identified by bilal;
grant all privileges to bilal;
alter user bilal account unlock;

-- Task 02

create table jobs01 as select * from hr.jobs where 1=2;
create table jobs_history01 as select * from hr.JOB_HISTORY where 1=2;
alter table jobs01 add constraint JOB_ID primary key (JOB_ID);
desc JOBS01;

-- Task 03

alter table jobs01 modify JOB_ID numeric;
desc jobs01;

-- Task 04

desc JOBS_HISTORY01;
alter table JOBS_HISTORY01 add CONSTRAINT "job id" FOREIGN key (JOB_ID) REFERENCES jobs01 (JOB_ID);

-- Task 05

INSERT into JOBS01 values ('001','Junior SDE','70000','100000');
insert into JOBS_HISTORY01 values ('059','2-Jan-2021','2-Jan-2022','001',002);
select * from jobs01;
select * from JOBS_HISTORY01;

-- Task 06

alter table JOBS01 add (Job_Nature varchar2(30));
desc jobs01;

-- Task 07

create table MY_EMPLOYEES as select * from HR.EMPLOYEES where 1=0;
alter table MY_EMPLOYEES ADD CONSTRAINT "EMPLOYEE_ID" PRIMARY KEY(EMPLOYEE_ID); 
desc MY_EMPLOYEES;
INSERT INTO MY_EMPLOYEES VALUES (59,'BILAL','AHMED','YADA@GMAIL.COM','1234','21-JAN-2019',001,70000,0.2,456,002);
INSERT INTO MY_EMPLOYEES VALUES (60,'KHALIQ','Maqbool Khan','anything@GMAIL.COM','4321','20-JAN-2019',001,60000,0.1,456,002);

select * from MY_EMPLOYEES;
--SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
--FROM all_constraints cons, all_cons_columns cols
--WHERE cols.table_name = 'MY_EMPLOYEES'
--AND cons.constraint_type = 'P'
--AND cons.constraint_name = cols.constraint_name
--AND cons.owner = cols.owner
--ORDER BY cols.table_name, cols.position;

-- Task 08

ALTER TABLE JOBS_HISTORY01 
ADD CONSTRAINT Emp_ID FOREIGN KEY (EMPLOYEE_ID) 
references MY_EMPLOYEES(EMPLOYEE_ID);
SELECT * FROM JOBS_HISTORY01;
SELECT * FROM MY_EMPLOYEES;
ALTER TABLE JOBS_HISTORY01
DROP COLUMN EMPLOYEE_ID;

desc JOBS_HISTORY01;
SELECT DISTINCT EMPLOYEE_ID FROM JOBS_HISTORY01 WHERE EMPLOYEE_ID NOT IN (
    SELECT EMPLOYEE_ID FROM MY_EMPLOYEES);
clear screen;

-- Task 09

ALTER TABLE JOBS01 
DROP COLUMN JOB_NATURE;
DESC JOBS01;

-- Task 10

ALTER TABLE MY_EMPLOYEES ADD CONSTRAINT "Ename only in uppercase" CHECK(upper(FIRST_NAME)=FIRST_NAME);

-- Task 11

ALTER TABLE MY_EMPLOYEES ADD CONSTRAINT "SALARY MUST NOT BE SAME" UNIQUE(SALARY);

-- Task 12

ALTER TABLE MY_EMPLOYEES MODIFY PHONE_NUMBER VARCHAR (20) NOT NULL; 

-- Task 13

INSERT INTO MY_EMPLOYEES VALUES (59,'BILAL','AHMED','YADA@GMAIL.COM','1234','21-JAN-2019',001,70000,0.2,456,002);

-- Task 14

UPDATE MY_EMPLOYEES SET SALARY=2000 WHERE EMPLOYEE_ID=105 AND SALARY<1000;

-- Task 15

ALTER TABLE MY_EMPLOYEES ADD CONSTRAINT "JOBSid+EMPid as PK" PRIMARY KEY (EMPLOYEE_ID, JOB_ID);
SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = 'MY_EMPLOYEES'
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;
-- Task 16

desc JOBS_HISTORY01;
CREATE INDEX INDX_JOB_ID ON JOBS_HISTORY01(JOB_ID);

-- Task 17
CLEAR SCREEN;
SELECT * FROM MY_EMPLOYEES;
alter table jobs_history01 DROP COLUMN EMPLOYEE_ID;
TRUNCATE TABLE MY_EMPLOYEES CASCADE;
SELECT * FROM MY_EMPLOYEES;