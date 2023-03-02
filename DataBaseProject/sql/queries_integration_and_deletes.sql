SELECT * FROM T_Department;
SELECT * FROM T_Address;
SELECT * FROM T_Person;
SELECT * FROM T_Employee;
SELECT * FROM T_Login;
SELECT * FROM T_Role;
SELECT * FROM T_Job_review;
SELECT * FROM T_AddrDept;
SELECT * FROM T_Salary;
SELECT * FROM T_EmpRole;
SELECT * FROM T_AdvertisingWorker;
SELECT * FROM T_AdvertisingOffice;
SELECT * FROM T_purchase;
SELECT * FROM T_purchasingworker;
SELECT * FROM T_Advertisement;
SELECT * FROM T_AdvertisementsOfAdvertisingWorker;
SELECT * FROM T_Purchase_Items;

--כתובת של מחלקה מסוימת לפי שם המחלקה, במידה ולמחלקה אין כתובת השאילתא תחזיר כתובת ריקה עבור  המחלקה
SELECT D.DEPT_NAME, A.CITY, A.STREET, A.HOUSE_NUM, A.APT_NUM, a.postal_code, a.po_box
FROM T_Address A NATURAL JOIN T_addrdept AD RIGHT JOIN T_department D ON AD.DEPT_ID = D.DEPT_ID
WHERE D.dept_name = 'pharmacy';



INSERT INTO T_Department(dept_id, dept_desc, dept_name, dept_phone, dept_email)
VALUES ( 5011,'the department responsible is to buy equipment', 'rechesh', 08-6241033, 'rechesh.Habriut@MOH.HEALTH.GOV.IL');
  
-- שינוי שם עבור 
UPDATE T_Role
SET role_name = 'purcharser'
WHERE role_id = 4295; 

-- שינוי חלק ממספר זיהוי עבור ש 
UPDATE T_Role
SET dept_id = 5011
WHERE role_id = 4295; 

-- הכנסת עובד לתפקיד
INSERT INTO T_EMPROLE( emp_id, role_id , dept_id)
VALUES(1, 4295, 5011);

-- עדכון כתובת העובד
UPDATE T_Person
SET addr_id = 1808
WHERE IDperson = 1;

commit;

--שמות העובדים וכתובתם על פי מחלקה מסוימת
SELECT P.fname, P.lname, A.city, A.street, A.house_num, A.postal_code, po_box
FROM T_Person P NATURAL JOIN T_Address A 
WHERE p.idperson = ( SELECT E.idperson
                     FROM  T_Employee E NATURAL JOIN T_EmpRole NATURAL JOIN T_Department D
                     WHERE D.dept_name ='rechesh');

-- עדכון תלוש משכורת
UPDATE T_Salary
SET EMP_ID = 2 
WHERE SAL_ID = 3045;

 

-- עדכון תלוש משכורת
UPDATE T_Salary
SET sal_date = '01-JAN-2020'
WHERE SAL_ID = 3045;


-- עדכון תלוש משכורת
UPDATE T_Salary
SET val = 19000
WHERE SAL_ID = 3045;


-- דוחות משכורת של עובד מסוים מתחום הפרסום לפי ת.ז. שלו והתאריך שממנו הוא רוצה את הדוחות
SELECT *
FROM  T_AdvertisingWorker NATURAL JOIN T_Employee E NATURAL JOIN T_salary S
WHERE E.idperson =  2 AND s.sal_date > '01-JAN-2019';



UPDATE T_Employee
SET hire_date = '01-MAR-2001' 
WHERE emp_id = 2;



INSERT INTO T_Department(dept_id, dept_desc, dept_name, dept_phone, dept_email)
VALUES ( 5012,'the department responsible is to advertise', 'Advertise', 08-6241044, 'Advertising.Habriut@MOH.HEALTH.GOV.IL');
 

UPDATE T_Role
SET dept_id = 5012
WHERE role_id = 9095;


-- הכנסת עובד לתפקיד
INSERT INTO T_EMPROLE( emp_id, role_id , dept_id)
VALUES(2, 9095, 5012);

INSERT INTO T_Job_review (job_id, dept_id, role_id, emp_id, start_date, end_date, progress)
VALUES (313, 5012, 9095, 2, '01-JAN-2002',  '02-MAR-2002', 'finish the project');

-- כל שמות העובדים בפרסום ששייכים למשרד פרסום מסוים וגויסו החל מתאריך מסוים, תעודת הזהות שלהם,
-- פירוט התקדמות בעבודה שלהם.
-- השאילתה תחזיר את דוחות העבודה שלהם ממוינים בסדר עולה לפי תאריכי סיום דיווח על הפרויקט.
--SELECT *
--FROM (SELECT idperson, fname, lname, emp_id, hire_date FROM T_Person NATURAL JOIN T_Employee) E
--RIGHT JOIN (SELECT emp_id, start_date, end_date, progress FROM T_Job_review) J on E.Emp_Id = J.Emp_Id
--NATURAL JOIN T_AdvertisingWorker O
--NATURAL JOIN (select advertisingofficeid from T_AdvertisingOffice where officename = 'White Wave')T
--WHERE E.hire_date > '01-MAR-1999'  
--ORDER BY J.end_date;

--כל שמות העובדים, תעודת הזהות שלהם, התאריך שגויסו ופירוט ההתקדמות בעבודה שלהם, 
--העובדים שהחלו לעבוד בחברה מתאריך מסוים. השאילתה תחזיר את דוחות העבודה השייכים למחלקה מסוימת
--ממוינים לפי תאריכי סיום דווח על הפרויקט, בסדר עולה.
SELECT *
FROM (SELECT idperson, fname, lname, emp_id, hire_date FROM T_Person  NATURAL JOIN T_Employee ) E
NATURAL JOIN (SELECT emp_id, start_date, end_date, progress, dept_name FROM T_Job_review NATURAL JOIN T_Department) J
WHERE E.hire_date > '01-MAR-1999'  AND J.dept_name = 'Advertise' 
ORDER BY J.end_date;


