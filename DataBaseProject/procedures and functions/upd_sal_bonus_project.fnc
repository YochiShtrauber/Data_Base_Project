create or replace function upd_sal_bonus_project(p_sal_date in date, project_name in varchar2) return varchar2 is
  FunctionResult integer;
  p_emp_id T_emprole.emp_id%type;
  precent number;
  p_hire_date date;
  p_base_salary_to_compute integer;
  p_base_salary integer;
  sal_bonus integer;
  now date;
  new_sal_val integer;
  
  CURSOR C_emps is
   select emp_id
   from t_Job_Review jr
   where jr.proj_name = project_name;
   
begin
  OPEN C_emps;
  FunctionResult:=0;
  LOOP
    FETCH C_emps INTO p_emp_id;
          EXIT WHEN C_emps%notfound;
          select hire_date into p_hire_date
          from t_Employee
          where emp_id = p_emp_id;
          if EXTRACT(YEAR FROM p_hire_date) > 2016 then
             precent:=1;
          elsif EXTRACT(YEAR FROM p_hire_date) > 2010 then
             precent:=2;
          elsif EXTRACT(YEAR FROM p_hire_date) > 2000 then
             precent:=3;
          else
             precent:=4;
          end if;
          
          select val into p_base_salary_to_compute
          from T_salary
          where emp_id = p_emp_id and EXTRACT(MONTH FROM sal_date)|| '-' || EXTRACT(YEAR FROM sal_date) = EXTRACT(MONTH FROM p_sal_date) || '-' || EXTRACT(YEAR FROM p_sal_date);
          
          select TRUNC(SYSDATE) into now
          FROM DUAL;
          
          select val into p_base_salary
          from T_salary
          where emp_id = p_emp_id and EXTRACT(MONTH FROM sal_date)|| '-' || EXTRACT(YEAR FROM sal_date) = 
                EXTRACT(MONTH FROM now) || '-' || EXTRACT(YEAR FROM now);
          
          sal_bonus:=(p_base_salary_to_compute*precent)/100;
          FunctionResult:=FunctionResult+sal_bonus;
          new_sal_val:=p_base_salary+sal_bonus;
          
          dbms_output.put_line(p_emp_id || '  ' || p_base_salary_to_compute || '  '|| precent || ' ' || sal_bonus || '  ' || new_sal_val);
          
          update T_Salary
          set val = new_sal_val
          where emp_id = p_emp_id and EXTRACT(MONTH FROM sal_date)|| '-' || EXTRACT(YEAR FROM sal_date) = 
                EXTRACT(MONTH FROM now) || '-' || EXTRACT(YEAR FROM now);
          commit;
  END LOOP;
  CLOSE C_emps; 
  return(FunctionResult);
end upd_sal_bonus_project;
/
