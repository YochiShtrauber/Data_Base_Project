create or replace noneditionable procedure add_salary_reports_monthly(in_sal_date in date, proj_name_for_bonus in varchar2 DEFAULT 'nothing' ) is
p_emp_id T_emprole.emp_id%type;
p_sal_val T_emprole.Sal_Val%type;
total_bonus integer;

CURSOR C_emps is
   select distinct emp_id
   from T_emprole;

begin
  OPEN C_emps;
  LOOP
    FETCH C_emps INTO p_emp_id;
      EXIT WHEN C_emps%notfound; 
      select sum(sal_val) into p_sal_val
      from t_Emprole
      where emp_id = p_emp_id;
      insert into T_salary(Val,Sal_Date,Emp_Id)
      values (p_sal_val, in_sal_date, p_emp_id);
      commit;
  end loop;
  CLOSE C_emps;
  if proj_name_for_bonus <> 'nothing' then
    total_bonus := upd_sal_bonus_project(p_sal_date => in_sal_date,
                                   project_name => proj_name_for_bonus);
    dbms_output.put_line('added bonus '|| total_bonus || ' for project ' || proj_name_for_bonus );
  end if; 
end add_salary_reports_monthly;
/
