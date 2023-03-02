create or replace trigger audits
  after update or delete
  on t_salary 
  for each row
declare
  l_transaction VARCHAR2(10);
begin
  l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('salary', l_transaction, USER, SYSDATE);
end audits;
/
