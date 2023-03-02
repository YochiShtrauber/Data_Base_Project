SELECT * FROM T_EmpRole;
alter table t_Emprole
add sal_val integer;
commit;

Drop table T_Salary;

CREATE TABLE T_Salary
(
  val INT,
  sal_date DATE NOT NULL,
  emp_id INT NOT NULL,
  PRIMARY KEY (emp_id, sal_date),
  FOREIGN KEY (emp_id) REFERENCES T_Employee(emp_id)
);

insert into T_Salary (emp_id, sal_date, val)
values (5011,'update t_Job_Review
set proj_name = 'lala'
where emp_id = 2;

update t_Job_Review
set proj_name = 'jojo'
where emp_id = 5011;

commit;10-FEB-2021', 20000);

insert into T_Salary (emp_id, sal_date, val)
values (2,'01-JAN-2020', 19000);

commit;

update T_Salary
set val = 23930
where emp_id = 2 and sal_date = '02-JUN-2021';
commit;

update T_purchase 
set purchasingdate = '01-FEB-2021'
where purnum = 3;

update T_purchase 
set purchasingdate = '23-FEB-2021'
where purnum = 7;

update T_purchase 
set purchasingdate = '01-MAY-2021'
where purnum = 11;

commit;

alter table t_Job_Review
modify end_date date null;

alter table t_Job_Review
modify progress varchar(500) null;

delete from t_Job_Review
where job_id = 26039;

delete from t_Job_Review
where job_id = 29555;

delete from t_Job_Review
where job_id = 16269;

commit;


