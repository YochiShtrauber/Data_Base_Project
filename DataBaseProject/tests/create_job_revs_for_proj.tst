PL/SQL Developer Test script 3.0
8
begin
  -- Call the procedure
  create_job_revs_for_proj(p_job_id => :p_job_id,
                           p_role_name => :p_role_name,
                           num_of_emps => :num_of_emps,
                           proj_name => :proj_name,
                           p_hire_date => :p_hire_date);
end;
5
p_role_name
1
researcher
5
num_of_emps
1
3
4
proj_name
1
injections
5
p_hire_date
1
01/01/1990
12
p_job_id
1
314
5
0
