SELECT * FROM T_Department;
SELECT * FROM T_Address;
SELECT * FROM T_Person;
SELECT * FROM T_Employee where emp_id = 930;
SELECT * FROM T_Login;
SELECT * FROM T_Role;
SELECT * FROM T_Job_review where proj_name = 'injections';
SELECT * FROM T_AddrDept;
SELECT * FROM T_Salary where emp_id = 930;
SELECT * FROM T_EmpRole;
SELECT * FROM T_AdvertisingWorker;
SELECT * FROM T_AdvertisingOffice;
SELECT * FROM T_purchase;
SELECT * FROM T_purchasingworker;
SELECT * FROM T_Advertisement;
SELECT * FROM T_AdvertisementsOfAdvertisingWorker;
SELECT * FROM T_Purchase_Items;
SELECT * FROM T_audits;

CREATE TABLE T_audits (
      audit_id         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
      table_name       VARCHAR2(255),
      transaction_name VARCHAR2(10),
      by_user          VARCHAR2(30),
      transaction_date DATE
);

update T_salary
set val = 3000
where emp_id = 280;

update T_role
set Role_desc = 'this is good'
where role_id = 2636;

update t_Employee
set work_phone = 34582673
where emp_id = 5;

update T_address
set house_num = 56
where addr_id = 4723;

DELETE FROM T_role WHERE role_id = 679;

update T_person
set citizenship = 'Japan'
where idperson = 373991554;
commit;

select *
from t_Emprole
where dept_id = 3011;

insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (316, '06-JUN-2021', 3011, 2110, 930, 'injections');
insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (317, '17-JUN-2021', 3011, 2110, 930, 'help');
insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (318, '17-JUN-2021', 3011, 2110, 280, 'goto');
insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (319, '17-JUN-2021', 3011, 2110, 930, 'make');


insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (324, '17-JUN-2021', 3011, 2110, 930, 'hello');

insert into t_Job_Review(Job_Id, Start_Date,Dept_Id,Role_Id, Emp_Id, Proj_Name)
values (325, '17-JUN-2021', 3011, 2110, 930, 'find');

delete from T_salary where sal_date = '01-APR-2012';

  select count(distinct proj_name)
  from t_Job_Review
  where emp_id = 930 and job_id not in
  (select job_id from t_Job_Review where emp_id = 930 and end_date < '16-JUN-2021');
  
  
    no_data EXCEPTION;
  PRAGMA
  EXCEPTION_INIT (no_data, 01403);
  
             EXCEPTION 

             WHEN no_data THEN
               num_of_projs:=0;
               is_in_that_proj:=0;
           END;
           
           -- ��� ����� ���� �� ���� ����� V
           -- ��� ����� ���� ���� �����
           -- ��� ����� �������� ����� ���� ���� �� ����� ������ ���
           -- ��� ��� �������� ��� ���� �����
-------------------------------------------------------------
          select val
          from T_salary
          where emp_id = p_emp_id and EXTRACT(MONTH FROM sal_date)|| '-' || EXTRACT(YEAR FROM sal_date) = 
                EXTRACT(MONTH FROM now) || '-' || EXTRACT(YEAR FROM now);
