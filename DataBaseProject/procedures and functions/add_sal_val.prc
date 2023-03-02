create or replace procedure add_sal_val is 

p_emp_id T_emprole.emp_id%type;
n number;

CURSOR C_emps is
   select emp_id
   from T_emprole;
   
begin
  OPEN C_emps;
  LOOP
    FETCH C_emps INTO p_emp_id;
          EXIT WHEN C_emps%notfound; 
          SELECT dbms_random.value(10000,40000) num into n
          from dual;
          update t_Emprole
          set t_Emprole.sal_val = n
          where t_Emprole.emp_id = p_emp_id;
          dbms_output.put_line( p_emp_id || ': ' || n); 
          commit;
  END LOOP;
  CLOSE C_emps; 
  
end add_sal_val;
/
