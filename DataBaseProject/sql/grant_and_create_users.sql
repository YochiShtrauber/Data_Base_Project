-------------------------------------create new user
alter session set "_ORACLE_SCRIPT"=true;


CREATE USER sara -- user name 
IDENTIFIED BY 1423 -- passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to sara;
grant create table to sara; 

ALTER USER sara quota unlimited on SYSTEM

--DROP USER sara


-------------------------------grant

grant all on T_person to sara;

revoke all on T_person from sara;
 


grant select on T_department to sara;

revoke all on T_person from sara;

revoke select on T_department from sara;


grant select on T_person to sara;


grant all on T_department to sara;
-------------------------------------create new user
alter session set "_ORACLE_SCRIPT"=true;


CREATE USER josef -- user name 
IDENTIFIED BY 1423 -- passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to josef;
grant create table to josef; 

ALTER USER josef quota unlimited on SYSTEM

--DROP USER josef

-------------------------------grant

grant select on T_person to josef;


grant all on T_department to josef;

revoke select on T_person from josef;

revoke all on T_department from josef;
 
grant all on T_person to josef;

grant select on T_department to josef;

alter user josef quota unlimited on users;

----------------------------------------

alter session set "_ORACLE_SCRIPT"=true;  

create user hai --user name
IDENTIFIED BY hai    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to hai;
grant create table to hai;
grant unlimited tablespace to hai;
grant create view , create procedure , create sequence to hai;
grant DEBUG CONNECT SESSION to haiþ;
grant CREATE ANY TRIGGER to haiþ;
ALTER USER hai quota unlimited on SYSTEM;

--------------------------------------

alter session set "_ORACLE_SCRIPT"=true;  

create user ariel --user name
IDENTIFIED BY 1234    --passward
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;

grant create session to ariel;
grant create table to ariel;
grant unlimited tablespace to ariel;
grant create view , create procedure , create sequence to ariel;
grant DEBUG CONNECT SESSION to arielþ;
grant CREATE ANY TRIGGER to arielþ;
ALTER USER ariel quota unlimited on SYSTEM

revoke unlimited tablespace from ariel;

select * from dba_users;
