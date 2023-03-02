INSERT INTO T_Department(dept_id, dept_desc, dept_name, dept_phone, dept_email)
VALUES ( 3011,'the department responsible is to check the security of the medicine', 'pharmacy', 08-6241010, 'Call.Habriut@MOH.HEALTH.GOV.IL');

INSERT INTO T_Address (addr_id,  city, street, house_num, postal_code, po_box)
VALUES (1011, 'jerusalem', 'yrmia', 17, 54456, 665 );

INSERT INTO T_Address (addr_id,  city, street, house_num, postal_code, po_box)
VALUES (1012, 'haifa', 'havazelet', 3, 5473, 965 );

INSERT INTO T_Person (IDperson, BirthDate,  KodGender,  citizenship , fname, lname,  email, phone, addr_id)
VALUES (011567543, '04-JUL-1970', '0', 'Israel', 'itzik', 'cohen', 'itzik66@gmail.com', 0587644732, 1012 );

INSERT INTO T_Login (login_id, mypassword, username)
VALUES( 6011, '8539FKDu', 'itzikC');

INSERT INTO T_Employee ( emp_id, hire_date,  work_phone,  work_email, login_id, IDperson)
VALUES (5011, '03-JUL-2000', 0506788856, 'itzik@MOH.HEALTH.GOV.IL', 6011, 011567543 );

INSERT INTO  T_Role(role_id, role_name, role_desc, dept_id)
VALUES (2110, 'researcher', 'check the medicine', 3011) ;

INSERT INTO T_Job_review (job_id, dept_id, role_id, emp_id, start_date, end_date, progress)
VALUES (312, 3011, 2110, 5011, '01-JAN-2018',  '02-MAR-2018', 'confirm the covid');

INSERT INTO T_ADDRDEPT (dept_id, addr_id )
VALUES (3011, 1011);

INSERT INTO T_Salary (sal_id, val, sal_date,  emp_id)
VALUES (7011, 20000, '10-FEB-2021', 5011);

INSERT INTO T_EMPROLE( emp_id, role_id , dept_id)
VALUES( 5011, 2110, 3011);

commit;
