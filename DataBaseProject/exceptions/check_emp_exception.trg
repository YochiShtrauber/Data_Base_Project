create or replace trigger check_emp
  before insert
  on t_job_review 
  for each row
  
declare
  now date;
  num_of_projs integer;
  is_in_that_proj integer;
  too_busy EXCEPTION;
  
begin
  select TRUNC(SYSDATE) into now
  FROM DUAL;  
  
  select count(distinct proj_name) into num_of_projs
  from t_Job_Review
  where emp_id = :new.emp_id and job_id not in
  (select job_id from t_Job_Review where emp_id = :new.emp_id and end_date < now);
  
  select count(distinct proj_name) into is_in_that_proj
  from t_job_review
  where emp_id = :new.emp_id and proj_name = :new.proj_name;
  
  if (is_in_that_proj = 0) and (num_of_projs >= 4) then
        RAISE too_busy;
  end if;
  EXCEPTION 
      WHEN too_busy THEN
        raise_application_error(-20101, 'this worker is too busy');
end check_emp;
/