--SELECT E.idperson,  E.fname,  E.lname,  E.emp_id,  E.hire_date, J.start_date, J.end_date, J.progress, T.advertisingofficeid  
--FROM (SELECT idperson, fname, lname, emp_id, hire_date FROM T_Person NATURAL JOIN T_Employee) E
--RIGHT JOIN (SELECT emp_id, start_date, end_date, progress FROM T_Job_review) J on E.Emp_Id = J.Emp_Id
--NATURAL JOIN T_AdvertisingWorker O
--NATURAL JOIN (select advertisingofficeid from T_AdvertisingOffice where officename = 'White Wave')T
--WHERE E.hire_date > '01-MAR-1999'  
--ORDER BY J.end_date;


--SELECT  idperson, fname, lname, emp_id, hire_date, start_date, end_date, progress
--select *
--FROM T_Person NATURAL JOIN T_Employee
--NATURAL JOIN T_Job_review 
--NATURAL JOIN T_AdvertisingWorker
--NATURAL JOIN T_AdvertisingOffice;
--WHERE hire_date > '01-MAR-1999' and officename = 'White Wave'
--ORDER BY end_date;


UPDATE T_purchasingworker
SET purchasingbudget = 59
WHERE Emp_id = 502;

--  פרטי העובדים מתחום הרכש שחרגו מהתקציב שיועד להם
SELECT P.fname, P.lname, P.email, P.phone
FROM T_Person P NATURAL JOIN T_Employee NATURAL JOIN T_PurchasingWorker U 
WHERE U.PurchasingBudget < (select sum(PUR.purchasecost)
                            from T_purchase PUR
                            where PUR.PurchasingWorkerId = U.PurchasingWorkerId);

commit;


--כל  תאריכי הלידה והמשכורות של עובדים שנולדו בחודש מסוים
--select birthdate from DUAL Natural join T_person where to_char(to_date(birthdate), 'month') = 'jul';

----------------------------------------------------------------------------------------
ALTER TABLE T_Job_review 
ADD project_name varchar(20);

ALTER TABLE T_Job_review
RENAME COLUMN project_name TO proj_type;

ALTER TABLE T_Job_review
RENAME COLUMN proj_type TO proj_name;

--למה לא נותן הרשאה למחוק מהמערכת?? הרי זה שלנו??
ALTER TABLE T_Job_review 
DROP COLUMN proj_name;
--גם אין הרשאה 
ALTER TABLE T_Job_review
ALTER COLUMN proj_name varchar(50);
--גם לא..
ALTER TABLE T_Login
ALTER COLUMN username varchar(50) UNIQUE;
-- לשנות גם ת.ז. של עובד לייחודי וגם שם משתמשכמו כאן
-----------------------------------------------------------------------------------------
--שינוי שם הפרויקט של דוח מסוים
UPDATE T_Job_review
SET proj_name = 'check'
WHERE emp_id = 501;

--שינוי כתובת של עובד מסוים
UPDATE T_Address
SET house_num = 10
WHERE addr_id = 102;

--שינוי תאריך סיום פרויקט של דוח סקירת עבודה לפי מס' הפרויקט\עבודה
UPDATE T_JOB_REVIEW
SET end_date = (SELECT to_date(Sysdate) AS System_date FROM Dual) 
WHERE job_id = 312;

-- שינוי סיסמה עבור שם משתמש מסוים
UPDATE T_Login
SET mypassword = '263hs839'
WHERE username = 'itzikC';
----------------------------------------------------------------------------------------

insert into T_Person (IDperson, BirthDate,  KodGender,  citizenship , fname, lname,  email, phone, addr_id)
VALUES (478823635, '04-JUL-1970', 'M', 'Israel', 'חיים', 'בר', 'iujd6@gmail.com', 0587784732, 102 );

INSERT INTO T_Login (login_id, password, username)
VALUES( 602, 'ek840j2l', 'haimB');

INSERT INTO T_Employee ( emp_id, hire_date,  work_phone,  work_email, login_id, IDperson)
VALUES (502, '03-JUN-2000', 0506777856, 'haim@MOH.HEALTH.GOV.IL', 602, 478823635 );

DELETE FROM T_Employee WHERE idperson = 478823635;

DELETE FROM T_Login WHERE login_id = 602;

DELETE FROM T_Person WHERE idperson = 478823635;

SELECT to_date(Sysdate) AS System_date 
FROM Dual;

--פורמט התאריך שלי
--SELECT  value
--FROM SYS.NLS_DATABASE_PARAMETERS
--WHERE parameter = 'NLS_DATE_FORMAT';


---------------------------------- מחיקות לאחר האינטגרציה delete


DELETE FROM T_AdvertisementsOfAdvertisingWorker WHERE advertisementid = 2;

DELETE FROM T_Advertisement WHERE Advertisementid = 2;

DELETE FROM T_Purchase_Items WHERE purnum = 8 and purchasingworkerid = 8;

------------------------------------------------------------------------------

CREATE Index i_person_fname_lname
on T_person (fname, lname);


CREATE INDEX i_employee_hire_date
on T_employee (hire_date);


CREATE INDEX i_department_DEPT_NAME
on T_Department (DEPT_NAME);


-------------------------------------create new user
alter session set "_ORACLE_SCRIPT"=true;


CREATE USER sara -- user name 
IDENTIFIED BY 1423 -- passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to sara;
grant create table to sara; 

ALTER USER sara quota unlimited on SYSTEM

--DROP USER sara





