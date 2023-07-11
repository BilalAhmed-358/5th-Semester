Extra Questions.
Ashmal Anis 19K-0305 Sec: H

1) Show last month and next month.
SELECT EXTRACT(MONTH FROM ADD_MONTHS(SYSDATE,-1)) AS LAST_MONTH , EXTRACT(MONTH FROM ADD_MONTHS(SYSDATE,1)) AS NEXT_MONTH FROM DUAL;

2) Show the last day of september, 2021
SELECT LAST_DAY(SYSDATE) FROM DUAL;  -- since this month is september, we can use sysdate directly here

3) Show today’s date, last day of this month, next Monday’sdate , next months, 1 st day.
SELECT SYSDATE AS PRESENT_DATE, LAST_DAY(SYSDATE) AS LASY_DAY, NEXT_DAY(SYSDATE, 'MONDAY') AS NEXT_MONDAY,
LAST_DAY(SYSDATE)+1 AS FIRST_DAY FROM DUAL;

4) Show the number of days for this year to end.
SELECT ABS(TRUNC(SYSDATE) - TO_DATE('31-DEC-2021', 'DD-MM-YY')) AS DAYS_REMAINING FROM DUAL;

5) Show the number of days left to end this month
SELECT ABS(TRUNC(SYSDATE) - LAST_DAY(SYSDATE)) AS DAYS_REMAINING FROM DUAL;

6) Show the number of months between today and 1 Dec, 2021
SELECT MONTHS_BETWEEN('01-DEC-21', SYSDATE) AS MONTHS_REMAINING FROM DUAL;

7) Show the number of months, each employee has worked from hire date.
SELECT MONTHS_BETWEEN(SYSDATE, HIRE_DATE) FROM EMPLOYEES;

8) Show the new year considering the date 16-Feb-2021.
SELECT EXTRACT(YEAR FROM ADD_MONTHS('16-SEP-21', MONTHS_BETWEEN(LAST_DAY('01-JAN-22'),'16-SEP-21'))) AS NEW_YEAR FROM DUAL;

9) Show the new month, considering 16 sept, 2021.
SELECT EXTRACT(MONTH FROM LAST_DAY('16-SEP-21')+1) AS NEXT_MONTH FROM DUAL;
-- another way of doing the same thing is
SELECT TO_CHAR(LAST_DAY('16-SEP-21')+1,'Month') AS NEXT_MONTH FROM DUAL;

10) Show the new month, considering 12 sept, 2021.
SELECT EXTRACT(MONTH FROM LAST_DAY('12-SEP-21')+1) AS NEXT_MONTH FROM DUAL;
-- another way of doing the same thing is
SELECT TO_CHAR(LAST_DAY('12-SEP-21')+1,'Month') AS NEXT_MONTH FROM DUAL;

11) Show tomorrows date as Tomorrow
SELECT SYSDATE+1 AS TOMORROW FROM DUAL;

12) Show the next month’s name.
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,1),'Month') AS Month_Name FROM DUAL;

13) 
SELECT ROUND(SYSDATE, 'YEAR') AS Next_Year FROM DUAL;

14) Show the time for five minutes from now.
SELECT to_char(sysdate - interval '-5' minute,'HH:MI:SS AM') as LATER_TIME FROM DUAL;

15) Show the first name, hiredate in format: SEPTEMBER 12, 2021, SALARY IN $99999.99 for first five rows.
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE, 'MONTH DD, YYYY') AS HIRE_DATE, TO_CHAR(SALARY,'$99999.99') AS SALARY FROM EMPLOYEES WHERE ROWNUM <=5;

16) Show odd rows from table having first name, emp id, rownum from employees table.
SELECT * FROM (SELECT FIRST_NAME, EMPLOYEE_ID, ROWNUM AS RNumber FROM EMPLOYEES) WHERE MOD(RNumber,2) <> 0;