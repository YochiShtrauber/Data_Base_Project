create or replace procedure create_job_revs_for_proj (p_job_id in integer, p_role_name in varchar2, num_of_emps in integer, proj_name in varchar2, p_hire_date in date) is

TYPE emp IS RECORD (emp_id integer,hire_date date, role_name varchar(50), dept_id integer, role_id integer, work_email varchar(50));
p_emp emp;
num_emps_in_role integer;
random_emp integer;
rand_till integer;
i integer;
n number;
p_start_date date;

CURSOR C_emps1 is
   select emp_id,hire_date, role_name, dept_id, role_id, work_email
   from T_emprole NATURAL JOIN T_role NATURAL JOIN t_Employee
   where T_role.Role_Name = p_role_name and t_Employee.Hire_Date < p_hire_date;

begin
    OPEN C_emps1;
      
    select count(*) into num_emps_in_role  from T_emprole NATURAL JOIN T_role NATURAL JOIN t_Employee
    where T_role.Role_Name = p_role_name and t_Employee.Hire_Date < p_hire_date; 
    rand_till:=num_emps_in_role - num_of_emps;
    SELECT dbms_random.value(0,rand_till) num into random_emp from dual;
    --dbms_output.put_line(' start select from: ' || rand_till || 'emps in cursor: ' || num_emps_in_role);
     
    -- get employees only after fetching till the random num
    for i in 1..random_emp
    LOOP
      FETCH C_emps1 INTO p_emp;
           EXIT WHEN C_emps1%notfound; 
           dbms_output.put_line( 'emp_id: '|| p_emp.emp_id || '     dept_id: ' ||  p_emp.dept_id  || '    role_id: ' || p_emp.role_id  || 
                  '     role_name: ' || p_emp.role_name ||'      hire_date: ' || p_emp.hire_date   ||  '     work_email: ' || p_emp.work_email);
    END LOOP;
      
    select TRUNC(SYSDATE) into p_start_date
    FROM DUAL;
      
    n:=1; 
    for n in 1..num_of_emps
    loop
       FETCH C_emps1 INTO p_emp;
           EXIT WHEN C_emps1%notfound;
         
           insert into T_Job_Review(Job_Id, Start_Date, Emp_Id, Dept_Id, Role_Id, Proj_Name)
           values (p_job_id, p_start_date,p_emp.emp_id, p_emp.dept_id, p_emp.role_id , proj_name);
           
           commit;
    end loop;
    FETCH C_emps1 INTO p_emp;
      
    CLOSE C_emps1;
end create_job_revs_for_proj;
/
