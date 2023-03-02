create or replace procedure add_salary_reports_monthly(in_sal_date in date,p_emp_id in integer) is

p_sal_val T_emprole.Sal_Val%type;
invalid_person EXCEPTION;
p_status T_person.Status%type;

begin
    select status into p_status
    from T_person NATURAL JOIN T_employee
    where emp_id = p_emp_id;
    if p_status = '0' or p_status = 'Dead' then
      RAISE invalid_person;
    else
      select sum(sal_val) into p_sal_val
      from t_Emprole
      where emp_id = p_emp_id;
      insert into T_salary(Emp_Id, Sal_Date, val)
      values (p_emp_id, in_sal_date, p_sal_val);
      commit;
    end if;
    EXCEPTION 
      WHEN invalid_person THEN
        raise_application_error(-20100, 'this person has no valid status');
end add_salary_reports_monthly;
/
