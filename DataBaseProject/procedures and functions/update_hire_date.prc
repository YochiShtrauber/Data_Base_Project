create or replace procedure update_hire_date is 

p_emp_id T_emprole.emp_id%type;
p_hire_date date;

CURSOR C_emps is
   select emp_id
   from T_employee;
   
begin
  OPEN C_emps;
  LOOP
    FETCH C_emps INTO p_emp_id;
          EXIT WHEN C_emps%notfound;
          select to_date('01-01-1970', 'dd-mm-yyyy')+trunc(dbms_random.value(1,12000)) into p_hire_date from dual;
          
          update t_Employee
          set t_Employee.hire_date = p_hire_date
          where t_employee.emp_id = p_emp_id;
          --dbms_output.put_line( p_emp_id || ': ' || p_hire_date); 
          commit;
  END LOOP;
  CLOSE C_emps; 
  
end update_hire_date;
/
