



ALTER TABLE PurchasingWorker
RENAME TO T_PurchasingWorker;



ALTER TABLE purchase
RENAME TO T_purchase;



ALTER TABLE AdvertisingWorker
RENAME TO T_AdvertisingWorker;



ALTER TABLE AdvertisingOffice
RENAME TO T_AdvertisingOffice;


ALTER TABLE Advertisement
RENAME TO T_Advertisement;


ALTER TABLE AdvertisementsOfAdvertisingWorker
RENAME TO T_AdvertisementsOfAdvertisingWorker;



ALTER TABLE Purchase_Items
RENAME TO T_Purchase_Items;





Alter table T_Person
modify status varchar(30);


Alter table T_Person
modify email varchar(50) null;

Alter table T_Person
modify phone integer null;

Alter table T_Person
modify addr_id integer null;


select * from T_Person;


insert into T_Person(Idperson,
                     Birthdate,
                     Kodgender,
                     Citizenship,
                     Fname,
                     Lname,
                     Status)
select Idperson, Birthdate,
                     Kodgender,
                     Citizenship,
                     Fname,
                     Lname,
                     Status
from Person; 
                     
                    
select * from T_Person;



Alter table T_Employee
modify hire_date DATE null;

Alter table T_Employee
modify work_phone integer null;

Alter table T_Employee
modify login_id integer null;


select * from T_Employee;


insert into T_Employee(Emp_Id,
                       Work_Email,
                       Idperson)
select workerId, email, Idperson
from worker; 

select * from T_Employee;




----------------------------------------- here we have to check how to had salary
Alter table T_Salary
modify val int null;

Alter table T_Salary
modify sal_date Date null;

Alter table T_Salary
modify emp_id int null;

-- insert 1000 records via data generator with random sal_id

select * from T_Salary;


update T_salary(Val,
                     Emp_Id)
select salary, workerid from worker  
where             



UPDATE T_salary
SET Emp_id  = (select workerId from worker), 
    val = (select salary from worker w
           where Emp_id = w.workerid )   
WHERE val is null ;

------------------------------------------------


Alter table T_PurchasingWorker
RENAME COLUMN workerid to emp_id;


Alter table T_AdvertisingWorker
RENAME COLUMN workerid to emp_id;


ALTER TABLE T_PurchasingWorker
ADD CONSTRAINT fk_T_employee
FOREIGN KEY (emp_id)
REFERENCES T_employee(emp_id);

ALTER TABLE T_PurchasingWorker
DROP CONSTRAINT SYS_C008434;


ALTER TABLE T_AdvertisingWorker
ADD CONSTRAINT fk_T_emp_adv
FOREIGN KEY (emp_id)
REFERENCES T_employee(emp_id);

ALTER TABLE T_AdvertisingWorker
DROP CONSTRAINT SYS_C008429;



