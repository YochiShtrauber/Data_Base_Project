create or replace function check_maam_and_savings(maam in integer) return varchar2 is
  FunctionResult integer;
  last_year integer;
  now date;
  TYPE puRec IS RECORD(purnum t_Purchase.Purnum%type, cost t_Purchase.Purchasecost%type, workerid T_PURCHASE.PURCHASINGWORKERID%type);
  p_purchase puRec;
  p_cost_without_maam integer;
  sum_of_neto_purch integer;
  global_budget integer;
  
  CURSOR c_purches is
   select purnum, purchasecost, purchasingworkerid 
   from t_Purchase
   where EXTRACT(YEAR FROM purchasingdate) = last_year;

begin
  
  select TRUNC(SYSDATE) into now FROM DUAL;
  last_year:= EXTRACT(YEAR FROM now);  
  sum_of_neto_purch:=0;

  OPEN c_purches;
  LOOP
    FETCH c_purches INTO p_purchase;
         EXIT WHEN c_purches%notfound;
         p_cost_without_maam:=p_purchase.cost - (maam*p_purchase.cost)/100;
         sum_of_neto_purch:=sum_of_neto_purch+p_cost_without_maam;
         
         update T_purchase 
         set purchasecost = p_cost_without_maam
         where purnum = p_purchase.purnum;
         
         commit;
         
  END LOOP;
  CLOSE c_purches;
  
  select sum(purchasingbudget) into global_budget
  from T_purchasingworker;
  
  FunctionResult:=global_budget-sum_of_neto_purch;
  
  return(FunctionResult);
end check_maam_and_savings;
/
