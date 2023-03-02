create or replace trigger trii
  after update or delete
  on t_salary 
  for each row
declare
 ----
begin
 dbms_output.put_line( 'emp_id: ');
end;
/
