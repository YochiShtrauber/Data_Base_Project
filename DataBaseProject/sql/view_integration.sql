




CREATE VIEW V_person_address AS
  SELECT fname, lname, birthDate, status, KodGender, city, street, house_num  
  FROM T_person p
  INNER JOIN T_address a 
  ON p.addr_id = a.addr_id
  Where p.status = 1;
  
  
select * 
from V_person_address;



--CREATE VIEW V_purch_salary AS
 -- SELECT fname, lname, status, emp_id, work_phone, work_email, val, sal_date, purchasingbudget, 
 -- purnum, purchasecost, purchasingdate
 -- FROM T_person pers
  --Natural Join T_employee 
 -- Natural Join T_salary 
 -- Natural Join T_purchasingworker 
 -- Natural Join T_purchase 
 -- Where pers.status = 1;
  
  
  

--select *
--from V_purch_salary;




CREATE VIEW V_role_salary AS
  SELECT dept_name, role_name, role_desc, sal_date, val 
  FROM T_Department Natural Join T_Role  
  Natural Join T_EmpRole Natural Join T_Salary 
  Where sal_date > '01-JAN-2019';
  
  
  
select * 
from V_role_salary;



