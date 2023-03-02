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
SELECT * FROM T_audits;

--כתובת של מחלקה מסוימת לפי שם המחלקה, במידה ולמחלקה אין כתובת השאילתא תחזיר כתובת ריקה עבור  המחלקה
SELECT D.DEPT_NAME, A.CITY, A.STREET, A.HOUSE_NUM, A.APT_NUM, a.postal_code, a.po_box
FROM T_Address A NATURAL JOIN T_addrdept AD RIGHT JOIN T_department D ON AD.DEPT_ID = D.DEPT_ID
WHERE D.dept_name = &<name="dept_name" type="string" required=true list="select dept_name from T_department">;

--שמות העובדים וכתובתם על פי מחלקה מסוימת
SELECT P.fname, P.lname, A.city, A.street, A.house_num, A.postal_code, po_box
FROM T_Person P NATURAL JOIN T_Address A 
WHERE p.idperson = ( SELECT E.idperson
                     FROM  T_Employee E NATURAL JOIN T_EmpRole NATURAL JOIN T_Department D
                     WHERE D.dept_name =&<name="dept_name" type="string" required=true list="select dept_name from T_department">);

-- דוחות משכורת של עובד מסוים מתחום הפרסום לפי ת.ז. שלו והתאריך שממנו הוא רוצה את הדוחות
SELECT *
FROM  T_AdvertisingWorker NATURAL JOIN T_Employee E NATURAL JOIN T_salary S
WHERE E.idperson =  &<name="id_person" type="integer" list="select idperson from T_person"  required=true> AND s.sal_date > &<name="d_from" type=date required=true>;

--כל שמות העובדים, תעודת הזהות שלהם, התאריך שגויסו ופירוט ההתקדמות בעבודה שלהם, 
--העובדים שהחלו לעבוד בחברה מתאריך מסוים. השאילתה תחזיר את דוחות העבודה השייכים למחלקה מסוימת
--ממוינים לפי תאריכי סיום דווח על הפרויקט, בסדר עולה.
SELECT *
FROM (SELECT idperson, fname, lname, emp_id, hire_date FROM T_Person  NATURAL JOIN T_Employee ) E
NATURAL JOIN (SELECT emp_id, start_date, end_date, progress, dept_name FROM T_Job_review NATURAL JOIN T_Department) J
WHERE E.hire_date > &<name="d_from" type=date required=true>  AND J.dept_name = &<name="dept_name" type="string" required=true list="select dept_name from T_department"> 
ORDER BY J.end_date;

-- שמות ופרטי העובדים שמשכורתם מעל ערך מסוים
SELECT p.fname, p.lname, p.email, p.phone, s.val
FROM T_Person p NATURAL JOIN T_Employee NATURAL jOIN T_salary s
WHERE s.val > &<name="salary_val" type="integer" required=true default=15000>;

select *
from t_Role NATURAL JOIN t_Emprole NATURAL JOIN t_Employee;
