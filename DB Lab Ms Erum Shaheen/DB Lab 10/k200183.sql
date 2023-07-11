-- Question 01

--creating table

create table person(personID varchar(20), firstName varchar(255), lastName varchar(255), Address varchar(255),city varchar(255),age varchar(255), constraint pk_person primary key(personID));
set transaction name 'First_name';

Insert into person (personID, firstName, lastName, Address,city,age)
select 1, 'Usama', 'Ahmed','Pakistan','Karachi', 19 from dual union all
select 2, 'Bilal', 'Ahmed','Pakistan','Karachi', 20 from dual union all
select 3, 'Zulnoor', 'Siddiqui','Pakistan','Karachi', 21 from dual union all
select 4, 'Wamiq', 'Akram','Pakistan','Karachi', 18 from dual union all
select 5, 'Sohail', 'Khan','Pakistan','Karachi', 20 from dual;

select * from person;

savepoint after_5_insertion;

Insert into person (personID, firstName, lastName, Address,city,age)
select 6, 'Usama', 'Ahmed','Pakistan','Karachi', 19 from dual union all
select 7, 'Bilal', 'Ahmed','Pakistan','Karachi', 20 from dual union all
select 8, 'Zulnoor', 'Siddiqui','Pakistan','Karachi', 21 from dual union all
select 9, 'Wamiq', 'Akram','Pakistan','Karachi', 18 from dual union all
select 10, 'Sohail', 'Khan','Pakistan','Karachi', 20 from dual;

update person set firstName='Rida' where personid=7;
select * from person where personid=7;
select * from person;
rollback to savepoint after_5_insertion;

-- Task 02
update person set age='30' where personid=8;

-- Reason: Because we haven't commited our changes yet.
--Update command doesnot have autocommit status this is the 
--resson our changes are not showing up in the unsaved tab.

