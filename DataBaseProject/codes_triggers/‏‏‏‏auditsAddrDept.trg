create or replace trigger auditsAddrDept
  after update or delete
  on t_Addrdept
  for each row
declare
  l_transaction VARCHAR2(10);
begin
  l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO T_audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('Addrdept', l_transaction, USER, SYSDATE);
end;
/
