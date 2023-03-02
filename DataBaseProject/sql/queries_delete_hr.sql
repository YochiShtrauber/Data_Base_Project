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

--����� �� ����� ������ ��� �� ������, ����� ������� ��� ����� ������� ����� ����� ���� ����  ������
SELECT D.DEPT_NAME, A.CITY, A.STREET, A.HOUSE_NUM, A.APT_NUM, a.postal_code, a.po_box
FROM T_Address A NATURAL JOIN T_addrdept AD RIGHT JOIN T_department D ON AD.DEPT_ID = D.DEPT_ID
WHERE D.dept_name = 'pitvrsz';
--WHERE A.addr_id = (SELECT addr_id
--                  FROM T_addrdept AD RIGHT JOIN T_department D ON AD.DEPT_ID = D.DEPT_ID
--                  WHERE D.dept_name = 'pitvrsz');

--���� ������� ������� �� �� ����� ������
SELECT P.fname, P.lname, A.city, A.street, A.house_num, A.postal_code, po_box
FROM T_Person P NATURAL JOIN T_Address A 
WHERE p.idperson = ( SELECT E.idperson
                     FROM  T_Employee E NATURAL JOIN T_EmpRole NATURAL JOIN T_Department D
                     WHERE D.dept_name ='pharmacy');

-- ����� ������ �� ���� ����� ��� �.�. ��� ������� ����� ��� ���� �� ������
SELECT *
FROM T_Employee E  NATURAL JOIN T_salary S
WHERE E.idperson =  011567543 AND s.sal_date > '01-JAN-2019';

--�� ���� �������, ����� ����� ����, ������ ������ ������ �������� ������ ����, 
--������� ����� ����� ����� ������ �����. ������� ����� �� ����� ������ ������� ������ ������
--������� ��� ������ ���� ���� �� �������, ���� ����.
SELECT *
FROM (SELECT idperson, fname, lname, emp_id, hire_date FROM T_Person  NATURAL JOIN T_Employee ) E
NATURAL JOIN (SELECT emp_id, start_date, end_date, progress, dept_name FROM T_Job_review NATURAL JOIN T_Department) J
WHERE E.hire_date > '01-MAR-1999'  AND J.dept_name = 'pharmacy' 
ORDER BY J.end_date;

--��  ������ ����� ��������� �� ������ ������ ����� �����
SELECT p.fname, p.lname, p.email, p.phone, s.val
FROM T_Person p NATURAL JOIN T_Employee NATURAL jOIN T_salary s
WHERE s.val > 18000;


--��  ������ ����� ��������� �� ������ ������ ����� �����
--select birthdate from DUAL Natural join T_person where to_char(to_date(birthdate), 'month') = 'jul';

----------------------------------------------------------------------------------------
ALTER TABLE T_Job_review 
ADD project_name varchar(20);

ALTER TABLE T_Job_review
RENAME COLUMN project_name TO proj_type;

ALTER TABLE T_Job_review
RENAME COLUMN proj_type TO proj_name;

--��� �� ���� ����� ����� �������?? ��� �� ����??
ALTER TABLE T_Job_review 
DROP COLUMN proj_name;
--�� ��� ����� 
ALTER TABLE T_Job_review
ALTER COLUMN proj_name varchar(50);
--�� ��..
ALTER TABLE T_Login
ALTER COLUMN username varchar(50) UNIQUE;
-- ����� �� �.�. �� ���� ������� ��� �� �������� ���
-----------------------------------------------------------------------------------------
--����� �� ������� �� ��� �����
UPDATE T_Job_review
SET proj_name = 'check'
WHERE emp_id = 501;

--����� ����� �� ���� �����
UPDATE T_Address
SET house_num = 10
WHERE addr_id = 102;

--����� ����� ���� ������ �� ��� ����� ����� ��� ��' �������\�����
UPDATE T_JOB_REVIEW
SET end_date = (SELECT to_date(Sysdate) AS System_date FROM Dual) 
WHERE job_id = 312;

-- ����� ����� ���� �� ����� �����
UPDATE T_Login
SET mypassword = '263hs839'
WHERE username = 'itzikC';
----------------------------------------------------------------------------------------

insert into T_Person (IDperson, BirthDate,  KodGender,  citizenship , fname, lname,  email, phone, addr_id)
VALUES (478823635, '04-JUL-1970', 'M', 'Israel', '����', '��', 'iujd6@gmail.com', 0587784732, 102 );

INSERT INTO T_Login (login_id, password, username)
VALUES( 602, 'ek840j2l', 'haimB');

INSERT INTO T_Employee ( emp_id, hire_date,  work_phone,  work_email, login_id, IDperson)
VALUES (502, '03-JUN-2000', 0506777856, 'haim@MOH.HEALTH.GOV.IL', 602, 478823635 );

DELETE FROM T_Employee WHERE idperson = 478823635;

DELETE FROM T_Login WHERE login_id = 602;

DELETE FROM T_Person WHERE idperson = 478823635;

SELECT to_date(Sysdate) AS System_date 
FROM Dual;

--����� ������ ���
--SELECT  value
--FROM SYS.NLS_DATABASE_PARAMETERS
--WHERE parameter = 'NLS_DATE_FORMAT';



