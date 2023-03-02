create or replace trigger reject_emp_to_new_proj
  before insert
  on t_job_review 
  
declare
  now date;
  num_of_projs integer;
  is_in_that_proj integer;
  p_emp t_Employee.Emp_Id%type;
  emp_changed boolean;
  
  CURSOR c_emp is
  select emp_id
  from t_Employee NATURAL JOIN t_Emprole
  where dept_id = :new.dept_id and role_id = :new.role_id;
  
begin
  emp_changed := false;
  select TRUNC(SYSDATE) into now
  FROM DUAL;  

  --get all the job reviews of the new emp inserted, all the projects that currently in process
  --and count all the different projects that this emp work on.
  select count(*) into num_of_projs
  from t_Job_Review
  where emp_id = :new.emp_id and job_id not in
  (select job_id from t_Job_Review where emp_id = :new.emp_id and end_date < now)
  group by proj_name;
  
  select count(*) into is_in_that_proj
  from t_job_review
  where emp_id = :new.emp_id and proj_name = :new.proj_name;
  
  if (num_of_projs >= 4) or (is_in_that_proj <> 0) then
    --check all the workers of that role if ther eis avaliable one
    OPEN c_emp;
    LOOP
      FETCH c_emp INTO p_emp;
           EXIT WHEN c_emp%notfound;
           
           select count(*) into num_of_projs 
           from t_Job_Review
           where emp_id = p_emp and job_id not in
           (select job_id from t_Job_Review where emp_id = p_emp and end_date < now)
           group by proj_name;
              
           select count(*) into is_in_that_proj
           from t_job_review
           where emp_id = p_emp and proj_name = :new.proj_name; 
    
           if num_of_projs < 4 and is_in_that_proj = 0 then
             :new.emp_id = p_emp;
             dbms_output.put_line("the worker" || :new.emp_id || " was avaliable and inserted");
             emp_changed := true;
             EXIT;
           end if;
     END LOOP;
     CLOSE c_emp;
     if emp_changed = false then
        dbms_output.put_line("this worker is toobusy or already in that project, || 
        "and there is no other worker to replace him");
     end if;
  else
     dbms_output.put_line("the worker" || :new.emp_id || " was avaliable and inserted");
  end if;
  
end reject_emp_to_new_proj;
/
