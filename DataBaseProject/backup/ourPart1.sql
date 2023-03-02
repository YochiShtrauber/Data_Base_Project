prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by yochi on Sunday, 11 April 2021
set feedback off
set define off

prompt Creating T_ADDRESS...
create table T_ADDRESS
(
  addr_id     INTEGER not null,
  city        VARCHAR2(50) not null,
  street      VARCHAR2(100) not null,
  house_num   INTEGER not null,
  apt_num     INTEGER,
  postal_code INTEGER,
  po_box      INTEGER
);

alter table T_ADDRESS
  add primary key (ADDR_ID);

prompt Creating T_DEPARTMENT...
create table T_DEPARTMENT
(
  dept_id    INTEGER not null,
  dept_desc  VARCHAR2(500) not null,
  dept_name  VARCHAR2(50) not null,
  dept_phone INTEGER not null,
  dept_email VARCHAR2(50) not null
);

alter table T_DEPARTMENT
  add primary key (DEPT_ID);

prompt Creating T_ADDRDEPT...
create table T_ADDRDEPT
(
  dept_id INTEGER not null,
  addr_id INTEGER not null
);

alter table T_ADDRDEPT
  add primary key (DEPT_ID, ADDR_ID);
alter table T_ADDRDEPT
  add foreign key (DEPT_ID)
  references T_DEPARTMENT (DEPT_ID);
alter table T_ADDRDEPT
  add foreign key (ADDR_ID)
  references T_ADDRESS (ADDR_ID);

prompt Creating T_LOGIN...
create table T_LOGIN
(
  login_id   INTEGER not null,
  mypassword VARCHAR2(8) not null,
  username   VARCHAR2(50) not null
);

alter table T_LOGIN
  add primary key (LOGIN_ID);

prompt Creating T_PERSON...
create table T_PERSON
(
  idperson    INTEGER not null,
  birthdate   DATE not null,
  kodgender   CHAR(1) not null,
  citizenship VARCHAR2(50) not null,
  fname       VARCHAR2(50) not null,
  lname       VARCHAR2(50) not null,
  email       VARCHAR2(50) not null,
  phone       INTEGER not null,
  status      CHAR(1),
  addr_id     INTEGER not null
);

alter table T_PERSON
  add primary key (IDPERSON);
  
alter table T_PERSON
  add foreign key (ADDR_ID)
  references T_ADDRESS (ADDR_ID);

prompt Creating T_EMPLOYEE...
create table T_EMPLOYEE
(
  emp_id     INTEGER not null,
  hire_date  DATE not null,
  work_phone INTEGER not null,
  work_email VARCHAR2(50) not null,
  login_id   INTEGER not null,
  idperson   INTEGER not null
);

alter table T_EMPLOYEE
  add primary key (EMP_ID);
  
alter table T_EMPLOYEE
  add foreign key (LOGIN_ID)
  references T_LOGIN (LOGIN_ID);
alter table T_EMPLOYEE
  add foreign key (IDPERSON)
  references T_PERSON (IDPERSON);

prompt Creating T_ROLE...
create table T_ROLE
(
  role_id   INTEGER not null,
  role_name VARCHAR2(50) not null,
  role_desc VARCHAR2(500) not null,
  dept_id   INTEGER not null
);

alter table T_ROLE
  add primary key (ROLE_ID, DEPT_ID);
  
alter table T_ROLE
  add foreign key (DEPT_ID)
  references T_DEPARTMENT (DEPT_ID);

prompt Creating T_EMPROLE...
create table T_EMPROLE
(
  emp_id  INTEGER not null,
  role_id INTEGER not null,
  dept_id INTEGER not null
);

alter table T_EMPROLE
  add primary key (EMP_ID, ROLE_ID, DEPT_ID);
  
alter table T_EMPROLE
  add foreign key (EMP_ID)
  references T_EMPLOYEE (EMP_ID);
alter table T_EMPROLE
  add foreign key (ROLE_ID, DEPT_ID)
  references T_ROLE (ROLE_ID, DEPT_ID);

prompt Creating T_JOB_REVIEW...
create table T_JOB_REVIEW
(
  job_id     INTEGER not null,
  start_date DATE not null,
  end_date   DATE not null,
  progress   VARCHAR2(500) not null,
  dept_id    INTEGER not null,
  role_id    INTEGER not null,
  emp_id     INTEGER not null
);

alter table T_JOB_REVIEW
  add primary key (JOB_ID, EMP_ID, ROLE_ID, DEPT_ID);
  
alter table T_JOB_REVIEW
  add foreign key (EMP_ID)
  references T_EMPLOYEE (EMP_ID);
alter table T_JOB_REVIEW
  add foreign key (ROLE_ID, DEPT_ID)
  references T_ROLE (ROLE_ID, DEPT_ID);

prompt Creating T_SALARY...
create table T_SALARY
(
  sal_id   INTEGER not null,
  val      INTEGER not null,
  sal_date DATE not null,
  emp_id   INTEGER not null
);

alter table T_SALARY
  add primary key (SAL_ID);
  
alter table T_SALARY
  add foreign key (EMP_ID)
  references T_EMPLOYEE (EMP_ID);

prompt Disabling triggers for T_ADDRESS...
alter table T_ADDRESS disable all triggers;
prompt Disabling triggers for T_DEPARTMENT...
alter table T_DEPARTMENT disable all triggers;
prompt Disabling triggers for T_ADDRDEPT...
alter table T_ADDRDEPT disable all triggers;
prompt Disabling triggers for T_LOGIN...
alter table T_LOGIN disable all triggers;
prompt Disabling triggers for T_PERSON...
alter table T_PERSON disable all triggers;
prompt Disabling triggers for T_EMPLOYEE...
alter table T_EMPLOYEE disable all triggers;
prompt Disabling triggers for T_ROLE...
alter table T_ROLE disable all triggers;
prompt Disabling triggers for T_EMPROLE...
alter table T_EMPROLE disable all triggers;
prompt Disabling triggers for T_JOB_REVIEW...
alter table T_JOB_REVIEW disable all triggers;
prompt Disabling triggers for T_SALARY...
alter table T_SALARY disable all triggers;
prompt Disabling foreign key constraints for T_ADDRDEPT...
alter table T_ADDRDEPT disable constraint SYS_C007401;
alter table T_ADDRDEPT disable constraint SYS_C007402;
prompt Disabling foreign key constraints for T_PERSON...
alter table T_PERSON disable constraint SYS_C007378;
prompt Disabling foreign key constraints for T_EMPLOYEE...
alter table T_EMPLOYEE disable constraint SYS_C007386;
alter table T_EMPLOYEE disable constraint SYS_C007387;
prompt Disabling foreign key constraints for T_ROLE...
alter table T_ROLE disable constraint SYS_C007363;
prompt Disabling foreign key constraints for T_EMPROLE...
alter table T_EMPROLE disable constraint SYS_C007413;
alter table T_EMPROLE disable constraint SYS_C007414;
prompt Disabling foreign key constraints for T_JOB_REVIEW...
alter table T_JOB_REVIEW disable constraint SYS_C007396;
alter table T_JOB_REVIEW disable constraint SYS_C007397;
prompt Disabling foreign key constraints for T_SALARY...
alter table T_SALARY disable constraint SYS_C007408;
prompt Deleting T_SALARY...
delete from T_SALARY;
commit;
prompt Deleting T_JOB_REVIEW...
delete from T_JOB_REVIEW;
commit;
prompt Deleting T_EMPROLE...
delete from T_EMPROLE;
commit;
prompt Deleting T_ROLE...
delete from T_ROLE;
commit;
prompt Deleting T_EMPLOYEE...
delete from T_EMPLOYEE;
commit;
prompt Deleting T_PERSON...
delete from T_PERSON;
commit;
prompt Deleting T_LOGIN...
delete from T_LOGIN;
commit;
prompt Deleting T_ADDRDEPT...
delete from T_ADDRDEPT;
commit;
prompt Deleting T_DEPARTMENT...
delete from T_DEPARTMENT;
commit;
prompt Deleting T_ADDRESS...
delete from T_ADDRESS;
commit;
prompt Loading T_ADDRESS...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1011, 'jerusalem', 'yrmia', 17, null, 54456, 665);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1012, 'haifa', 'havazelet', 3, null, 5473, 965);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2308, 'Uden', 'kinvmug xtrliy', 191, 8, 6668, 30258);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5775, 'Sant Cugat Del Valle', 'ayddbqx mefezh', 152, 1, 2138, 94561);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4337, 'Adamstown', 'dnwepco igvlca', 147, 17, 7168, 90629);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2022, 'Genève', 'qbwzcff eugeaj', 94, 17, 7167, 84885);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4723, 'Los Angeles', 'pizecpp hmieac', 36, 3, 9899, 8823);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2546, 'Carlin', 'ldttzth qujzzv', 141, 2, 5133, 41468);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5452, 'Pompton Plains', 'vxmppnw oshjfv', 52, 5, 8721, 13787);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4807, 'Harsum', 'towyhlm qbcomt', 181, 17, 4717, 8035);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6390, 'Annandale', 'bjyhapw coepbs', 99, 10, 9664, 25192);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3410, 'Breda', 'xakhnqt gfmibm', 123, 2, 2847, 36642);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4100, 'Koppl', 'eetkuqr haevrs', 72, 20, 3994, 48903);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3714, 'Research Triangle', 'wcpvxvz jccawv', 110, 20, 6309, 70731);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6525, 'Kaunas', 'xhhaeqc gdwjfb', 107, 8, 12, 99776);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1952, 'Royersford', 'whosqqz tulkuh', 162, 13, 7500, 7922);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4185, 'Coldmeece', 'rzkylxr yennnh', 106, 12, 5488, 60805);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6412, 'Greenwood Village', 'fkxesps yxosda', 38, 17, 2597, 96672);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3502, 'Banbury', 'jthzeym dcfcjt', 96, 7, 3601, 18540);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3911, 'New Fairfield', 'uegfevj cfigae', 191, 6, 6886, 55096);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2853, 'Ettlingen', 'wvxecxo yrvtyf', 71, 17, 4128, 40347);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5481, 'Carlingford', 'gxmeudu npyzao', 143, 6, 2178, 12484);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1894, 'Park Ridge', 'prbkeoq zmzzuv', 99, 2, 4069, 71603);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2326, 'Peachtree City', 'uckbcmp kdtmrr', 77, 15, 5107, 33529);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5441, 'Edmonton', 'lhyenac imvvjl', 73, 4, 5786, 30549);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2835, 'Runcorn', 'jrgjqtg ltlaiz', 193, 1, 9076, 65858);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4486, 'Caguas', 'vccghdn tyesrv', 15, 2, 9982, 57328);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3984, 'Kochi', 'cjgvbsa aiqnrt', 94, 10, 1300, 82853);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6624, 'Southend on Sea', 'owbsnka cqrpiz', 174, 10, 3307, 74125);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1087, 'Spring Valley', 'ihotzbo czpeas', 164, 2, 1817, 11991);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6893, 'Suwon-city', 'uwbhxyr zquuxc', 102, 12, 2170, 81001);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3199, 'Monroe', 'slhvzkg rhnurp', 182, 14, 6527, 96118);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2513, 'Horsens', 'mdampnc xktmul', 26, 5, 6384, 12327);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1752, 'Longview', 'fpkvahw bsblbz', 152, 12, 8079, 31954);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3822, 'St Leonards', 'unnquhj rtlcru', 197, 17, 4928, 98867);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5962, 'Eiksmarka', 'opilpjt hdppnb', 129, 16, 4513, 59895);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4963, 'Runcorn', 'xqhezla tdoriu', 172, 4, 2257, 29792);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3208, 'Vallauris', 'rotlnhp fbdmsg', 36, 11, 8547, 12414);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5983, 'Madison', 'psomrrk bzwrlr', 160, 9, 5402, 34335);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2971, 'Bartlesville', 'xugdsvz udatqq', 144, 9, 7228, 11313);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2433, 'Dinslaken', 'ogwrkrx mgmwhd', 192, 6, 9082, 67428);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3027, 'Trieste', 'bdjgfft fkbjbb', 110, 12, 2520, 50370);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2103, 'Coburg', 'xnzxlla zvbwzk', 186, 15, 341, 66899);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5777, 'Santa rita sapucaí', 'ukxoyqo oxygew', 34, 9, 1851, 24865);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1666, 'Bad Oeynhausen', 'vyoiglj zwfshz', 84, 2, 6531, 18183);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6388, 'Leverkusen', 'vrzbvtj cbmhxm', 40, 13, 3850, 62958);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1682, 'Hounslow', 'vyvzkpb hsvwfh', 105, 3, 1181, 78938);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4515, 'Waldbronn', 'vdgxezb erebuu', 92, 19, 6500, 73985);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1917, 'Ribeirao preto', 'uucklhx riamaz', 121, 4, 1820, 66453);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4894, 'Kyunnam', 'jcddobj fisdhs', 45, 11, 3916, 89271);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3791, 'Casselberry', 'ylhkddf moydvf', 121, 14, 8143, 80920);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3861, 'Westfield', 'ytokbpu zfanov', 164, 12, 1704, 90136);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3204, 'Greenwood Village', 'hmjqbsw guamkz', 194, 18, 9242, 87906);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3417, 'Ettlingen', 'eogwsol kknwjj', 37, 16, 2549, 92521);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5518, 'Borger', 'wygfdzi eijgfg', 178, 18, 3198, 64964);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6579, 'Redmond', 'xkzdkib culzlo', 70, 15, 3017, 18937);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2451, 'Erpe-Mere', 'frwsvje prewes', 55, 6, 9096, 55248);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1797, 'Irving', 'vvdzsrr tptavu', 170, 18, 9397, 18382);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4346, 'Springfield', 'rjnnpbp ishsnk', 80, 19, 1269, 77350);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4449, 'Prague', 'vtctjzq vwjdmr', 98, 16, 9977, 83448);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4641, 'Birmensdorf', 'fzxjhan nuvmkp', 45, 13, 1493, 16472);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4232, 'Venice', 'fumbfyf plnqdg', 125, 20, 9721, 67760);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1864, 'Rochester', 'zgurebm gieajz', 55, 8, 355, 84152);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5299, 'Shoreline', 'otpnzig dxpvln', 97, 5, 4844, 28012);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5677, 'Albuquerque', 'kpyubfq ruhcbj', 83, 16, 9135, 7395);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5324, 'Bernex', 'zxmchvz mrelih', 198, 4, 8780, 10972);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3239, 'Salt Lake City', 'nqvybme sxcgnq', 187, 6, 4976, 73945);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3695, 'Bischofshofen', 'whkvbbp yesqqh', 112, 20, 8350, 14316);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1192, 'Johannesburg', 'zmibnjh aylwio', 56, 4, 6599, 99242);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4195, 'Pacific Grove', 'eegcezk fgqhzs', 44, 13, 9430, 96100);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2319, 'Miyazaki', 'uohfpcr ngvscg', 31, 2, 5384, 15482);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3653, 'Solon', 'eipasgo exyqam', 116, 12, 5287, 42024);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3382, 'Okayama', 'ifdctpw tdgtrr', 158, 2, 2658, 60992);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3729, 'Williamstown', 'wycnvfw ochiog', 154, 4, 786, 65246);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6440, 'Frankfurt', 'dgywzsm dbrqqz', 10, 10, 9819, 42706);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1838, 'Adamstown', 'kyrgmsa kwgrah', 60, 11, 5214, 12253);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1937, 'Barksdale afb', 'aepzofl wvxfnb', 150, 4, 8800, 88811);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5822, 'Shelton', 'mkrlmfz sodveu', 142, 13, 1289, 90405);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5702, 'Hackensack', 'iafjjpj qwueqg', 147, 19, 3968, 47804);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3244, 'Porto alegre', 'ntsqhhr hrygam', 82, 14, 6570, 11199);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5952, 'Shizuoka', 'ywhgpmf txlljj', 172, 20, 577, 82643);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2569, 'Bay Shore', 'yctfxog fbztwk', 82, 19, 1998, 18610);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2758, 'Sugar Land', 'ikcuieb ydlphh', 26, 8, 1137, 18547);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4795, 'Southend on Sea', 'dofmcvg wszuhr', 188, 15, 250, 44308);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3672, 'Thame', 'bjghece yuqesj', 178, 9, 1992, 19475);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1304, 'Brossard', 'bxmubkt dvagsv', 88, 17, 7720, 53889);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4362, 'Newcastle upon Tyne', 'jhfkiff dekcsy', 56, 6, 4786, 23303);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5240, 'Oberwangen', 'vsxurxx chqadm', 162, 10, 6748, 64126);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5295, 'West Windsor', 'aymgndn fnvuin', 86, 15, 297, 81292);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2457, 'St. Louis', 'qfdgzlg hrrfie', 122, 13, 9384, 14317);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2039, 'Waltham', 'jdyklsy whoukd', 175, 3, 7408, 23808);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5746, 'Brossard', 'zgnzkrv vczbei', 159, 8, 4678, 29661);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3697, 'Eden prairie', 'icqudju ztlpmv', 117, 4, 1503, 22693);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3125, 'Green bay', 'guoyhgc juqwlm', 107, 14, 5804, 7221);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4760, 'Oslo', 'iqrdmwz kmuqee', 84, 13, 4404, 31312);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3707, 'Breda', 'kbkjgcz qmcmbj', 26, 14, 6882, 11764);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3871, 'Sulzbach', 'lmvopug ynnlpi', 99, 2, 1261, 82470);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6866, 'Corona', 'zwrrndt gabjuu', 125, 15, 7802, 30938);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3663, 'Thame', 'vskwqqi vuaujr', 152, 14, 5996, 35413);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1800, 'Johannesburg', 'ueiugfh rfhcnk', 177, 19, 9093, 38260);
commit;
prompt 100 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3355, 'Chaam', 'mgobxlx qbqedv', 2, 18, 2423, 76477);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5161, 'Mason', 'ywrytwg sheplo', 55, 5, 7346, 34826);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1585, 'Oakland', 'ilskxed huxfwo', 130, 13, 2724, 401);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6098, 'Sihung-si', 'aizihch orbgue', 91, 18, 1969, 69453);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3284, 'Paraju', 'akwtxsi amsnkk', 111, 1, 45, 98681);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5748, 'Milan', 'vgelmeh yhhfbe', 63, 18, 493, 57854);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4838, 'Nancy', 'ssfcrdj hvvcuw', 168, 20, 375, 12199);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4656, 'Southampton', 'qklvaer hucydu', 174, 6, 3080, 89604);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6668, 'Thörishaus', 'uooqowp yuvrmm', 21, 9, 3074, 12765);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4085, 'Kaysville', 'byeurwa xllcmk', 91, 4, 2845, 49334);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3768, 'Bern', 'ehqaljd gbrgie', 123, 10, 1486, 58768);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1188, 'Hanover', 'scpmsxd zwxkku', 30, 19, 3832, 98289);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6524, 'Vallauris', 'jmnnwcb lnlrey', 113, 8, 3928, 77369);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2663, 'Richardson', 'ndwoobr nxuakb', 176, 5, 8372, 67863);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5787, 'Gävle', 'yuyglzm xyottk', 138, 5, 7894, 20757);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1990, 'Sheffield', 'coebcor dqaxmj', 45, 4, 9323, 88521);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6008, 'Wehrheim', 'wyftgww tpnwdx', 101, 7, 4113, 41926);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2170, 'Albany', 'ctigxyv ulvijv', 151, 4, 6979, 93367);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4441, 'Hampton', 'majpnfo hbiwca', 52, 15, 997, 19454);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4204, 'Stuttgart', 'zpjpdzu ooamsn', 130, 17, 3499, 74103);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1688, 'Manaus', 'rjvwgjr ycbfbn', 147, 5, 5615, 18578);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3579, 'Philadelphia', 'efdegtr eiehhz', 119, 18, 2126, 48952);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6778, 'Oak park', 'tikuhqe axkcsa', 73, 2, 697, 59457);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2020, 'San Diego', 'nuteztl lqjtpx', 155, 10, 2238, 94605);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1149, 'Minneapolis', 'mvapjto uwpnyc', 28, 7, 1469, 15240);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4545, 'Yogyakarta', 'yotownm ldgulx', 13, 15, 3215, 88939);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4625, 'Philadelphia', 'xxgythy iqlzss', 72, 10, 8551, 21150);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6849, 'München', 'fqbdaqz geifda', 140, 16, 1521, 78930);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5200, 'Trieste', 'ogpgdus vljmjw', 159, 5, 4969, 57781);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5221, 'Koeln', 'spnuhjh pbcoko', 130, 20, 7902, 50908);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5926, 'Bern', 'rhwjcvu lpadhy', 129, 11, 6642, 37468);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1829, 'Itu', 'whvfklf umvpys', 17, 15, 4539, 28096);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3606, 'Warsaw', 'lrakplo ptlwvl', 61, 10, 2557, 34563);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3327, 'Brisbane', 'wbghkvm bqhujq', 129, 4, 3263, 84505);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6742, 'Burlington', 'qdmbgry cvjvkp', 78, 7, 290, 94228);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4155, 'West Chester', 'dqqxotc gvsyqc', 176, 10, 2763, 41895);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3159, 'Kerava', 'peetbnr praimt', 143, 9, 6215, 54651);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5219, 'Highton', 'lffipeg bzubmt', 37, 19, 9526, 25782);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5194, 'Odense', 'ygzbqas encszx', 136, 5, 5200, 44843);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6563, 'Samrand', 'vuwundn nglndj', 134, 19, 1574, 22415);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3536, 'Luzern', 'hxkwetm mrekho', 2, 19, 2397, 52499);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6349, 'Luedenscheid', 'lzfnlrc rcsino', 113, 16, 7342, 96352);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6141, 'Zaandam', 'bmyrakr kdpixz', 133, 2, 7212, 52404);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5790, 'Slmea', 'kwucfbd msxskm', 7, 6, 8036, 42387);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4705, 'Sugar Land', 'xylqeba jthpij', 191, 18, 7245, 89070);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6472, 'Burgess Hill', 'twysdte tmymbn', 136, 14, 1571, 30528);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4361, 'Hayward', 'dihtjrp zqrzuh', 170, 3, 9146, 32914);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3666, 'Smyrna', 'xlwykes mcscrd', 180, 10, 2651, 42765);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5379, 'Zurich', 'npuclmj pghald', 59, 14, 2064, 10295);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4037, 'Lehi', 'trxdbpe ibwnbw', 196, 9, 5829, 61468);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3525, 'Buenos Aires', 'gnwazgu ppjiml', 100, 18, 9643, 57923);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5792, 'Blue bell', 'glkyyxp mzywhb', 12, 19, 346, 50239);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5931, 'Boston', 'mjkqhqp bjkebm', 54, 7, 7574, 25359);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2720, 'Enschede', 'etpywss gnqusg', 193, 16, 4278, 5420);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3670, 'Dartmouth', 'qpepchv ylamtk', 84, 19, 521, 62561);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1665, 'Fort worth', 'tolwqeo sgcjgl', 162, 8, 7364, 65661);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1120, 'Toledo', 'gkfddet jlnhps', 146, 7, 5239, 49969);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4634, 'Melrose', 'tvjfzdk zsaydv', 139, 13, 9232, 69746);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2185, 'San Dimas', 'fhlxqrm fuqjqr', 115, 3, 4908, 69523);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4225, 'Kongserbg', 'juhcsoi gnemco', 73, 18, 199, 40838);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4067, 'Elche', 'hvfhbpw ijdacv', 140, 7, 3320, 69265);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6413, 'Bratislava', 'uorqjry wxxkkc', 103, 11, 8857, 43223);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4684, 'Dubai', 'klsdtqb orgxbu', 61, 8, 8129, 30871);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5674, 'Neuquen', 'sckrfco xtjxnp', 100, 19, 6137, 99232);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2885, 'San Antonio', 'jxyrpme rzwaey', 128, 13, 7501, 62092);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1457, 'El Paso', 'oapjcrx kchdas', 116, 11, 7506, 801);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4137, 'Bratislava', 'mbtdmve jdeqao', 40, 5, 6577, 56581);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5546, 'Fort Lewis', 'mwsuxqq akyxqa', 184, 2, 8, 40184);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2067, 'Wetzlar', 'zlwrmfl gdjgxj', 84, 17, 5579, 32980);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2623, 'Kongserbg', 'hrtmanb vhqgxt', 4, 8, 5644, 99383);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6867, 'Malmö', 'zbhnuny mwqsby', 147, 19, 4269, 2828);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4864, 'Noumea', 'cpoxdbm vyicuo', 143, 3, 146, 30226);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6665, 'Helsingborg', 'prsyvfy wdefmm', 87, 9, 6912, 88074);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5343, 'Woking', 'myajqlk wxiqhd', 19, 2, 2789, 85931);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4181, 'Long Island City', 'iegmvne wjataf', 9, 6, 7820, 24491);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1486, 'Kreuzau', 'jeyvpxr iuekci', 10, 11, 3176, 12290);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5975, 'Overland park', 'yjgnesj yqbtvw', 3, 7, 9669, 95262);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6186, 'Milton', 'uiwofhj mtcsrk', 145, 5, 5767, 83436);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4576, 'Eisenhüttenstadt', 'ermyser fcjvvi', 136, 9, 452, 42683);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2490, 'Brno', 'ipzpskf rpjsxs', 59, 14, 3380, 90950);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3315, 'Blue bell', 'wreoztt yuzpfc', 18, 2, 4189, 94197);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4555, 'Glasgow', 'nnjpqpd qeexsh', 154, 18, 1861, 90202);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3767, 'Des Plaines', 'tqqumua rmxbbg', 102, 20, 2433, 151);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5848, 'Okayama', 'fhiahuy kzukym', 90, 3, 6708, 76678);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1501, 'Sutton', 'jlyfbmc jewrwk', 141, 17, 7565, 20051);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6875, 'Fairview Heights', 'gbkugdg ehogjv', 133, 9, 6170, 69718);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5847, 'Zagreb', 'ioqtfrr vwetpw', 119, 14, 3673, 31490);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6721, 'Baarn', 'whbulmy jskege', 121, 11, 3276, 43236);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2254, 'Courbevoie', 'vxppizj kjzpfi', 178, 4, 391, 93101);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4375, 'Bruxelles', 'xfvhksv prueta', 115, 19, 3607, 70783);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1634, 'Neuchâtel', 'ebxomky odpuug', 129, 2, 8225, 64057);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4177, 'Mapo-gu', 'tkyddgq ziksjk', 155, 8, 8340, 23058);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5711, 'Jakarta', 'lnxapnx pgsfxp', 137, 13, 7267, 6075);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4423, 'Somerset', 'zodzafj pzskrg', 39, 4, 8148, 57756);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5151, 'Saga', 'tjvqwlz fkpazx', 92, 13, 3911, 60591);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6702, 'Yavne', 'nrwuxqh ehwybw', 151, 17, 4845, 73533);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1617, 'Aurora', 'xygpxzq zytojg', 110, 2, 981, 29533);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6650, 'Athens', 'hscduxv pwwyof', 36, 2, 3107, 53422);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1557, 'Overland park', 'gegqhyk vcndfn', 26, 16, 6787, 49724);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4818, 'Leinfelden-Echterdin', 'gueiuea xupkyo', 103, 6, 5659, 27662);
commit;
prompt 200 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3364, 'Fort Saskatchewan', 'cykbvjb wqnxms', 53, 13, 9471, 69886);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4004, 'Lexington', 'dhjrink vbliic', 109, 2, 1866, 47681);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6002, 'Salem', 'ouwhenr xtkovj', 68, 12, 3783, 50683);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1381, 'Santorso', 'tkysjki hvjlnk', 77, 16, 9615, 73915);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1530, 'Kaiserslautern', 'oaxqnbm rirxxc', 171, 10, 8637, 515);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6069, 'Dublin', 'xkatljn qwivph', 175, 17, 9000, 94450);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6132, 'Bruxelles', 'lkweibw syryzi', 29, 7, 3412, 62868);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5255, 'Brisbane', 'kzeufcf zodwfn', 22, 10, 2263, 6556);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6368, 'Palo Alto', 'xvojoft tneavn', 11, 5, 2500, 7761);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4436, 'Warrington', 'tvqblag bripdq', 86, 3, 8806, 50028);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1725, 'Kungki', 'rqlmpaf hgnzrs', 157, 8, 6182, 99947);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6924, 'North Wales', 'swszitu xzvopu', 141, 12, 3773, 82311);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5566, 'Warley', 'puajefz cokeyp', 37, 18, 4434, 88178);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3291, 'Limeira', 'wbmfxhs lqrnha', 73, 14, 6974, 95018);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5484, 'Buffalo', 'qqvblnp fsgtpr', 138, 11, 4186, 38262);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4151, 'Westport', 'thjwheh lpjdxb', 48, 9, 219, 70684);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5716, 'Kista', 'ttypfkl zmklqt', 68, 16, 8195, 74232);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6753, 'Lake worth', 'dqkfwkj xmypwi', 197, 17, 2214, 5085);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5967, 'Dunn loring', 'bxixntn ryfqck', 1, 1, 6525, 68002);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3000, 'Irving', 'opuabme hpjsej', 72, 8, 1848, 11452);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6765, 'Oberwangen', 'ovssacv ezocqa', 121, 12, 6997, 85513);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4131, 'Telford', 'oigfpcf tjtexj', 7, 12, 6911, 793);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4692, 'Tours', 'ybvqwdo tvqmmf', 20, 5, 9120, 38056);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4520, 'Araras', 'trxwdst hrsvhl', 147, 12, 8656, 44795);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3074, 'Conshohocken', 'niqmofc inpghr', 28, 9, 2241, 90049);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1271, 'Tottori', 'amvqvkq fiqtiu', 96, 14, 3981, 85118);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2990, 'Fort McMurray', 'ssyjjwz ehxtzd', 152, 12, 1854, 42040);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3788, 'Irving', 'arubdhk nbmmkt', 107, 4, 1552, 27331);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1656, 'New Hyde Park', 'ssrskqi paznxk', 152, 6, 6110, 38966);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5805, 'Kobe', 'remxgdg gkgiru', 123, 11, 7805, 41331);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2634, 'Friedrichshafe', 'kgtisqv shrtvu', 57, 14, 7936, 90136);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5385, 'Ramat Gan', 'hpugkcx pysfae', 180, 19, 2452, 42073);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6152, 'Royersford', 'drcmeyl dqwsya', 197, 18, 4990, 72626);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4434, 'St Kilda', 'vmvafmk gzujnd', 198, 19, 4812, 28870);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5270, 'Ternitz', 'nxilhwp hbujnr', 124, 19, 9145, 57278);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4027, 'Charleston', 'qnphcpi kjczsm', 104, 18, 61, 89776);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1999, 'Reykjavik', 'rqhqvef oqhgti', 5, 10, 8119, 84322);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3747, 'Whitehouse Station', 'jzevhoz muvcav', 182, 15, 1456, 864);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4672, 'Campinas', 'owtarhg dhrfjv', 177, 18, 7454, 19451);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2733, 'Peterborough', 'mfliydq wcynfv', 144, 20, 3587, 86032);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3252, 'Fairborn', 'uzvpkuy sgdovs', 196, 12, 7634, 59422);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4629, 'Houma', 'zhpbofp xquayw', 77, 18, 9040, 56953);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6178, 'Pecs', 'dwkjfpe pnwivh', 84, 5, 7431, 3917);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2248, 'Brookfield', 'mvkjtbd ymzipn', 29, 18, 3247, 19782);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5345, 'Silverdale', 'sfmazvv bvpsia', 81, 3, 2488, 54785);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2261, 'Horsham', 'tgixbuy jvrqwb', 75, 19, 2462, 13371);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6988, 'Palo Alto', 'qxopdoe vnyjhz', 134, 20, 9771, 71675);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5358, 'Melrose park', 'qlksrpr swqmts', 200, 19, 1795, 59064);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3458, 'Santa Cruz', 'scwrhpf vepjja', 159, 6, 494, 76812);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5741, 'Rochester', 'kkfcujl lowtyp', 150, 14, 7521, 14760);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2258, 'St. Louis', 'iecedwq moamck', 188, 2, 8105, 33635);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5292, 'Fuerth', 'pznmgob juozlr', 71, 10, 147, 88170);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1443, 'Dortmund', 'qlsfanq vpxzvh', 95, 11, 1825, 29901);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2307, 'Runcorn', 'djxsqmy kpmdik', 36, 13, 3489, 36576);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6597, 'Walnut Creek', 'kcbajpc bvhald', 125, 2, 5563, 67677);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6750, 'Pasadena', 'saurbju xbnutq', 77, 4, 561, 75903);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6128, 'Koblenz', 'fxdymis mikcxv', 36, 13, 8802, 76793);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5380, 'Ismaning', 'zslvzfu ixdmdy', 134, 18, 3568, 90897);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6786, 'Kungens kurva', 'zdljckr ttqcvj', 195, 10, 6163, 54441);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6583, 'Indianapolis', 'zblmqdc ltwmop', 195, 17, 360, 31455);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1479, 'Anyang-si', 'fariapy raypow', 100, 4, 3104, 81283);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4409, 'Santa Fe', 'dywsxmj gdpnzy', 125, 16, 7068, 99143);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3488, 'Alpharetta', 'vgurqwj kplhmk', 95, 8, 4243, 33067);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1676, 'Seattle', 'pqmfnke yuvnkw', 9, 9, 7691, 82802);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4164, 'Piacenza', 'mijnclj qpttjm', 52, 15, 4019, 89929);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4312, 'Treviso', 'lnahdrk thyzsk', 30, 3, 7405, 72530);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5268, 'Ellicott City', 'hzdviyf zgwdxq', 107, 16, 8095, 23101);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4109, 'Palo Alto', 'xmwlios ilixgs', 64, 9, 2789, 24389);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2368, 'Alleroed', 'cwfpack zpknke', 149, 9, 2230, 56578);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5276, 'Dunn loring', 'pryegwz iiggfb', 114, 19, 6664, 82681);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4130, 'Tbilisi', 'cimgcth vhnzjk', 76, 20, 6259, 17096);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4655, 'Freising', 'ohhadaw fczemz', 90, 15, 8123, 4677);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1602, 'Boise', 'yssvoxl yojygg', 124, 15, 8212, 11005);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6675, 'Nagoya', 'hyukzqf rgtmtb', 24, 5, 1942, 27823);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4800, 'Edison', 'sidqydl sjzthg', 127, 3, 4908, 27998);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3197, 'Lisbon', 'cyosagh plmwyi', 66, 19, 320, 3462);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1601, 'Cobham', 'psqmylb daflod', 65, 14, 8747, 81486);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4817, 'Bremen', 'pdbdnwj adhqrj', 94, 19, 8218, 8424);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2324, 'Irving', 'hsnhcqd foddga', 40, 10, 5370, 92466);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2167, 'Irvine', 'fckuaow dckejv', 44, 15, 9090, 13540);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4628, 'Norderstedt', 'lhnfcuv zusems', 135, 5, 7525, 34461);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5543, 'West Monroe', 'xcxumvm wgvghh', 69, 14, 4702, 74026);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2083, 'Lublin', 'kmejllr fuvvua', 148, 6, 1934, 85529);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4350, 'Valencia', 'qmcdixe pelpml', 27, 15, 6344, 44362);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4938, 'Bronx', 'hltlcsk erducy', 185, 18, 6959, 97350);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4871, 'El Dorado Hills', 'dwwstni uzwxol', 19, 15, 7453, 30876);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6232, 'Graz', 'unghxii alwpid', 162, 14, 5001, 13327);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5285, 'Tottori', 'fecgdoh lwjgks', 104, 3, 665, 23859);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4843, 'Peine', 'zuxjdss bvocai', 179, 3, 7799, 25290);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4665, 'Redding', 'ielpcue tojljp', 145, 3, 4496, 6154);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1509, 'Pottendorf', 'ndgpabt slywgx', 159, 16, 5133, 3699);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5622, 'Athens', 'hebseeg modjcb', 130, 20, 5463, 42447);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4468, 'Maebashi', 'tqosjxn ivbhuu', 82, 15, 4454, 85376);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1364, 'Chirignago', 'sfrztku zyfgtv', 109, 12, 1146, 81552);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5116, 'Yomgok-dong', 'vbrpszd hobnir', 199, 2, 3525, 64609);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6983, 'Biella', 'spwspuc cjfaqa', 85, 5, 7782, 80431);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4440, 'Williamstown', 'prbmkmf edxpgi', 168, 12, 4337, 58454);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1628, 'New Hyde Park', 'epbiiec eoyqeq', 126, 4, 6729, 60040);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6926, 'Natal', 'nmglfgs qmhxwf', 131, 3, 6130, 37866);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5013, 'Pirapora bom Jesus', 'fvdfezy asftge', 152, 4, 5762, 74819);
commit;
prompt 300 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2898, 'Araras', 'huussie hkjdqv', 185, 5, 583, 71886);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6446, 'Hercules', 'sjrxoyl euisbu', 99, 8, 261, 74791);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5850, 'Northampton', 'nsmmkay ufufix', 160, 5, 4936, 38211);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4595, 'Holderbank', 'jtyobkp jksevn', 3, 14, 3347, 43973);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2097, 'Fair Lawn', 'iubpnwa cqacgn', 18, 5, 968, 18056);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4150, 'Toulouse', 'flfujxz siflei', 136, 10, 843, 98145);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5656, 'Reston', 'bsmjhul kvccqh', 101, 12, 8505, 35674);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6603, 'Bremen', 'lgncjey ckuzoe', 120, 4, 9794, 52121);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1404, 'Golden', 'tuwbbnl rewkxn', 191, 11, 4195, 16152);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1902, 'Ann Arbor', 'ssouflc bbviul', 183, 15, 9242, 29854);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2408, 'Tours', 'manopju mdpfge', 134, 15, 1436, 71401);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5339, 'Streamwood', 'pnvrwzm jcbhgf', 102, 4, 4011, 62467);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5710, 'King of Prussia', 'zhfkynm jyuprn', 49, 4, 4969, 80394);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2413, 'Juno Beach', 'gcvmqqq fkoojx', 88, 3, 6074, 77909);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3755, 'Battle Creek', 'budfokv qgpyiw', 21, 16, 2284, 35928);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4049, 'Bradenton', 'mxivzel ebwcpr', 147, 3, 4394, 69653);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5885, 'Villata', 'yhkggfu pqeyww', 92, 16, 2689, 88675);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2941, 'Kristiansand', 'clytimg kjeesk', 8, 6, 9802, 1567);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2791, 'Vantaa', 'quvozkv iitdjm', 168, 12, 4108, 6864);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3543, 'Rio de janeiro', 'gxkzhwq yfmpdl', 162, 6, 459, 6891);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5246, 'Chur', 'awajrdk pzyaae', 24, 4, 7793, 59068);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3467, 'Austin', 'avedogl wxfdbd', 157, 2, 1587, 67899);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3886, 'Villata', 'gpnvjse wiviam', 111, 18, 2940, 88714);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6471, 'Takapuna', 'plwijso jmsxsr', 144, 17, 6419, 48448);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2201, 'Kungki', 'jxgdzmt rmspmw', 180, 16, 6908, 72995);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2156, 'Portsmouth', 'bncrhev bxonvl', 178, 9, 7847, 77507);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1741, 'Bedford', 'oouihwd iboxnj', 9, 8, 4898, 88050);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2917, 'Kopavogur', 'hgmfyvx hcigcz', 182, 5, 3662, 82299);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6973, 'Shenzhen', 'zvbhtba fmrywi', 125, 2, 9411, 35063);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2491, 'Matsuyama', 'pidasrc tqkwsc', 36, 15, 8279, 20989);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3118, 'Alpharetta', 'yrogzcr amnrqw', 95, 9, 3536, 95757);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6431, 'Peterborough', 'cvllgrt hlmuog', 98, 9, 2450, 65366);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2385, 'Tilst', 'kcwmjod hlpwch', 27, 6, 9518, 39755);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3858, 'Rio de janeiro', 'ytimdwj matmil', 107, 8, 1897, 95873);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6939, 'Burgess Hill', 'ziftyyy xceius', 46, 4, 8290, 28413);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3346, 'Monroe', 'ubuzozx guccyz', 89, 4, 5856, 32947);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4180, 'Arlington', 'ifnxlmm vbeafs', 112, 17, 1511, 48392);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2397, 'Warszawa', 'zxkfykp jldmej', 173, 4, 9604, 76467);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6116, 'New Castle', 'fknkxip yvvoxb', 121, 16, 1716, 41741);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4461, 'Brossard', 'qekbklc snwqia', 22, 16, 8699, 71463);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2588, 'Pordenone', 'zerprfb bwpdlt', 42, 17, 2765, 96076);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1742, 'Leipzig', 'gwjxfqk gbgofq', 113, 19, 521, 51195);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2025, 'Richmond', 'lbcjwko frxwlm', 150, 4, 4371, 96286);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2163, 'Slmea', 'ivjiboq elyyyv', 51, 8, 9076, 11292);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5572, 'Zipf', 'fpoevtj qgscaa', 48, 6, 7757, 34815);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4304, 'Columbia', 'taqkcib tlbqzg', 63, 2, 5484, 37915);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3661, 'Paderborn', 'rtcirpc unyngg', 20, 19, 2831, 40436);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2561, 'Charleston', 'npjrbgq ydjkbs', 46, 10, 3782, 28788);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5899, 'Visselhövede', 'oprxzpk aoitxo', 28, 17, 9926, 58672);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5430, 'Ankara', 'jucbshk kuqczo', 181, 2, 1556, 29383);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3166, 'Springville', 'npifekk gqtnvj', 196, 17, 115, 18887);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5877, 'Rosario', 'xrvuhmf tlgkcg', 81, 4, 7945, 26511);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6697, 'Monument', 'cvzqymb gpqkht', 152, 9, 9235, 32404);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6463, 'Brisbane', 'cmimqis pgslmf', 129, 4, 2901, 90613);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6770, 'Fort McMurray', 'dsgtpbk kadwbm', 168, 6, 682, 47529);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3418, 'Knoxville', 'zervngx vewfng', 58, 16, 9073, 52962);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4247, 'Olsztyn', 'gezmxfb cqwape', 157, 20, 5122, 88795);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3898, 'Ithaca', 'jiyhpow olhfbb', 185, 6, 409, 28002);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2637, 'Ringwood', 'cputcrv wnndhj', 44, 8, 3901, 53774);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6861, 'Utsunomiya', 'tlwxmdc qzqdoo', 13, 10, 5579, 11442);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2245, 'Hounslow', 'vklnxxa lqcjii', 132, 9, 3752, 74611);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5551, 'Würzburg', 'mvywilx cuakmw', 66, 12, 4996, 45816);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3423, 'Lippetal', 'jimrtps lxjimx', 145, 19, 5702, 54681);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3712, 'Bad Oeynhausen', 'skwtnad nbdrmk', 60, 19, 6108, 77864);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4914, 'Edison', 'lpsnzpj srietj', 131, 9, 4944, 40804);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3129, 'Winterthur', 'adclpfb mhpfut', 95, 7, 7930, 84349);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1667, 'Fukuoka', 'kneqehq maizhg', 74, 10, 6243, 51715);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5694, 'Slough', 'iofagdb utariq', 36, 19, 9817, 33821);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5852, 'Somerset', 'vgksehj upsyeu', 197, 2, 1006, 68675);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3320, 'San Mateo', 'kykxfjo xvxqel', 127, 1, 8781, 42018);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4443, 'Guamo', 'axbtpuk dcjzpd', 145, 4, 9433, 53884);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1204, 'Gaithersburg', 'ycryols yfjhvb', 66, 1, 7497, 63489);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6550, 'Flushing', 'wjhryql ccuiad', 182, 11, 821, 18585);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1560, 'Vantaa', 'wknbsbh nhmyfl', 85, 6, 9323, 53273);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1533, 'Issaquah', 'fzckwih ufhnqb', 200, 11, 6953, 72744);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1819, 'Stafford', 'vvphwmz bnjjbb', 79, 14, 8543, 68065);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3168, 'Biella', 'xzvhhib amswtx', 200, 4, 6681, 20675);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2531, 'Ohtsu', 'kijxhzt nqumbb', 86, 18, 5229, 7076);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4699, 'S. Bernardo do Campo', 'vvwzkvp osuccn', 107, 15, 7196, 26740);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1970, 'Madison', 'esytdep tdzsqt', 12, 9, 945, 58629);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3226, 'Marietta', 'jeumqie vohqgk', 85, 12, 1669, 81901);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3029, 'Grand Rapids', 'alnqrvu sjqbkb', 155, 18, 223, 49401);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1288, 'Colombo', 'qhlaibt otlmdt', 104, 5, 4351, 89977);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3184, 'Royston', 'wyywzty eyvsbl', 199, 19, 3012, 24949);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3833, 'Macclesfield', 'xffqcwj aucvcq', 126, 20, 5298, 91929);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2939, 'Pulheim-brauweiler', 'khvpplj sfedti', 41, 15, 2534, 39903);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5182, 'Friedrichshafe', 'domczyr juegob', 147, 15, 8127, 58214);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2336, 'Massagno', 'utunmhr vdiwui', 57, 1, 624, 83676);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2139, 'Warszawa', 'scvqgjz sosujc', 83, 1, 5, 8408);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3288, 'Wörth', 'upahbub ysvcgp', 17, 15, 3547, 77386);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1320, 'Golden', 'emnqpdc ymltqq', 87, 12, 7701, 77946);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5999, 'El Segundo', 'sodkicp hdjrhe', 79, 8, 7697, 7586);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4722, 'Richmond', 'yhoovzu sitqby', 129, 2, 543, 38526);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3210, 'Hartmannsdorf', 'gatvcsa xvjndj', 154, 20, 4308, 51118);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6591, 'Aurora', 'txrennm hucrqq', 155, 18, 9612, 36961);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1316, 'Kaunas', 'syczzuk yjmclv', 32, 8, 7087, 82740);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4636, 'Saint-vincent-de-dur', 'yuxdsne hdzpza', 24, 10, 6869, 85664);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2865, 'Reading', 'xpwgoyz dpayrs', 21, 10, 8024, 24141);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4448, 'Clark', 'xfeajvm nbkkmq', 174, 16, 6343, 66451);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5459, 'Hunt Valley', 'ikdyren vdhiib', 93, 2, 7224, 25039);
commit;
prompt 400 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4657, 'Thalwil', 'utgcigz lvcnim', 120, 9, 6900, 13362);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6227, 'Ferraz  vasconcelos', 'hraivta tvaisb', 196, 18, 4734, 78556);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1687, 'Trieste', 'cvnrcog fcoedj', 177, 20, 898, 33314);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5231, 'Buffalo Grove', 'sznqiwh qgwpnd', 68, 20, 3954, 65266);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5590, 'Belmont', 'frkfsed bpbrls', 186, 9, 9688, 73765);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2592, 'Canal Winchester', 'auvbaun jxezrh', 106, 15, 2171, 13849);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6261, 'Victoria', 'oxepevu nihavs', 109, 20, 4673, 19891);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4584, 'L''union', 'cktgsxu ncbgwr', 106, 1, 4327, 3757);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2392, 'Aurora', 'agxibaa ifqbed', 13, 1, 4316, 54549);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1007, 'West Monroe', 'wyrnvlb reobjw', 83, 1, 9658, 97879);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6468, 'Erlangen', 'gnmcekd hiqvqe', 94, 6, 4672, 44737);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1950, 'Biella', 'vvlzkdy irtros', 166, 6, 2300, 18237);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2549, 'Karlsruhe', 'pikfjhl azscmf', 18, 19, 1061, 74197);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5454, 'Matsuyama', 'xsmmvta alnger', 113, 16, 3488, 69717);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3750, 'Altamonte Springs', 'dwwkvyb trsulo', 56, 17, 3063, 52798);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5281, 'Leimen', 'kqntyeh vtddwn', 88, 8, 4067, 2416);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4747, 'Oldenburg', 'jhmrjrx ninfkm', 128, 4, 1504, 95800);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2598, 'Bellevue', 'aoweszl qlfisc', 97, 7, 551, 16618);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4945, 'Bielefeld', 'maukzni utrhmq', 188, 14, 4610, 96654);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1146, 'Bruxelles', 'xsazefn bgtjoe', 16, 10, 510, 97314);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5185, 'St. Petersburg', 'mopbbsx njtnfi', 112, 8, 7232, 10359);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1670, 'Draper', 'fojnsxv lafmvu', 98, 5, 921, 36821);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5118, 'Silver Spring', 'bepaugz ekgxiq', 114, 13, 1606, 43792);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4697, 'Kaunas', 'wudzjjl hqswmw', 124, 10, 6709, 2307);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4949, 'Protvino', 'txavuvh vpomfu', 105, 5, 2044, 52146);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1853, 'Atlanta', 'owjavfz pbdhae', 163, 16, 5917, 39833);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2909, 'Hounslow', 'lfduhci efnjyk', 137, 4, 8397, 49010);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6731, 'Oshkosh', 'vxtgrqb mgregq', 100, 16, 9097, 29932);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2416, 'Trieste', 'dzdlqyq ogzcqe', 139, 13, 9251, 26024);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5548, 'Holts Summit', 'xugnzjm pahjyy', 163, 9, 5888, 23583);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6364, 'Houston', 'rcipmxp oqhkix', 77, 8, 6333, 57175);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3991, 'Loveland', 'vmgdnnc ystuxa', 14, 3, 2796, 57454);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3701, 'Dubai', 'vjqdwpp klqrsd', 69, 15, 5815, 59396);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3538, 'Marietta', 'bybpuzf qafcez', 184, 10, 3102, 35479);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5944, 'Santana do parnaíba', 'tsloxch etyszu', 138, 16, 7748, 28201);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1328, 'Telford', 'coprfii xedonn', 174, 15, 8044, 75798);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6940, 'Yamagata', 'bdqrjhv tsoisb', 170, 3, 2666, 99128);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1496, 'Delafield', 'vxkenwx lliycz', 198, 5, 5074, 30903);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5338, 'Santa Clarita', 'xawzaik gkmmln', 185, 13, 7204, 88751);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3498, 'Salzburg', 'ofwiiqe cybirj', 103, 20, 4619, 20378);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2924, 'Eschborn', 'vidjnvh vtrmrb', 3, 15, 8679, 33108);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3283, 'New hartford', 'cshnyoe rfutnh', 123, 7, 9008, 7293);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6158, 'Dublin', 'prqqemy nyquww', 46, 5, 9873, 80174);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4679, 'Oberwangen', 'ipmscvp stafup', 99, 17, 246, 28048);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6415, 'Kwun Tong', 'ypmwfck ksbbnc', 163, 1, 5437, 39867);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2778, 'Brasília', 'bxdatps scfsmp', 16, 8, 5661, 4865);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5744, 'Yokohama', 'yiypfnm pkmuch', 140, 13, 5266, 94419);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5512, 'Athens', 'klxnyns gpwixg', 179, 5, 2794, 38969);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1278, 'Bracknell', 'jhqsmha gsxalu', 2, 20, 1950, 11523);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6302, 'Pittsburgh', 'emybnzv mfttzg', 156, 5, 8950, 4178);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6944, 'Colombo', 'tzuwmyz ucfjbe', 52, 18, 5563, 60935);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3209, 'Barbengo', 'eeqtkgv tjzplo', 37, 2, 536, 35380);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5488, 'Lexington', 'xnigiux wqxcun', 156, 6, 5285, 3109);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2667, 'Hanover', 'ericzwi sraatp', 90, 2, 7540, 70760);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6806, 'Spring City', 'menturi nrkujb', 64, 20, 2754, 48527);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3870, 'Kevelaer', 'zdopemf lpjbxa', 156, 15, 2352, 44000);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2327, 'Kingston', 'uugjhva vbuqxf', 111, 1, 5424, 12520);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3406, 'Nicosia', 'yoyzqyd ysrkgr', 64, 10, 3771, 42507);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5714, 'Mason', 'irnvzsw kduqow', 2, 7, 8302, 80192);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3560, 'Tottori', 'uuetfqo zzdtuu', 52, 17, 9835, 57046);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1661, 'Porto alegre', 'bigmiwu ttrokp', 200, 17, 3581, 54523);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6455, 'Agoncillo', 'hcozssi nbjbym', 54, 5, 1370, 31659);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3500, 'Firenze', 'zmpmmle cxvkke', 124, 10, 3005, 50423);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3016, 'Nagoya', 'vxhreuk gvqofq', 61, 18, 6640, 14060);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4171, 'West Drayton', 'mowvlid tafodu', 164, 7, 4311, 74309);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4319, 'Wehrheim', 'hvxcpdz vlzefj', 37, 6, 3101, 29604);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3237, 'Cottbus', 'qoriudz oyrled', 127, 19, 318, 43991);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3775, 'Auckland', 'kxonyzh viqvua', 72, 15, 4780, 53624);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6685, 'Boulder', 'bwkesir rukcap', 119, 20, 3038, 31922);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2783, 'Williamstown', 'fgykfny kdfyhe', 184, 1, 4935, 87047);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4084, 'Shoreline', 'aenupxp zzfotd', 28, 19, 3613, 41869);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5251, 'Bristol', 'eyooeug ajoaco', 190, 16, 4772, 54312);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5869, 'Lecanto', 'ryyxapt ctayzz', 104, 16, 735, 15222);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6490, 'Barnegat', 'bedqdmv lbyruc', 200, 12, 307, 41292);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5397, 'Paal Beringen', 'hwbmstc wdqbct', 95, 5, 4875, 30493);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2864, 'Lima', 'tvvdufl edrpen', 162, 10, 7822, 58733);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4377, 'Ottawa', 'bjtildg rarmfb', 33, 7, 6819, 30527);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4569, 'Fort worth', 'alyisqg towdsd', 36, 4, 4867, 95524);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4135, 'Seongnam-si', 'xqzbwpa yfyfvp', 35, 11, 3985, 89762);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4594, 'Orlando', 'rlkexwb xtgddv', 161, 2, 2934, 93964);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3940, 'Port Macquarie', 'ioqcpyy khawex', 200, 10, 4109, 17099);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3157, 'Rua eteno', 'pduhvkb wevcrj', 187, 13, 6628, 5960);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5145, 'Sant Cugat Del Valle', 'vhlyiyh tinyzj', 197, 3, 8496, 73678);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5238, 'Mogi Guacu', 'ggthvee hucrfq', 185, 11, 5579, 86446);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4796, 'Elche', 'kxquesb rngnkn', 10, 7, 6506, 41593);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6174, 'Leipzig', 'vsruzum nztkxh', 129, 15, 8401, 8046);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3434, 'Enfield', 'aoftgtp qrcgez', 68, 13, 6844, 67617);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1811, 'Hong Kong', 'kvnnlpe yuzqei', 184, 3, 5137, 28793);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3618, 'Moorestown', 'bshurzn mmouup', 181, 6, 4645, 41571);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4870, 'Waite Park', 'hqhqeog joazpf', 128, 3, 8297, 92524);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2647, 'Matsuyama', 'njtjxbt tskxmi', 54, 16, 2502, 1178);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2111, 'Frederiksberg', 'xwretrv fhccka', 64, 18, 9738, 5099);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6975, 'Hohenfels', 'epebxnk sfsglg', 69, 9, 3946, 77932);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5228, 'New York', 'epbzsim varjhv', 50, 9, 6920, 11238);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1500, 'Sparrows Point', 'znnufcf fjclsu', 193, 11, 5246, 93767);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4527, 'Brisbane', 'wxjdksb yeiyck', 6, 12, 7858, 84552);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5886, 'Neuchâtel', 'jlkfmch tlzwnd', 189, 14, 3263, 35138);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6615, 'Carmichael', 'jzaaijn fsmgvq', 141, 5, 8436, 31969);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6300, 'Ferraz  vasconcelos', 'pgcejpj samzoq', 73, 12, 992, 63722);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6970, 'Hermitage', 'qyycldn cuaujp', 39, 19, 4032, 20116);
commit;
prompt 500 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3190, 'Buffalo', 'hudydvq obelxw', 182, 11, 7953, 54687);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4463, 'Vallauris', 'iqclzgy axntxa', 167, 12, 3616, 90164);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3907, 'Bønes', 'hgwrqpg fecvri', 86, 1, 4927, 67606);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3247, 'Sugar Land', 'wpriaxu eezfvi', 147, 5, 9376, 93597);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4330, 'Aurora', 'tfzigcc bkmmtt', 1, 1, 6596, 54529);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3448, 'Pirmasens', 'xwdrowx gxppxu', 6, 8, 8033, 36422);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3304, 'Wuerzburg', 'npezfvb dgwcbx', 194, 12, 5586, 96600);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6923, 'Research Triangle', 'rjbtznc bzamok', 119, 13, 3803, 34392);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5223, 'Tampa', 'pssijae qydyeb', 153, 18, 2064, 50359);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4940, 'Pusan', 'apytlqe gjxpse', 22, 7, 2247, 52557);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1728, 'Canal Winchester', 'wvatruo judvhp', 160, 3, 6937, 17697);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5192, 'Raleigh', 'fxjmzwn toxall', 174, 19, 5732, 4514);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1528, 'Toronto', 'vikidts lrfnly', 102, 20, 653, 54593);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6767, 'Brisbane', 'effzhwz bsksjw', 19, 19, 2275, 97240);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4834, 'Double Oak', 'qrobzos pxjizw', 55, 11, 6235, 81500);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6396, 'Dunn loring', 'ejhuqzz xfrvcs', 168, 5, 4576, 86108);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5176, 'Lippetal', 'yknsnji wdkjbk', 16, 4, 6841, 89078);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3248, 'Bronx', 'sevrifh mmezbc', 84, 10, 5824, 95561);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3949, 'Cromwell', 'ogsqwje gmxkfc', 46, 11, 5717, 64031);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4524, 'Altstätten', 'xehujtv ivlrvs', 73, 12, 1258, 1468);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1464, 'Doncaster', 'lhqfzkh lqsvuh', 23, 3, 7207, 70441);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4808, 'Nynäshamn', 'gpxqhck hnkoks', 83, 3, 1949, 3324);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6465, 'Stony Point', 'osqmytk bvfzak', 93, 12, 9738, 43309);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6422, 'Syracuse', 'wxwgzyd orfnar', 131, 4, 5009, 23794);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1669, 'Eden prairie', 'aqvtqwy wwdwgb', 107, 16, 4176, 46823);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4707, 'Tempe', 'cratqqh mvzgff', 139, 10, 3606, 14419);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6249, 'Staten Island', 'fzxeoaz mbammr', 132, 5, 732, 68637);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1474, 'Spresiano', 'efcomxz tvkbto', 71, 1, 5457, 20657);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6254, 'Aiken', 'yheykmv xrebfg', 41, 2, 3221, 87467);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6822, 'Schlieren', 'phqivla yplrzf', 165, 14, 630, 67002);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5969, 'Redondo beach', 'clwtmzf mbrgkg', 20, 20, 9836, 35865);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1096, 'Utsunomiya', 'qrzfepz bzscel', 123, 8, 1863, 55272);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1172, 'Stoneham', 'afqaurn tvzzco', 148, 9, 962, 14505);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4652, 'Adelaide', 'zqgkvcd zpovrm', 138, 10, 455, 43464);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4621, 'Eschborn', 'mnglfax jnxnrm', 134, 6, 9121, 50836);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2272, 'Piacenza', 'imcsiym yptont', 62, 1, 973, 12059);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4108, 'Enfield', 'ydbapol texsut', 85, 11, 5531, 78451);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2365, 'Geneva', 'tkszkxt uefzmr', 71, 6, 2455, 73195);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2804, 'Cannock', 'rvvccma ndqscj', 184, 9, 451, 50187);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5179, 'Ellicott City', 'kyulvyc voiaii', 87, 14, 4102, 34210);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3297, 'Herndon', 'vpqbfrn envkqr', 121, 15, 2566, 46915);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6976, 'Unionville', 'zujuxvu rjhztu', 166, 2, 9370, 86106);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1015, 'Cuenca', 'jtrdwqb hhwppj', 122, 13, 6820, 91417);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3399, 'Thame', 'lvaysqi eztylh', 163, 2, 9374, 32918);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3240, 'Goslar', 'yzpzbrb ujnqsr', 134, 7, 809, 5346);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3715, 'Gothenburg', 'hbakkut rmdami', 173, 5, 2733, 91722);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3013, 'Kansas City', 'iqwxpqo vzjedf', 64, 12, 7608, 11900);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5023, 'Shelton', 'ydfydth bxfahe', 94, 5, 942, 4578);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4044, 'Irvine', 'wvvzmim oblkyv', 163, 1, 2923, 84242);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1940, 'Seongnam-si', 'ctphuob hxxvqg', 147, 19, 7113, 15553);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4412, 'Paraju', 'bcmgslq dfewcf', 89, 15, 7213, 71832);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6978, 'Burgess Hill', 'fnugumc aeanzx', 192, 18, 5705, 50922);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3994, 'Alessandria', 'ggteeqv xvncbp', 78, 10, 8216, 45212);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6542, 'Waco', 'etruiga nddsko', 80, 11, 3193, 74491);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4755, 'Scottsdale', 'mofiuto nlkrva', 157, 2, 4148, 36522);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3376, 'Mclean', 'gfauhrn ssnqeb', 199, 12, 3947, 85618);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4700, 'Bartlesville', 'fvkaapw hutbbi', 29, 4, 9708, 71790);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5374, 'Fort Collins', 'erjiglt lzitzg', 83, 13, 6161, 48222);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5990, 'Vaduz', 'edsubmr yqssze', 63, 6, 1840, 80901);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5569, 'Campinas', 'dedccqi plqrwz', 21, 2, 8425, 5405);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6848, 'Schlieren', 'wecyfqi vobyfn', 179, 10, 1285, 46728);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3637, 'Lublin', 'royqeit ythisu', 49, 19, 579, 87856);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2243, 'Storrington', 'csalhot wujghc', 131, 5, 31, 43383);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1541, 'Rua eteno', 'qqhaljk rraynn', 142, 17, 2284, 57703);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4840, 'Saitama', 'xxnuuht huhohk', 172, 4, 5987, 31191);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4425, 'Neuquen', 'kvtinhj zlhsal', 186, 19, 119, 49677);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3476, 'Bethesda', 'plnbdfd ilzewn', 37, 10, 1218, 78558);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1745, 'Boston', 'mxuxlbv pnudzu', 40, 1, 5539, 60895);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1317, 'Houma', 'ccbalgq heppjm', 94, 9, 8715, 55470);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3268, 'Roanoke', 'uqzkxxm appcgj', 124, 1, 6394, 80899);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3681, 'Nizhnevartovsk', 'ecznskv fvbjyj', 153, 18, 590, 76695);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2239, 'Stans', 'drepysa trggaj', 151, 3, 9656, 40306);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6942, 'Hackensack', 'upifmrr ugvkjv', 113, 7, 1129, 59064);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6410, 'Cambridge', 'nhsrzao tqgvuo', 21, 5, 4119, 28676);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4080, 'Cheshire', 'cmdywgz bxsgny', 159, 12, 1487, 86783);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1410, 'Cottbus', 'sddtnii jslfol', 180, 4, 4196, 5258);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1433, 'St Jean de Soudain', 'ydicdws vyearo', 69, 12, 3045, 5114);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6221, 'East Peoria', 'mlnpkrb agkwvy', 29, 6, 6167, 45091);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5272, 'Cherepovets', 'tyuyiql ivvraw', 50, 7, 9193, 12461);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1693, 'Samrand', 'tabtunr lnnkzz', 153, 12, 9123, 71446);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3918, 'Warrington', 'pjcxdzl fvwnwj', 35, 8, 7363, 43337);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1286, 'Essen', 'sbpeulo kvnjhe', 183, 5, 5196, 34807);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2005, 'Ismaning', 'wfcxidx zciuoi', 151, 5, 8337, 93959);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6029, 'San Ramon', 'wzylidu utxoca', 143, 2, 8849, 11046);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1036, 'Manchester', 'wzfhhrv llkfbi', 72, 7, 3158, 89417);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6122, 'Kaunas', 'jsxvqar qlynid', 172, 9, 6984, 31436);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5956, 'Luzern', 'phanpud dasnna', 25, 8, 9551, 10040);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3322, 'Waltham', 'fgzylxy oezwvd', 132, 10, 3045, 42164);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1134, 'Mexico City', 'zzpsxuw ecunlq', 3, 13, 9277, 84835);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5439, 'Regina', 'ulyrbzs cpelgs', 140, 17, 7410, 38563);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4851, 'Park Ridge', 'kilavoa bekzvf', 73, 17, 9817, 84342);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1398, 'Louisville', 'phmaerm hfogcw', 186, 15, 3823, 98096);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3937, 'Hermitage', 'amkeqbe exdktu', 34, 5, 8058, 11523);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3803, 'Newton-le-willows', 'mxyuemw kfxpor', 111, 4, 399, 34889);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1550, 'Silverdale', 'dqxjpcl vpgbgw', 169, 1, 3268, 19643);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2748, 'Petach-Tikva', 'ijuhyya xjdfig', 31, 13, 8392, 47401);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5547, 'Anières', 'pgbshvc kdktuu', 28, 18, 8744, 57773);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1104, 'Ben-Gurion', 'fescwcj cjwbam', 69, 17, 1221, 77837);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2547, 'Sao caetano do sul', 'yenpvkw igvlbj', 118, 17, 1574, 29866);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2738, 'Slidel', 'andtevx uvotez', 132, 20, 8338, 20305);
commit;
prompt 600 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6048, 'Stone Mountain', 'vwafars gugskm', 141, 14, 7900, 30334);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4501, 'Hearst', 'zejhimt wyosab', 68, 17, 961, 131);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4983, 'Maebashi', 'vlkrxnv emwrxz', 68, 8, 2243, 22203);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6920, 'Radovljica', 'zadjuuq yopmds', 18, 3, 253, 14858);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2115, 'Ravensburg', 'bikqyzl acxbyx', 172, 2, 6582, 39081);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3043, 'Farnham', 'dgoutlq mnurij', 23, 15, 3970, 45751);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4903, 'Warren', 'civhorw vwjfpx', 26, 11, 3151, 87107);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6666, 'Visselhövede', 'inxmdke bkgmcd', 29, 4, 5423, 62867);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2923, 'Nanaimo', 'pzrwkuw tgmzjt', 188, 6, 8862, 15441);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3804, 'Hochwald', 'fgxoxkq rvahpf', 41, 19, 1536, 35238);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4124, 'High Wycombe', 'amqqbku phhysw', 193, 12, 7629, 7864);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5078, 'Utsunomiya', 'ttabmxd lbtmjh', 24, 14, 729, 47652);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2388, 'Milton Keynes', 'ksuxekt sphqth', 140, 17, 9231, 20549);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2454, 'West Windsor', 'nqqxznu hpvqgd', 120, 19, 1768, 88672);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5585, 'Täby', 'newlwzd ydltue', 110, 7, 8756, 79608);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3063, 'Claymont', 'lglbqlm hleaux', 52, 20, 7368, 57787);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4092, 'Bremen', 'vlircpg sduzch', 103, 15, 163, 91504);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1237, 'Ulsteinvik', 'fxfswhr cihikj', 43, 17, 8112, 52971);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4120, 'North bethesda', 'jfweysl svxqkr', 167, 2, 2908, 92761);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5753, 'Norderstedt', 'gcpdsbn btxfwb', 27, 17, 7050, 46091);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1270, 'Miyazaki', 'qdceqep anyqtk', 177, 1, 9381, 82909);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1855, 'Pusan', 'yzccnna bdogfe', 127, 12, 2409, 74547);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6228, 'South Weber', 'jdqhmcs vsslac', 155, 7, 24, 39430);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4490, 'Duluth', 'ashlwqv ofavsv', 187, 7, 6249, 11471);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3809, 'Morioka', 'kumbohm hmuuaz', 198, 17, 8877, 45562);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1407, 'Kreuzau', 'iyopevg cdluwi', 78, 4, 8004, 33462);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2870, 'New York City', 'cbjpano qvbqrd', 81, 16, 7002, 10614);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2757, 'Vilnius', 'jpzmwsu nakvpr', 186, 10, 2258, 97143);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6774, 'Rochester', 'kmztzhv yjphdu', 178, 8, 101, 77494);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1873, 'Valencia', 'vsdvuib mkojnt', 196, 20, 9675, 42689);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1529, 'Ramat Gan', 'qdqnxux nuzrug', 81, 6, 6934, 46627);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6419, 'Dartmouth', 'engazeb vnxown', 32, 14, 8175, 88834);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1158, 'Harrisburg', 'hehggst kprciy', 22, 6, 234, 26366);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6584, 'Double Oak', 'inymugd ibhpww', 102, 1, 1231, 2369);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4906, 'Redding', 'dcqqxtq xoulje', 41, 20, 1467, 16200);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3002, 'Claymont', 'lvcuqij xhpcab', 116, 10, 927, 21200);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2701, 'Melbourne', 'xorixfg fubjfy', 126, 7, 3140, 15867);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3429, 'Vienna', 'nlbhtue yntjny', 50, 10, 6241, 36884);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5925, 'Boulogne', 'zvirdlp edyteb', 143, 1, 9904, 57238);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3068, 'Fort McMurray', 'yjevpra ejfraq', 112, 16, 4032, 92995);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4272, 'Olivette', 'pnbwmnz uciejx', 33, 19, 284, 48605);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2361, 'Omaha', 'qpsusvi gwvuvl', 169, 18, 3885, 8549);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4012, 'Daejeon', 'wpuylqo indklv', 136, 11, 8408, 16914);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2140, 'Rtp', 'cojjvdf ddhxmp', 97, 20, 2963, 35587);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1471, 'Bruneck', 'tpmijmo hpjdvi', 180, 15, 5748, 99200);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2839, 'Bronx', 'kgtrvfc eilpvj', 94, 15, 1293, 42447);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1817, 'Edwardstown', 'dcaciam gsdygr', 27, 17, 1950, 45355);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5154, 'Bangalore', 'kjsixng vrggim', 1, 5, 8056, 88022);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4384, 'Kaohsiung', 'qakybgh jmldax', 47, 16, 3479, 13702);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2229, 'Americana', 'hntxwrp safmzr', 175, 4, 5995, 16869);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6547, 'Gävle', 'sahstdl jlhinv', 67, 16, 1547, 44376);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1006, 'Sainte-foy', 'aazplkz yqrzjn', 169, 2, 5851, 45354);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3537, 'Beaverton', 'apazkcl pqjrgi', 54, 16, 6320, 54399);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6208, 'Dinslaken', 'zopscnd jkgeue', 162, 11, 5535, 40929);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6102, 'Recife', 'nftjqgf pdnqni', 131, 16, 4853, 1944);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5491, 'Delafield', 'miebvbf qgstsl', 36, 18, 64, 64539);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1428, 'Whittier', 'njshqqp jmuibi', 189, 10, 6983, 33524);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1152, 'Berlin', 'cndkrhk fjgznb', 76, 8, 4172, 77840);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6510, 'Mito', 'wdmizqc zfkrot', 191, 17, 1916, 9367);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3909, 'Campana', 'duxvwcp dztmtq', 145, 5, 5668, 29206);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5114, 'Syracuse', 'ufihyeu ektfwv', 30, 2, 689, 17560);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2937, 'Wehrheim', 'efvnidw ikjocg', 163, 5, 9247, 93347);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6996, 'Trenton', 'jpgiqxn zjlbyn', 150, 14, 2893, 97422);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1257, 'Velizy Villacoublay', 'qwrdrfl itpher', 65, 19, 1244, 62227);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4428, 'Novara', 'imixvxi njflav', 87, 18, 217, 82302);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1798, 'Pompton Plains', 'ugskmeh rxuqgn', 52, 12, 1222, 76888);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3335, 'Redding', 'gjqespi csfprb', 89, 6, 2747, 81268);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4876, 'Ipswich', 'rhauski jdttri', 138, 1, 2579, 12880);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3656, 'Salisbury', 'zwpdpug exjsvq', 8, 3, 3142, 68795);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1029, 'Saitama', 'unddgno pjftjt', 139, 4, 1026, 2538);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2475, 'Biel', 'gniwffo gmjrxk', 154, 10, 3073, 95299);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5538, 'Mountain View', 'yblycgc tlybei', 49, 1, 6327, 27668);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1133, 'Spring Valley', 'edezqjc pqwnjp', 120, 5, 7468, 22226);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2947, 'Los Alamos', 'grerjiu xaukbv', 2, 12, 3926, 60688);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3534, 'Lakeville', 'tuzeyhn dqpfng', 106, 2, 6818, 39794);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4196, 'Appenzell', 'ujhbkjk akyjsp', 200, 7, 1859, 77469);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5438, 'Southend on Sea', 'npdbrfr pgpbfs', 197, 7, 8113, 8422);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6643, 'Richmond Hill', 'trmltka dvcoaa', 194, 3, 4184, 59357);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4708, 'Pensacola', 'xwkybzj xarxqt', 42, 4, 5503, 56331);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3180, 'Mönchengladbach', 'rduwjeo gqyire', 48, 19, 6068, 55333);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4169, 'Bremen', 'rpxrqto tbypub', 1, 18, 3613, 44508);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4859, 'Eschen', 'uhkxygd wrsaba', 19, 3, 4399, 78595);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5614, 'Salvador', 'yrbatrb pkrzeh', 171, 1, 9914, 91361);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6137, 'Erpe-Mere', 'ezdzwiw trxzig', 93, 18, 1104, 91944);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4780, 'Storrington', 'invvyww zjchra', 172, 20, 7561, 70382);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4927, 'Pasadena', 'cdmmnge laymxw', 71, 9, 626, 88995);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2509, 'Maidenhead', 'xazqptb ugmuvl', 164, 20, 7869, 65495);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6175, 'Varzea grande', 'bimjaol uyqtln', 127, 13, 2338, 1373);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5562, 'Herzlia', 'aubmvza njvbew', 106, 17, 2025, 52661);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5651, 'Enschede', 'pmoborl cqaiwc', 122, 16, 4828, 28821);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5126, 'Libertyville', 'xloekwk yazvoh', 6, 13, 6325, 43619);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2317, 'Suwon-city', 'esszqkb qlbsco', 78, 10, 2922, 90106);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2116, 'Di Savigliano', 'ujrbmcv envzvk', 11, 17, 9896, 79589);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4274, 'Telford', 'ytcuonf smlxpw', 117, 10, 4956, 79411);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4644, 'Terrasa', 'glvqnmd exuckf', 74, 1, 5812, 91965);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2143, 'Joinville', 'ovdnoqe icltua', 109, 18, 1389, 26813);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3567, 'Eiksmarka', 'qbvknpg xxgvta', 65, 19, 5075, 4529);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6328, 'Brampton', 'ufwtinw ycfgph', 5, 11, 1361, 52146);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5418, 'Sao caetano do sul', 'erpkinn dzvuas', 193, 19, 2418, 68678);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2929, 'Bellevue', 'ydefjhi zntjoi', 123, 9, 7096, 15185);
commit;
prompt 700 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3401, 'Salisbury', 'qhwjtbt oswhhq', 24, 3, 6577, 7727);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4315, 'Kumamoto', 'uwhfmdb bfpqij', 12, 4, 2455, 43977);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1556, 'Calcutta', 'uxyovrh bbonxl', 86, 14, 4822, 12190);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3053, 'Bartlett', 'xjzhotz ubdbhp', 187, 15, 6717, 5661);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1597, 'Horsens', 'ovixgwj jtbren', 22, 10, 6568, 63462);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2846, 'Burlington', 'vllewwx aewajo', 51, 7, 7714, 2188);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3669, 'Sapulpa', 'hbqucfg dsvgbo', 72, 9, 7637, 8368);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2900, 'Englewood', 'tcyypjz mgoxru', 187, 7, 6847, 51162);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3900, 'Kanata', 'ysozjtx jnefqp', 1, 12, 4874, 2781);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3978, 'Cerritos', 'aomkcfk dugewn', 14, 4, 342, 69853);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4397, 'Smyrna', 'alatclj sivxda', 83, 9, 301, 72264);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1026, 'New hartford', 'ndlzhwn sbtdvz', 147, 18, 9369, 6569);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1808, 'Braintree', 'qpifhoh bmqfem', 133, 5, 9850, 63700);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5664, 'Dardilly', 'npbnqjd pufsch', 136, 8, 4221, 74344);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3805, 'N. ft. Myers', 'sytsdpe hutcvr', 39, 1, 289, 998);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5001, 'München', 'etdsqjs myiiam', 28, 17, 4319, 62453);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2560, 'Roma', 'fznkdwz ylcjxp', 148, 5, 1415, 30578);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2636, 'Olympia', 'lecvrni ytfork', 95, 8, 3119, 11886);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5845, 'Monterrey', 'nrghjae qxldzh', 77, 17, 9392, 31535);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5068, 'Longview', 'kvriuyu ujmgul', 71, 1, 2929, 51157);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5222, 'Ashland', 'fqtmmms vopuru', 173, 9, 7408, 66528);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2541, 'Bristol', 'qyvxtwo ilaysz', 16, 13, 1050, 24171);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3420, 'West Launceston', 'ldjxcqs avaqfo', 111, 13, 5501, 49711);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2515, 'Portland', 'mkcqazg aisolt', 156, 6, 1352, 68410);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1675, 'Zurich', 'vonfanw vqvzri', 58, 16, 3903, 68527);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2616, 'Oyten', 'lrurauq ptmlec', 150, 7, 1808, 38413);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6889, 'Butner', 'nlssyai yethyy', 101, 8, 2596, 2389);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6500, 'Douala', 'axiqmxg vihrbs', 17, 1, 1880, 83171);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1495, 'Tokyo', 'uxnpajt ckkrux', 87, 13, 2105, 93336);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2077, 'Tempe', 'fimljpx xphwsk', 25, 4, 6123, 94612);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4139, 'Coldmeece', 'rzvdxxw tawflx', 122, 17, 1002, 44103);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4061, 'Bretzfeld-Waldbach', 'rfulicz caqqnz', 198, 5, 450, 17562);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1505, 'Netanya', 'cokxhyb tfyiev', 117, 11, 6165, 90699);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6543, 'Radovljica', 'okajiny nfrqzt', 48, 9, 6162, 18771);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1405, 'Akita', 'vloskmg tjnohw', 110, 19, 7386, 52165);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2552, 'Rio de janeiro', 'mkgfcqe ytbips', 135, 4, 7774, 10299);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1813, 'South Hadley', 'yawfggb xlvnes', 121, 14, 7407, 28488);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4688, 'Slough', 'mcaacti welcuj', 133, 10, 4740, 58637);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4573, 'Goiania', 'ggwnsrb ofrkee', 169, 8, 2363, 48717);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2305, 'Boulder', 'qdsowse utnfah', 124, 11, 5803, 99808);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4033, 'Rtp', 'svtotvy qiqgsi', 127, 19, 8866, 98030);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2133, 'Freiburg', 'dopepwj usveri', 62, 13, 1749, 38200);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4368, 'Redding', 'xbirjbp oozlkh', 60, 1, 8371, 75781);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6462, 'Houston', 'jtutkul jzgpkq', 130, 18, 5867, 3188);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5936, 'Sacramento', 'bizehtu tcirfc', 132, 12, 4030, 35321);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5759, 'Amherst', 'blcpptk pbhveq', 179, 8, 6163, 47229);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6009, 'Ebersdorf', 'tkocqgf sdmggs', 119, 19, 2948, 30861);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1093, 'Crete', 'cmzbtch goelwj', 65, 1, 5040, 42372);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2230, 'Silver Spring', 'hpfzeki yzbrby', 188, 20, 1185, 26964);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2945, 'Southend on Sea', 'ijhyikd ixrufq', 41, 14, 4773, 22858);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2644, 'Farnham', 'hszxpst bzhzsd', 163, 1, 9446, 26423);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5195, 'Nancy', 'kqtxmws iwqlgl', 113, 8, 3923, 25613);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2483, 'Heiligenhaus', 'mnwqtrb kfjknz', 100, 19, 1298, 65244);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6725, 'Herndon', 'cykurrm ffrrmt', 24, 5, 1576, 14476);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4396, 'Oshawa', 'fmwaftm uwkkql', 65, 9, 1608, 10355);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4381, 'Sao caetano do sul', 'lczygzk ldvhrm', 165, 7, 4854, 77230);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1767, 'Täby', 'iuggqgg zrcrie', 7, 3, 19, 92625);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2618, 'Coquitlam', 'zkrwlar lojtoc', 172, 6, 2693, 12798);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2590, 'Grapevine', 'duuzfft sscxne', 5, 16, 2816, 82515);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5359, 'Mayfield Village', 'bmwmnfk strvzb', 34, 5, 8109, 63553);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2192, 'Pecs', 'nzvlieg jqnukn', 19, 13, 2356, 49835);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1880, 'Bristol', 'omyztiv amzxnj', 164, 8, 1952, 13277);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2349, 'Ingelheim', 'nhgmwdd fwgobk', 77, 10, 8099, 70573);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4335, 'Melrose park', 'dxrrits iazuhh', 8, 12, 6447, 33839);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1115, 'Marlboro', 'rumwfio umjzth', 97, 19, 7191, 18597);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6351, 'Albuquerque', 'xxkfrmh yuwkqq', 90, 3, 538, 74526);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6870, 'Oxford', 'didgcsb lsrsyp', 95, 10, 412, 69472);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6417, 'Granada Hills', 'fwkirjz xqqyqb', 119, 16, 7876, 50597);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2799, 'Vantaa', 'tzuedla wudhmo', 82, 18, 2119, 63729);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2927, 'Shoreline', 'snludwk kocxss', 137, 16, 2752, 61504);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6554, 'Manchester', 'bwprejb ttggew', 51, 19, 5359, 93808);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1254, 'Mountain View', 'ylchqnw uzjcvc', 82, 8, 7249, 75576);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1546, 'Monument', 'safdaku nybqnz', 117, 5, 8801, 31624);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2012, 'Crete', 'aqipdxz arqnrx', 113, 18, 8256, 4584);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5124, 'Loveland', 'jcdbnmg yyqyui', 27, 3, 4937, 81776);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2409, 'Oldwick', 'wsjquwp hszhrf', 52, 19, 2415, 39313);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2289, 'Sundsvall', 'vvahnzp uvbssp', 178, 17, 6844, 94991);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3061, 'El Dorado Hills', 'zffimrn pknsvh', 53, 9, 3921, 59113);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6202, 'Nara', 'birdhfd vnttko', 105, 6, 6479, 89551);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4452, 'Olivette', 'dlqghzz hfcukj', 21, 8, 2596, 80807);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6612, 'Pointe-claire', 'bryqgfm arzuut', 107, 2, 3869, 53691);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5440, 'Peterborough', 'aptmcio ysbopa', 127, 17, 7510, 40812);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2903, 'Dardilly', 'lkjydjd gsogst', 176, 16, 8581, 90522);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1403, 'Los Alamos', 'sszkrmv ibhgig', 8, 5, 4692, 97943);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1833, 'Yogyakarta', 'xlxuknp gnkult', 29, 16, 7244, 97053);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6569, 'Leverkusen', 'sgtoega fswoai', 98, 3, 4448, 61544);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1722, 'Karlstad', 'zorezts ruxgyc', 96, 13, 8611, 95390);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3066, 'Marlboro', 'nenrrdo ebkpfx', 66, 5, 7809, 98456);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1326, 'Cape town', 'kgplrln vmrjps', 50, 11, 176, 59957);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5773, 'Carlsbad', 'tnnuhfs vdpsqq', 82, 5, 614, 86191);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5717, 'Issaquah', 'wadeweh itlshx', 30, 12, 1602, 62183);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4744, 'Madison', 'vixsfbu buymvm', 169, 10, 1960, 72075);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4088, 'Slidel', 'jqfiawn gkgndu', 184, 1, 1389, 61398);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2968, 'Birmensdorf', 'zxronnt rsnyno', 71, 2, 6768, 77440);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5398, 'Bielefeld', 'brlmpxd jtbjbt', 148, 14, 9202, 35195);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3138, 'Anières', 'iwaoukt piejfe', 12, 9, 5135, 6130);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3314, 'Carlingford', 'wyyoyuv ckvhrd', 26, 8, 2803, 42133);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3479, 'Pecs', 'fdeluzk bnccgm', 150, 13, 8988, 98187);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2888, 'Alleroed', 'gsadola fxltbb', 8, 14, 1113, 6849);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6404, 'Ludbreg', 'yzvornk heoqap', 198, 2, 3504, 66181);
commit;
prompt 800 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3366, 'Albany', 'wmttmvt ulvkxa', 54, 19, 3795, 76663);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2656, 'Wellington', 'ysuhowg ccqufi', 26, 12, 9906, 22165);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5672, 'Smyrna', 'mtnwqtr zinzpz', 49, 4, 7711, 32680);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5839, 'Shreveport', 'uwxwcim gfmvhq', 152, 3, 6116, 53535);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5415, 'Eschen', 'klgjdoo bkxlva', 101, 13, 5676, 40965);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2160, 'Deerfield', 'mrvclrk jeubox', 170, 20, 8325, 51612);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6013, 'Bergara', 'jzpwmrq sptqjt', 39, 11, 9287, 22590);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6014, 'Zafferana Etnea', 'axkvloa jcwczn', 161, 14, 4825, 43488);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5197, 'Zaandam', 'xpcavrg vcmnfl', 148, 13, 6957, 93852);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4237, 'Oakland', 'ntwzzei aaxsxa', 102, 2, 4729, 95554);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3441, 'Nuernberg', 'arhqhjg ifvbwj', 198, 12, 5644, 63179);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6172, 'Spresiano', 'omqrlhu hvwqjy', 68, 19, 5924, 85769);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3234, 'Fort Lee', 'dqpuvfl yvboex', 148, 7, 8918, 75845);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6946, 'Aomori', 'cwcfizw hcdllr', 59, 6, 8963, 52878);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6891, 'St-laurent', 'kdrcvrw ztvgvp', 47, 11, 2366, 64182);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4300, 'Hässleholm', 'akzcvtc jfhtfk', 29, 17, 5262, 64123);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6428, 'Burlington', 'sjonmgc hinasd', 29, 1, 7141, 12323);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4309, 'Okayama', 'nrilvki szokgk', 86, 9, 810, 37374);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5483, 'Gothenburg', 'xqzntxr pizjre', 25, 5, 2699, 80692);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4617, 'Campana', 'neyiook vsljpj', 117, 13, 509, 15284);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1911, 'Oak park', 'lixplxk btdtxx', 180, 12, 4058, 89584);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5291, 'Horsens', 'asmdvhc kulvrs', 181, 8, 3812, 92215);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2066, 'Mainz-kastel', 'gkpwqap vwuqpy', 66, 3, 7983, 910);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3215, 'Maidenhead', 'eoqmxnm byushs', 36, 19, 9840, 66927);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5654, 'Osaka', 'cmapmyp syhtxb', 77, 9, 261, 44624);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4070, 'Zipf', 'vnrruwp vgbprh', 28, 6, 1958, 52657);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6638, 'Burlington', 'cbzfkgj nkfqgr', 59, 5, 201, 55479);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4320, 'Appenzell', 'dlbjpxs jgwvmk', 198, 4, 967, 53178);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4419, 'Tampa', 'gmmdwyy ubbecq', 161, 3, 8752, 14607);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2063, 'Tartu', 'vwlprsi ouvgxb', 36, 4, 6520, 27523);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1039, 'Neuquen', 'atbnklw gqzmcq', 172, 11, 7613, 31166);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3574, 'Ribeirao preto', 'cfsakwb taynwj', 156, 3, 2139, 73060);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2627, 'High Wycombe', 'wksgqxt bezauj', 21, 17, 1716, 98323);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4054, 'Toyama', 'wpioqfr vopxfe', 6, 20, 2926, 26435);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4873, 'Lathrop', 'xzlfrdy qpzakn', 113, 8, 9648, 55743);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3276, 'Pasadena', 'ahhlzgs uqnscz', 33, 17, 7436, 48403);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1614, 'Groton', 'vzaqcqn upwssm', 188, 20, 5579, 30633);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4964, 'Caguas', 'rkcoqqm dhtovi', 55, 13, 3701, 94917);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2883, 'Hunt Valley', 'hdcmeuw tckolw', 35, 13, 4423, 77313);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1707, 'Kerava', 'bfdikjx vehtmh', 169, 8, 653, 98242);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4823, 'Rotterdam', 'kdjpyqb tidxnb', 82, 16, 4257, 4001);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4862, 'Saint Paul', 'wnufyen fmydem', 18, 19, 8194, 52593);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1638, 'Staten Island', 'mkmlala azmayc', 144, 13, 4262, 47315);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6217, 'North Wales', 'ubxtlko hdmfvy', 199, 3, 299, 67365);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1242, 'Frankfurt am Main', 'rqpcylu gyivnr', 198, 2, 1471, 31159);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1572, 'Grand Rapids', 'cwgxfwa qnigve', 18, 14, 9916, 46071);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5695, 'Copenhagen', 'nayqucu sdiyqr', 54, 20, 9781, 36331);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3916, 'Gävle', 'avgrsmv xvktym', 108, 7, 3965, 39288);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4455, 'Unionville', 'xboquxk aquird', 30, 1, 1831, 83852);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5974, 'Dallas', 'jzpjotf rcaqfl', 42, 4, 708, 99384);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3554, 'Maintenon', 'mozsdan xnkdoe', 174, 2, 6657, 80548);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4327, 'Abbotsford', 'tmbiqmx ccuyuq', 106, 14, 340, 71403);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2362, 'Luedenscheid', 'iktbolk eqcnzf', 39, 9, 24, 90490);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2045, 'Sao paulo', 'gdttfdy wbsyxp', 46, 17, 8229, 95692);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5908, 'Amarillo', 'kpzttfw lxvzty', 167, 16, 2365, 32265);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2449, 'Redwood City', 'tmhiivh ddvdbw', 173, 11, 2559, 76945);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3769, 'Paisley', 'iefzdpw rjrxvv', 138, 3, 3327, 53139);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3929, 'Lake worth', 'sxkvtqd ajjito', 40, 20, 7840, 16397);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1045, 'Nicosia', 'ovvysbd lwdqrc', 44, 5, 4386, 69108);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3840, 'Biel', 'fwccqpv liotre', 132, 15, 7549, 81401);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4048, 'Bingham Farms', 'tfpaosb npteak', 110, 11, 1282, 69268);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4317, 'Ljubljana', 'zoircrx fhhfxn', 29, 5, 2308, 63005);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2679, 'Lancaster', 'hcjycdr hdenhf', 105, 15, 8451, 55289);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1346, 'Mönchengladbach', 'llywwai fzzeop', 1, 7, 4642, 3577);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1729, 'Bolzano', 'xnjjwlo wrvwco', 18, 20, 6796, 1505);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3588, 'Sainte-foy', 'wbxquvy igyybt', 97, 14, 1120, 258);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1394, 'Hackensack', 'effqdtg dvhqdf', 25, 13, 5894, 60082);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4090, 'Amherst', 'rinaizg zwwjdr', 53, 3, 1020, 58391);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2770, 'Wichita', 'kpkuvtn inmhqp', 27, 11, 6657, 87178);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5706, 'Darmstadt', 'uogrmjx hvwfpj', 110, 15, 2214, 65634);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5399, 'Knoxville', 'jwsxybm bbkcem', 29, 14, 5475, 15858);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6629, 'Fuerth', 'sfwemle zssgot', 48, 13, 4420, 63574);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6879, 'Coimbra', 'vitrekv xtyjje', 54, 20, 6939, 54663);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1129, 'Kista', 'tnfksyo xjrmty', 137, 8, 2716, 87587);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6694, 'University', 'ifeqhep xakbao', 125, 13, 3329, 21706);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1130, 'Bartlett', 'inyouti mkfret', 181, 11, 4712, 47260);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4262, 'University', 'luazcdn lhxuyo', 85, 10, 453, 10818);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1450, 'Hyderabad', 'jdhpgtc mfrewm', 57, 2, 2897, 85703);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1796, 'Rockville', 'dkzynwh hlkadp', 100, 10, 4837, 35818);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1106, 'Enfield', 'iijlgie gywwvt', 173, 1, 7994, 20137);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3601, 'Bristol', 'gykmjhh nnmhxb', 197, 16, 2760, 76760);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5708, 'Kaohsiung', 'knogxxi tjrgyt', 140, 7, 8779, 45315);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6159, 'Boulder', 'uslsyhl hsdsgu', 103, 18, 5832, 10299);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5561, 'Belp', 'ieavlqi ynxvyv', 143, 15, 3005, 43041);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5212, 'Lucca', 'muudulj inhcei', 152, 17, 3988, 55471);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1651, 'Sale', 'uniwchi ycckey', 22, 13, 860, 80996);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (4388, 'Wörth', 'ynziksh rteijm', 5, 16, 9684, 10331);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2933, 'Rua eteno', 'whdnhxb xthgav', 102, 18, 3099, 60194);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1423, 'Richmond', 'zidltya utlhbe', 122, 20, 699, 18520);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2190, 'Pomona', 'jsgbcus utbcxu', 120, 19, 3491, 99472);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3241, 'Groton', 'rfumzza weudpc', 26, 11, 8943, 28955);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1121, 'Ohita', 'ncxynqp mdpfin', 82, 20, 6889, 58715);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6687, 'Newnan', 'mbhcpsd tuitpt', 164, 2, 8292, 93644);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6262, 'Reisterstown', 'zfgnvmv abpnzk', 164, 16, 7698, 56448);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5844, 'Cedar Rapids', 'shpsrlr jpkmky', 161, 8, 8627, 76696);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5678, 'Bend', 'kxsadjv htikka', 149, 8, 2337, 56649);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5619, 'Morioka', 'oenqdbw ovgrhb', 97, 7, 3871, 52770);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6614, 'Rome', 'gmcdctu xhrlvz', 93, 8, 2677, 95967);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1674, 'Concordville', 'cfshodj benryh', 55, 3, 1935, 75273);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6498, 'San Ramon', 'yrwgnji tyanfj', 190, 20, 7014, 62077);
commit;
prompt 900 records committed...
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3031, 'Yokohama', 'gluntwi mkbfag', 75, 11, 7589, 76013);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6654, 'Glenshaw', 'udjbaga zpoxxn', 56, 11, 8084, 67958);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6633, 'Treviso', 'saxvgfy uqyzlo', 176, 13, 2385, 54155);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3716, 'Ithaca', 'qtmmqhd obvkco', 114, 15, 2755, 6973);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6943, 'New York City', 'jvaodgz mmakpo', 143, 3, 3496, 47564);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5660, 'Doncaster', 'qfxaduc nyzmes', 150, 14, 7990, 73015);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3673, 'Lima', 'aygvort ffolvy', 197, 1, 3985, 7734);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1019, 'Reston', 'qaigpjq dcirza', 110, 13, 5585, 45039);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1494, 'Grand Rapids', 'rtiywuj mhfpjv', 43, 2, 6551, 2371);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2366, 'Ann Arbor', 'hzuwonk ncqpws', 8, 9, 3277, 86111);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3207, 'Perth', 'ukflliw wxgpyy', 161, 17, 5613, 95509);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1503, 'Auckland', 'ckfimtu kxcxds', 189, 14, 3942, 28549);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5196, 'Takapuna', 'aulwmgc iwmnsl', 44, 7, 1592, 47841);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2754, 'Milpitas', 'gdqdvor xwasce', 2, 5, 6471, 65917);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6903, 'St. Petersburg', 'jdeznza nxpbxi', 60, 5, 1788, 69132);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2895, 'Whittier', 'wkmjnds mcboyr', 69, 17, 8273, 14250);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2963, 'Münster', 'ermlvkg xhbrbw', 169, 19, 530, 30670);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3374, 'Ebersdorf', 'fxrpamb pbbksj', 24, 4, 5717, 61223);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2370, 'Birkenhead', 'gvlqbyc iglkua', 1, 3, 6027, 68865);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1692, 'Corona', 'icchzyy vdeqjm', 105, 1, 7810, 87671);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2580, 'Vantaa', 'nubpjpb vzoytb', 177, 10, 5502, 57088);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1565, 'Snoqualmie', 'mdzfzrb hdhwno', 106, 17, 3451, 72883);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5836, 'Palma de Mallorca', 'wrwzuxc amsbau', 25, 4, 1863, 66170);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5152, 'Cerritos', 'nskwdpf osawfe', 181, 6, 9066, 59221);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (6084, 'Solon', 'xkuromr ivbghl', 135, 14, 2535, 85412);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (5816, 'Santana do parnaíba', 'msxijyr llcujh', 136, 15, 48, 6996);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (2458, 'West Chester', 'gopuirq zqxeiv', 169, 10, 5662, 11849);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (3409, 'Gdansk', 'cmyzqzk qrhenr', 98, 1, 4962, 83990);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (102, ' jerusalem', ' teena', 5, 5, 456, 756);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (103, ' tel-aviv''', ' rimon', 6, 8, 643, 68);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1034, 'jerusalem', 'ben-zion', 3, 7, 456, 543);
insert into T_ADDRESS (addr_id, city, street, house_num, apt_num, postal_code, po_box)
values (1035, 'tel-aviv', 'arlozorov', 6, 5, 2587, 7657);
commit;
prompt 932 records loaded
prompt Loading T_DEPARTMENT...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3011, 'the department responsible is to check the security of the medicine', 'pharmacy', -6241002, 'Call.Habriut@MOH.HEALTH.GOV.IL');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1705, 'ryquxiadvemwxzvhzlps', 'miumb', 88796069, 'steven.eldard@mse.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (712, 'hxodycegbmtcdotqr', 'usc', 424222125, 'vondie.foxx@abatix.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8880, 'ecwxqfzmgt', 'yed', 445219557, 'omar.lineback@processplus.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8005, 'hteuvikjpq', 'wtpazx', 661004583, 'cuba@ecopy.hu');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6325, 'pfpoll', 'zqzbo', 233043491, 'allan.benet@atg.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1488, 'xyktuwcelqnug', 'gxixkzz', 305653744, 'joy.frakes@kitba.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8541, 'bihptlqjkcatrbyrnwgd', 'iukcl', 434686407, 'spikel@veritekinternational.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2674, 'mkzktssncstnb', 'ayucnwg', 362808598, 'kevn.snow@zoneperfectnutrition.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8070, 'biirdsfotoenp', 'jdbvi', 756173716, 'burt.badalucco@hudsonriverbancorp.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3824, 'ji', 'pdlu', 713964506, 'jane.elizabeth@benecongroup.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8873, 'prhogjpkzccmkmgf', 'ys', 755640425, 'lchilton@grayhawksystems.lt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2478, 'qqftmqx', 'zvsey', 40669262, 'ricardok@neogen.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7298, 'ntfwrqciwdi', 'u', 260820808, 'rueben@advancedneuromodulation.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2656, 'ebmvjkzmubkec', 'l', 849958323, 'claude.g@kitba.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4962, 'mrendwzqesrhcdlcjdt', 'v', 559990535, 'r.devito@coridiantechnologies.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9677, 'dqqxsrnkxrkizfl', 'ehca', 944255484, 'meg.mccormack@sears.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3518, 'xoqrjoyw', 'yiyzuy', 430747176, 'levar.g@scripnet.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (354, 'k', 've', 3616295, 'millie.brickell@midwestmedia.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (212, 'elkkmss', 'z', 283646529, 'debi.larter@uem.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9698, 'klx', 'ez', 93374942, 'geoffrey.church@iss.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8770, 'cnocdmovebtupbqa', 'o', 810258615, 'milla.masur@tama.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4667, 'wpnevxmqffkxqbfuveeb', 'krpyh', 422405301, 'd.keith@conquest.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6661, 'ujdzraufprxjhahwz', 'yi', 339239144, 'bobby.crowell@zoneperfectnutrition.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6283, 'tlgzcylao', 'va', 333775653, 'regina.overstreet@career.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4544, 'zeqqsxzsbayirbcb', 'libmnq', 545500878, 'dwightc@circuitcitystores.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (633, 'tuwtwyosbbo', 'vxwb', 277392590, 'debra.singh@medamicus.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5642, 'skfapjiu', 'franqj', 88078287, 'l.chinlund@authoria.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5623, 'u', 'fr', 235348455, 'fvenora@curagroup.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5785, 'orvpidfon', 'v', 467671314, 'pam.stills@hencie.ar');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3038, 'eksuxbfw', 'xyscef', 177224905, 'jena.graham@innovativelighting.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9483, 'puahqvhystdjzivctkfz', 'bjavyt', 992947359, 'selma.winwood@nhr.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4395, 'sanlrciqqakoie', 'y', 737120167, 'kateb@alogent.hk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9079, 'cbiudrhgl', 'xjzeo', 112672542, 'cate.shepard@datawarehouse.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8266, 'mstjudnwarftgzetmwf', 'wx', 582949059, 'a.allison@nissanmotor.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3108, 'oeqyaastmb', 'ikydylt', 317200070, 'devon.raitt@trinityhomecare.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7193, 'bu', 'dgwfxvm', 113323604, 'kris.mcdiarmid@marketfirst.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (368, 'mfozgmclso', 'okgozq', 965124179, 'leo.magnuson@valleyoaksystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4202, 'blxivyoxyaa', 'oiqsq', 87060949, 'ewan.connelly@dcgroup.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (595, 'nhpmwthj', 'd', 688541301, 'raul.tillis@mindiq.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2326, 'kffwozzpclf', 'frrxr', 22622645, 'c.mcanally@genextechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3872, 'llsbibqj', 'cqjwznn', 441662336, 'ivan@clubone.lt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7528, 'bazzrtzdxryajimaxdc', 'iymfiba', 967702429, 'leonardom@mindworks.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3063, 'j', 'b', 892679961, 'kathy.t@meridiangold.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (76, 'snfokmwphvjtiiougeve', 'rk', 136205332, 'k.lemmon@fordmotor.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9672, 'zlqwelbifgjfckf', 'ut', 710494715, 'julie@vfs.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6339, 'igkick', 'hmwsbeq', 686063661, 'steven.danes@trm.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8898, 'roxknibhiztizpnzaxfb', 'yumv', 108204866, 'cevin.vanshelton@ccb.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6196, 'edvhfksmedpqokkrghne', 'zfva', 449496770, 'a.swank@simplycertificates.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3078, 'qphbdmpqqtpj', 'iw', 243570634, 'domingo@educationaldevelopment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6686, 'oyrnqwebrnsyz', 'z', 626888938, 'laura.burstyn@networkdisplay.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2867, 'pqnqucjc', 'whj', 918119760, 'j.wen@comnetinternational.cn');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8612, 'auluiys', 'yzbaz', 129113582, 'buffy.irving@shufflemaster.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2994, 'lrrjliteaf', 'ifulfpo', 256314946, 'gilbert.austin@scripnet.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7206, 'tzfoauozdxz', 'zb', 261861809, 'beverley@usenergyservices.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8200, 'daqwqgyqxhlp', 'pybmq', 515936582, 'cliff.scheider@bowman.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5874, 'pusxpceih', 'ydg', 547339314, 'thomas.moraz@cendant.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8312, 'u', 'pufa', 413780109, 'arturo.quinlan@novartis.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8011, 'go', 'jckttj', 805905389, 'carl.stewart@carteretmortgage.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8381, 'imtw', 'bdcmnt', 738178120, 'rick.faithfull@ceom.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6205, 'zzuuhesdikkufsfjg', 'mnvqxw', 497973356, 'gino.chilton@americanvanguard.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7823, 'kbiaaik', 'jb', 124396138, 'peabo.connick@nexxtworks.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3410, 'lnkfllmjg', 'j', 908124987, 'isaacm@diamondtechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3728, 'ivl', 'p', 804309800, 'walter.irons@ibm.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5049, 'qqcifjmcky', 'vduncfo', 931237118, 'susan@greene.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9836, 'k', 'iu', 868471224, 'kurtwood.capshaw@intel.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7084, 'rpjlosfxauplbantbgy', 'jjn', 857733331, 'harriet.suvari@younginnovations.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6761, 'pqvdwoqowy', 'gtwaai', 558071057, 'edward.stoltz@envisiontelephony.be');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2613, 'dxhso', 'ryufmn', 994058550, 'ving.griffith@ris.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3427, 'mwkbyjohz', 'ycg', 209837231, 'richard.janssen@aquickdelivery.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7562, 'iieifcfm', 'yrfdvq', 723907038, 'ezahn@sprint.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4787, 'wqwfwrradesaoiaka', 'aeodd', 340262471, 'sgill@gdi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5707, 'm', 'p', 66632336, 'miles.m@aop.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6746, 'ynhv', 'kyrdl', 811210346, 'dianne@servicesource.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7270, 'gnbafpgbgjmyor', 'rwuevpr', 778993192, 'kiefer.m@typhoon.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1544, 'hzzujq', 'q', 200973143, 'bo27@trx.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7614, 'mxvyjkpmtqrih', 'hc', 891022271, 'denzel.mifune@evergreenresources.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8162, 'vtntgto', 'jswirm', 709790743, 'amy@heritagemicrofilm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1346, 'fuypivdvvsxdrlisre', 'ffuf', 151074557, 'winona.ryan@powerlight.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (280, 'scldtwxreczdr', 'puvijo', 343180490, 'brian.rickman@astute.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5132, 'fc', 'dxyi', 878054792, 'brookeo@servicelink.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3293, 'ewwtrr', 'hutvq', 437168186, 'kris.shalhoub@vivendiuniversal.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7514, 'tmsbpox', 'tma', 619652652, 'anita.curfman@aci.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9028, 'xglfo', 'fj', 881793905, 'larenz.foster@paisley.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2048, 'rhawvuwwopw', 'iws', 807849315, 'marina.allen@yashtechnologies.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7860, 'xogxdpimbc', 'hyvnn', 939523554, 'christian.dourif@hencie.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5652, 'ybjmsfcvxxrpt', 'fzy', 454528355, 'scott.m@vfs.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3331, 'qxzfpfevxlrjzzrklknn', 'lziubqc', 545313448, 'josh.buckingham@hewlettpackard.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6160, 'e', 'qsk', 276438402, 'ronnie@dis.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7503, 'tliojmoopqr', 'qcw', 23088479, 'allan@socketinternet.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6272, 'jycdyxepbiupuphxn', 'pcq', 960625022, 'earl.mantegna@paintedword.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (948, 'puk', 'd', 943668328, 'pam.s@gateway.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2456, 'z', 'zq', 98668157, 'renee@johnson.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6116, 'rjuyzfytxwp', 'yr', 884844593, 'lea.ifans@computersource.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4979, 'tpftngexkjxnidynncm', 'wa', 218878342, 'reese.streep@greenmountain.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8926, 'qnclefwb', 'gzegieu', 527641064, 'rness@simplycertificates.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9321, 'hyn', 'b', 491294519, 'julia.henstridge@hondamotor.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8822, 'i', 'ycm', 925843396, 'cliff.gibbons@streetglow.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7411, 'tymfmenydtaqlcrh', 'alo', 148120891, 'bradley.morton@employerservices.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8539, 'zqxxvnpzkyhsdgvqznkz', 'wwrb', 989680229, 'debi.c@elmco.be');
commit;
prompt 100 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (193, 'bjrojnalqeaysbu', 'gwbcriv', 619068179, 'irene.c@its.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6259, 'iymmnmsavyzchipunko', 'epw', 630125075, 'gdavid@glacierbancorp.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1094, 'c', 'pzglugz', 811090643, 'pam.bosco@shufflemaster.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2795, 'cqsroobwekeyqbtuv', 'edjdfc', 968698953, 'grace.unger@dis.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5198, 'xpsshdnunlpih', 'lhdpg', 923614714, 'nanci@computersource.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3047, 'fviwvjtyw', 'nbpbdlb', 414672895, 'kasey.ponty@pioneerdatasystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1131, 'aabcnsbpsrm', 'g', 263732547, 'harris.parish@loreal.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8808, 'oetfbhwdxolzvgan', 'zbjzq', 810647547, 'steve@coadvantageresources.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2316, 'bhlkv', 'aavn', 556720439, 'vpatton@lemproducts.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (319, 'cnsqd', 'gt', 130447013, 'twitt@alohanysystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (985, 'hkhwrswu', 'xdn', 882586112, 'vpfeiffer@taycorfinancial.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2606, 'gfnispruiiqelp', 'fuznl', 243202922, 'claude@maverick.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8300, 'rpvyl', 'pssvfu', 80947325, 'joaquin.lucien@execuscribe.hu');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6303, 'gfqehekgyoohlbe', 'dcuuheh', 118254868, 'marlon.chilton@seiaarons.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9442, 'ha', 'nku', 289222719, 'brooke.turturro@dsp.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (610, 'qssareiqysfrqqwnnb', 'lyqr', 836400030, 'joe.abraham@timberlanewoodcrafters.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4501, 'hqvrky', 'vycgnp', 564153701, 'linda.n@vitacostcom.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8747, 'rcjrckrckmwf', 'ciz', 352945380, 'lindsay@3tsystems.nz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1106, 'sqvseyklqmrjvp', 'l', 877695868, 'christian.coltrane@firstsouthbancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1748, 'wgulzuzqbvwiyzl', 'z', 880908356, 'g.perez@palmbeachtan.hu');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (122, 'inxxqpnbudordilsc', 'g', 563051457, 'alicia.elizondo@nuinfosystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (853, 'yexsjsmpgcjbbj', 'mp', 14341665, 'gran.gere@chhc.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1011, 'ik', 'no', 148473450, 'jeanne.b@appriss.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (191, 'jhxifwht', 'k', 321433895, 'clea.sobieski@ibm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (229, 'afyszz', 'b', 679295416, 'uma.francis@labradanutrition.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5730, 'dv', 'ssjdm', 233116072, 'r.ferrell@scripnet.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2313, 'ahngxmmdzmynenyd', 'kbd', 604721259, 'edgar.krumholtz@kmart.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7582, 'ivzvripn', 'pfq', 851614319, 'ewen@comnetinternational.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (930, 'l', 'tjgdsv', 428468114, 'nikka@smi.ie');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2777, 'jt', 'vieh', 518691201, 'colleen.root@fmt.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7453, 'dsowmnyhzzjspdoadf', 'tysmlxh', 144994609, 'ereid@trm.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8341, 'vctxxlofsdanx', 'nhejr', 573578528, 'm.heald@vfs.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9182, 'rziqy', 'oeuihbc', 153023454, 'cameron@maverick.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5040, 'nh', 'vjs', 403030359, 'ted.kattan@creditorsinterchange.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9269, 'anxqp', 'z', 819097589, 'psinatra@eagleone.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8622, 'tqbazuzpjdrv', 'pp', 880476572, 'e.shawn@progressivemedical.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9225, 'bdrxmxpuy', 'iel', 582316443, 'marlon@fns.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4195, 'axkprvxizxfg', 'xkg', 633871677, 'colm.l@keymark.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7727, 'lqxcoqqfecjfqdfiwvde', 'keamyaz', 813157883, 'j.chilton@airmethods.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1354, 'stwciygcnex', 'jybdy', 365507846, 'michelle.hampton@sds.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2583, 'scmtpeppchodccbcsrr', 'fanwyo', 123068639, 'suzi.rifkin@als.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6782, 'avidgfbtzepodn', 'ok', 771594280, 'cviterelli@quakercitybancorp.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4244, 'lc', 'monv', 10308715, 'marie.lapaglia@serentec.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7619, 'xjmefhgziu', 'ryknj', 326922377, 'leono@tmt.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1237, 'dikswwtotnbcerhmrwv', 'dybzyf', 313425204, 'pierce.orlando@otbd.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4131, 'klhkrpzmtzhuxubg', 'p', 682303144, 'natascha.campbell@nat.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6891, 'ujnghdipukdfjuonnli', 'fc', 377618617, 'charlize.w@elite.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2654, 'jhvameym', 'ime', 978707871, 'denny.rhymes@adolph.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6501, 'j', 'zlcjrn', 186679016, 'merrill.d@eagleone.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6549, 'scpziu', 'z', 803695577, 'grizzo@esoftsolutions.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (404, 'vmwslwmsfwmsbk', 'y', 569649502, 'k.charles@hitechpharmacal.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7910, 'zgxsmu', 'kjqacy', 875447411, 'j.owen@ecopy.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (154, 'vxvapefarb', 'bcc', 707648620, 'corey.neil@employerservices.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3005, 'vwhmisjulyqaq', 'qz', 828130771, 'blair.dourif@kwraf.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6593, 'qlokiub', 'i', 926607862, 'robs@mds.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5624, 'gzjo', 'qjm', 447728512, 'sonny.renfro@inzone.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1389, 'xymnbxq', 'gtsnz', 539071781, 'burt.o@dataprise.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1356, 'epbxnfre', 'gzvboa', 867874662, 'm.benson@gltg.no');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5474, 'njwruizfoxikhaboonfn', 'yjmpa', 570602560, 'rosiet@eastmankodak.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4978, 'mmtumandqjncblgzqka', 'vsmpy', 488956898, 'hector@blueoceansoftware.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (436, 'czqoueoorlwc', 'vrlkvde', 511052029, 'colleen.d@hencie.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6584, 'zpinsbontbdg', 'aycjq', 75304986, 'domingob@caliber.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4221, 'vbrb', 'usk', 731903136, 'leon.lang@pepsico.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8209, 'nuupuecknyzwzvmih', 'o', 788289165, 'lupe@colgatepalmolive.nz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1872, 'uygyiuaihuwcuerrw', 'c', 587524444, 'tori.d@portageenvironmental.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2584, 'ejfyjhikylvk', 'wfm', 593250440, 's.craddock@genghisgrill.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4198, 'zyiglhwixqa', 'g', 273774794, 'scarlett.tate@ccb.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1118, 'wtfaiqpemhnojydlmh', 'u', 552760480, 'julianna.gayle@afs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2039, 'uvuoftuliqqcvwjudix', 'ih', 262535075, 'janice.gagnon@shot.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4726, 'nejm', 'tkxdpso', 331734853, 'aidan.aglukark@healthscribe.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7202, 'amyqwvtn', 'smojdc', 653985374, 'mandy.molina@glacierbancorp.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5653, 'pvrbamxps', 'bue', 917612481, 'eric.kinnear@talx.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1351, 'ldlb', 'zzjkyo', 907050918, 'alfie@ungertechnologies.ht');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7385, 'a', 'q', 795025580, 'lucinda.kapanka@generalelectric.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3464, 'yctkauyfjkguiqqivczi', 'rfpuvmu', 678838110, 'sgarr@nhr.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3894, 'tipepjhovtvkwocctfwc', 'q', 424041795, 'jeanluc@pds.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4733, 'abhicvwczmdirf', 'ini', 62508380, 'harrison.ripley@accurateautobody.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7215, 'gcinnkgrjav', 'hqjuit', 733241557, 'r.womack@jma.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4586, 'rubmfmzskpqwiiazvbj', 'ruvdpv', 651426696, 'juliette.moody@atlanticnet.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5685, 'yu', 'wiag', 277736779, 'cole.mitchell@refinery.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9021, 'szsqrxxfcnjdfeg', 'ypk', 11366187, 'liquid.ponce@mds.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3256, 'ysjsalppxhiqlupeggnb', 't', 223623171, 'anne.stanley@emt.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8079, 'dcukzxufvbnjxltqonhj', 'mjzbvo', 696820725, 'lenny.laurie@adolph.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5745, 'yirztoanvmyrqnxkv', 'cmugarb', 667804708, 'b.costello@stonebrewing.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3109, 'tkfytqaldnliug', 'tog', 519833681, 'ty.c@spd.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6694, 'etmpcmdl', 'vruzko', 247648104, 'coley.ward@totalentertainment.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3298, 'ppmvygducmb', 'gsjnsx', 97799704, 'eliza.dawson@printcafesoftware.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8616, 'tqfbdimzrsszawer', 'fp', 839660112, 'dariusp@idlabel.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8674, 'aujhpzgyjuewqxhvaidn', 'rarrhmf', 438542, 'gladys.f@reckittbenckiser.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9904, 'qafcsvlbnmgzikmplgv', 'vdlq', 846653388, 'rickie.weiland@ams.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5931, 'pzajxbysf', 'sk', 360523202, 'colleen.m@newviewgifts.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4770, 'pnqzpnzemidwirul', 'vhn', 64688655, 'tyrone.eastwood@securitycheck.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5199, 'ikjbwylisajyrcjykmnc', 'jrcd', 567179164, 'celia.m@astute.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2378, 'qraxvb', 'isa', 820370142, 'davey.may@kis.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4447, 'i', 'evtde', 482357494, 'sander.patton@lms.gr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9567, 'bpcbskk', 'm', 822942452, 'd.woodward@amerisourcefunding.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8601, 'prldzzqqaibfa', 'wfqgj', 24786522, 'lee.foster@mission.is');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2691, 'xumpbqmnwedclwnf', 'wzpzqs', 374461990, 'nathan.studi@elite.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2142, 'wrccqubljkkv', 'wkm', 9694179, 'shannon.rhames@tilsonlandscape.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2882, 'bdfasiqpblvulze', 'cucl', 958208878, 'goldie.sossamon@servicesource.com');
commit;
prompt 200 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6279, 'aqqhxbhgjjunfxaur', 'kjsbcm', 517348806, 'l.thorton@webgroup.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7045, 'zqpaysxbkaitr', 'xszywh', 392152639, 'raulm@voicelog.nc');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2479, 'gwxcsiuwtyt', 'ul', 938830878, 'carolh@y2marketing.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5083, 'wwjzbufmlmpgh', 'umyjflq', 832253207, 'juice@quicksilverresources.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4143, 'grrggtuzicojpksk', 'dybr', 944014344, 'aprilh@conquestsystems.gr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6043, 'fcllegwlkaperk', 'ejwg', 869493744, 'lholden@kis.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (668, 'weqwqfzthjtptjdlzq', 'kpc', 927590466, 'frederic.leoni@unicru.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8555, 'zraizznhoaf', 'hzhjrh', 923307898, 'paul.osment@mwp.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2057, 'qbwwepwmfkas', 'oy', 895629701, 'timbruglia@codykramerimports.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8246, 'whpxrhpnu', 'tfclwu', 628447542, 'chloe@gillani.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (780, 'kcqvovlkwglhmkgtkli', 'pbzrwcp', 553113817, 'pierce@sears.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3895, 'fawooazedslxpe', 'wqvsp', 742303803, 'rade.mcgill@spas.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8679, 'b', 'ygkync', 694338079, 'johnny@nestle.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1686, 'dyisuupiwiwjapqec', 'uoc', 705621794, 'vgayle@monarchcasino.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9265, 'r', 'kfdc', 68069934, 'clipnicki@limitedbrands.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4417, 'ppishcezepkerpommn', 'af', 503876986, 'chloe.rowlands@cardinalcartridge.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3459, 'yudbqyhddngfhpbxh', 'w', 657493033, 'rneuwirth@dbprofessionals.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2157, 'jibnotuwnymamwqmo', 'olbqyrq', 746475068, 'alice.prinze@eastmankodak.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7681, 'jaqwiwajtpqwlwk', 'ieixe', 500214716, 'kennys@spectrum.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2312, 'khtoags', 'ledjz', 867133356, 'alfie@onstaff.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2072, 'ixf', 'medoo', 84853897, 'willie.crouch@questarcapital.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9481, 'zsbqnkzygdchl', 'jhy', 168028379, 'hector@doraldentalusa.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7680, 'pko', 'qyvgwk', 346624879, 'talvine@usdairyproducers.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9837, 'mlrwvtezdbsraapwyz', 'i', 780234818, 'millie.palmer@emt.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1590, 'ntkrbxlmriuluyn', 'yqweel', 37625179, 'v.farina@pioneerdatasystems.cz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3651, 'tvmeqekldvqwj', 'lhh', 600226997, 'lucinda.s@als.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2329, 'eayi', 'tzqzba', 174420966, 'dionne.rankin@typhoon.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9390, 'lagtchpymhhex', 'mg', 530163047, 'r.swayze@firstsouthbancorp.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3964, 'bmqbfu', 'xlw', 109428522, 'shelby.spine@eastmankodak.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7776, 'pgclofinodobzxcgjw', 'l', 665282921, 'junior.feliciano@escalade.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (959, 'qykpxtviyfcorsa', 'bzilkaa', 498114890, 'karen@aop.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3306, 'uulmagibdqn', 'otezjad', 491675417, 'rolando.pfeiffer@hotmail.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5153, 'qsyqkpwlat', 'awh', 560083675, 'shannyn.russo@unitedasset.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6863, 'dbiqdqeszkbmlpp', 'rbvw', 480246724, 'rueben.jackman@refinery.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2830, 'vgtnvfubadghrjsdkeja', 'ris', 511481268, 'cathy.m@exinomtechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2825, 'oomqejyvliv', 'n', 270699601, 'andy.s@clorox.no');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4000, 'mjkcuphzytvnphewgxrh', 'leg', 933034292, 'lucy.bergen@sony.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5766, 'ybkccwzvhob', 'eght', 13626385, 'rory@vms.hu');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9525, 'uhsepjjcjltevnalyr', 'pncjjs', 120700995, 'pam.leto@isd.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1803, 'xispbuvv', 'wfcflry', 590300824, 'suzy@north.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (785, 'dyoiwzkiffqwluu', 'rmq', 183298077, 'ethan.dunaway@escalade.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (151, 'kbbvopacpkldwuuvoo', 'th', 932516633, 'jean@smartdrawcom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2170, 'vn', 'pm', 861845979, 'mjeter@healthscribe.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7389, 'twosncleiz', 'ifxpz', 945038254, 'manu.snow@advancedneuromodulation.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8198, 'cqpnxkwhdxxqgj', 'ev', 834892827, 'patricia.f@authoria.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8413, 'nemrmmaqrclbyrl', 'rguk', 383121744, 'dave.brolin@tigris.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (621, 'gjsyjxxlyhiurqm', 'lbjjjv', 426950063, 'rawlins.curtishall@denaliventures.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7890, 'mndpvrhgjneqptqkysvn', 'cxe', 243056052, 'rade@verizon.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2752, 'flhgiiz', 'eckxoh', 769222216, 'cece.kleinenberg@staffone.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1654, 'vlbvvzqggvsasljxnjd', 'jfwmva', 551066993, 'charlton.d@ghrsystems.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8178, 'oasmccdlsg', 'helbctn', 792319180, 'lorettah@gci.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4138, 'csomte', 'jdarv', 247721148, 'chelyw@bowman.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9052, 'ovsctbxws', 'swlrp', 266883641, 'bill.schock@nestle.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3581, 'yieg', 'dlygaag', 412909793, 'randalls@vivendiuniversal.hk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1279, 'eeszlww', 'tiabu', 50806449, 'mykelti.solido@shirtfactory.li');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5261, 'jsdnhlbk', 'wsl', 587925946, 'melba@consultants.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9108, 'aqywqrmypmdat', 'smcf', 812219162, 'ricky.sossamon@clorox.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6532, 'haktjianvwol', 'ij', 392321078, 'moe.eder@lemproducts.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5419, 'fwheppjiggliq', 'mvh', 439181260, 'rosanna.michaels@safeway.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9416, 'jciigomg', 'u', 687077468, 'clay.cage@safeway.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (487, 'oznwwmwhyvka', 'jzijv', 24445979, 'ossie.fogerty@capstone.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7396, 'dgi', 'ravf', 142894032, 'jlewin@bmm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9503, 'whzmhlbjvhrddq', 'hatg', 427941726, 'gina.mohr@ungertechnologies.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8987, 'cftsjhxspnlvf', 'ihxqonw', 179828154, 'rturner@qssgroup.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7304, 'avywwgvxrdcztnqiouzx', 'ckbpe', 269953050, 'vern.blanchett@alternativetechnology.mx');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4685, 'rmhxvxzerxpi', 'jkysggo', 113359756, 'chant.diesel@ksj.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8564, 'kg', 'ijnhjxp', 973495965, 'bradley.mccormack@flavorx.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2895, 'um', 'v', 758843896, 'leonardo.johansson@baesch.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7588, 'e', 'dsigtrk', 90851229, 'tal.finn@scheringplough.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1678, 'jxhrel', 'pnebj', 124621358, 'andre.d@sunstream.tr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2185, 'zk', 'kuzff', 898628695, 'denny.winger@infovision.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2874, 'cidhccfh', 'k', 862842501, 'jennifer.daniels@alogent.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6576, 'hyfvqcdjjihojsugz', 'iibhoas', 358694910, 'dianne.hunter@trc.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1825, 'f', 'mo', 424957147, 'edie.cromwell@colgatepalmolive.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (941, 'jrrtshyuvsgajrtvkl', 'sgzb', 138511631, 'tcheky.dawson@ataservices.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5991, 'zmtgtgxaygxshpecgw', 'mlsajb', 965678086, 'lara.mccracken@vivendiuniversal.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2064, 'znqdfenovkuggeut', 'k', 49390420, 'y.kirkwood@yumbrands.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2945, 'vyafcympvg', 'equfp', 46525253, 'timothy.ermey@ntas.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7664, 'yrqhcujsrqqxxrpmdiiw', 'nn', 910244259, 'frances.gandolfini@jlphor.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5724, 'focbbfxmzgwguwrag', 'd', 296857883, 'w.james@keith.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7337, 'srxchrffgtahtvomdp', 'byibjze', 600389841, 'aida.murray@officedepot.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7037, 'rihafqmjj', 'az', 648440588, 'domingo.bridges@ivci.lk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6211, 'ygz', 'ewj', 382453636, 'crystal.frampton@capitalbank.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8124, 'zhlyrxvhwwlpyttuo', 'kqbxvmm', 176113020, 'tony.rooker@gillette.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9955, 'bahr', 'wgyx', 499800896, 'kimberly.lovitz@ufs.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4083, 'hmxbugaybihi', 'ejoqad', 689289594, 'rachid.atkins@electricalsolutions.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2622, 'humsbd', 'fv', 928341598, 'adina.freeman@gillani.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7921, 'pefjabgwneape', 'z', 818401502, 'nelly.c@componentgraphics.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9211, 'qdhet', 'wjeyv', 138349770, 'sydney@woronocobancorp.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (465, 'arwweigovnxnc', 'd', 362669064, 'belindak@educationaldevelopment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3004, 'cnjfywffuuzgy', 'sj', 446157444, 'martha@lifelinesystems.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9631, 'iqwtkygqxdayadlexvz', 'vwy', 251851318, 'meredith@contract.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7198, 'ylmnhfjzdqoveddxh', 'fhd', 573077153, 'hthurman@doraldentalusa.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8827, 'pdtcerfjwvswyf', 'u', 852972510, 'warren.wen@newmedia.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3923, 'oowuhlgdcqtdpwofco', 'i', 874825700, 'alice.morton@ach.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2726, 'xjfmzxiymyp', 'w', 231029826, 'dustin@yes.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2637, 'gwx', 'wte', 737288738, 'lwhitwam@aquickdelivery.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2213, 'isfvxrlcauckt', 'gjc', 651169645, 'gino.f@maverick.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3783, 'ww', 'dzgtq', 692872777, 'leem@sandyspringbancorp.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3058, 'azwn', 'fdoeka', 271330450, 'hazel.jovovich@taycorfinancial.com');
commit;
prompt 300 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3742, 'tjfnnwiootdbimhsv', 'pswverc', 20373801, 'omar@ghrsystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9228, 'awwkealmhflnbw', 'htjlda', 922585460, 'holland.browne@monarchcasino.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (682, 'vasbqxya', 'ruy', 230723847, 'tsatriani@carboceramics.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6302, 'qmr', 'snmxoi', 136637299, 'wade.kimball@cws.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8319, 'zfjscukca', 'otde', 874552932, 'tommy@priorityexpress.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3981, 'm', 'mw', 57292075, 'irene.idol@stonetechprofessional.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7345, 'ienqotvo', 'trdz', 147684033, 'lydia.lindley@speakeasy.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9953, 'ghtggjpdfqkgrcg', 'zt', 634899717, 'janice.l@ibm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5815, 'bvweprfkdcaqlarjyp', 'ik', 577650028, 'zooey.coughlan@summitenergy.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2921, 'ibomegtoiggngz', 'qrayl', 5585530, 'gilberth@generalmotors.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8930, 'ok', 'zl', 720190493, 's.kahn@nestle.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3926, 'iaiwwg', 'lzbqddc', 702951622, 'tilda.p@dearbornbancorp.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6546, 'mwbwz', 'yxky', 174244591, 'miriam.armstrong@kitba.il');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8160, 'timlielrwar', 'yrw', 235269194, 'cevin.supernaw@newtoninteractive.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5313, 'dyitkwqxdrz', 'pku', 725137648, 'elle.derringer@smg.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8877, 'jioau', 'eyqn', 513476144, 'wayman.streep@noodles.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3210, 'woreqrifoz', 'buk', 290357273, 'jack.fender@pioneermortgage.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8067, 'ztri', 'inlet', 576970071, 'jonnylee@mre.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7065, 'kimqssuqxj', 'kkdto', 382900003, 'gsoda@sweetproductions.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2167, 'kkvnkhz', 'wtpq', 243018922, 'ashley.hawn@bestbuy.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1517, 'mgqoirxzaw', 'aqtg', 390255118, 'elijah.paige@amerisourcefunding.ar');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4482, 'fhzbcxsodwhmbtioyn', 'yjgttj', 573127648, 'janeane.uggams@keith.pt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (187, 'ntvpzgslfn', 'lbufki', 559464515, 'jlorenz@ositissoftware.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5335, 'xirhuwvbf', 'umbmzjk', 329088949, 'shannyn.raybon@fds.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4311, 'wiohipbnku', 'zq', 224465821, 'miriam.wong@providenceservice.lt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2140, 'svuen', 'os', 947712296, 'denis.cole@invisioncom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9459, 'vatgsa', 'jdyzlff', 404860225, 'louise@advancedneuromodulation.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2832, 'xdbyzaqkwwkalbafn', 'a', 819890841, 'penelope.l@3tsystems.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4436, 'vrizzsrs', 'ipcta', 871230714, 'spencer@3tsystems.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4022, 'tsbapvqiadlxu', 'he', 876184469, 'rhona.dunn@drinkmorewater.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6073, 'mhwf', 'r', 224324764, 'casey@vertexsolutions.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4270, 'hosjkgnoyouexzjmgy', 'qqqozn', 269105981, 'treat.giraldo@ungertechnologies.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (91, 'ngaxqett', 'dyqqh', 250060902, 'mika.thompson@gdi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9008, 'nee', 'ji', 423644337, 'oro.p@carboceramics.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3647, 'hxeaxv', 'qz', 109302004, 'lizzy.bryson@esoftsolutions.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2240, 'jkijrywlva', 'ynly', 194684506, 'taryn.rippy@telecheminternational.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2058, 'tcbsheh', 'lt', 203579249, 'v.wheel@doctorsassociates.nz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6914, 'zxbmkdnwjn', 'gztt', 15132093, 'lynn.c@dsp.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8320, 'hjoevdugm', 'qlpla', 510214740, 'harvey.coward@wyeth.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3064, 'ojyzqgelkdzyffwrn', 'tcb', 326058760, 'cgoldblum@career.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (167, 'wgapgw', 'sbwqo', 557497022, 'koakenfold@scooterstore.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1149, 'exfpgdnlikmsos', 'uvkfceo', 314052245, 'azucar.d@albertsons.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7875, 'ipvycypjhfptusa', 'ipv', 492377457, 'carrie.b@ceb.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5196, 'yvzgnysqhlmubkaty', 'exdb', 86773128, 'oded.chambers@ogi.hk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9342, 'sdlhqzqseggpbddtsty', 'c', 105053439, 'daryl.baranski@nhhc.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5726, 'ktekvsomujmyokchvh', 'keq', 927418979, 'kirsten.quinones@johnkeeler.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1156, 'ysfg', 'h', 586917143, 'trini.richards@priorityleasing.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4381, 'jkmxypr', 'qdqum', 169556819, 'dionne.s@advertisingventures.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2715, 'wbhaucbwanbty', 'blmvwkf', 672410351, 'diamond.rodgers@northhighland.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6703, 'ttumogobzswnwbamui', 'vhnnax', 544564401, 'cathyd@worldcom.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6416, 'sebv', 'kvfyi', 695436632, 'angela.singh@lydiantrust.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3854, 'ciuyjlxtekobymjzh', 'c', 182751777, 'wesley.k@spinnakerexploration.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6798, 'lbyhslbwzzx', 'bwd', 810248684, 'rod.reeve@refinery.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4993, 'kyem', 'flwq', 970199777, 'nina.harris@diversitech.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (183, 'qx', 'gzm', 63414892, 'quentin@savela.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1472, 'ypeldhdudvdfpwducgp', 'mjvjocz', 581982471, 'tildac@americanhealthways.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1738, 'vu', 'kas', 687255847, 'rik.garner@idlabel.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3389, 'zapshhkypobwimzaip', 'zxntht', 778374850, 'schanning@pearllawgroup.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8761, 'ejcejpqwkvdhdgyage', 'tqn', 913582605, 'sharonb@lemproducts.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (631, 'duciyvjnsxgoihynak', 'yneic', 36513585, 'michael.redgrave@ibm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9496, 'iczebdwkxiyrndcdm', 'jojcyvq', 720591144, 'russell.hiatt@infinity.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8343, 'qpinxnkvxuaoopqhjui', 'uzh', 304213582, 'd.rhysdavies@ceb.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5429, 'lrzcnunjnzjr', 'x', 416818385, 'samuel.suvari@nlx.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1773, 'iytogtvo', 'nslgh', 640511305, 's.sarsgaard@mag.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1458, 'nexrfffaxr', 'qhpx', 715759096, 'jesus.clayton@interfacesoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8057, 'nvfbgy', 'jed', 17918632, 'e.cara@nike.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5942, 'ycctawghqkungkeeo', 'p', 794863406, 'ceili.dern@vesta.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7923, 'lcpysjvrtigmrqphb', 'zkvqqwy', 336601450, 'geraldine.pepper@astafunding.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2017, 'oiwnnvxz', 'vtwehuy', 615304982, 'patrick.theron@epiqsystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9434, 'sd', 'wcr', 530671760, 'rebeka.russo@unit.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9538, 'uddtjcyvkkanrbbi', 'hl', 862873257, 'viggo.c@royalgold.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7841, 'xretskupudzxtxeub', 'efrbz', 843916612, 'wally@mls.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9484, 'idkmxyyda', 'ada', 771415356, 'tom.ness@bestever.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5053, 'jiipazsuereksquqjm', 'onugd', 313661010, 'lindsey.vince@johnson.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3999, 'g', 'hnycn', 364399792, 'marybethr@efcbancorp.cl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4481, 'rcodyfsjovnfgrloel', 'cr', 325610728, 'pchoice@astafunding.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8, 're', 'by', 605122270, 'hector.playboys@firstsouthbancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4830, 'dtkrlishmwi', 'qtuc', 215844094, 'cbyrd@sms.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2552, 'rspydlvgrccexftb', 'gtrddqz', 661190264, 'stevie@hondamotor.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8166, 'vrjokaiquvez', 'mnyuobi', 296389961, 'cornell.union@mag.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4786, 'drsjilllitzey', 'qbju', 694639901, 'quentin@fab.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1907, 'milvsshyonnawadpzght', 'zfrv', 352276708, 'gchaplin@sysconmedia.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9063, 'ldnlrq', 'kojdiy', 341643251, 'earlj@innovateecommerce.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1012, 'hymze', 's', 726702585, 'daryl.frost@spenser.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7919, 'fhitox', 'q', 599096114, 'bruce.fiennes@solipsys.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4467, 'fadrdgrugrlwsmynxsdv', 'u', 79353230, 'claude.o@avs.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4353, 'ydwfatwztkrbnttu', 'kixmye', 381031902, 'bret.thewlis@dell.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1724, 'ezeifutaajseka', 'yp', 117565528, 'dom.lillard@jewettcameron.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6042, 'ebvgxxxqk', 'inpcmp', 189316228, 'marianne.jessee@codykramerimports.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3649, 'nag', 'wijxhbo', 641856964, 'angela@ecopy.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2673, 'lblvywkpojxxdnily', 'd', 859410778, 'pablo.apple@pharmacia.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8748, 'cpkksr', 'wfbxhx', 662880099, 'salma.lamond@cendant.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4102, 'xpluswgkrsb', 'zbft', 508260855, 'austin@appriss.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7447, 'iv', 'z', 743888837, 'eddie@ceb.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2129, 'dqi', 'uzz', 684641021, 'sissy.hagar@glmt.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7849, 'jjhmdlwwmbmrfh', 'adrg', 730614045, 'sgreen@shufflemaster.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9673, 'qyhkvmahybsholzdmza', 'yhuscg', 330524764, 'joe.marley@speakeasy.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8359, 'umojzkownjabvacabjvd', 'yj', 913611308, 'liam.kotto@studiobproductions.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9560, 'wqwenrharcenzpbnubb', 'xyywml', 980212649, 'oded.heche@marriottinternational.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4751, 'kkadsnzfolqmjdf', 'wjj', 563733518, 'donna.sevigny@cynergydata.com');
commit;
prompt 400 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1483, 'yu', 'wld', 504353171, 'vincent.pepper@ceb.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1219, 'jmthzochimh', 'qkme', 859089307, 'jared.k@ksj.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2657, 'dhf', 'wbzlj', 196020659, 'rades@parker.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2198, 'zwop', 'fsa', 592274086, 'horace.p@hersheyfoods.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3218, 'knzqakhzmnhlvzxpt', 'kqhu', 653548302, 'carlenec@bis.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8732, 'devseihpwyb', 'vmzk', 181662199, 'sissy.adkins@cascadebancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5092, 'njpaxump', 'ctpn', 765505235, 'gspader@fiberlink.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (99, 'q', 'riyvgo', 559249212, 'hazel.ferrell@trc.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6019, 'a', 'gqvo', 728888183, 'winonak@healthscribe.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3505, 'qrzketrrxrao', 'xrl', 758722069, 'katrin.sedaka@lynksystems.ve');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1952, 'najza', 'iytkc', 686884717, 'levar@generalelectric.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8323, 'xh', 'b', 207475255, 'tzetajones@globalwireless.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9652, 'kkupnwxdfmaoikp', 'jh', 569128082, 'andrea@paintedword.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2345, 'bxknru', 'spkdouu', 720346183, 'roscoe.serbedzija@denaliventures.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7943, 'xinuoohdzsxqrtwhyxb', 'n', 151811571, 'bobby@air.mo');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1671, 'tdimrjqzd', 'uvawls', 929553989, 'cledust@its.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3803, 'mlcnbsckakbmyr', 'ynugksq', 945927610, 'n.gugino@bat.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9550, 'ayesudndanistayzdt', 'ihdvpc', 491525855, 'v.benoit@bayer.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3266, 'tcptcvbt', 'dbczf', 319758625, 'steven@mindiq.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1274, 'ktqtnm', 'n', 542375409, 'c.twilley@capitolbancorp.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9350, 'iapbktugpxpr', 'bstgw', 711646048, 'lesley.dreyfuss@ois.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5475, 'vqjatcd', 'ebfst', 494401643, 'viggo.ticotin@ads.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7643, 'qkmifkvwx', 'blwwfmt', 332682929, 'tori@genextechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6415, 'hhtoyrj', 'jpvwyg', 363746979, 'nathanr@carboceramics.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7348, 'elcvlpmiphgsrc', 'gul', 869447910, 'elviss@knightsbridge.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9236, 'u', 'zqqgrz', 331542803, 'jeanclaudef@smartdrawcom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (271, 'cxqxwhwrboruarweaeni', 'dtlkf', 750275674, 'albertina.w@ccfholding.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2617, 'nvfxmjxlthaousw', 'rz', 96123526, 'gsnipes@ccb.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2542, 'mjftipavqliokmlcgy', 'vqsq', 919564340, 'rosario.dayne@execuscribe.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1746, 'aclbyqrmxisbt', 'kty', 37727412, 'collective.tomei@pepsico.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9994, 'fyqsidz', 'c', 69273516, 'ssanchez@nestle.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (718, 'zxvruoxezlfl', 'ddmmyk', 288670859, 'ivan.brock@timberlanewoodcrafters.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9393, 'f', 'gcjiow', 648526982, 'rik.weber@spotfireholdings.is');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2499, 'ssuuwhcaluxli', 'ufkx', 998726191, 'judge.bright@gltg.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (999, 'ixrkmaiuhitgewycmenf', 'leowfo', 520586399, 'hookah.richards@ach.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8093, 'yvpjdvztxuhu', 'zesmuyz', 520963829, 'k.broza@albertsons.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4015, 'btcw', 'hv', 538580541, 'marianne@wellsfinancial.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8494, 'b', 'dwgyi', 406630894, 't.domino@topicsentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6229, 'yvkgywsvu', 'nhqqh', 946115258, 't.bancroft@pragmatechsoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6386, 'gknamsdxd', 'thht', 24009125, 'kristin.carradine@owm.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2959, 'uey', 'fn', 212760660, 'nancy.kinney@progressivedesigns.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4871, 'eohqfovbyrb', 'xqzukr', 941459669, 'samantha@learningvoyage.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7972, 'vrramyl', 'bejj', 926045460, 'grace.sossamon@gillani.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5264, 'tirpmpbnudzc', 'r', 699006220, 'amoriarty@kmart.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7282, 'e', 'iyzqxx', 550336716, 'xander.bloch@dynacqinternational.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6994, 'xyjcbzcjvposb', 'khyem', 604815958, 'desmond.gallagher@generalmotors.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1867, 'miexntgy', 'scaql', 73338925, 'tom@montpelierplastics.mx');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8750, 'k', 'o', 326160580, 'stevie.allan@fab.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7758, 'gfehlibypvjnoosi', 'nw', 573308638, 'dorry@sensortechnologies.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (143, 'hdibbklvjowgkicp', 'p', 435270472, 'cornellp@investmentscorecard.ar');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5142, 'gdzqlcjxpa', 'bfwr', 784417379, 'gabriel.buffalo@ivci.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9527, 'byvsk', 'yh', 936179505, 'n.sisto@primussoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1186, 'myrinanuenz', 'fgrntav', 145498387, 'toni@labradanutrition.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1357, 'km', 'pbawhi', 465351036, 'jon.addy@medsource.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9261, 'yobqwxyfjkecil', 'tegfacc', 125374956, 'wesley.matheson@conquest.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6452, 'slgwogxrauztakgavkxl', 'tbjzfuj', 745425848, 'laurie.s@fnb.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5769, 'ffynsbcggysd', 'yweiuq', 282473781, 'natalie@stm.gr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6718, 'fqvboxtnrmrxpvvhl', 'iqhyh', 375452714, 'goran.gosdin@lms.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7478, 'njmiceosjamiwlkvb', 'fq', 282587791, 'ned@marketbased.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3494, 'psifamrxdbrbmbzkdsi', 'jqnc', 703508985, 'claire.wells@mms.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1108, 'pznenhwrkkbajvb', 'xdbffv', 770382506, 'debby.marsden@pragmatechsoftware.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3381, 'dslkiwc', 'fckmmf', 687763560, 'brendan.arquette@newhorizons.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4425, 'owcionmtrtpdp', 'vpoxkhj', 411109458, 'liam.c@verizon.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2521, 'gxayvthvcba', 'nujv', 822097485, 'randall.bale@philipmorris.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2556, 'ptfhdbamauawe', 'gwgtm', 312709472, 'neil.okeefe@dillards.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8774, 'jurgjvxlehk', 'b', 306189147, 'freddy.l@alogent.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1480, 'za', 'joacidv', 845813973, 'pelvics@yashtechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9867, 'xyilvsodsjev', 'use', 775847915, 'lonnie.m@computersource.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3928, 'ssirpoyanjpz', 't', 864862071, 'g.whitford@otbd.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4643, 'svxzlnykd', 'p', 30778488, 'loug@terrafirma.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1031, 'evsbnm', 'xqr', 833417826, 'nicky.buffalo@at.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4650, 'jeeulzcmci', 'iwwjv', 686209411, 'rickie.parsons@cns.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1813, 'rijhqyxtbtqa', 'ozrxrv', 287193698, 'cburns@sms.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9025, 'rdzlefjztlanzp', 'rkemx', 945849554, 'ryan.difranco@investorstitle.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4428, 'ujomjh', 'auj', 958787793, 'neve.g@banfeproducts.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (641, 'kwknmiysgfxwdvyj', 'g', 542387761, 'anthony.kennedy@meridiangold.sg');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8548, 'xvs', 'u', 500665847, 'atate@cimalabs.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (854, 'fdsdwnvpudiscyqgmt', 'wsf', 575668755, 'taras@pulaskifinancial.pt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3809, 'vbcjpkkplrcpjn', 'slcbp', 489237791, 'e.barkin@horizon.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1129, 'skgjejenrtcp', 'fhrl', 272817170, 'goranp@cyberthink.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4914, 'zjggelmudw', 'bymi', 309338532, 'clay.kirkwood@ibfh.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9899, 'zgwddqsjhzlknnv', 'rcwg', 831313695, 'val.beckinsale@horizonorganic.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2770, 'wt', 'w', 423040649, 'pelvice@primussoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4265, 'jdgrcwilsjkdy', 'wnoztg', 411818617, 'sal@tracertechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7978, 'olanf', 'xwhrqzq', 464515439, 'patti.hobson@ibm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9749, 'jmtzxppvpsuywqdvw', 'jgnjb', 24035313, 'albertina.arkenstone@vivendiuniversal.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2138, 'jysmcysprirknq', 'zgklzz', 629403848, 'terence.cale@spinnakerexploration.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4861, 'vyoizmanwwiit', 'zukehwo', 262889831, 'g.coltrane@vivendiuniversal.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5787, 'pocarwxgm', 'zbqrib', 372978395, 'jason.pleasure@blueoceansoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4904, 'elfw', 'trkiw', 464411615, 'domingo.lawrence@ogiointernational.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9155, 'lrfmw', 'kjuqz', 785903337, 'wnapolitano@bioreliance.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7166, 'r', 'lylhln', 237514351, 'hazel.salonga@jewettcameron.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7247, 'pddytzh', 'gzca', 105806569, 'george@signature.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5412, 'gtwycko', 'znqhfdw', 848935953, 'steven.kinnear@seafoxboat.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (288, 'mohq', 'xm', 466542424, 'neil.allan@virbac.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6934, 'pdv', 'ttzaqh', 731923343, 'g.brosnan@anworthmortgage.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4893, 'jhqxmkcylfynublakaoa', 'j', 850627067, 'isabellac@voicelog.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6212, 'qfiynl', 'z', 174017001, 'tanya@sis.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3839, 'ywfsl', 'lhmxfn', 384818653, 'albertf@activeservices.cy');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7246, 'ynwchgmfh', 'dpbk', 60039651, 'stephen.chung@talx.jp');
commit;
prompt 500 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (727, 'stgxhwd', 'c', 372768681, 'n.caldwell@pulaskifinancial.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6031, 'ordp', 'cnnt', 10670724, 'nickelt@usenergyservices.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (322, 'llczqhqdrvu', 'wg', 890062835, 'max@signature.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8096, 'fsqllgkwxpdddbffts', 'go', 681741119, 'latin.leto@swi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9246, 'pugatepewato', 'onqrrht', 781189422, 'andrew.caviezel@trinityhomecare.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7483, 'jferepbplaz', 'jkq', 988887021, 'judd.mantegna@vfs.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7195, 'imjmdpehfluswjkjq', 'o', 444317910, 'thomas.davis@alternativetechnology.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7675, 'rnqnu', 'zsill', 648576751, 'bret.mccabe@kiamotors.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8257, 'yyubocms', 'gxfnlo', 796512175, 'red@telwares.cl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8372, 'xmzdlwbllg', 'unjoci', 166621692, 'olympia@gbas.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5972, 'ivgpqgeblzmjup', 'hwg', 927161587, 'geggyw@infinity.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1023, 'vteau', 'curu', 968251395, 'rachaelg@nha.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9476, 'exymjspnq', 'sbile', 16338903, 'emerson.kudrow@genghisgrill.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (11, 'lpxxpgoaizccap', 'vgta', 220221044, 'richard.sepulveda@hps.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1881, 'jvnbcqncpkiia', 'eljmq', 417768434, 'lorraine@shot.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4512, 'vbieoyxunuuhjlcwrs', 'kwfg', 497503479, 'allan@fmb.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6993, 'wtyutvte', 'byann', 641120598, 'fats.q@epiqsystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2927, 'gwfa', 'bvdutud', 733312562, 'carlene@commworks.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4611, 'ocmalrrymsnczhoc', 'rpdo', 25732853, 'freddy.thewlis@fordmotor.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6497, 'pagvxeic', 'zhspnqu', 169904716, 'ian.ramis@msdw.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8000, 'bftkzojjzpb', 'er', 598953589, 'kelli.boothe@bristolmyers.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3870, 'dkiieizmqfigodwndt', 'gy', 621081068, 'illeana.blossoms@vitacostcom.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7702, 'tefpxmvkllycsgkik', 'rvpob', 427443633, 'rhona@universalsolutions.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3968, 'yxs', 'm', 15471829, 'nickel.s@spenser.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4546, 'nrkplo', 'bf', 935039821, 'jimmyd@wellsfinancial.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5127, 'lu', 'givxh', 693226063, 'sydney.olyphant@ungertechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8053, 'zpxxukbevarwb', 'xpow', 518587830, 'francel@angieslist.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6506, 'wpla', 'euukhcg', 147071081, 'boz.evans@pioneermortgage.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8641, 'jyswhouql', 'tzz', 230930157, 'gabriel.rollins@sds.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1484, 'zepdvexsgandsvr', 'oppyzrn', 807892499, 'bonnie.cohn@esteelauder.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2486, 'aufvqstrfxwevii', 'fxhtec', 425990248, 'jonnylee.gordon@flavorx.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3275, 'l', 'by', 605913080, 'linda@enterprise.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5233, 'sgxyodstsaakz', 'szyohvg', 484338238, 'anna.l@abatix.cz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (609, 'lamxajfjyyeuw', 'jhkkll', 1054552, 'gladys.delta@hps.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8738, 'hydcaunnqdvlyqngiufz', 'wvkob', 984498910, 'brendan.cara@dataprise.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7129, 'obowzklnzhb', 'r', 259038791, 'juliette.singh@ataservices.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2343, 'ujzfhijbwrwvxn', 'y', 574691150, 'rhona.a@at.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6306, 'vjtbpskeefrhs', 'fb', 733985646, 'ian@innovativelighting.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3873, 'ifguxx', 'po', 451901989, 'geraldine.guzman@kwraf.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3478, 'bjxlinonxdi', 'kccu', 370419446, 'omar.steenburgen@tracertechnologies.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4358, 'qouxs', 'k', 486366209, 'molly.glover@credopetroleum.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7363, 'djmpldmxdzvtiza', 'tpbr', 887491820, 'dwight.chan@safeway.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5913, 'wzf', 'h', 145048321, 'tobey@cmi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6736, 'kyhcyfrkiibhkqqetye', 'kkyqlfx', 650633064, 's.johnson@newviewgifts.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9946, 'xmcmgjyg', 'gp', 920836712, 'gilberto.c@safehomesecurity.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8157, 'ndqufkawjxgdehtmps', 'prrq', 28097342, 'c.domino@mss.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3991, 'tzuopfuuupjte', 'eelycom', 128347374, 'vickie.masur@vspan.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8967, 'iokisipmmts', 'oppglr', 903816244, 'jena.emmerich@marriottinternational.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8470, 'dktznrtxbd', 'yjjnb', 395254248, 'cschiff@integratelecom.th');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5962, 'vqlufjagysobgxbrl', 'fp', 935324398, 'teri.i@travizon.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3775, 'rdfnakyxkecpq', 'bsuhg', 810774118, 'maury.marx@shirtfactory.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9206, 'vgiuopikgwwglset', 'ely', 65542685, 'willem.harrison@horizonorganic.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9637, 'cipywroeaunoxjx', 'ihgqksw', 814767345, 'shannyn.badalucco@mwp.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4422, 'beo', 'xxdoa', 995984089, 'jake.madsen@sunstream.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5515, 'qyuxbcn', 'weqs', 294851836, 'n.carter@gtp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9067, 'yh', 'cygvxt', 983696636, 'n.tomei@lindin.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6124, 'tb', 'trzp', 701267844, 'nathan.g@envisiontelephony.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9271, 'jas', 'psci', 50152750, 'vivica.e@owm.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4534, 'fm', 'rlvgn', 201651854, 'radney.crow@hatworld.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4996, 'yfjdzdbzrmx', 'yflt', 572419967, 'joaquim.w@nat.mx');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9388, 'imbdm', 'ugfqgpl', 772997067, 'lili.bogguss@americanmegacom.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8710, 'xtlsemficsnwln', 'ls', 884453753, 'petew@royalgold.cn');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4335, 'wtsnobtcpb', 'sycew', 94112137, 'denzel.barry@cimalabs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6677, 'ptb', 'bmtemq', 980575207, 'gina.landau@sunstream.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4723, 'ubolukyzosrnp', 't', 828081068, 'ron.macy@arkidata.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2388, 'sohcbjlorhuopebfsj', 'dbilbh', 597796946, 'rascal.quaid@bestbuy.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1889, 'iemfzlixadkyvqd', 'zrlwwu', 575031223, 'dpayne@gra.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7789, 'ltuimaijelt', 'bqash', 616883895, 's.dorff@horizon.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1053, 'vwgyiwthizu', 'cgmtb', 360559058, 'russell@apexsystems.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9059, 'ikbtnmoyxjcxczywbh', 'k', 18784644, 'k.hauser@newmedia.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8768, 'mfdr', 'gbd', 579216979, 'carlene.plummer@formatech.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1787, 'nvcsg', 'snw', 366568526, 'bruce.vincent@innovateecommerce.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8944, 'ghonxhgq', 'e', 372806908, 't.chambers@gapinc.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2099, 'yxsxssdgyh', 'c', 771897533, 'rebeka.rollins@sourcegear.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (41, 'fjiotpb', 'cuk', 34415339, 'campbell.loeb@ultimus.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (801, 'saoyqcchuxjdqigrhkc', 'woauxi', 125088860, 'breckin.winwood@elmco.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5917, 'pdlmsiyejmqd', 'kc', 165552145, 'fpeet@ipsadvisory.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4184, 'lbxbxcposl', 'ly', 476759529, 'franz.tyson@conquestsystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (381, 'glunuanaxetjmfju', 'g', 875931133, 'charlie.cheadle@prosum.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8500, 'ebvxgwmuwjtjeeqqztcm', 't', 992271769, 'u.suvari@sensortechnologies.cy');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8280, 'ak', 'j', 189220509, 'v.warden@floorgraphics.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1476, 'nmaxgglgzjsdb', 'utdibif', 194489948, 'viggo.conroy@hitechpharmacal.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7601, 'pscojxqrnqrjyloawf', 'd', 135639338, 'leonardo.s@shar.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6223, 'flenursrudefllvwuvfi', 'tasvf', 858937728, 'roscoey@fab.pt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8576, 'rjgrsy', 'mlkw', 464015404, 'm.cleese@inspirationsoftware.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5282, 'ttvdnldbnfix', 'mhtraj', 773181283, 'derek.levin@shirtfactory.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5441, 'ixooag', 'm', 60966703, 'lynn.waits@floorgraphics.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5353, 'haseehzgaoyhkzri', 'yyfxj', 363751717, 'marleyb@horizonorganic.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9147, 'opvrnuxogkfnru', 'frzqe', 213414466, 'nluongo@newtoninteractive.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (94, 'pjuizomdd', 'ix', 682521907, 'emma@generalmills.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3951, 'nxdgpznixrjclkkpimd', 'jscn', 605582077, 'mae.whitley@codykramerimports.ee');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2188, 'nawydbxvlfckzhhrayjm', 'weoynry', 980946683, 'ned@royalgold.be');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6096, 'uxgjeqkrow', 'qcy', 268430086, 'ani.sheen@tigris.ar');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (922, 'lbabjprllbvdkrlt', 'poutc', 835300401, 'cornell.biehn@topicsentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (604, 'kdjm', 'jompks', 385156278, 'mac.gracie@ungertechnologies.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2911, 'ystslc', 'dwla', 198166546, 'rforster@bmm.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2999, 'jlwaklcvej', 'n', 92671152, 'mac.shaw@hondamotor.li');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5189, 'qgqpwxq', 'caf', 806243026, 'rascal.lang@lemproducts.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8769, 'inxofgcfxqxkmcv', 'buyga', 626084235, 'dorry.freeman@glacierbancorp.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5375, 'bzmlckdoa', 'xisvl', 97594430, 'h.coverdale@pinnaclestaffing.ca');
commit;
prompt 600 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7722, 'wzfnruhguolaepkouin', 'syly', 602261153, 'hookah.burns@inspirationsoftware.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3396, 'ozjsdtjropsdk', 'xndolp', 655971001, 'collective.zappacosta@nobrainerblindscom.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4570, 'kdofswjviwiwevlp', 'wsucsuq', 104201861, 'barbarah@topicsentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7804, 'ooc', 'cglrfy', 623038962, 'murraym@taycorfinancial.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6301, 'j', 'e', 450026212, 'spencer.r@manhattanassociates.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2872, 'hgmmoiujgwvbt', 'rozq', 285971678, 'campbell@gha.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9508, 'ku', 'tqiagj', 540473276, 'lesley@abs.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2649, 'sldwfy', 'xlarto', 580102804, 'buffy.carlton@trm.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (252, 'hdvnp', 'fewrhgr', 292164698, 'christine.dillon@mss.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5205, 'cmdhwarso', 'fpttbx', 272901101, 'janeane.ruffalo@servicelink.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5836, 'sljrybkaarondltt', 'bzsx', 935103971, 'tal@visionarysystems.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2302, 'bttncqv', 'pgs', 827086198, 'anthony.bailey@scheringplough.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (665, 'zmzoluxsqzhk', 'ni', 293286176, 'yaphet.lennox@trusecure.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1056, 'cqpncgzdgkxgmfgkyjf', 'sawjui', 926426256, 'wayman.mcdowall@trainersoft.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3362, 'bpuvogh', 'sx', 397167723, 'jude.lizzy@base.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9062, 'fxiovz', 'vkwr', 68986425, 'taye.bridges@bedfordbancshares.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4095, 'szwsawnigvr', 'sbcc', 661880174, 'bernard@boldtechsystems.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8325, 'lkfcbufqmse', 'q', 377573303, 'xander.alston@jlphor.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9486, 'sjaleylxmpyusp', 'gfasgr', 642500029, 'temuera.robinson@bestever.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8582, 'mdxa', 'ppw', 943419477, 'armin.kirkwood@worldcom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1039, 'qvwyefcrgmwhvpphs', 'ot', 31844946, 'kiefer.russo@processplus.ar');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (457, 'ogtwhmutyurxueta', 'xoccrc', 345675479, 'a.gosdin@sprint.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1735, 'jk', 'z', 127127040, 'aarkenstone@generalmills.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8906, 'bkjfbhfufk', 'twotykg', 24407953, 'xwoodard@americanmegacom.pt');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (384, 'zcimdkqtlbxqiy', 'r', 256230511, 'sander.horton@glacierbancorp.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5535, 'iyqewfbzrko', 'tzkj', 496144229, 'clive.mcintosh@cis.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4058, 'ddlmh', 'w', 789993877, 'garland.duncan@pfizer.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6528, 'mxworeypzgprfkxs', 'ntlg', 96331560, 'vincent.swinton@gateway.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4988, 'ms', 'ihggfdi', 652856686, 'greg.lopez@hotmail.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2664, 'xdjfrkefxopdt', 'bv', 295616915, 'k.rucker@dell.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5039, 'vbcgftrrs', 'klk', 43173546, 'saule@novartis.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8931, 'pczkjskxrbac', 'dpsdmlk', 159757191, 'kirkp@usphysicaltherapy.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3758, 'zqvispvvlw', 'kkdsrf', 591835636, 'tyc@solipsys.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5851, 'fnaduelxapisytbhpyby', 't', 566728111, 'kbridges@linksys.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2248, 'qbmswqzfixqqepjeba', 'up', 432162295, 'bobbi.rowlands@speakeasy.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9940, 'txdlw', 'hlom', 387609678, 'mgallagher@terrafirma.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7061, 'ooy', 'c', 564943959, 'chloeb@hatworld.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8859, 'ylrycbyi', 'hf', 997449969, 'g.skerritt@fsffinancial.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7897, 'vijhyzrrcqur', 'wofatj', 77550376, 'mwalsh@generalmills.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5908, 'edkezjnvoqzzwfl', 'jpyeogx', 320101550, 'olympia.lachey@mercantilebank.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7830, 'ebqaagzhbyyh', 'lqikxt', 426812174, 'desmond.pfeiffer@cws.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4864, 'xongukcrpdrhx', 'lxpdmoi', 550890708, 'tracy.milsap@ccb.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5479, 'pxbpuzofgi', 'ufm', 58996507, 'm.melvin@hondamotor.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5248, 'zwvxeu', 'yykhr', 57181371, 'tildaw@accuship.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8980, 'jdvmxfxolxcliskkzl', 'n', 193013086, 'louu@heartlab.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6099, 'xqgxaexiu', 'eiv', 808913699, 'josh.getty@mag.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4613, 'hniecbvqosqngrqz', 'leksbab', 329251712, 'gevans@hondamotor.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6421, 'muctsxhvvt', 'wc', 435879748, 'nick.t@shot.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6981, 'sgnrqpfy', 'bb', 447400546, 'karon.cantrell@telwares.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3506, 'rihcoglvlrmtv', 'fnjw', 424800356, 'ashley@refinery.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7053, 'uuveluvinjrembfsagk', 'id', 562824765, 'gordon.sayer@stm.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2810, 'hulohpdslz', 'esc', 348453144, 'petula.gleeson@eastmankodak.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6024, 'pjwaamfwfqlthfiq', 'mfib', 880443846, 'h.deschanel@hfn.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4040, 'ynwbfs', 'ilhif', 781058939, 'millas@wellsfinancial.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6486, 'jjlkdqqftwekk', 'kjwlbop', 241757787, 'l.reid@educationaldevelopment.gr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3884, 'rfnddqfcaqxohonbuxv', 'alxpic', 736318263, 'elijah@abs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6176, 'hqgwcbhaqoqtw', 'hsib', 970976971, 'gord.patton@unit.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6470, 'mlsvta', 'gnxselo', 952143701, 'curt.springfield@swi.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (222, 'vgwcftdgzgensosrpfi', 'cxaa', 963507324, 'cledus.kinney@ivorysystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2497, 'nzfqxfxvfzin', 'prwyzo', 128468096, 'bernie.stampley@otbd.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7099, 'mwmthismeodmmeoliea', 'hvd', 464999477, 'gordon.s@tilsonlandscape.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2056, 'it', 'xgxee', 933129920, 'doug.mccoy@trekequipment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8019, 'lcgexyylygnatqn', 'ke', 936320944, 'd.maxwell@noodles.cl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (993, 'mpf', 'fypuiye', 745252111, 'marie.dealmeida@scooterstore.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1831, 'yfgdbhzvrmixol', 'w', 725739578, 'tal.jane@cns.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4448, 'nyglmpbvsncatmfph', 'yxea', 775444218, 'geoffrey.olyphant@educationaldevelopment.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1960, 'zacftjdezaevctgftmc', 'thpomr', 527965462, 'quentin.borden@gentrasystems.tw');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4407, 'urtaagmfe', 'kkgswq', 336053655, 'cathy.a@enterprise.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5027, 'ytbkjjq', 'jvlr', 111495094, 'claude.levine@authoria.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4254, 'iqnmbm', 'iyty', 973555537, 'joy.morton@diageo.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1743, 'imbdamxwg', 'dixdxt', 936399152, 'rose.fraser@fmt.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5346, 'mdiyyru', 'vvypy', 949197186, 'george.bello@nobrainerblindscom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4660, 'q', 'wcozh', 383012512, 'natasha@ufs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1775, 'wcwiavjmsebwaj', 'ydnw', 496200180, 'shelby.a@caliber.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8528, 'zbgpmhys', 'guopr', 427585900, 'ed.witherspoon@securitycheck.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7586, 'rgz', 'xporaux', 964796460, 'halc@apexsystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6787, 'pftqxpy', 'cna', 969132245, 'mandy.s@mavericktechnologies.il');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5078, 'jikfarjuvy', 'ooe', 406858222, 'juliana.r@bluffcitysteel.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6827, 'eghlokrodceshrldvmw', 'sni', 482222863, 'solomon@nsd.cl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1369, 'phkzyxiqxia', 't', 683248882, 'mstiller@jewettcameron.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5410, 'esahntm', 'xanvzev', 852023753, 'nigel.francis@bis.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4056, 'mextqnlgplyvbshv', 'tvi', 739159022, 'miranda@sensortechnologies.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3653, 'hzutxjtoov', 'vxgwpa', 909358862, 'derrick.avalon@anworthmortgage.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8291, 'ghwvet', 'czzz', 988180162, 'dom.aiken@owm.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8937, 'xajtezqjy', 'mbjx', 416707122, 'gilbert.sartain@horizonorganic.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3382, 'xqbikgf', 'wonmbdt', 247983685, 'joaquim.bening@capitalautomotive.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5470, 'swmdjclvrqytevv', 'aqgg', 561244371, 'jaime.getty@gci.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8201, 'vpedsswxnhmbgcnw', 'jue', 261631662, 'george.stamp@dbprofessionals.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5349, 'dkwzjbwduy', 'vykt', 889644036, 'edward.branch@ssi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1947, 'bwmpygctzjgfulooab', 's', 383982047, 'terence.leguizamo@printingforlesscom.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6109, 'as', 'wmi', 217389431, 'rgore@toyotamotor.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5747, 'zbqdwlsjxufpoxpahtr', 'rhkb', 130440489, 'geena.stiers@noodles.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (931, 'iwinvcdqgumqbrr', 'rbxuw', 846976358, 'a.haggard@dcgroup.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4705, 'ngexlhxgllaktdebiws', 'eshkk', 336939192, 'terence@tps.hu');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (333, 'crxyfelopoeobqgu', 'tfw', 264694012, 'joseph.geldof@investorstitle.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2354, 'piemnujiembr', 'mq', 794652310, 'joelyn@ach.il');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7703, 'ymz', 'jfby', 231436252, 'tal.w@meritagetechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5108, 'pyklwa', 'cno', 3253098, 'billy.carlisle@wendysinternational.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3067, 'hooqwicurshfpdxwm', 'az', 709926147, 'orlando.wilkinson@dillards.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1856, 'rkhfkupo', 'eznwfp', 543957009, 'dorry.esposito@viacom.com');
commit;
prompt 700 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8505, 'biblfulacyf', 'qp', 662283134, 'ian.m@activeservices.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5544, 'omnhrtfdhhnev', 'n', 263696453, 'nigel@doctorsassociates.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2156, 'vwubcafgumcqtretzfr', 'g', 55222426, 'toshiro.o@woronocobancorp.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (625, 'fdrfsdckoa', 'qyyxg', 173661635, 'blair@uem.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5072, 'viuktxq', 'a', 916100529, 'rose.berkeley@conquestsystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4982, 'rggxofkvvibl', 'xolum', 369236569, 'grant.cooper@summitenergy.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5557, 'qrpl', 'kmc', 30915326, 'wally.shatner@tmaresources.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8686, 'yujpdixjcasggiufax', 'gj', 262527619, 'sarah.bullock@scriptsave.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6845, 'xjijnttganpalv', 'i', 245798392, 'lynette.royparnell@lifelinesystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3842, 'ldurjxpfuf', 'vili', 675236046, 'pamk@team.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9708, 'tqpjkpjhl', 'viofewf', 183847645, 'denny.shearer@cis.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7640, 'opxvhexiczmveq', 'wfmr', 476549107, 'vondie.roth@bradleypharmaceuticals.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8416, 'musuaoznlhtzfno', 'wgok', 871741719, 'v.porter@staffforce.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3339, 'pcs', 'blbco', 960669674, 'alec.mcclinton@kwraf.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9737, 'eokjqhyyixofaeujv', 'rnrap', 474715961, 'm.stiers@colgatepalmolive.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3700, 'mcnp', 'efay', 256967395, 'mika.c@atlanticnet.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5795, 'injsxnqmcxulmaaqcbza', 'ovfubc', 933459848, 'juliette.michael@banfeproducts.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2401, 'jjzykscsmy', 'hsdtw', 507761430, 'sophie@securitycheck.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9338, 'fosnsqxgkhjmjwst', 'nlmlt', 778473819, 'nikka.scott@drinkmorewater.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3093, 'jqobszgwrhhvkmlmgm', 'xtuari', 192020836, 'amanda.p@hencie.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3183, 'bskkqychzqttsddnend', 'ccvgoo', 218479713, 'mrichardson@dcgroup.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6719, 'dbjly', 'gfqbu', 946729638, 'goran@saralee.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3338, 'fqrco', 'ilhxqfb', 972008789, 'burtb@heritagemicrofilm.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (741, 'mq', 'ywljiwo', 741969081, 'kcoe@streetglow.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4822, 'fiadgbzjvdrwgiyvmkq', 'npxfx', 933767486, 'gloria.sylvian@north.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5397, 'ybztbw', 'qxhmkpq', 601280078, 'colleen.waits@totalentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5926, 'burkknnlmwjfymbchmpg', 'dueik', 743823857, 'gene.cube@bestbuy.tw');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (30, 'kwwlhkgmrwoydjj', 'juidx', 472491931, 'stellan.bachman@providentbancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3025, 'hkjivngvwkjaxvdnwt', 'eqkltnl', 134793740, 'nick@innovateecommerce.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2754, 'duc', 'vp', 586534028, 'gordie.s@questarcapital.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9644, 'oamxfpwdsf', 'k', 647774353, 'pablo.pryce@appriss.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9474, 'dsvdqdfcfrenhknglngh', 'bpumw', 655795639, 'daryl.devita@gillani.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9279, 'thikdh', 'nmydcz', 437868094, 'rdiaz@capital.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6807, 'yk', 'ek', 82351630, 'oferrell@pfizer.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9012, 'vjs', 'nrc', 682180532, 'vivica.rowlands@palmbeachtan.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8481, 'a', 'wxd', 513306306, 'wes.rollins@trainersoft.py');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3349, 'sqjwfdia', 'yroz', 25766173, 'ethan@nhhc.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3414, 'skoxxkwjlye', 'daudf', 483875458, 'allison.calle@knightsbridge.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1080, 'n', 'cqnaxr', 535440146, 'christina.fariq@dcgroup.mx');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1509, 'ofhjdxkpyjfyqqh', 'jywd', 770748531, 'eliza.e@diamondtechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3636, 'wscuwlalhnyehftitqk', 'rd', 402483298, 'merrilee@worldcom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8722, 'qyelfnmiqzxtteg', 'koxi', 436745378, 'c.pollak@avs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3165, 'refkeaeqinnbpwkn', 'jlzhl', 649936059, 'steven.weller@allegiantbancorp.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3853, 'snjydqonp', 'f', 697337135, 'roddyc@sms.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7085, 'hcoskmzjjdcatu', 'tw', 22524565, 'ruebenr@unicru.no');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9471, 'tnog', 'byjw', 728621424, 'lara.gleeson@solutionbuilders.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8672, 'jnfrwnxsmzpwxgwctbw', 'bu', 75107816, 'r.garr@aco.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5354, 'cfrvyorlnhtqsab', 'vo', 147296015, 'earl.mann@loreal.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6979, 'fdkftxnrj', 'zenfrmk', 847782064, 'paula.buckingham@viacell.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6354, 'cn', 'ejv', 792427022, 't.mccoy@novartis.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5686, 'e', 'pnjofyv', 902210531, 'albertina.haynes@heartlab.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7175, 'nkuqvc', 'dwoeqb', 292588144, 'tfiorentino@aoltimewarner.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6289, 'kwddqfboxflf', 'tnvnm', 56935690, 'alex.d@invisioncom.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8781, 'y', 'hwrw', 227340276, 'd.willard@totalentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2786, 'cq', 'wovsobf', 292483236, 'nicholas.ferrell@caliber.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7336, 'piaqzrjrydvzltmhd', 'oj', 609079561, 'tara.p@execuscribe.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9564, 'odgmjvwelqyq', 'vco', 164735098, 'jcale@tps.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6150, 'tqnfc', 'htspug', 643062323, 'jason.weir@trekequipment.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (255, 'axheb', 'joek', 859947671, 'marlon.farrow@sensortechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6390, 'yhtdtlndtnf', 'pfigxld', 387746818, 'jbandy@topicsentertainment.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6696, 'dbcjspzlo', 'c', 798682715, 'sharon.rhysdavies@learningvoyage.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2711, 'bptlppholu', 'z', 139448668, 'n.landau@hfg.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2182, 'tvhdjhfcg', 'i', 876267146, 'rick.singh@csi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3149, 'iispytisz', 'qri', 128698383, 'ewan.torino@softworld.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4190, 'pgkdtjryktwj', 'nnz', 555715696, 'anjelica.witherspoon@trekequipment.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5505, 'auk', 'fckke', 616395523, 'vincent@wendysinternational.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2953, 'pekjgcjlgjzmby', 't', 76284342, 'nina@voicelog.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7459, 'tqtz', 'hkuhbko', 520731950, 'phil.c@epamsystems.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7352, 'twglsqzszd', 'pgjwedl', 210357932, 'robby.davidson@sony.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (836, 'b', 'ik', 325878473, 'henry.pleasence@usphysicaltherapy.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8836, 'jwvgiaqdzhdsx', 'i', 549687850, 'colmp@cascadebancorp.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3042, 'onlzhxweb', 'x', 547592373, 'morris.stuart@seafoxboat.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1033, 'ezfwhadjsaywaqy', 'pl', 985431602, 'j.jackman@bestever.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6286, 'bthwmekwgcapcqbwm', 'gp', 396320122, 'qcocker@ptg.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7260, 'rqguwskbdwwio', 'xrggcb', 167585074, 'a.santarosa@tilia.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3372, 'hxgzscktdtmfj', 'sg', 373234648, 'horace@staffone.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4752, 'zadydqse', 'z', 881498024, 'nora.wayans@investmentscorecard.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5061, 'xjq', 'zas', 886007715, 'r.schwarzenegger@kingston.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2974, 'lk', 'hn', 340096287, 'sgellar@actechnologies.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4652, 'bkemzdwupuef', 'rkidqjn', 632501930, 'kurtwoodm@scriptsave.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3395, 'zvugix', 'ydrb', 595644127, 'heather.duke@spinnakerexploration.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6628, 'lzwtj', 'cryqhi', 441231405, 'mae.tomei@tilia.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3424, 'jkzgtgouadj', 'kq', 384805732, 'patricia.schwarzenegger@ptg.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2916, 'meejwjnkmidfbuklaqy', 'lqhtvfx', 739110307, 'jimmy@elitemedical.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6026, 'zdjdrz', 'bkrjls', 860732087, 'lonnie.mcdowall@ass.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8028, 'emsdmjsma', 'snoydo', 575436101, 'j.shatner@pib.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9084, 'eititnhd', 'ljtyi', 314383014, 'larnelle.todd@tracertechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1384, 'eocursjasuvpgcglfxss', 'hwm', 580345227, 'devonf@gagwear.es');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2435, 'b', 'gmjpisv', 853758331, 'w.dooley@connected.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (87, 'zccdppnlhgqhbtcqwd', 'hbmidn', 391168930, 'garth.balaban@newhorizons.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6884, 'h', 'me', 843938579, 'tamalal@greenmountain.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (489, 'fmszagaufoggblfpaj', 'jeaa', 639528752, 'fpenn@dvdt.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6662, 'xt', 'w', 718563226, 'pamela@prosperitybancshares.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9809, 'h', 'm', 414330933, 'gordd@virbac.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3643, 'whuaoecbonvyoxmoejh', 'hdfzcot', 938841017, 'rickp@kingland.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5579, 'y', 'tsynhqk', 243123325, 'first.dooley@portosan.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2645, 'hlplrqdh', 'uthboi', 423508261, 'csawa@marsinc.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9812, 'mkzaarfxqdqu', 'xsb', 925128589, 'jaredm@telecheminternational.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2528, 'jkxvniiezktwbpyfloau', 'wrupqln', 826427363, 'billy@wendysinternational.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9266, 'lgqivcjhbjwhusyqoe', 'shg', 387890017, 'matthew.vonsydow@carteretmortgage.com');
commit;
prompt 800 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5966, 'xx', 'sky', 357095735, 'njohansen@saksinc.ht');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6445, 'rmczmtrgwr', 'jdatm', 241387665, 'dbrandt@atg.py');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3449, 'yvdlujkbok', 'ilwsr', 906520569, 's.macdowell@mqsoftware.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9510, 'ovgkhp', 'fmrcoi', 466626838, 'norm.gates@gdi.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7763, 'csviwcptlqywplcs', 'e', 640632538, 'wstevenson@accesssystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9233, 'rzacakb', 'xxiy', 599457094, 'frankie.gano@cooktek.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7564, 'hezlhxnxvahtofn', 'yigprc', 628024319, 'alfief@cendant.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2356, 'sxdn', 'j', 895765210, 'ryans@onstaff.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1315, 'etezfvb', 'ldc', 118218960, 'embeth.eastwood@its.be');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5593, 'hdowciiuqsr', 'ejsql', 530773137, 'kristin.garner@bristolmyers.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7750, 'uunrbogon', 'ilap', 796099923, 'lindsey.applegate@dataprise.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3739, 'dtxwvbriwaxny', 'jnpwfj', 578503591, 'nanci.cantrell@aop.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1601, 'grkkem', 'jbx', 513364505, 'lara.krabbe@dancor.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6973, 'iktw', 'xyijecw', 675311707, 'quentink@sfb.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4754, 'kmashiok', 'mvl', 640039835, 'remy@sunstream.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (177, 'mmulwamzbeokdqhd', 'ep', 976042672, 'dustin.shocked@sprint.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (422, 'pejxwjttkvabptiaym', 'civ', 434790905, 'garry.i@faef.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (815, 'oibhrsyjonubjtslneq', 'hjm', 931192109, 'd.yorn@sunstream.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2768, 'v', 'zx', 119847055, 'patti.gershon@albertsons.fi');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8512, 'tnyqbemm', 'xuhe', 234848608, 'connief@allegiantbancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1972, 'qraqaxpjmqivxi', 'rkp', 124591277, 'elijah.posey@authoria.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9902, 'grlipjrvlvkrlz', 'zbu', 46730287, 'anne.a@callhenry.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (339, 'ngd', 'pjsrx', 530510490, 'nholmes@freedommedical.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4169, 'vkoxkalwprtdccs', 'tnbfv', 343814133, 'nicole.springfield@career.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2264, 'oipdlvfqswl', 'tddlei', 303268650, 'r.mortensen@tlsservicebureau.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8703, 'krizibuorzmiupljfvhh', 'mq', 466234967, 'pat.worrell@ungertechnologies.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9694, 'zhqigeaxhulboghdvril', 'avwph', 494669963, 'jon.hynde@avr.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6879, 'yiyhlebtsyunchqo', 'sppix', 606185383, 'milla.difranco@keymark.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1720, 'ikwrvuvbpxlgtwj', 'pdiu', 858452992, 'rhughes@aventis.cz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3929, 'ogotsjkcoznt', 'hsqzri', 975556275, 'jake.burke@accesssystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5903, 'q', 'tw', 789898493, 'devon.c@aventis.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1848, 'dtdmdkuqbdtbkivckxz', 'n', 646291993, 'pat.domino@servicelink.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8737, 'aevjgzcd', 'uzkhnre', 84991187, 'brad.m@officedepot.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3188, 'mjsiqyydekvxfhuuks', 'kecow', 118247807, 'ned.g@coadvantageresources.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8151, 'npzpicf', 'uloc', 478722649, 'renee.levine@accessus.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3313, 'thzmdoeefz', 'yulvgoa', 394748082, 'miriam@pepsico.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2676, 'szmbxcxcx', 'lpa', 201071640, 'salma.ferrell@alternativetechnology.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5430, 'zmxoozbqdpybu', 'zul', 71414710, 'lucinda@kellogg.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8726, 'fkd', 'lrfj', 650047427, 'udo.evans@universalsolutions.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8929, 'reqbsdfbsqjuxeefwjfy', 't', 304739880, 'salma.gayle@parker.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6432, 'wdepya', 'e', 11629146, 'laurie.arden@nestle.tw');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (482, 'pofmyfjw', 'ayiyqek', 551477044, 'morris.b@spectrum.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8256, 'hvkzgwbwe', 'tzm', 864909479, 'bhaynes@lynksystems.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6572, 'fsaiorhx', 'ni', 510284199, 'e.frampton@esteelauder.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (740, 'mtyzzfcenlveuwgyco', 'zwig', 354239889, 'kellyl@technica.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6418, 'kpocmwnuxacwfhxpdge', 'njzpzj', 102473125, 'mitchell.garcia@investorstitle.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8110, 'mlkpvdhtrgouh', 'nsvi', 285113076, 'ramsey.bonneville@accesssystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9205, 'khajrypr', 'jh', 604101550, 'derek.rourke@nrae.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1445, 'outssslgydj', 'jriiio', 490312443, 'rik.tyson@asa.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6409, 'zbsxhryrrazblc', 'ldsa', 202995264, 'r.koyana@cima.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5673, 'b', 'id', 244301515, 'fionnula.m@mission.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1090, 'mgborbxbtiuviusu', 'tga', 728440091, 'cheech.strong@carteretmortgage.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5356, 'yelz', 'wifbk', 874730906, 'buffy@solipsys.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7930, 'oqpwgrkhmgkwmxfcqdu', 'd', 960406792, 'devonb@toyotamotor.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3156, 'yzi', 'vz', 88223479, 'tzi.carlyle@gha.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2817, 'kfedjndxubful', 'rp', 99725554, 'melba.mckennitt@ccb.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3031, 'crqzzrtp', 'nfkziy', 647675223, 'jena.p@qls.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6727, 'hnsvucjhfanfol', 'a', 842415561, 'diamond.diesel@lifelinesystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8255, 'nbyosulodgxuaslyf', 'mguk', 526469935, 'kelli@gtp.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9037, 'qn', 'iligp', 725110764, 'rowan.rollins@gha.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3151, 'pnnzw', 'ksz', 664973607, 'manu.hunter@ositissoftware.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7633, 'qgekztplzj', 'dylgpp', 712924485, 'demi.horizon@mercantilebank.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4178, 'rdrthreabugsyv', 'yyucnd', 34811753, 'rachael.m@emt.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5494, 'ecvqzvrkk', 'gdtcrv', 550714349, 'rory.oneill@providentbancorp.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (128, 'hdvjcsrht', 'snfny', 926547755, 'rosanna.hawn@wyeth.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (64, 'cbjqc', 'yvjzc', 177601859, 'bobbi.pesci@invisioncom.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3558, 'xlj', 'uum', 749464655, 'maceo.david@pioneerdatasystems.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9096, 'uoknarda', 'cmzhhqe', 376231382, 'liv.kane@electricalsolutions.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5195, 'opnczszqtmnnfypkkssp', 'uousqp', 910912917, 'cyndi.pantoliano@solipsys.in');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5299, 'vlsgcuibemaog', 'nsnmn', 471475242, 'bnoseworthy@progressivemedical.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2563, 'omfvq', 'uji', 148091153, 'm.bandy@bowman.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4946, 'hbhyxhe', 'klgepz', 743686114, 'kfiorentino@allstar.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (392, 'i', 'ozf', 721819950, 'christina.rebhorn@linksys.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4112, 'ysiiaaofuib', 'we', 633674141, 'oliver@msdw.se');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2982, 'wmxmkfosctklkusce', 'zxp', 262556986, 'winona.g@computersource.no');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (194, 'brylehgnojkefrqyiloo', 'mpgc', 922816302, 'rosanne.shocked@denaliventures.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7866, 'pzvujkvczepkifwkqej', 'qojb', 436543191, 'irenfro@sci.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5852, 'lotjivsijmlnhalwm', 'j', 659637177, 'joaquim.lewin@pinnaclestaffing.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5179, 'ejzmzm', 'jbqp', 471408479, 'natasha@circuitcitystores.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7277, 'ntjuiyigajcqrcvjsp', 'fogwyn', 166514506, 'bcash@alternativetechnology.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4118, 'ffpr', 'sbfvg', 509786402, 'awills@atg.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3799, 'lbmuonpbqdvfddjnfyjp', 'vb', 291502619, 'ahmad.sellers@nhhc.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8636, 'xqohnsvcedqispecj', 'cptsanm', 490749656, 'jim.prinze@ptg.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9027, 'rhpxf', 'ipc', 881021109, 'elle.franks@neogen.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6081, 'uzjpyptyvqduitnez', 'fqcd', 186690207, 'rhona.thorton@dynacqinternational.py');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (312, 'zp', 's', 922140778, 'casey.thewlis@cimalabs.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4298, 'bsz', 'qetf', 163901057, 'victoria.d@verizon.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4343, 'bumpruzvswfa', 'uxnki', 120742234, 'doug.lamond@caliber.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6441, 'cxjiklsf', 'zyrrcnh', 108927695, 'dmccain@marketbased.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8434, 'gbiurjyfsgepes', 'qcyttbo', 656419619, 'miko.weiss@stmaryland.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1096, 'rgzzdfhegjuyztxfw', 'mtwyaz', 497974440, 'ernest.clayton@printcafesoftware.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2799, 'w', 'imt', 849953299, 'rachel.wen@alternativetechnology.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9437, 'oefudoaoprbdrl', 'db', 446479861, 'javon.rapaport@limitedbrands.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8490, 'bztpb', 'pr', 490855811, 'dabney.kelly@mag.nz');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2339, 's', 'p', 666115069, 'colm.t@taycorfinancial.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8946, 'zqekvvg', 'qtsk', 223057665, 'sigourney.s@integratelecom.pl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2801, 'uaprnw', 'm', 120863023, 'christine.donelly@surmodics.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9210, 'voythoegpqexpf', 'ppi', 305507335, 'pfarrow@bestever.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8273, 'nstvgpjizscbdftdh', 'ar', 106980792, 'marisal@accesssystems.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5320, 'luwcybpblaeiue', 'kqcyn', 108954643, 'juice.slater@printingforlesscom.com');
commit;
prompt 900 records committed...
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3001, 'o', 'tfpfx', 301166461, 'robby.boothe@microsoft.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9469, 'xsxkxcwtivbfr', 'ok', 698018899, 'julia.guinness@aquickdelivery.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3659, 'hpedwkhskysxgfzdmz', 'sryepl', 650034340, 'danni.hawkins@extremepizza.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8678, 'fdhfvueyx', 'qngaki', 992334421, 'm.clooney@otbd.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3289, 'oswhkkhhqqseq', 'movn', 624590371, 'marleyc@computersource.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6648, 'awkfwkoukek', 'kww', 994593364, 'brets@elitemedical.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8862, 'ghyhpnmimuklnbpkqutc', 'gdrrc', 774412990, 'merillee@glacierbancorp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9029, 'qtctgqraocxlbtwcdi', 'skjgwdo', 682493881, 'r.sayer@mitsubishimotors.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8779, 'qwqlnuuqeu', 'bq', 513123683, 'jdiddley@lms.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (40, 'lnaoyflct', 'm', 700300834, 'bill.margulies@gtp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7076, 'jks', 'dz', 459459332, 'pat.sewell@generalelectric.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (564, 'h', 'ozn', 905230086, 'kathleen.d@nexxtworks.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (739, 'kyyjaskwpxi', 'cekl', 613903641, 'l.harrelson@novartis.dk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1222, 'wpkvaiuz', 'cnsumyy', 23783759, 'nanci.reeves@emt.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7924, 'eanxtfzdubxho', 'fhgjas', 711076926, 'eileen.mattea@progressivedesigns.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6209, 'pxvmiil', 'vz', 565757835, 'lea.n@serentec.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3474, 'mfyelzkhnxeb', 'cqzvr', 629167612, 'bobbi.condition@baesch.at');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8202, 'yqbraewyqktvc', 'fezw', 567125306, 'vince.m@securitycheck.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3405, 'eizahaenupzymwirdsof', 'ett', 337531682, 'crandal@kis.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7825, 'anbwuet', 'pjycbj', 289590522, 'isaac.atlas@spinnakerexploration.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2774, 'wbk', 'b', 913175886, 'lena.sampson@nha.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3282, 'ygwisdctewlkbnompa', 'ed', 852320438, 'aidan.solido@operationaltechnologies.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5498, 'd', 'glhb', 453768968, 'n.bale@innovativelighting.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5460, 'knamflvpzp', 'ahujayl', 39450285, 'kurt@stm.it');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3719, 'dmzzhuyqszrqo', 'hyuka', 977884281, 'a.weller@fsffinancial.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (6263, 'ro', 'dhno', 205200550, 'mirar@speakeasy.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (946, 'tnkcnju', 'oz', 631365077, 'teri.dooley@capitalbank.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4307, 'zgckybhtksz', 'xekjx', 235324413, 'pamela.dern@gtp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9020, 'sdpzjnencxtpwi', 'hxke', 718719378, 'blair.kristofferson@saralee.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1833, 'zxwsmciygckz', 'nyoghik', 605283836, 'nilsm@airmethods.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2601, 'budfxtcpvcnfex', 'dfble', 517781079, 'julianne.d@innovateecommerce.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8429, 'xqdoykipvutmfkxi', 'bsnqefe', 528655273, 'shannynr@maverick.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1404, 'iwcefzgrymojyiimqzso', 'mlzso', 592544717, 'vienna.feuerstein@banfeproducts.za');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3875, 'wmurdvguhiluksbnmexw', 'gvfjha', 113605427, 'heath.r@generalelectric.ca');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2678, 'phoobfvurqkqjx', 't', 499617999, 'ronny@accurateautobody.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7710, 'zaogay', 'kcgpnm', 33340547, 'adrien.saucedo@priorityexpress.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4616, 'yehraons', 'z', 14329721, 'ashton.mccracken@gtp.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4266, 'kxicxaswfdmgkbko', 'zn', 247637557, 'fred.remar@tilsonlandscape.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5226, 'l', 'impro', 145802138, 'rhys.reeve@angieslist.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2765, 'hxlbfn', 'jxjzdc', 559761435, 'ossier@north.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (622, 'ezexagwyfq', 'e', 463454273, 'chubby.franks@catamount.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5200, 'ovfnmyqhm', 'lplweja', 374671821, 'ian.w@sfmai.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (9253, 'hfisddyzhptzuqdrh', 'gngbh', 511868821, 'armand@atg.br');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4974, 'qwxoe', 'pjmww', 734432018, 'hilton.m@acsis.nl');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1148, 'ujvthsmblddlkb', 'xiczk', 223118273, 'lila.w@americanvanguard.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3848, 'iemdryyflf', 'towoqo', 537700649, 'c.david@evinco.jp');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (3572, 'px', 'qug', 438354604, 'cameron.t@parksite.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7960, 'hvjzso', 'kk', 341045907, 'salma.leigh@homedepot.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5620, 'vem', 'ss', 270255269, 'herbie.gershon@progressivedesigns.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (7939, 'dvlxdofszbozaobvrr', 'h', 51402573, 's.carrey@democracydata.de');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8939, 'gzuyktmhvuyzvzpez', 'boyqv', 75608874, 'frances.g@keymark.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4051, 'rotoraeqttehwlkicwcc', 'kwxl', 647681558, 'sandra.p@limitedbrands.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1070, 'xrakoukmvhbdnih', 'kjqcv', 672109436, 'kyra.t@aventis.ch');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (8848, 'cnxhrlm', 's', 343365961, 'natascha.b@unicru.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (4411, 'fywmuhkjqjarepyjgg', 'qd', 343110768, 'marie@qas.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (1198, 'akkdzibdqdvmkwacvmf', 'lyzk', 754648824, 'gwyneth.rock@intel.au');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (2870, 'lrsmrmajvnzgruwsn', 'fan', 185027233, 't.baranski@swi.com');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5780, 'nxhcavpd', 'exccyye', 346915696, 'csevenfold@lydiantrust.fr');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5982, 'llihcjipkzhs', 'vsgmlfx', 659078389, 'jimmie.r@blueoceansoftware.uk');
insert into T_DEPARTMENT (dept_id, dept_desc, dept_name, dept_phone, dept_email)
values (5832, 'qszfskp', 'xqpk', 339211625, 'larah@bioreference.br');
commit;
prompt 960 records loaded
prompt Loading T_ADDRDEPT...
insert into T_ADDRDEPT (dept_id, addr_id)
values (3011, 1011);
commit;
prompt 1 records loaded
prompt Loading T_LOGIN...
insert into T_LOGIN (login_id, mypassword, username)
values (6011, '8539FKDu', 'itzikC');
insert into T_LOGIN (login_id, mypassword, username)
values (5074, '$qd:s2LB', 'dfhzvd');
insert into T_LOGIN (login_id, mypassword, username)
values (6089, 'J\9nC|xs', 'sivkqq');
insert into T_LOGIN (login_id, mypassword, username)
values (4107, '-VOJc>Ns', 'mbxnev');
insert into T_LOGIN (login_id, mypassword, username)
values (4938, 'gt*va",+', 'ccqajo');
insert into T_LOGIN (login_id, mypassword, username)
values (6110, 'cn=FC1g|', 'fpjhqf');
insert into T_LOGIN (login_id, mypassword, username)
values (3296, 'W.(,X''/[', 'slkbte');
insert into T_LOGIN (login_id, mypassword, username)
values (2240, '@g,tV6L#', 'wbmhoc');
insert into T_LOGIN (login_id, mypassword, username)
values (1535, '{b821"T^', 'kpsikk');
insert into T_LOGIN (login_id, mypassword, username)
values (2136, 'aY2JJu[Q', 'dixinn');
insert into T_LOGIN (login_id, mypassword, username)
values (4196, ')[#1+;i:', 'anezbr');
insert into T_LOGIN (login_id, mypassword, username)
values (6313, '3xy{1{tf', 'ijtlax');
insert into T_LOGIN (login_id, mypassword, username)
values (8213, 'pg>N#NrX', 'lfnxdn');
insert into T_LOGIN (login_id, mypassword, username)
values (5851, 'Tqj5JAp`', 'bnboyj');
insert into T_LOGIN (login_id, mypassword, username)
values (4957, 'bUCduTnW', 'abhdox');
insert into T_LOGIN (login_id, mypassword, username)
values (2194, 'Ww1m=~B"', 'qenjxe');
insert into T_LOGIN (login_id, mypassword, username)
values (9260, '?t)Ti''xR', 'ttsmmh');
insert into T_LOGIN (login_id, mypassword, username)
values (4558, 'vX^`31jh', 'cgjkph');
insert into T_LOGIN (login_id, mypassword, username)
values (9457, 'Z8AWzMH\', 'xuwven');
insert into T_LOGIN (login_id, mypassword, username)
values (7493, ')J^R(_1n', 'ijnfcx');
insert into T_LOGIN (login_id, mypassword, username)
values (8093, 'rD=iU<KC', 'qwhogq');
insert into T_LOGIN (login_id, mypassword, username)
values (2554, '.U2_l4yG', 'ptxmum');
insert into T_LOGIN (login_id, mypassword, username)
values (244, 'A5''vxW''Z', 'yqcqsr');
insert into T_LOGIN (login_id, mypassword, username)
values (7392, '$me!N[CI', 'feaehl');
insert into T_LOGIN (login_id, mypassword, username)
values (8242, 'JJ1;GA]S', 'iytumd');
insert into T_LOGIN (login_id, mypassword, username)
values (269, '&p~I;8''z', 'lzfimg');
insert into T_LOGIN (login_id, mypassword, username)
values (9159, '2BDSFD+y', 'rbaszg');
insert into T_LOGIN (login_id, mypassword, username)
values (3566, 'M&M[rR@O', 'wxnkuz');
insert into T_LOGIN (login_id, mypassword, username)
values (9035, 'xV07tysK', 'htgnid');
insert into T_LOGIN (login_id, mypassword, username)
values (7537, 'eva%P4lh', 'kjpiyc');
insert into T_LOGIN (login_id, mypassword, username)
values (7544, '2yjiW<4`', 'ekuhtj');
insert into T_LOGIN (login_id, mypassword, username)
values (4234, '7<cnZ($#', 'ifnvxm');
insert into T_LOGIN (login_id, mypassword, username)
values (2380, '5_^RNmPD', 'pywcfm');
insert into T_LOGIN (login_id, mypassword, username)
values (9351, 'BoFV%Vt=', 'nxlwdw');
insert into T_LOGIN (login_id, mypassword, username)
values (9664, 'dIPMbBr4', 'ozkqbb');
insert into T_LOGIN (login_id, mypassword, username)
values (3290, '-DDIeEe''', 'wrbwcu');
insert into T_LOGIN (login_id, mypassword, username)
values (4988, 'e$dcJ(^Q', 'idfqak');
insert into T_LOGIN (login_id, mypassword, username)
values (1430, '.yc!+,z$', 'qniwej');
insert into T_LOGIN (login_id, mypassword, username)
values (2790, 'Y%QGue(?', 'fcheek');
insert into T_LOGIN (login_id, mypassword, username)
values (6968, ')|^g_X;?', 'nlwxic');
insert into T_LOGIN (login_id, mypassword, username)
values (3498, '[-&@3G*O', 'xjlelv');
insert into T_LOGIN (login_id, mypassword, username)
values (9945, '@a:-V&p+', 'xxpywh');
insert into T_LOGIN (login_id, mypassword, username)
values (7695, 'i:czc$zW', 'qryafz');
insert into T_LOGIN (login_id, mypassword, username)
values (6348, 'JlLY$u$K', 'gocnhs');
insert into T_LOGIN (login_id, mypassword, username)
values (8376, 'N-qTG(8(', 'xnebbu');
insert into T_LOGIN (login_id, mypassword, username)
values (7880, '8vs-%=Vw', 'ljqamj');
insert into T_LOGIN (login_id, mypassword, username)
values (717, 'V#*-&PMt', 'ovvxel');
insert into T_LOGIN (login_id, mypassword, username)
values (4002, ':Ba"Qo;<', 'nghnzh');
insert into T_LOGIN (login_id, mypassword, username)
values (5673, 'ZDjzLc/:', 'fkqryl');
insert into T_LOGIN (login_id, mypassword, username)
values (9628, 'AB2|#8bF', 'ykollu');
insert into T_LOGIN (login_id, mypassword, username)
values (8401, 'Pe%rt{<X', 'xiaapq');
insert into T_LOGIN (login_id, mypassword, username)
values (5985, 'hgotgm4o', 'lvlzca');
insert into T_LOGIN (login_id, mypassword, username)
values (5021, 'sR#t^rVa', 'hepmzc');
insert into T_LOGIN (login_id, mypassword, username)
values (9719, 'HQyc*jL4', 'lgmhwe');
insert into T_LOGIN (login_id, mypassword, username)
values (7079, '_4^a<SW]', 'iphwvw');
insert into T_LOGIN (login_id, mypassword, username)
values (2870, '`%D?A,N$', 'toduqp');
insert into T_LOGIN (login_id, mypassword, username)
values (632, ')YJxqW(6', 'eovljy');
insert into T_LOGIN (login_id, mypassword, username)
values (5104, 'smnL1R=]', 'cwmvsr');
insert into T_LOGIN (login_id, mypassword, username)
values (4286, '\?)Z7=x?', 'bxyprs');
insert into T_LOGIN (login_id, mypassword, username)
values (8384, 'smTru)DG', 'vhogjc');
insert into T_LOGIN (login_id, mypassword, username)
values (9853, '!p`idO@,', 'ycynfn');
insert into T_LOGIN (login_id, mypassword, username)
values (1801, 'z''gBpS"K', 'ddatkf');
insert into T_LOGIN (login_id, mypassword, username)
values (3334, '}N%Hp`F#', 'nawlxs');
insert into T_LOGIN (login_id, mypassword, username)
values (5828, 's{hR,\KO', 'wwynsh');
insert into T_LOGIN (login_id, mypassword, username)
values (942, 'm@FAUz=5', 'zected');
insert into T_LOGIN (login_id, mypassword, username)
values (111, ',8t/h6QH', 'nrwyzq');
insert into T_LOGIN (login_id, mypassword, username)
values (6987, 'B{=74UMX', 'lxouaz');
insert into T_LOGIN (login_id, mypassword, username)
values (6405, 'N}WY},m#', 'bjnnin');
insert into T_LOGIN (login_id, mypassword, username)
values (9421, ':J^A`rVX', 'koapac');
insert into T_LOGIN (login_id, mypassword, username)
values (8350, 'O^,h([''c', 'inspzh');
insert into T_LOGIN (login_id, mypassword, username)
values (7793, '%|9IqK6j', 'rcjbui');
insert into T_LOGIN (login_id, mypassword, username)
values (7559, 'QK6?!Ru)', 'ykhbxl');
insert into T_LOGIN (login_id, mypassword, username)
values (4482, '@--}=GiU', 'lgrkop');
insert into T_LOGIN (login_id, mypassword, username)
values (8030, '>8)P|w1-', 'jminnx');
insert into T_LOGIN (login_id, mypassword, username)
values (1039, '8]Wf]3N/', 'ezmthr');
insert into T_LOGIN (login_id, mypassword, username)
values (9090, 'TmeAKwsu', 'ppzpck');
insert into T_LOGIN (login_id, mypassword, username)
values (9161, 'D#a(+L"r', 'csmjhp');
insert into T_LOGIN (login_id, mypassword, username)
values (5614, 'NFp>7Ew.', 'qtevow');
insert into T_LOGIN (login_id, mypassword, username)
values (5997, 'gcuoBd%4', 'auoomw');
insert into T_LOGIN (login_id, mypassword, username)
values (1967, 'iTNzk4TO', 'dowuld');
insert into T_LOGIN (login_id, mypassword, username)
values (561, '};dQ;{E=', 'tcfwkj');
insert into T_LOGIN (login_id, mypassword, username)
values (4352, '4z#TtS"`', 'hmszxl');
insert into T_LOGIN (login_id, mypassword, username)
values (2820, ';+X,fF|r', 'upqfik');
insert into T_LOGIN (login_id, mypassword, username)
values (2861, 'nYV5(<u9', 'cjaxfn');
insert into T_LOGIN (login_id, mypassword, username)
values (3919, '7Bjw)|TR', 'njgvqa');
insert into T_LOGIN (login_id, mypassword, username)
values (4195, '[UYps^7j', 'xfcyqe');
insert into T_LOGIN (login_id, mypassword, username)
values (8033, 'A?Xs1E|;', 'iuufnd');
insert into T_LOGIN (login_id, mypassword, username)
values (9433, 'l-LpEK+5', 'avfzqv');
insert into T_LOGIN (login_id, mypassword, username)
values (1608, 'eM4d,_EA', 'manqir');
insert into T_LOGIN (login_id, mypassword, username)
values (4753, 'R>0WrYY-', 'vhvcke');
insert into T_LOGIN (login_id, mypassword, username)
values (9643, 'bV;ayakt', 'kuojvq');
insert into T_LOGIN (login_id, mypassword, username)
values (9725, '7YFvK%3+', 'yofywj');
insert into T_LOGIN (login_id, mypassword, username)
values (7109, 'v|dO#!`-', 'yuyjim');
insert into T_LOGIN (login_id, mypassword, username)
values (7671, '7ir<&w|3', 'nnhsum');
insert into T_LOGIN (login_id, mypassword, username)
values (2249, '>hJ1u$ds', 'tejawi');
insert into T_LOGIN (login_id, mypassword, username)
values (2494, '1-<A2[4D', 'cdwigg');
insert into T_LOGIN (login_id, mypassword, username)
values (757, '2L0[kBqa', 'qbqgko');
insert into T_LOGIN (login_id, mypassword, username)
values (7252, 'D5ho%A;K', 'ylosra');
insert into T_LOGIN (login_id, mypassword, username)
values (6198, '{B:-x^*s', 'pwdgno');
insert into T_LOGIN (login_id, mypassword, username)
values (4625, '@3/AG0zp', 'olmano');
commit;
prompt 100 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (8224, 'RkE;_kuD', 'keihcr');
insert into T_LOGIN (login_id, mypassword, username)
values (291, 'n7tCoO@/', 'bqjtyh');
insert into T_LOGIN (login_id, mypassword, username)
values (657, '@yKqic!}', 'zcyvyo');
insert into T_LOGIN (login_id, mypassword, username)
values (6867, '<_4GSq?@', 'bwdsbv');
insert into T_LOGIN (login_id, mypassword, username)
values (120, 'Rm!dS>-T', 'knrohr');
insert into T_LOGIN (login_id, mypassword, username)
values (6546, 'abj2h},.', 'jmtkxf');
insert into T_LOGIN (login_id, mypassword, username)
values (71, 'd^=pQ_l/', 'iaswzt');
insert into T_LOGIN (login_id, mypassword, username)
values (591, 'g(CEI|0}', 'wybcgw');
insert into T_LOGIN (login_id, mypassword, username)
values (5066, '8wBp!o5?', 'vlupeu');
insert into T_LOGIN (login_id, mypassword, username)
values (2004, 'DtZ<^id>', 'nebeak');
insert into T_LOGIN (login_id, mypassword, username)
values (5781, '7J|l_M!o', 'ykzokq');
insert into T_LOGIN (login_id, mypassword, username)
values (6109, 'p<O627dH', 'ngdybu');
insert into T_LOGIN (login_id, mypassword, username)
values (5372, 'GRN/r{4[', 'hwvyaw');
insert into T_LOGIN (login_id, mypassword, username)
values (9232, '_,spxql{', 'abbdln');
insert into T_LOGIN (login_id, mypassword, username)
values (4272, 'b,b|\N{w', 'uzsjms');
insert into T_LOGIN (login_id, mypassword, username)
values (1612, 'WJ(R,DYl', 'wwlfgn');
insert into T_LOGIN (login_id, mypassword, username)
values (3278, '653y9\SV', 'syqmfb');
insert into T_LOGIN (login_id, mypassword, username)
values (2848, 'vV[Hm>[z', 'ykvmcg');
insert into T_LOGIN (login_id, mypassword, username)
values (7202, 'v4-i!6j+', 'zoelgt');
insert into T_LOGIN (login_id, mypassword, username)
values (2722, '60M}d#EX', 'cmskdj');
insert into T_LOGIN (login_id, mypassword, username)
values (8319, 'uk-sGS63', 'ugflbw');
insert into T_LOGIN (login_id, mypassword, username)
values (9697, '5E<$WY\[', 'pfazdi');
insert into T_LOGIN (login_id, mypassword, username)
values (2799, '`]hc3"7H', 'pyyhfr');
insert into T_LOGIN (login_id, mypassword, username)
values (8200, 't2lV^!d,', 'vzgjeg');
insert into T_LOGIN (login_id, mypassword, username)
values (150, 'N(|liA(I', 'dcskem');
insert into T_LOGIN (login_id, mypassword, username)
values (8442, 'n8''!u/ZY', 'rrzcca');
insert into T_LOGIN (login_id, mypassword, username)
values (5930, '86<]e>f0', 'nyxbtf');
insert into T_LOGIN (login_id, mypassword, username)
values (9871, '#4@S{j~+', 'eviply');
insert into T_LOGIN (login_id, mypassword, username)
values (3855, 'LY^vxkvH', 'rhzyfd');
insert into T_LOGIN (login_id, mypassword, username)
values (9581, 'E)m_4CHG', 'voywuw');
insert into T_LOGIN (login_id, mypassword, username)
values (2187, 'H}7G*|D-', 'kxhryj');
insert into T_LOGIN (login_id, mypassword, username)
values (828, '+)K<0GZr', 'ajgfrq');
insert into T_LOGIN (login_id, mypassword, username)
values (1285, 'r%a6xPt.', 'wdsgkl');
insert into T_LOGIN (login_id, mypassword, username)
values (3995, 'H4Yl3r7k', 'ykmzeu');
insert into T_LOGIN (login_id, mypassword, username)
values (6874, '+5LX16%0', 'hzusey');
insert into T_LOGIN (login_id, mypassword, username)
values (8078, 'D@1#NYk=', 'exabsf');
insert into T_LOGIN (login_id, mypassword, username)
values (8577, 'sQJH6byF', 'oszkng');
insert into T_LOGIN (login_id, mypassword, username)
values (5759, 'ldc$:"J|', 'zltcqk');
insert into T_LOGIN (login_id, mypassword, username)
values (3706, 'YOjn.UX|', 'bqvhbn');
insert into T_LOGIN (login_id, mypassword, username)
values (1997, 'P|:13:yq', 'vmiote');
insert into T_LOGIN (login_id, mypassword, username)
values (9983, '%X`q0_2#', 'brrokn');
insert into T_LOGIN (login_id, mypassword, username)
values (3178, ';4?o1q~_', 'gjanau');
insert into T_LOGIN (login_id, mypassword, username)
values (1354, '6?f7''>&>', 'blvmal');
insert into T_LOGIN (login_id, mypassword, username)
values (4033, 'O[taz;X.', 'ytkzwn');
insert into T_LOGIN (login_id, mypassword, username)
values (2752, ',:x#''(MN', 'dbczex');
insert into T_LOGIN (login_id, mypassword, username)
values (6891, '+p^SX9Ew', 'jcbgul');
insert into T_LOGIN (login_id, mypassword, username)
values (5362, 'fh?<{1~L', 'nfmvnr');
insert into T_LOGIN (login_id, mypassword, username)
values (6831, 'T{k)3VuJ', 'njfghm');
insert into T_LOGIN (login_id, mypassword, username)
values (4595, 'B`+<o,uc', 'ipksve');
insert into T_LOGIN (login_id, mypassword, username)
values (8019, 'cae#rM5e', 'twxdkq');
insert into T_LOGIN (login_id, mypassword, username)
values (9976, '-iitJIj"', 'pkektg');
insert into T_LOGIN (login_id, mypassword, username)
values (5429, '#N,H^R`"', 'igmuiw');
insert into T_LOGIN (login_id, mypassword, username)
values (1407, 'FR)u.CQB', 'zjqiol');
insert into T_LOGIN (login_id, mypassword, username)
values (1089, 'G@a>kv9U', 'rxcspx');
insert into T_LOGIN (login_id, mypassword, username)
values (234, '.BSq{'')y', 'sukavu');
insert into T_LOGIN (login_id, mypassword, username)
values (1098, 'JVgwrh(4', 'jwtvko');
insert into T_LOGIN (login_id, mypassword, username)
values (4334, 'kTD@2X!9', 'roxdmh');
insert into T_LOGIN (login_id, mypassword, username)
values (3810, '4y\uD9)R', 'uyxwrh');
insert into T_LOGIN (login_id, mypassword, username)
values (4418, '/Y0`V_>%', 'stivts');
insert into T_LOGIN (login_id, mypassword, username)
values (2208, 'Tq2Tq+eE', 'obsymh');
insert into T_LOGIN (login_id, mypassword, username)
values (4813, '~To~}8H;', 'lwwqdm');
insert into T_LOGIN (login_id, mypassword, username)
values (8440, '`M,zj~BV', 'moojch');
insert into T_LOGIN (login_id, mypassword, username)
values (8579, 'qL@U8(0b', 'mgjauc');
insert into T_LOGIN (login_id, mypassword, username)
values (1243, 'N{#@a~P_', 'kumbyx');
insert into T_LOGIN (login_id, mypassword, username)
values (725, '{GQ-:u$J', 'jtwkfy');
insert into T_LOGIN (login_id, mypassword, username)
values (3427, 'q@);7''P<', 'hljezp');
insert into T_LOGIN (login_id, mypassword, username)
values (2250, '<Axks!9m', 'cztijr');
insert into T_LOGIN (login_id, mypassword, username)
values (560, '{J!O=)mM', 'rxwofu');
insert into T_LOGIN (login_id, mypassword, username)
values (702, '<pM3xA8>', 'upmziv');
insert into T_LOGIN (login_id, mypassword, username)
values (8348, '76P1+!0a', 'qemkpx');
insert into T_LOGIN (login_id, mypassword, username)
values (140, 'XX3QY;h8', 'qxghsn');
insert into T_LOGIN (login_id, mypassword, username)
values (1064, 'U.XH9:Ow', 'mdwvws');
insert into T_LOGIN (login_id, mypassword, username)
values (1036, '{#cEy^Op', 'zozmud');
insert into T_LOGIN (login_id, mypassword, username)
values (7040, 'nKD~w=$`', 'eizozd');
insert into T_LOGIN (login_id, mypassword, username)
values (8546, '3aw\z#0L', 'jxceug');
insert into T_LOGIN (login_id, mypassword, username)
values (2415, '}n)J[{8z', 'yuaefu');
insert into T_LOGIN (login_id, mypassword, username)
values (9794, 'Zx.W#x;E', 'ugwinv');
insert into T_LOGIN (login_id, mypassword, username)
values (7298, '2CUUQ(AG', 'srmywz');
insert into T_LOGIN (login_id, mypassword, username)
values (3103, '^<c4D^&K', 'scncdq');
insert into T_LOGIN (login_id, mypassword, username)
values (6254, 'S)IFp^\D', 'efctrc');
insert into T_LOGIN (login_id, mypassword, username)
values (2617, 'DS_Tc{:*', 'fimbyn');
insert into T_LOGIN (login_id, mypassword, username)
values (3487, 'd>tO6+uI', 'uyujcq');
insert into T_LOGIN (login_id, mypassword, username)
values (5476, '&/;#HX~)', 'tewjxi');
insert into T_LOGIN (login_id, mypassword, username)
values (7649, 'PaG%jsZ[', 'ielime');
insert into T_LOGIN (login_id, mypassword, username)
values (9676, ':x8R!ZH[', 'btrxal');
insert into T_LOGIN (login_id, mypassword, username)
values (4063, 'lc*06.]]', 'ntjpuz');
insert into T_LOGIN (login_id, mypassword, username)
values (6803, 'uixXJqDb', 'ccmlvd');
insert into T_LOGIN (login_id, mypassword, username)
values (8075, 'e~R;dHbG', 'sxztag');
insert into T_LOGIN (login_id, mypassword, username)
values (7282, '1$*~d(.(', 'xzojhw');
insert into T_LOGIN (login_id, mypassword, username)
values (2636, ',U*[gRo&', 'lydjza');
insert into T_LOGIN (login_id, mypassword, username)
values (2030, 'ZqtCtPQ{', 'ldsukk');
insert into T_LOGIN (login_id, mypassword, username)
values (1830, ',~E-Op[-', 'xcnitl');
insert into T_LOGIN (login_id, mypassword, username)
values (1027, 'E@vx3|[H', 'rxhgxp');
insert into T_LOGIN (login_id, mypassword, username)
values (1502, '"8|8S.kI', 'ldglsr');
insert into T_LOGIN (login_id, mypassword, username)
values (3972, ']^s@.lW/', 'umakwr');
insert into T_LOGIN (login_id, mypassword, username)
values (6211, 'AFcY^?Y)', 'wtzxwp');
insert into T_LOGIN (login_id, mypassword, username)
values (208, '`=-3d-+$', 'xqwvcz');
insert into T_LOGIN (login_id, mypassword, username)
values (3784, 'x[M9;a+V', 'srrkzs');
insert into T_LOGIN (login_id, mypassword, username)
values (933, '#)erw9j_', 'cnzmod');
insert into T_LOGIN (login_id, mypassword, username)
values (973, 'N4l@bp-Z', 'jnuyyb');
commit;
prompt 200 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (7124, 'y`BGK@Ac', 'hddnab');
insert into T_LOGIN (login_id, mypassword, username)
values (155, 'oG$}-5T[', 'wvkiwi');
insert into T_LOGIN (login_id, mypassword, username)
values (4934, '\]y{5JPs', 'mesign');
insert into T_LOGIN (login_id, mypassword, username)
values (9413, 'rKb&B`An', 'checcc');
insert into T_LOGIN (login_id, mypassword, username)
values (2383, 'KQf{wjyq', 'dnuvnh');
insert into T_LOGIN (login_id, mypassword, username)
values (6456, 'qxK"<#G(', 'zicfqs');
insert into T_LOGIN (login_id, mypassword, username)
values (279, 'q+Jcv_S>', 'czyvhh');
insert into T_LOGIN (login_id, mypassword, username)
values (1225, 'mIhp{+}H', 'igtapl');
insert into T_LOGIN (login_id, mypassword, username)
values (3680, '[0JN+F~*', 'aggnzd');
insert into T_LOGIN (login_id, mypassword, username)
values (422, 'k1"*ZrQW', 'tggzwb');
insert into T_LOGIN (login_id, mypassword, username)
values (7137, '{2?*gEG(', 'kwnyee');
insert into T_LOGIN (login_id, mypassword, username)
values (39, 'U$y6r\u''', 'dbapag');
insert into T_LOGIN (login_id, mypassword, username)
values (1603, '>u5T$xT1', 'kjzehn');
insert into T_LOGIN (login_id, mypassword, username)
values (8766, 'q)?vAJhW', 'udfzxx');
insert into T_LOGIN (login_id, mypassword, username)
values (4448, '{i_4*Uac', 'hxntzb');
insert into T_LOGIN (login_id, mypassword, username)
values (9427, '8ZV&x9&j', 'ylxggi');
insert into T_LOGIN (login_id, mypassword, username)
values (9933, 'lK~ezwA(', 'kaoaxe');
insert into T_LOGIN (login_id, mypassword, username)
values (5149, 'C=RWr3/n', 'xmijau');
insert into T_LOGIN (login_id, mypassword, username)
values (4650, '"2LX)\I6', 'itbouc');
insert into T_LOGIN (login_id, mypassword, username)
values (8865, 'r|\7&>5!', 'gamxpn');
insert into T_LOGIN (login_id, mypassword, username)
values (3956, '4GWw+FI[', 'kjwetm');
insert into T_LOGIN (login_id, mypassword, username)
values (6160, 'U&7(RORW', 'knaewc');
insert into T_LOGIN (login_id, mypassword, username)
values (7322, 'M2Q&JP`W', 'bblsmc');
insert into T_LOGIN (login_id, mypassword, username)
values (5370, 'Ehg9jL*Q', 'dorvzu');
insert into T_LOGIN (login_id, mypassword, username)
values (3307, 'P9@"&K}4', 'fwmzon');
insert into T_LOGIN (login_id, mypassword, username)
values (3464, 'IQ{DR#cg', 'oidnyn');
insert into T_LOGIN (login_id, mypassword, username)
values (5363, 'FbOgk5}?', 'ljcgel');
insert into T_LOGIN (login_id, mypassword, username)
values (7708, 'r4XO~#-7', 'ylxhbh');
insert into T_LOGIN (login_id, mypassword, username)
values (8470, '/K"tSY+}', 'przxvq');
insert into T_LOGIN (login_id, mypassword, username)
values (4398, '`B(KtX>k', 'bhhcbj');
insert into T_LOGIN (login_id, mypassword, username)
values (375, 'eN!NXM"c', 'ehygdy');
insert into T_LOGIN (login_id, mypassword, username)
values (1142, '^)yB\bfb', 'epfbtr');
insert into T_LOGIN (login_id, mypassword, username)
values (5436, '9)\_q{h=', 'pqiogz');
insert into T_LOGIN (login_id, mypassword, username)
values (1124, '`aI(J.+A', 'qqdexq');
insert into T_LOGIN (login_id, mypassword, username)
values (720, 'uVbPWz7!', 'ibddhq');
insert into T_LOGIN (login_id, mypassword, username)
values (8267, '`$7<LJ:N', 'fkwqgd');
insert into T_LOGIN (login_id, mypassword, username)
values (4603, '6U@@z9[G', 'fekexu');
insert into T_LOGIN (login_id, mypassword, username)
values (2894, 'P8HJv2tq', 'ouvpuc');
insert into T_LOGIN (login_id, mypassword, username)
values (5426, '1LPHlP]0', 'tfyvly');
insert into T_LOGIN (login_id, mypassword, username)
values (2663, 'f5mP~sDA', 'djogwl');
insert into T_LOGIN (login_id, mypassword, username)
values (6777, '+vH]zX3Z', 'wdpkro');
insert into T_LOGIN (login_id, mypassword, username)
values (3866, '(~dW''K{m', 'klpnfy');
insert into T_LOGIN (login_id, mypassword, username)
values (6649, 'F4uY7''Rl', 'wwmlwf');
insert into T_LOGIN (login_id, mypassword, username)
values (1657, 'x6RW?j%7', 'ytgyde');
insert into T_LOGIN (login_id, mypassword, username)
values (1046, 'J''DB6''pV', 'feicsx');
insert into T_LOGIN (login_id, mypassword, username)
values (6184, '=vO[uy/|', 'shgxti');
insert into T_LOGIN (login_id, mypassword, username)
values (2979, 'C91evJDN', 'fxrfkr');
insert into T_LOGIN (login_id, mypassword, username)
values (3515, '''D''p4(.+', 'gqkenq');
insert into T_LOGIN (login_id, mypassword, username)
values (5725, 'Up}g.9z$', 'ocrxyh');
insert into T_LOGIN (login_id, mypassword, username)
values (4906, '>16mw2K<', 'vbuxtw');
insert into T_LOGIN (login_id, mypassword, username)
values (1156, 'l0wlYvj<', 'hbdukj');
insert into T_LOGIN (login_id, mypassword, username)
values (5008, '48oZ!!UP', 'ojbfcx');
insert into T_LOGIN (login_id, mypassword, username)
values (5552, 'clNP=F''p', 'bbgwlr');
insert into T_LOGIN (login_id, mypassword, username)
values (1697, 'h])HKy''_', 'rvabjt');
insert into T_LOGIN (login_id, mypassword, username)
values (9986, 'n&DB4WFm', 'focqaw');
insert into T_LOGIN (login_id, mypassword, username)
values (427, '6W=0scq~', 'jfdvba');
insert into T_LOGIN (login_id, mypassword, username)
values (2915, 'Jqnm@J79', 'emyhlt');
insert into T_LOGIN (login_id, mypassword, username)
values (7333, '2]rE$'':U', 'vloijt');
insert into T_LOGIN (login_id, mypassword, username)
values (7715, '!y#%L]!<', 'wxugbt');
insert into T_LOGIN (login_id, mypassword, username)
values (8509, 'LK~\u!TI', 'gjozpt');
insert into T_LOGIN (login_id, mypassword, username)
values (5350, 'kjwv9{>U', 'wysfnf');
insert into T_LOGIN (login_id, mypassword, username)
values (1999, 'H&OnsrVD', 'jshvgc');
insert into T_LOGIN (login_id, mypassword, username)
values (9869, '$l-TJC[1', 'nfgxoa');
insert into T_LOGIN (login_id, mypassword, username)
values (7332, 'Fm!X?_u}', 'jhsfnp');
insert into T_LOGIN (login_id, mypassword, username)
values (2515, 'uK&oKk<"', 'ionwwt');
insert into T_LOGIN (login_id, mypassword, username)
values (9832, ')e&?DSZa', 'zhokhy');
insert into T_LOGIN (login_id, mypassword, username)
values (7524, 'pUC`Oy^"', 'djsrrb');
insert into T_LOGIN (login_id, mypassword, username)
values (769, 'J:,Vpj=#', 'mhwbja');
insert into T_LOGIN (login_id, mypassword, username)
values (3718, '6v<S-To+', 'fnmopu');
insert into T_LOGIN (login_id, mypassword, username)
values (1465, '.6L%^1S5', 'cnvgrd');
insert into T_LOGIN (login_id, mypassword, username)
values (6684, 'ElU!f*1W', 'cjtsky');
insert into T_LOGIN (login_id, mypassword, username)
values (1063, 'i6J:~Y5k', 'ropybb');
insert into T_LOGIN (login_id, mypassword, username)
values (903, '@>v9Grg1', 'pgpbbf');
insert into T_LOGIN (login_id, mypassword, username)
values (7164, 'JoZb:t"g', 'wdaxqb');
insert into T_LOGIN (login_id, mypassword, username)
values (5517, 'z@FW5\/A', 'rtswpu');
insert into T_LOGIN (login_id, mypassword, username)
values (5520, '1B\eR\_q', 'miggcf');
insert into T_LOGIN (login_id, mypassword, username)
values (2332, '8["?x\U3', 'dndbmo');
insert into T_LOGIN (login_id, mypassword, username)
values (5808, 'Nw,4p?c_', 'tkckxa');
insert into T_LOGIN (login_id, mypassword, username)
values (5257, '&R?+PYq:', 'wtdsvr');
insert into T_LOGIN (login_id, mypassword, username)
values (5615, '$>_)w#8N', 'qlrwkt');
insert into T_LOGIN (login_id, mypassword, username)
values (8306, '@(+)$k0%', 'jcrxcp');
insert into T_LOGIN (login_id, mypassword, username)
values (3617, '*[bBsOGP', 'mrtiua');
insert into T_LOGIN (login_id, mypassword, username)
values (6902, 'mQ@GyJ8w', 'akbrqw');
insert into T_LOGIN (login_id, mypassword, username)
values (5554, 'Ao0LxArb', 'piuzqd');
insert into T_LOGIN (login_id, mypassword, username)
values (1599, 'hZhES.P}', 'zolycc');
insert into T_LOGIN (login_id, mypassword, username)
values (3635, '6jw%Tu]2', 'nebctk');
insert into T_LOGIN (login_id, mypassword, username)
values (9802, '~4$)GuOq', 'tbotfc');
insert into T_LOGIN (login_id, mypassword, username)
values (321, 'i+B?0Um7', 'adjzfy');
insert into T_LOGIN (login_id, mypassword, username)
values (3106, 'Vx@*"xCM', 'zskxaw');
insert into T_LOGIN (login_id, mypassword, username)
values (3351, 'm7jXY|z)', 'ozcwul');
insert into T_LOGIN (login_id, mypassword, username)
values (4633, 'X"Vf_^OE', 'sklgbl');
insert into T_LOGIN (login_id, mypassword, username)
values (4045, 'kKNujGV:', 'tfobpb');
insert into T_LOGIN (login_id, mypassword, username)
values (2340, '6Qn4`+3<', 'kvvrlg');
insert into T_LOGIN (login_id, mypassword, username)
values (4654, 'dMVX@q\}', 'zpcmyp');
insert into T_LOGIN (login_id, mypassword, username)
values (5310, 'rUe4:xMU', 'plwbtl');
insert into T_LOGIN (login_id, mypassword, username)
values (5862, 'vCq@5''*|', 'jzguob');
insert into T_LOGIN (login_id, mypassword, username)
values (8427, 'lB_#m\{$', 'msqlxw');
insert into T_LOGIN (login_id, mypassword, username)
values (9788, '`LTpSG&c', 'inwwys');
insert into T_LOGIN (login_id, mypassword, username)
values (5642, '-$,?%jaV', 'dfweok');
insert into T_LOGIN (login_id, mypassword, username)
values (5589, 'viLW|-es', 'aajgrc');
commit;
prompt 300 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (7522, '_X_nkB/l', 'kqubmr');
insert into T_LOGIN (login_id, mypassword, username)
values (3483, 'Cy|q_`]`', 'xlcurv');
insert into T_LOGIN (login_id, mypassword, username)
values (4471, 'yN<x(7+B', 'djilnf');
insert into T_LOGIN (login_id, mypassword, username)
values (6274, '0g&9NuX&', 'koihnv');
insert into T_LOGIN (login_id, mypassword, username)
values (2078, 'im!g[sg=', 'rdawuh');
insert into T_LOGIN (login_id, mypassword, username)
values (7373, 'RvrCuO9:', 'oleqbd');
insert into T_LOGIN (login_id, mypassword, username)
values (9764, '(C|0"xX,', 'tetegd');
insert into T_LOGIN (login_id, mypassword, username)
values (527, 'RE9"&/>6', 'aiinzs');
insert into T_LOGIN (login_id, mypassword, username)
values (4411, ')Q1QDV:x', 'juhauj');
insert into T_LOGIN (login_id, mypassword, username)
values (516, '&eq/n[,2', 'ugymhw');
insert into T_LOGIN (login_id, mypassword, username)
values (3720, 'L#>d`#}"', 'sxtmgl');
insert into T_LOGIN (login_id, mypassword, username)
values (8769, '/DQM>z-z', 'xjprpf');
insert into T_LOGIN (login_id, mypassword, username)
values (6298, 'I3`yLg10', 'jvnbbg');
insert into T_LOGIN (login_id, mypassword, username)
values (749, 'r="p=8sC', 'wokdtu');
insert into T_LOGIN (login_id, mypassword, username)
values (7599, '-}r-KGTZ', 'kpyqpe');
insert into T_LOGIN (login_id, mypassword, username)
values (9517, 'aLVL:!HP', 'nrkgtv');
insert into T_LOGIN (login_id, mypassword, username)
values (2223, 'a0;Z''^_8', 'mfcqot');
insert into T_LOGIN (login_id, mypassword, username)
values (1428, 'YV>DRr&,', 'vewprg');
insert into T_LOGIN (login_id, mypassword, username)
values (5464, 'F8KL<901', 'vqvevt');
insert into T_LOGIN (login_id, mypassword, username)
values (3578, 'OQ)zA0Wz', 'gswtbu');
insert into T_LOGIN (login_id, mypassword, username)
values (8282, '(1}S"`Ls', 'jsphhx');
insert into T_LOGIN (login_id, mypassword, username)
values (4762, 'QkMW0''V3', 'wjslzl');
insert into T_LOGIN (login_id, mypassword, username)
values (5667, 'jiuK?Z0X', 'ryvunn');
insert into T_LOGIN (login_id, mypassword, username)
values (6614, 'A(}!l4S|', 'dxjjfo');
insert into T_LOGIN (login_id, mypassword, username)
values (2381, 'B]F5U0MT', 'nxifty');
insert into T_LOGIN (login_id, mypassword, username)
values (6967, 'DTcs-EeY', 'clxnup');
insert into T_LOGIN (login_id, mypassword, username)
values (3332, '^z[,$K)E', 'xgymjn');
insert into T_LOGIN (login_id, mypassword, username)
values (6763, ',`eYfS(n', 'gbppsa');
insert into T_LOGIN (login_id, mypassword, username)
values (6784, '8''i!j"ee', 'gmloyn');
insert into T_LOGIN (login_id, mypassword, username)
values (6414, 'dbBNV,OS', 'uxichm');
insert into T_LOGIN (login_id, mypassword, username)
values (1425, '$J^;Y6(_', 'zvuisy');
insert into T_LOGIN (login_id, mypassword, username)
values (7492, '}phfR^GX', 'faleqb');
insert into T_LOGIN (login_id, mypassword, username)
values (8312, '&e[/>Wgx', 'svuemo');
insert into T_LOGIN (login_id, mypassword, username)
values (6740, 'U)]vI{^S', 'cnzdla');
insert into T_LOGIN (login_id, mypassword, username)
values (5272, 'I=?l6\kc', 'fgmvso');
insert into T_LOGIN (login_id, mypassword, username)
values (1388, '/&#jzLTg', 'wqbisj');
insert into T_LOGIN (login_id, mypassword, username)
values (8564, '6dwjqoPP', 'evbqse');
insert into T_LOGIN (login_id, mypassword, username)
values (9069, 'c0CgNN/w', 'ndfwei');
insert into T_LOGIN (login_id, mypassword, username)
values (3247, 'aJN_XcwQ', 'dwtoeu');
insert into T_LOGIN (login_id, mypassword, username)
values (9662, ';IK:iH}''', 'wwbgys');
insert into T_LOGIN (login_id, mypassword, username)
values (4716, '#?r\xuz?', 'hbnlfa');
insert into T_LOGIN (login_id, mypassword, username)
values (1789, '_9ks$EMX', 'vljxyf');
insert into T_LOGIN (login_id, mypassword, username)
values (8179, 'xB:r=77''', 'ggwhrv');
insert into T_LOGIN (login_id, mypassword, username)
values (821, '@7ZuvH;k', 'nqmbxk');
insert into T_LOGIN (login_id, mypassword, username)
values (9387, ':a1W^n-4', 'heotxx');
insert into T_LOGIN (login_id, mypassword, username)
values (8616, '#mNm-Y|/', 'mlzffm');
insert into T_LOGIN (login_id, mypassword, username)
values (557, '_3L1IQ8Q', 'lbbyrh');
insert into T_LOGIN (login_id, mypassword, username)
values (1579, '''9@t6Ti-', 'gmivob');
insert into T_LOGIN (login_id, mypassword, username)
values (1333, '.gx"Qgm3', 'ivneos');
insert into T_LOGIN (login_id, mypassword, username)
values (4290, 'ND<T>0J<', 'utlybg');
insert into T_LOGIN (login_id, mypassword, username)
values (6003, 'g0DV1=A~', 'phknow');
insert into T_LOGIN (login_id, mypassword, username)
values (2849, '''uR]o]C*', 'xzobrr');
insert into T_LOGIN (login_id, mypassword, username)
values (8531, '"T''$?Ce`', 'aredev');
insert into T_LOGIN (login_id, mypassword, username)
values (6953, 'GEBU}|ZT', 'nolgwz');
insert into T_LOGIN (login_id, mypassword, username)
values (3129, 'W5>^L;UM', 'kvkrdr');
insert into T_LOGIN (login_id, mypassword, username)
values (3226, '<2sfy]?\', 'faqqpg');
insert into T_LOGIN (login_id, mypassword, username)
values (7788, 'Fo?G,\@5', 'uuvini');
insert into T_LOGIN (login_id, mypassword, username)
values (7061, '{k06=6k;', 'yxviye');
insert into T_LOGIN (login_id, mypassword, username)
values (5706, '=%]geZs8', 'abdhqr');
insert into T_LOGIN (login_id, mypassword, username)
values (2075, '<Pg1<m1&', 'cxvuxe');
insert into T_LOGIN (login_id, mypassword, username)
values (9903, 'v|qI5p.@', 'plytti');
insert into T_LOGIN (login_id, mypassword, username)
values (7612, 'iLgO]pQ(', 'ubbelg');
insert into T_LOGIN (login_id, mypassword, username)
values (410, '''DAsd!,>', 'zgupgk');
insert into T_LOGIN (login_id, mypassword, username)
values (6008, 't3-"2^_k', 'jhunmu');
insert into T_LOGIN (login_id, mypassword, username)
values (1160, '?a1R:wDU', 'bvzine');
insert into T_LOGIN (login_id, mypassword, username)
values (6256, 'K|V;$hgO', 'gubiae');
insert into T_LOGIN (login_id, mypassword, username)
values (49, 'c~MD>fpq', 'pxwzzj');
insert into T_LOGIN (login_id, mypassword, username)
values (4350, '/+$zkw:[', 'xdfgct');
insert into T_LOGIN (login_id, mypassword, username)
values (1440, ':#D6?6~f', 'egmrsj');
insert into T_LOGIN (login_id, mypassword, username)
values (9940, 'i(60LKdC', 'aprggj');
insert into T_LOGIN (login_id, mypassword, username)
values (9739, 'O9`u5j+\', 'lyvrcu');
insert into T_LOGIN (login_id, mypassword, username)
values (764, 'FiEVU|G*', 'aryrhz');
insert into T_LOGIN (login_id, mypassword, username)
values (2320, '9F"}s+,;', 'lzpxof');
insert into T_LOGIN (login_id, mypassword, username)
values (1011, 'GD#X!-9u', 'tswhsv');
insert into T_LOGIN (login_id, mypassword, username)
values (4634, 'o0IQ_pxo', 'ertiul');
insert into T_LOGIN (login_id, mypassword, username)
values (7201, 'X[S9.})%', 'riwgtq');
insert into T_LOGIN (login_id, mypassword, username)
values (9148, '=5dH}9ux', 'iwywsy');
insert into T_LOGIN (login_id, mypassword, username)
values (3681, 'f+h%C[gn', 'cfsyci');
insert into T_LOGIN (login_id, mypassword, username)
values (4549, 'ngvG]{!]', 'bbwnvn');
insert into T_LOGIN (login_id, mypassword, username)
values (7809, 'd):4fc3<', 'hxvtmd');
insert into T_LOGIN (login_id, mypassword, username)
values (7274, 'a:2rxH&,', 'pydlkw');
insert into T_LOGIN (login_id, mypassword, username)
values (2362, 'G\Dg6*KR', 'bdzgby');
insert into T_LOGIN (login_id, mypassword, username)
values (4417, 'sen.kN|N', 'nbdbay');
insert into T_LOGIN (login_id, mypassword, username)
values (2496, '.1%yD`6Q', 'abuhyn');
insert into T_LOGIN (login_id, mypassword, username)
values (2529, 'Yr&/C<5:', 'rhrpji');
insert into T_LOGIN (login_id, mypassword, username)
values (4077, 'Kj8-Y(oU', 'bhcdqo');
insert into T_LOGIN (login_id, mypassword, username)
values (6319, '.Ty.qBaH', 'xrtnih');
insert into T_LOGIN (login_id, mypassword, username)
values (2015, ';UQ/@0=o', 'hthvva');
insert into T_LOGIN (login_id, mypassword, username)
values (3140, 'mCS9RZcj', 'wlnkkm');
insert into T_LOGIN (login_id, mypassword, username)
values (2280, '}3SZk"$`', 'rtuwjp');
insert into T_LOGIN (login_id, mypassword, username)
values (8593, '~o0}1^%A', 'obhyxi');
insert into T_LOGIN (login_id, mypassword, username)
values (8819, 'K}HlU_vz', 'sbisir');
insert into T_LOGIN (login_id, mypassword, username)
values (9151, '@GXcqm7$', 'xkjbrz');
insert into T_LOGIN (login_id, mypassword, username)
values (4011, 'U).S@PH$', 'adlkin');
insert into T_LOGIN (login_id, mypassword, username)
values (6588, '+b82oX\W', 'bllbpc');
insert into T_LOGIN (login_id, mypassword, username)
values (372, 'qwh:q+1]', 'gubvya');
insert into T_LOGIN (login_id, mypassword, username)
values (2553, 'wdLIf-4m', 'azqxdu');
insert into T_LOGIN (login_id, mypassword, username)
values (3652, 'AeJoa8Zz', 'bndzpf');
insert into T_LOGIN (login_id, mypassword, username)
values (7844, '5]#]^SBK', 'geafhq');
insert into T_LOGIN (login_id, mypassword, username)
values (6956, 'Fn+-P"Gg', 'rmlxyi');
commit;
prompt 400 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (1274, 'PvK$kQs%', 'agxsdm');
insert into T_LOGIN (login_id, mypassword, username)
values (7930, 'vK=u0yAu', 'cmmzqw');
insert into T_LOGIN (login_id, mypassword, username)
values (5740, '$1.i&hdW', 'rlltys');
insert into T_LOGIN (login_id, mypassword, username)
values (1166, 'PP:df=#Q', 'pxqcaf');
insert into T_LOGIN (login_id, mypassword, username)
values (9790, '2i_$$;!n', 'ltksai');
insert into T_LOGIN (login_id, mypassword, username)
values (142, 'Wu{6|3KO', 'gobwms');
insert into T_LOGIN (login_id, mypassword, username)
values (5804, '.S4B;1#(', 'npjwjf');
insert into T_LOGIN (login_id, mypassword, username)
values (252, '\&^zNL\^', 'xmqpww');
insert into T_LOGIN (login_id, mypassword, username)
values (341, 'hIgWv=ln', 'dlgeci');
insert into T_LOGIN (login_id, mypassword, username)
values (9278, '6ZO2L?GJ', 'ziytqp');
insert into T_LOGIN (login_id, mypassword, username)
values (1457, '^Io4$_2<', 'fawidf');
insert into T_LOGIN (login_id, mypassword, username)
values (3018, 'C50o}Y49', 'epknnr');
insert into T_LOGIN (login_id, mypassword, username)
values (8192, 'rPX%QTk+', 'dfxcug');
insert into T_LOGIN (login_id, mypassword, username)
values (8261, '3?>1|d]W', 'gmcaql');
insert into T_LOGIN (login_id, mypassword, username)
values (7697, 'pj^6rg;K', 'ccdnwv');
insert into T_LOGIN (login_id, mypassword, username)
values (7985, 'Q$cnLkqU', 'kbgnlm');
insert into T_LOGIN (login_id, mypassword, username)
values (1398, 'M&),WGV:', 'jcnsrb');
insert into T_LOGIN (login_id, mypassword, username)
values (7230, '.V([ma:n', 'efmpnp');
insert into T_LOGIN (login_id, mypassword, username)
values (8824, '8DCn#20g', 'qedohi');
insert into T_LOGIN (login_id, mypassword, username)
values (5042, 'Du0zqe(N', 'zvzfxc');
insert into T_LOGIN (login_id, mypassword, username)
values (8385, '*B("k{br', 'zjiucr');
insert into T_LOGIN (login_id, mypassword, username)
values (6363, '''XAl;LLo', 'lcqzjw');
insert into T_LOGIN (login_id, mypassword, username)
values (2742, '?<vU{6/c', 'bigwtk');
insert into T_LOGIN (login_id, mypassword, username)
values (1279, 'ys#hZab!', 'ejnmfb');
insert into T_LOGIN (login_id, mypassword, username)
values (5686, 'QN1&tqa/', 'ambyzb');
insert into T_LOGIN (login_id, mypassword, username)
values (114, '@VYHcY?X', 'cvajyq');
insert into T_LOGIN (login_id, mypassword, username)
values (8163, 'f,]2Cngj', 'vzawha');
insert into T_LOGIN (login_id, mypassword, username)
values (8764, ':=R.Ro8<', 'jtenip');
insert into T_LOGIN (login_id, mypassword, username)
values (4169, '#dk]24!4', 'ttplrm');
insert into T_LOGIN (login_id, mypassword, username)
values (2230, 'l/$(\aB_', 'yxmfnk');
insert into T_LOGIN (login_id, mypassword, username)
values (6352, '/#X{cSFC', 'hcbgjj');
insert into T_LOGIN (login_id, mypassword, username)
values (8620, 'ogDrbo!j', 'svjwfh');
insert into T_LOGIN (login_id, mypassword, username)
values (9384, ':f6L_.+8', 'pvpezi');
insert into T_LOGIN (login_id, mypassword, username)
values (5809, '{=eM|ASG', 'qaxwjp');
insert into T_LOGIN (login_id, mypassword, username)
values (4130, 'ZZm9K@H,', 'jpzjxd');
insert into T_LOGIN (login_id, mypassword, username)
values (4401, '~:$~MfTt', 'iyaykq');
insert into T_LOGIN (login_id, mypassword, username)
values (5549, 'MYjUg2pP', 'jacxii');
insert into T_LOGIN (login_id, mypassword, username)
values (53, 'Q|R(S5qa', 'inlrob');
insert into T_LOGIN (login_id, mypassword, username)
values (2300, 'MoPD?z[X', 'szwioc');
insert into T_LOGIN (login_id, mypassword, username)
values (5561, '*%6!7+Jb', 'pfvfnp');
insert into T_LOGIN (login_id, mypassword, username)
values (160, 't@k\bJNc', 'qttcob');
insert into T_LOGIN (login_id, mypassword, username)
values (3798, '.ws4|(">', 'zqtsil');
insert into T_LOGIN (login_id, mypassword, username)
values (6037, '%UDY{4\~', 'sjgmql');
insert into T_LOGIN (login_id, mypassword, username)
values (6347, 'h3q`^"IL', 'tqxhcp');
insert into T_LOGIN (login_id, mypassword, username)
values (9081, 't&R05$tv', 'qfdbjw');
insert into T_LOGIN (login_id, mypassword, username)
values (8959, '6;(nJ2J3', 'vdzuvn');
insert into T_LOGIN (login_id, mypassword, username)
values (8511, '6L^ytk:W', 'azzlhp');
insert into T_LOGIN (login_id, mypassword, username)
values (9546, '5vp>@5(@', 'ekprsf');
insert into T_LOGIN (login_id, mypassword, username)
values (7527, '!#Z]IRQj', 'qopjik');
insert into T_LOGIN (login_id, mypassword, username)
values (1923, 'Ir[BLRf,', 'awqmpb');
insert into T_LOGIN (login_id, mypassword, username)
values (2970, 'no_g*bJ(', 'gsmvnd');
insert into T_LOGIN (login_id, mypassword, username)
values (9134, '}H77BO_-', 'xqjvfq');
insert into T_LOGIN (login_id, mypassword, username)
values (9230, 'IN8N\wt?', 'awvejd');
insert into T_LOGIN (login_id, mypassword, username)
values (8311, 'PySc\g#*', 'rjuake');
insert into T_LOGIN (login_id, mypassword, username)
values (4039, 'ua2Xrgq8', 'fyyqqp');
insert into T_LOGIN (login_id, mypassword, username)
values (7678, 'Tz=Gg6vD', 'fkgknn');
insert into T_LOGIN (login_id, mypassword, username)
values (2151, 'k?x[o>m)', 'aczpxs');
insert into T_LOGIN (login_id, mypassword, username)
values (6105, '(C-P%yt&', 'dsyzfr');
insert into T_LOGIN (login_id, mypassword, username)
values (1397, 'P]uZgpPH', 'exemot');
insert into T_LOGIN (login_id, mypassword, username)
values (3975, '{h`=&\x/', 'zjzpwy');
insert into T_LOGIN (login_id, mypassword, username)
values (9238, 'Lf2:pC_X', 'bceehn');
insert into T_LOGIN (login_id, mypassword, username)
values (7601, '[!-4bcs;', 'pxeocg');
insert into T_LOGIN (login_id, mypassword, username)
values (8339, ''']x:6,=G', 'woxhoh');
insert into T_LOGIN (login_id, mypassword, username)
values (7131, 'VK1c)5hd', 'ucybaq');
insert into T_LOGIN (login_id, mypassword, username)
values (8607, 'GNH(xUj,', 'xetwkg');
insert into T_LOGIN (login_id, mypassword, username)
values (773, '<SR|xYXi', 'mkavio');
insert into T_LOGIN (login_id, mypassword, username)
values (6026, '8QMHxo\_', 'uouxga');
insert into T_LOGIN (login_id, mypassword, username)
values (2675, 'a^$9_^M|', 'jnlxns');
insert into T_LOGIN (login_id, mypassword, username)
values (383, '^.lT!:qp', 'vovlal');
insert into T_LOGIN (login_id, mypassword, username)
values (59, '&LpE"p7?', 'awwulu');
insert into T_LOGIN (login_id, mypassword, username)
values (1511, 'K5IX?-/p', 'lvulsw');
insert into T_LOGIN (login_id, mypassword, username)
values (5478, 'I#sjLsjg', 'spukgn');
insert into T_LOGIN (login_id, mypassword, username)
values (3605, ':%5oKcH6', 'yxsxom');
insert into T_LOGIN (login_id, mypassword, username)
values (9999, '`R*{jAtN', 'zozdmo');
insert into T_LOGIN (login_id, mypassword, username)
values (7805, 'n(3c&YKS', 'sbiqps');
insert into T_LOGIN (login_id, mypassword, username)
values (4661, 'UM"MrU=u', 'uppgtb');
insert into T_LOGIN (login_id, mypassword, username)
values (7286, 'vH:Q6+38', 'jszxex');
insert into T_LOGIN (login_id, mypassword, username)
values (5425, 'sbG"n[{O', 'gwsthe');
insert into T_LOGIN (login_id, mypassword, username)
values (6670, 'GoWx{l@,', 'tizeuj');
insert into T_LOGIN (login_id, mypassword, username)
values (376, '|SE:o^ht', 'fqchjx');
insert into T_LOGIN (login_id, mypassword, username)
values (1846, 'ad:9:la_', 'akwcfb');
insert into T_LOGIN (login_id, mypassword, username)
values (9678, 'XgmJkSn~', 'vcpnea');
insert into T_LOGIN (login_id, mypassword, username)
values (6950, 'nf~wR;/k', 'tbeuwn');
insert into T_LOGIN (login_id, mypassword, username)
values (2669, '9!u#^#&W', 'ssybjh');
insert into T_LOGIN (login_id, mypassword, username)
values (2357, 'B<ZnYo`/', 'rqwsrw');
insert into T_LOGIN (login_id, mypassword, username)
values (891, '1R3)]bk^', 'fmitym');
insert into T_LOGIN (login_id, mypassword, username)
values (1280, '=m/~*W}C', 'hjpsyt');
insert into T_LOGIN (login_id, mypassword, username)
values (7993, '9/>N+A;l', 'ciwrgr');
insert into T_LOGIN (login_id, mypassword, username)
values (6798, '%tO{JU`f', 'qvlykf');
insert into T_LOGIN (login_id, mypassword, username)
values (4473, 'AFC7&1>L', 'hnqxzj');
insert into T_LOGIN (login_id, mypassword, username)
values (4167, '}<%x-tFk', 'bpudeb');
insert into T_LOGIN (login_id, mypassword, username)
values (6156, 'uRS55e[T', 'woizfz');
insert into T_LOGIN (login_id, mypassword, username)
values (4379, '%$W0UuD|', 'ypecli');
insert into T_LOGIN (login_id, mypassword, username)
values (9621, '/z2TvLV0', 'cwfdsc');
insert into T_LOGIN (login_id, mypassword, username)
values (5981, 'vk)z3#GY', 'onnnnw');
insert into T_LOGIN (login_id, mypassword, username)
values (1219, 'zK3OuR?0', 'imjawj');
insert into T_LOGIN (login_id, mypassword, username)
values (5028, 'D''`VvqZ|', 'ivhuif');
insert into T_LOGIN (login_id, mypassword, username)
values (2998, '5Qpm7h!x', 'cgvyqh');
insert into T_LOGIN (login_id, mypassword, username)
values (7594, '!b%:fyXs', 'slqwge');
insert into T_LOGIN (login_id, mypassword, username)
values (4816, 'X;Da$x_)', 'ntuykn');
commit;
prompt 500 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (2199, 'Qc6ZtcWU', 'fhnvbd');
insert into T_LOGIN (login_id, mypassword, username)
values (4394, 'KeM]uFA6', 'ipldxn');
insert into T_LOGIN (login_id, mypassword, username)
values (9443, 's"IG;FXj', 'urlrcp');
insert into T_LOGIN (login_id, mypassword, username)
values (4439, 'oLu?W.R3', 'iggdyq');
insert into T_LOGIN (login_id, mypassword, username)
values (3549, '=ZivTL{E', 'hypbam');
insert into T_LOGIN (login_id, mypassword, username)
values (4220, 'uPYYvkKt', 'kppsdr');
insert into T_LOGIN (login_id, mypassword, username)
values (5082, 'hEf:kgO"', 'wasaoi');
insert into T_LOGIN (login_id, mypassword, username)
values (7883, '|QXT~KW''', 'shpsnn');
insert into T_LOGIN (login_id, mypassword, username)
values (9007, 'kd+(uTu>', 'kvherd');
insert into T_LOGIN (login_id, mypassword, username)
values (3342, '"srJTRQ[', 'amvsuq');
insert into T_LOGIN (login_id, mypassword, username)
values (3072, 'k2&Zj>T?', 'pigqyt');
insert into T_LOGIN (login_id, mypassword, username)
values (1878, '''3eeRZ1C', 'eojivz');
insert into T_LOGIN (login_id, mypassword, username)
values (8235, '%J=x1$[V', 'naeqyl');
insert into T_LOGIN (login_id, mypassword, username)
values (9804, '9%iepc?t', 'crukpc');
insert into T_LOGIN (login_id, mypassword, username)
values (8431, '}?,Wh-`?', 'yypdch');
insert into T_LOGIN (login_id, mypassword, username)
values (7853, '=i!T<0n}', 'aaugnu');
insert into T_LOGIN (login_id, mypassword, username)
values (6120, '{}>|\#Wk', 'lmtrkd');
insert into T_LOGIN (login_id, mypassword, username)
values (2689, 'Ab8}<MqM', 'xlksno');
insert into T_LOGIN (login_id, mypassword, username)
values (3165, '1ukB}#GG', 'eoujyp');
insert into T_LOGIN (login_id, mypassword, username)
values (6356, 'k0#d}U:W', 'kyqshk');
insert into T_LOGIN (login_id, mypassword, username)
values (8552, '9e*]:Q*4', 'injfce');
insert into T_LOGIN (login_id, mypassword, username)
values (2704, 'KF\_3V"|', 'gctznw');
insert into T_LOGIN (login_id, mypassword, username)
values (6237, '^S1~Xx(n', 'nzvwhy');
insert into T_LOGIN (login_id, mypassword, username)
values (1845, '&6p\AK<I', 'woexrq');
insert into T_LOGIN (login_id, mypassword, username)
values (7780, 'HM4j9P''+', 'dixocj');
insert into T_LOGIN (login_id, mypassword, username)
values (176, '#F`&#Yn+', 'zcotzz');
insert into T_LOGIN (login_id, mypassword, username)
values (8079, 'r6u|STxl', 'qvfdom');
insert into T_LOGIN (login_id, mypassword, username)
values (3111, 't<3x(SNq', 'dcexhh');
insert into T_LOGIN (login_id, mypassword, username)
values (7872, ''')Wvw{rY', 'dbwtam');
insert into T_LOGIN (login_id, mypassword, username)
values (9377, 'fH/&|=>g', 'uneioz');
insert into T_LOGIN (login_id, mypassword, username)
values (1533, 'gbl)5gB{', 'cysajq');
insert into T_LOGIN (login_id, mypassword, username)
values (8937, '_[<~Uc=|', 'roontb');
insert into T_LOGIN (login_id, mypassword, username)
values (9805, '&{~3G^nR', 'ajtsls');
insert into T_LOGIN (login_id, mypassword, username)
values (5357, 'gDTjgJr-', 'ksujxq');
insert into T_LOGIN (login_id, mypassword, username)
values (8533, 'nz$"Jj.F', 'uavjji');
insert into T_LOGIN (login_id, mypassword, username)
values (7277, ';u_E>FAc', 'zelocm');
insert into T_LOGIN (login_id, mypassword, username)
values (6093, 'VI"3l''{(', 'qawaby');
insert into T_LOGIN (login_id, mypassword, username)
values (4069, '(t[k0B>7', 'uoleaj');
insert into T_LOGIN (login_id, mypassword, username)
values (4598, '[ch''wMXV', 'efkqvb');
insert into T_LOGIN (login_id, mypassword, username)
values (7459, 'YkU&-gCM', 'gnkccs');
insert into T_LOGIN (login_id, mypassword, username)
values (3223, 'CN:o''LiW', 'dvzava');
insert into T_LOGIN (login_id, mypassword, username)
values (6396, 'k9p$_8be', 'zsyopc');
insert into T_LOGIN (login_id, mypassword, username)
values (8038, ',Q.Al"r|', 'ggaexy');
insert into T_LOGIN (login_id, mypassword, username)
values (4369, 'rkmgi@?k', 'lbulhp');
insert into T_LOGIN (login_id, mypassword, username)
values (1183, '*%"G=?[r', 'kxunde');
insert into T_LOGIN (login_id, mypassword, username)
values (3142, '*^5^Z*>~', 'mifdwt');
insert into T_LOGIN (login_id, mypassword, username)
values (1322, '/S2DN9"-', 'drpaht');
insert into T_LOGIN (login_id, mypassword, username)
values (1155, 'R;GYgMQv', 'jjnpbh');
insert into T_LOGIN (login_id, mypassword, username)
values (4974, 'ebJk3{/B', 'fplpdg');
insert into T_LOGIN (login_id, mypassword, username)
values (7087, 'I="E.pX=', 'helkpb');
insert into T_LOGIN (login_id, mypassword, username)
values (2103, 'CWbgI(pm', 'xratzm');
insert into T_LOGIN (login_id, mypassword, username)
values (9220, '6IY3@Vo#', 'kkwqbv');
insert into T_LOGIN (login_id, mypassword, username)
values (8839, 'S=#)JZ,C', 'yoscxc');
insert into T_LOGIN (login_id, mypassword, username)
values (2837, 'isO%KZZT', 'zvqqhn');
insert into T_LOGIN (login_id, mypassword, username)
values (4890, '^OXT7F=*', 'kvjfsv');
insert into T_LOGIN (login_id, mypassword, username)
values (4999, 'RYOW[57y', 'qnelix');
insert into T_LOGIN (login_id, mypassword, username)
values (1199, 'nI27,>I.', 'hthyii');
insert into T_LOGIN (login_id, mypassword, username)
values (4383, 'UdOM7[UR', 'chesxm');
insert into T_LOGIN (login_id, mypassword, username)
values (9053, '_C^ve@f=', 'mfbymm');
insert into T_LOGIN (login_id, mypassword, username)
values (1725, '@/HnH$VA', 'ywjmjd');
insert into T_LOGIN (login_id, mypassword, username)
values (7483, 'MnBvlY2Q', 'mnjvqj');
insert into T_LOGIN (login_id, mypassword, username)
values (7945, 'lHtPb)))', 'icfuiu');
insert into T_LOGIN (login_id, mypassword, username)
values (8898, 'Gof>@v4u', 'tptmck');
insert into T_LOGIN (login_id, mypassword, username)
values (9928, 'l2Z%yO*6', 'whgstq');
insert into T_LOGIN (login_id, mypassword, username)
values (456, '".6''|l5d', 'ymypmg');
insert into T_LOGIN (login_id, mypassword, username)
values (9275, 'MRRDr@^q', 'abaaqx');
insert into T_LOGIN (login_id, mypassword, username)
values (7681, 'e-M<7E{O', 'asrlws');
insert into T_LOGIN (login_id, mypassword, username)
values (9175, '-*3GJ6CY', 'vnkrds');
insert into T_LOGIN (login_id, mypassword, username)
values (6533, '9,V3tUi$', 'nqdghr');
insert into T_LOGIN (login_id, mypassword, username)
values (278, 'zYg7%%rZ', 'ciknhq');
insert into T_LOGIN (login_id, mypassword, username)
values (7942, ';.eeF9~N', 'dnvnaw');
insert into T_LOGIN (login_id, mypassword, username)
values (2377, '}o[$NPq_', 'eufkje');
insert into T_LOGIN (login_id, mypassword, username)
values (35, 'da''/AR.H', 'dsqvkg');
insert into T_LOGIN (login_id, mypassword, username)
values (5479, 'b/;!tK+n', 'ocdvpy');
insert into T_LOGIN (login_id, mypassword, username)
values (3856, '.fLeshc#', 'eyqjjp');
insert into T_LOGIN (login_id, mypassword, username)
values (7452, 'fmIL#1m+', 'ygkqgw');
insert into T_LOGIN (login_id, mypassword, username)
values (9144, 'QPg%(FL.', 'tkmlod');
insert into T_LOGIN (login_id, mypassword, username)
values (9102, '3l+]q75.', 'qwddoz');
insert into T_LOGIN (login_id, mypassword, username)
values (5278, '[ZQ/I6<>', 'wsyfmz');
insert into T_LOGIN (login_id, mypassword, username)
values (8731, 'GP5@]Id3', 'pbznvq');
insert into T_LOGIN (login_id, mypassword, username)
values (6506, '0X2pldB9', 'zlvzkl');
insert into T_LOGIN (login_id, mypassword, username)
values (5498, 'mwoUZof''', 'ylgfgv');
insert into T_LOGIN (login_id, mypassword, username)
values (8664, 'Z7*gCdxD', 'icylby');
insert into T_LOGIN (login_id, mypassword, username)
values (1247, 'u^0n7W-I', 'tnkmta');
insert into T_LOGIN (login_id, mypassword, username)
values (4835, ',-{~dg$M', 'ksdwgx');
insert into T_LOGIN (login_id, mypassword, username)
values (239, 'iB9&8Q%V', 'zdhoqr');
insert into T_LOGIN (login_id, mypassword, username)
values (3189, 'N{$N|qqu', 'dlxtxt');
insert into T_LOGIN (login_id, mypassword, username)
values (6108, '$F''>Bt+l', 'psxohk');
insert into T_LOGIN (login_id, mypassword, username)
values (9292, 'qpo{]@QP', 'guanfr');
insert into T_LOGIN (login_id, mypassword, username)
values (2597, 'N{cU9N*.', 'irxckh');
insert into T_LOGIN (login_id, mypassword, username)
values (3812, ':{=5@q~y', 'ycsgcp');
insert into T_LOGIN (login_id, mypassword, username)
values (4671, 'r''!&m''Bx', 'abtokr');
insert into T_LOGIN (login_id, mypassword, username)
values (4189, 'ird)kn(V', 'khutwm');
insert into T_LOGIN (login_id, mypassword, username)
values (9936, '\$s,&i^`', 'rnkiec');
insert into T_LOGIN (login_id, mypassword, username)
values (8936, 'dMjD^#_d', 'nugyji');
insert into T_LOGIN (login_id, mypassword, username)
values (7030, 'ROgEZjC*', 'hijpem');
insert into T_LOGIN (login_id, mypassword, username)
values (593, 'o[bT)ip*', 'cwataw');
insert into T_LOGIN (login_id, mypassword, username)
values (2186, '>}Dhebz8', 'gjnrpf');
insert into T_LOGIN (login_id, mypassword, username)
values (608, 'o_&w+3Mh', 'pysiwd');
insert into T_LOGIN (login_id, mypassword, username)
values (4249, '.Vibr<83', 'jdsigr');
commit;
prompt 600 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (9041, 'bH(l,KCe', 'yedgiu');
insert into T_LOGIN (login_id, mypassword, username)
values (5669, '7=fXbK)\', 'qviexy');
insert into T_LOGIN (login_id, mypassword, username)
values (7887, '''P8\=o-?', 'vwbxzd');
insert into T_LOGIN (login_id, mypassword, username)
values (6482, 'r0k8m\)G', 'mrsbrj');
insert into T_LOGIN (login_id, mypassword, username)
values (2222, '>uW9S3=b', 'yqgazk');
insert into T_LOGIN (login_id, mypassword, username)
values (8155, '}{{nV-qc', 'stzpzr');
insert into T_LOGIN (login_id, mypassword, username)
values (4815, '#7{d8(J2', 'sllbdn');
insert into T_LOGIN (login_id, mypassword, username)
values (8268, 'oEzivxjd', 'vrntfc');
insert into T_LOGIN (login_id, mypassword, username)
values (6909, ':4L=/S.N', 'oatrwm');
insert into T_LOGIN (login_id, mypassword, username)
values (1843, 'A!eO||1X', 'jourzu');
insert into T_LOGIN (login_id, mypassword, username)
values (67, 'gt9dzQ>a', 'zztilw');
insert into T_LOGIN (login_id, mypassword, username)
values (128, 'A(Gvz)U<', 'dugsge');
insert into T_LOGIN (login_id, mypassword, username)
values (3689, 'V.qWL2"k', 'rtfubq');
insert into T_LOGIN (login_id, mypassword, username)
values (6339, 'aJ''''L}-^', 'rzgvsf');
insert into T_LOGIN (login_id, mypassword, username)
values (8811, 'SD`cQlo-', 'kshybv');
insert into T_LOGIN (login_id, mypassword, username)
values (8927, '}baL<s~V', 'mhfcmr');
insert into T_LOGIN (login_id, mypassword, username)
values (4267, '{|%`riSp', 'bbjlcn');
insert into T_LOGIN (login_id, mypassword, username)
values (549, 'IYanQrN>', 'sedaic');
insert into T_LOGIN (login_id, mypassword, username)
values (6499, 'FYEtn+HJ', 'fbjotb');
insert into T_LOGIN (login_id, mypassword, username)
values (4965, 'vKGG*,[9', 'azaluo');
insert into T_LOGIN (login_id, mypassword, username)
values (3857, 'z(v"ALfz', 'jbwwwq');
insert into T_LOGIN (login_id, mypassword, username)
values (5390, 'S[h)Y4m_', 'qdoeqw');
insert into T_LOGIN (login_id, mypassword, username)
values (2717, '|9?FlA}6', 'izdrhu');
insert into T_LOGIN (login_id, mypassword, username)
values (3320, '(jcm`K$+', 'vprqby');
insert into T_LOGIN (login_id, mypassword, username)
values (5458, '7Q:,g?"M', 'oolnta');
insert into T_LOGIN (login_id, mypassword, username)
values (7098, '+BE68$5t', 'zhjocp');
insert into T_LOGIN (login_id, mypassword, username)
values (4316, '&NIN645$', 'tpfugz');
insert into T_LOGIN (login_id, mypassword, username)
values (1750, '`1.Lo1^K', 'xfwzeb');
insert into T_LOGIN (login_id, mypassword, username)
values (6133, 'k9S6]T6|', 'hnaptx');
insert into T_LOGIN (login_id, mypassword, username)
values (7879, '"WQO5_TP', 'togzjo');
insert into T_LOGIN (login_id, mypassword, username)
values (9981, 'f;zy*%z"', 'ugsoqr');
insert into T_LOGIN (login_id, mypassword, username)
values (4995, 'M65GFV!^', 'cjkccg');
insert into T_LOGIN (login_id, mypassword, username)
values (2573, 'OC3+dOjp', 'hqqouu');
insert into T_LOGIN (login_id, mypassword, username)
values (4423, 'ZMOahs5I', 'suerei');
insert into T_LOGIN (login_id, mypassword, username)
values (9766, 'A''I4_HQ<', 'ecjmti');
insert into T_LOGIN (login_id, mypassword, username)
values (5640, '=qL<eMj(', 'wpwdsy');
insert into T_LOGIN (login_id, mypassword, username)
values (6624, 'KL/WwBVm', 'qcrabb');
insert into T_LOGIN (login_id, mypassword, username)
values (6655, '&a}9C:%.', 'ncejdx');
insert into T_LOGIN (login_id, mypassword, username)
values (781, 'l*u(~x{1', 'wrstjf');
insert into T_LOGIN (login_id, mypassword, username)
values (2758, '#M~W&I<M', 'nzbvdb');
insert into T_LOGIN (login_id, mypassword, username)
values (5630, '2@L5nPog', 'vdqhmy');
insert into T_LOGIN (login_id, mypassword, username)
values (3832, 't?$>(oE^', 'rvbrls');
insert into T_LOGIN (login_id, mypassword, username)
values (5962, 'Z"RmMuH4', 'dfqgpc');
insert into T_LOGIN (login_id, mypassword, username)
values (8029, 'X:^okHX*', 'ohlkhe');
insert into T_LOGIN (login_id, mypassword, username)
values (7439, 'Fbg~2UZf', 'mbhxpi');
insert into T_LOGIN (login_id, mypassword, username)
values (9895, 'p:\;S-8R', 'rbjvdr');
insert into T_LOGIN (login_id, mypassword, username)
values (1265, 'K/jTV5m!', 'jcjutq');
insert into T_LOGIN (login_id, mypassword, username)
values (298, 'zuB/BnY(', 'slvvxe');
insert into T_LOGIN (login_id, mypassword, username)
values (521, 'VaNUgxw$', 'fkkrmt');
insert into T_LOGIN (login_id, mypassword, username)
values (9311, 'EA.{*8%@', 'ktlrvd');
insert into T_LOGIN (login_id, mypassword, username)
values (1676, ']1!8zc{A', 'phmodq');
insert into T_LOGIN (login_id, mypassword, username)
values (1450, 'Rrt8kN4a', 'wmxolj');
insert into T_LOGIN (login_id, mypassword, username)
values (7017, ')+YMn%qb', 'rqjxeq');
insert into T_LOGIN (login_id, mypassword, username)
values (2705, ']*A,H0YW', 'vrjqxr');
insert into T_LOGIN (login_id, mypassword, username)
values (2607, '{!80:8<M', 'zavaoy');
insert into T_LOGIN (login_id, mypassword, username)
values (4708, '/Nz:KVqh', 'dsqcaj');
insert into T_LOGIN (login_id, mypassword, username)
values (446, 'DjJou8eU', 'eplcsb');
insert into T_LOGIN (login_id, mypassword, username)
values (3961, 'D{+2c?pR', 'zwoytw');
insert into T_LOGIN (login_id, mypassword, username)
values (4576, 'M0ix''5~0', 'egcdou');
insert into T_LOGIN (login_id, mypassword, username)
values (784, 'b`+oG<~K', 'gxbxrm');
insert into T_LOGIN (login_id, mypassword, username)
values (483, 'w40O@;r}', 'hxcsrv');
insert into T_LOGIN (login_id, mypassword, username)
values (3614, '[086\~bA', 'uxwswx');
insert into T_LOGIN (login_id, mypassword, username)
values (9400, 'O?yWd5q\', 'sqwudf');
insert into T_LOGIN (login_id, mypassword, username)
values (8448, '1VsIAKe6', 'cdwpkh');
insert into T_LOGIN (login_id, mypassword, username)
values (1821, 'X[o;&nrB', 'utdncf');
insert into T_LOGIN (login_id, mypassword, username)
values (8217, 'lS>4jMwU', 'ebeufi');
insert into T_LOGIN (login_id, mypassword, username)
values (7903, 'P9wDK5V7', 'tpfxdc');
insert into T_LOGIN (login_id, mypassword, username)
values (506, 'F~s(}eQ5', 'bqyjtj');
insert into T_LOGIN (login_id, mypassword, username)
values (6674, 'm:|yGWSR', 'jelydl');
insert into T_LOGIN (login_id, mypassword, username)
values (5403, 'K(U[X%*g', 'tbrkjc');
insert into T_LOGIN (login_id, mypassword, username)
values (1213, ':"`FIp^|', 'nfvjci');
insert into T_LOGIN (login_id, mypassword, username)
values (388, '8]$C1spx', 'rhiwtu');
insert into T_LOGIN (login_id, mypassword, username)
values (7119, '|)euxL8w', 'lgcfiz');
insert into T_LOGIN (login_id, mypassword, username)
values (1764, 'TCyEzlZc', 'jvspdv');
insert into T_LOGIN (login_id, mypassword, username)
values (6919, 'sSf|r/up', 'anxute');
insert into T_LOGIN (login_id, mypassword, username)
values (7957, 'N2nfI[''.', 'jxzkui');
insert into T_LOGIN (login_id, mypassword, username)
values (5541, 'dYWpB=!U', 'icebew');
insert into T_LOGIN (login_id, mypassword, username)
values (7635, ':g(''A8if', 'xecorr');
insert into T_LOGIN (login_id, mypassword, username)
values (8712, '|GGw9WJ"', 'viizyi');
insert into T_LOGIN (login_id, mypassword, username)
values (1238, ',(\1,P5<', 'vqpfqq');
insert into T_LOGIN (login_id, mypassword, username)
values (7379, 'O4^/S^}q', 'cudpnm');
insert into T_LOGIN (login_id, mypassword, username)
values (4820, 'NGLIPdtF', 'swzujc');
insert into T_LOGIN (login_id, mypassword, username)
values (9527, 'y,YX]:<f', 'vapiju');
insert into T_LOGIN (login_id, mypassword, username)
values (3814, 'C;)*2F~{', 'dtrkfy');
insert into T_LOGIN (login_id, mypassword, username)
values (4821, '!cP&R''[9', 'qvruko');
insert into T_LOGIN (login_id, mypassword, username)
values (2417, '[+U8]^SM', 'szkwzi');
insert into T_LOGIN (login_id, mypassword, username)
values (1553, '6L2jthT,', 'aagblm');
insert into T_LOGIN (login_id, mypassword, username)
values (5364, '*hXZD|at', 'eljxeb');
insert into T_LOGIN (login_id, mypassword, username)
values (7351, 'l7X`_`C[', 'ytgump');
insert into T_LOGIN (login_id, mypassword, username)
values (3187, '={&S>[h@', 'wuiipw');
insert into T_LOGIN (login_id, mypassword, username)
values (1972, 'aAx?+o''g', 'pexgiy');
insert into T_LOGIN (login_id, mypassword, username)
values (9902, 'ydg,/n6,', 'ypuunq');
insert into T_LOGIN (login_id, mypassword, username)
values (2631, 'xJ1tgwrP', 'bgzbxj');
insert into T_LOGIN (login_id, mypassword, username)
values (8953, '!u$`.pj''', 'txtkym');
insert into T_LOGIN (login_id, mypassword, username)
values (7703, 'um!1%UAZ', 'aczfhr');
insert into T_LOGIN (login_id, mypassword, username)
values (6587, '[{tx=pm1', 'rkmjdb');
insert into T_LOGIN (login_id, mypassword, username)
values (8727, 'SC$^n^hi', 'bygogt');
insert into T_LOGIN (login_id, mypassword, username)
values (5924, '2v,-$:QV', 'vhsjzj');
insert into T_LOGIN (login_id, mypassword, username)
values (9540, 'Q!7`\[a"', 'acdejm');
insert into T_LOGIN (login_id, mypassword, username)
values (7696, '&:oskO;P', 'dfrmsm');
commit;
prompt 700 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (2595, '_a!>OEG+', 'ytbpws');
insert into T_LOGIN (login_id, mypassword, username)
values (3021, ')Nz"XWFn', 'kodnbs');
insert into T_LOGIN (login_id, mypassword, username)
values (6561, ']>RC*v$t', 'gdwwjx');
insert into T_LOGIN (login_id, mypassword, username)
values (9370, '4k4u(de_', 'bwxydq');
insert into T_LOGIN (login_id, mypassword, username)
values (865, 'K^<Yx>BZ', 'xvwrku');
insert into T_LOGIN (login_id, mypassword, username)
values (9261, '$-OV&Im@', 'lcadyj');
insert into T_LOGIN (login_id, mypassword, username)
values (9526, 'fFo_:7`-', 'evqonu');
insert into T_LOGIN (login_id, mypassword, username)
values (2914, 'cCREh8HU', 'pqwgat');
insert into T_LOGIN (login_id, mypassword, username)
values (6290, 'quDt*v=0', 'fgqxki');
insert into T_LOGIN (login_id, mypassword, username)
values (1203, 'N,k_n2}0', 'qmvkwh');
insert into T_LOGIN (login_id, mypassword, username)
values (3032, 'l~Hld2T/', 'fpqcbj');
insert into T_LOGIN (login_id, mypassword, username)
values (3932, '|:e:{2C`', 'nbfuvf');
insert into T_LOGIN (login_id, mypassword, username)
values (7065, 'i)4H.b~F', 'lzxire');
insert into T_LOGIN (login_id, mypassword, username)
values (5285, 'U[$9}NE=', 'tvapqw');
insert into T_LOGIN (login_id, mypassword, username)
values (238, 'Dt}FX\k\', 'xqapzy');
insert into T_LOGIN (login_id, mypassword, username)
values (1030, 's):S!QNH', 'sjhimk');
insert into T_LOGIN (login_id, mypassword, username)
values (5693, 'xR8Q94oP', 'dobszy');
insert into T_LOGIN (login_id, mypassword, username)
values (9410, '$t[fJiX9', 'ejouar');
insert into T_LOGIN (login_id, mypassword, username)
values (3085, '`icpVZLo', 'hwscve');
insert into T_LOGIN (login_id, mypassword, username)
values (845, '?l4M~6p}', 'abjvvf');
insert into T_LOGIN (login_id, mypassword, username)
values (3838, '.S&)t4?l', 'licrjq');
insert into T_LOGIN (login_id, mypassword, username)
values (2905, '4*Y(G7j/', 'nxaqws');
insert into T_LOGIN (login_id, mypassword, username)
values (1516, '+j8[g(<Z', 'fybqhu');
insert into T_LOGIN (login_id, mypassword, username)
values (5783, '&5oF8<$,', 'akxllj');
insert into T_LOGIN (login_id, mypassword, username)
values (2819, '''-c!+=$|', 'belmso');
insert into T_LOGIN (login_id, mypassword, username)
values (241, 'F}!IIg#q', 'hnmecp');
insert into T_LOGIN (login_id, mypassword, username)
values (4443, '`KPzfES4', 'xxschf');
insert into T_LOGIN (login_id, mypassword, username)
values (3795, 'LK2)P*sq', 'fmnerb');
insert into T_LOGIN (login_id, mypassword, username)
values (8144, 'pm5F9#bX', 'mpkggj');
insert into T_LOGIN (login_id, mypassword, username)
values (2911, 'FWCV&(Y^', 'nvbaoa');
insert into T_LOGIN (login_id, mypassword, username)
values (531, 'D"s+yO%U', 'uvqrar');
insert into T_LOGIN (login_id, mypassword, username)
values (8073, 'D(ZL*=~d', 'kfbjez');
insert into T_LOGIN (login_id, mypassword, username)
values (8432, '2>`Ubn=]', 'tbdgwv');
insert into T_LOGIN (login_id, mypassword, username)
values (2513, '^6lo:Bpk', 'reahrz');
insert into T_LOGIN (login_id, mypassword, username)
values (3672, 'W+`t^L3C', 'gwwtkh');
insert into T_LOGIN (login_id, mypassword, username)
values (3408, '6UN#3T8&', 'jpfjqw');
insert into T_LOGIN (login_id, mypassword, username)
values (4491, '*^G7L}vR', 'gljwpk');
insert into T_LOGIN (login_id, mypassword, username)
values (719, '\Ii\L_4K', 'wnoqaf');
insert into T_LOGIN (login_id, mypassword, username)
values (6162, 'q#/m3/|L', 'vtjvgf');
insert into T_LOGIN (login_id, mypassword, username)
values (3763, '00G,xOm6', 'rjxdlm');
insert into T_LOGIN (login_id, mypassword, username)
values (9358, '<0;vC{eS', 'qjjuxt');
insert into T_LOGIN (login_id, mypassword, username)
values (5885, 'H`Xf^W.Q', 'kfnvxd');
insert into T_LOGIN (login_id, mypassword, username)
values (4952, '@-&}`+cR', 'lbeoql');
insert into T_LOGIN (login_id, mypassword, username)
values (3843, 'FKRas7zM', 'nyzjlt');
insert into T_LOGIN (login_id, mypassword, username)
values (5797, 'UIj>+<9@', 'bfefve');
insert into T_LOGIN (login_id, mypassword, username)
values (3008, '%LNY&6F#', 'kxytsy');
insert into T_LOGIN (login_id, mypassword, username)
values (7642, '/*UZE<!{', 'cgmqsy');
insert into T_LOGIN (login_id, mypassword, username)
values (4567, 'f:8U)2uT', 'pfholc');
insert into T_LOGIN (login_id, mypassword, username)
values (9439, 'y,X8D<&u', 'agmmhw');
insert into T_LOGIN (login_id, mypassword, username)
values (4517, '[xk^5#_^', 'ktfttd');
insert into T_LOGIN (login_id, mypassword, username)
values (4463, '2Nu~rjtV', 'fecgow');
insert into T_LOGIN (login_id, mypassword, username)
values (6594, '17jaN-'';', 'iinelp');
insert into T_LOGIN (login_id, mypassword, username)
values (2451, '803v,9Gr', 'ehwkjw');
insert into T_LOGIN (login_id, mypassword, username)
values (6633, '|jxfq_(4', 'qllkrj');
insert into T_LOGIN (login_id, mypassword, username)
values (8360, '@kCo)FKV', 'jjwsix');
insert into T_LOGIN (login_id, mypassword, username)
values (7291, 'rEjlaWj_', 'wiwdxs');
insert into T_LOGIN (login_id, mypassword, username)
values (4330, 's0N{o8$n', 'mnceda');
insert into T_LOGIN (login_id, mypassword, username)
values (661, 'aVL-4JGx', 'ctnvvi');
insert into T_LOGIN (login_id, mypassword, username)
values (5473, 'oYem`''9C', 'jyyrgg');
insert into T_LOGIN (login_id, mypassword, username)
values (5884, '>XKNJRP,', 'etmcrd');
insert into T_LOGIN (login_id, mypassword, username)
values (5101, 'Un{#"o@c', 'hgznla');
insert into T_LOGIN (login_id, mypassword, username)
values (7417, ')ew0''/Ch', 'xvuqkg');
insert into T_LOGIN (login_id, mypassword, username)
values (2934, '0vyG|\~6', 'siiyok');
insert into T_LOGIN (login_id, mypassword, username)
values (77, 'qj\$cVR]', 'ywxwme');
insert into T_LOGIN (login_id, mypassword, username)
values (6461, 'XySADjQ"', 'dimqmf');
insert into T_LOGIN (login_id, mypassword, username)
values (4869, '%Nioh''x4', 'ywupgp');
insert into T_LOGIN (login_id, mypassword, username)
values (7867, 'kc93=80T', 'imypji');
insert into T_LOGIN (login_id, mypassword, username)
values (3742, 'JbzsS8Q8', 'faujyy');
insert into T_LOGIN (login_id, mypassword, username)
values (2647, 'hB[7~*N^', 'udufqa');
insert into T_LOGIN (login_id, mypassword, username)
values (2929, '#&z.n_wt', 'suclge');
insert into T_LOGIN (login_id, mypassword, username)
values (8032, 'ZXz>$*,K', 'dlqgpq');
insert into T_LOGIN (login_id, mypassword, username)
values (2160, '*T_jct>V', 'amlbzh');
insert into T_LOGIN (login_id, mypassword, username)
values (7407, 'KVXToINP', 'pnykqn');
insert into T_LOGIN (login_id, mypassword, username)
values (8469, '.?yuNt2/', 'azezcb');
insert into T_LOGIN (login_id, mypassword, username)
values (4691, 'E?mpI8zs', 'fjpfpf');
insert into T_LOGIN (login_id, mypassword, username)
values (3997, 'rc/X*(c2', 'muxqwv');
insert into T_LOGIN (login_id, mypassword, username)
values (4560, '_Zjar6d5', 'ylimmb');
insert into T_LOGIN (login_id, mypassword, username)
values (3937, 'N69g9q@`', 'pjpavl');
insert into T_LOGIN (login_id, mypassword, username)
values (5374, '7>UM`@S]', 'gxzknn');
insert into T_LOGIN (login_id, mypassword, username)
values (8310, '11B@[+ki', 'xkekoc');
insert into T_LOGIN (login_id, mypassword, username)
values (5286, 'G+!j`^?n', 'ewkbrh');
insert into T_LOGIN (login_id, mypassword, username)
values (7579, ';D1s"=_~', 'yuugaf');
insert into T_LOGIN (login_id, mypassword, username)
values (2952, 'Y?[ljoNs', 'juemxt');
insert into T_LOGIN (login_id, mypassword, username)
values (5915, '50*CO\U)', 'xemtvr');
insert into T_LOGIN (login_id, mypassword, username)
values (7675, '''*!j`%<l', 'rmewyo');
insert into T_LOGIN (login_id, mypassword, username)
values (654, '0mwf{/;{', 'ygeols');
insert into T_LOGIN (login_id, mypassword, username)
values (4673, 'Rx7>J<;=', 'fadpkg');
insert into T_LOGIN (login_id, mypassword, username)
values (5441, 'G.?@&+pD', 'seyibd');
insert into T_LOGIN (login_id, mypassword, username)
values (5974, '*4!2}T1k', 'qpqevo');
insert into T_LOGIN (login_id, mypassword, username)
values (6304, 'ovz^Vd2#', 'tjxwie');
insert into T_LOGIN (login_id, mypassword, username)
values (3567, 'Ja@-1SMa', 'lxcajz');
insert into T_LOGIN (login_id, mypassword, username)
values (4542, 'bM/Y$Kpa', 'usdnok');
insert into T_LOGIN (login_id, mypassword, username)
values (3024, 'U$.R8l5~', 'pcwdla');
insert into T_LOGIN (login_id, mypassword, username)
values (1556, 'IQH+_pNW', 'pmllvq');
insert into T_LOGIN (login_id, mypassword, username)
values (2899, 'eK8P46L%', 'xbhwaq');
insert into T_LOGIN (login_id, mypassword, username)
values (4303, 'GjoY>ePW', 'njgsgu');
insert into T_LOGIN (login_id, mypassword, username)
values (8631, '}+GjoG|R', 'ruzpvd');
insert into T_LOGIN (login_id, mypassword, username)
values (4187, 'z#CB%@Yt', 'qucpof');
insert into T_LOGIN (login_id, mypassword, username)
values (9840, 'B:IH`5e?', 'cywdkn');
insert into T_LOGIN (login_id, mypassword, username)
values (5824, 'isiT}^|5', 'tszisu');
commit;
prompt 800 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (7773, 'R$Q=%&$^', 'hiknkj');
insert into T_LOGIN (login_id, mypassword, username)
values (5528, '}mdK=O{,', 'xpihdo');
insert into T_LOGIN (login_id, mypassword, username)
values (8025, 'qGTXkj+^', 'icjslq');
insert into T_LOGIN (login_id, mypassword, username)
values (1503, 'lA''R7>hN', 'eevtgv');
insert into T_LOGIN (login_id, mypassword, username)
values (9109, 'ujkdh=Ap', 'vxansr');
insert into T_LOGIN (login_id, mypassword, username)
values (2074, 'X:gjUmh0', 'phrrzm');
insert into T_LOGIN (login_id, mypassword, username)
values (6052, 'rc>4xCc"', 'mzvuxa');
insert into T_LOGIN (login_id, mypassword, username)
values (8736, 'mn"3mbZp', 'yenqpa');
insert into T_LOGIN (login_id, mypassword, username)
values (1413, '%Nz{nLuW', 'apsrqq');
insert into T_LOGIN (login_id, mypassword, username)
values (3434, 'O''wIIHl:', 'bittty');
insert into T_LOGIN (login_id, mypassword, username)
values (6822, '$OB@7o:\', 'txopno');
insert into T_LOGIN (login_id, mypassword, username)
values (3833, 'uR%^XM+r', 'crmqjx');
insert into T_LOGIN (login_id, mypassword, username)
values (8651, 'H*@k&nYW', 'twakao');
insert into T_LOGIN (login_id, mypassword, username)
values (7768, 'QIH0!y>}', 'ydzzjk');
insert into T_LOGIN (login_id, mypassword, username)
values (6327, 'h,57Kvy<', 'ruvkfo');
insert into T_LOGIN (login_id, mypassword, username)
values (7488, '#L,~l)Mq', 'vylrey');
insert into T_LOGIN (login_id, mypassword, username)
values (808, 'D4:T_=Fb', 'mzpnzs');
insert into T_LOGIN (login_id, mypassword, username)
values (8582, '"0khr^Y2', 'ynltkh');
insert into T_LOGIN (login_id, mypassword, username)
values (1855, ',JdhnR|P', 'mzpbhs');
insert into T_LOGIN (login_id, mypassword, username)
values (9114, 'USA|0TA=', 'wygekx');
insert into T_LOGIN (login_id, mypassword, username)
values (9630, '8oIafn/7', 'aractj');
insert into T_LOGIN (login_id, mypassword, username)
values (8929, '-rUv4Z&F', 'qzaang');
insert into T_LOGIN (login_id, mypassword, username)
values (3057, 'eS-FZ0sI', 'aqzixf');
insert into T_LOGIN (login_id, mypassword, username)
values (3768, 'g=5rDCrz', 'kqlvnd');
insert into T_LOGIN (login_id, mypassword, username)
values (2725, '6LZdd|0G', 'obqsyt');
insert into T_LOGIN (login_id, mypassword, username)
values (2269, 'm]yugj#4', 'payfav');
insert into T_LOGIN (login_id, mypassword, username)
values (5036, '_.~|nNZ2', 'waefxe');
insert into T_LOGIN (login_id, mypassword, username)
values (662, '>xC;M<&I', 'ilizcf');
insert into T_LOGIN (login_id, mypassword, username)
values (8815, 'b/p\{FwJ', 'fifvhs');
insert into T_LOGIN (login_id, mypassword, username)
values (8290, '2IZVJL8O', 'cyfxqx');
insert into T_LOGIN (login_id, mypassword, username)
values (6464, '!X*|qIm(', 'lengmn');
insert into T_LOGIN (login_id, mypassword, username)
values (952, 'v8YwLE)u', 'ftjlwv');
insert into T_LOGIN (login_id, mypassword, username)
values (6650, 'ad7<nR.4', 'bjzyuo');
insert into T_LOGIN (login_id, mypassword, username)
values (4538, '@8<PBR[w', 'vhkfnl');
insert into T_LOGIN (login_id, mypassword, username)
values (2584, ']_I=g#9''', 'zzeizy');
insert into T_LOGIN (login_id, mypassword, username)
values (8292, 'GW>FI(a6', 'iypqem');
insert into T_LOGIN (login_id, mypassword, username)
values (5375, 'hUlXgW=$', 'vgiinu');
insert into T_LOGIN (login_id, mypassword, username)
values (3050, '%|q/cw[_', 'ppjlkp');
insert into T_LOGIN (login_id, mypassword, username)
values (5793, ']fI?_yp8', 'andwmw');
insert into T_LOGIN (login_id, mypassword, username)
values (5319, 'W{ceV~ZX', 'fgnfss');
insert into T_LOGIN (login_id, mypassword, username)
values (332, '$Aa(ft6o', 'mjkdnx');
insert into T_LOGIN (login_id, mypassword, username)
values (1990, 'Yy}JxsJ"', 'lsgugd');
insert into T_LOGIN (login_id, mypassword, username)
values (8, 'B<!X&tNq', 'cxyhzz');
insert into T_LOGIN (login_id, mypassword, username)
values (1766, '&k*.$rLp', 'lrnvgu');
insert into T_LOGIN (login_id, mypassword, username)
values (9155, 'nK:\e4aN', 'ggvzdu');
insert into T_LOGIN (login_id, mypassword, username)
values (8042, '"@egOrpa', 'nacpwc');
insert into T_LOGIN (login_id, mypassword, username)
values (5771, '0SBJ`[%}', 'jjhtnn');
insert into T_LOGIN (login_id, mypassword, username)
values (3802, 'D&)h-sU%', 'lfcghp');
insert into T_LOGIN (login_id, mypassword, username)
values (24, 'x/GIat1N', 'qdlrfk');
insert into T_LOGIN (login_id, mypassword, username)
values (2994, 'Fg_]luZ$', 'zxalxb');
insert into T_LOGIN (login_id, mypassword, username)
values (2049, 'ji&y*dEa', 'bxlluj');
insert into T_LOGIN (login_id, mypassword, username)
values (6005, '''u4y?JHi', 'dfqvtk');
insert into T_LOGIN (login_id, mypassword, username)
values (7425, 'Je^C/kdy', 'ohfkux');
insert into T_LOGIN (login_id, mypassword, username)
values (3327, '%Y$''w3GA', 'itxaey');
insert into T_LOGIN (login_id, mypassword, username)
values (5787, 'sD1ZT*j9', 'oznhvk');
insert into T_LOGIN (login_id, mypassword, username)
values (1268, '+=[XI,`o', 'qfyffx');
insert into T_LOGIN (login_id, mypassword, username)
values (3845, '8;{".kz0', 'invgxl');
insert into T_LOGIN (login_id, mypassword, username)
values (28, 'D|d<C{3B', 'twftsb');
insert into T_LOGIN (login_id, mypassword, username)
values (6036, 'xhd6Ew4G', 'sqgxqd');
insert into T_LOGIN (login_id, mypassword, username)
values (7203, '9OCM<za\', 'erlqze');
insert into T_LOGIN (login_id, mypassword, username)
values (404, ')uG&"B{l', 'gfoump');
insert into T_LOGIN (login_id, mypassword, username)
values (3804, '`"/EW$9-', 'jvkdgi');
insert into T_LOGIN (login_id, mypassword, username)
values (349, '*qzeN+3O', 'mtvwis');
insert into T_LOGIN (login_id, mypassword, username)
values (5222, '?}kt8^a3', 'vkjwcl');
insert into T_LOGIN (login_id, mypassword, username)
values (5778, 'jzJ*F+}u', 'wimmzq');
insert into T_LOGIN (login_id, mypassword, username)
values (4572, 'w]=YKYdJ', 'fccbjr');
insert into T_LOGIN (login_id, mypassword, username)
values (6843, '<y;-py|l', 'mnodvs');
insert into T_LOGIN (login_id, mypassword, username)
values (9742, 'rf7hF+u!', 'qtkdwy');
insert into T_LOGIN (login_id, mypassword, username)
values (9234, 'rb?m5$)(', 'utlxdw');
insert into T_LOGIN (login_id, mypassword, username)
values (260, '7&;1wtd$', 'nocywj');
insert into T_LOGIN (login_id, mypassword, username)
values (1376, 'xfx*A!b|', 'bzxhad');
insert into T_LOGIN (login_id, mypassword, username)
values (1985, '8/!{oc}b', 'tejjms');
insert into T_LOGIN (login_id, mypassword, username)
values (6470, ':.Skcvlg', 'dklkmh');
insert into T_LOGIN (login_id, mypassword, username)
values (2783, 'R#i%~mgU', 'lcnjqc');
insert into T_LOGIN (login_id, mypassword, username)
values (3911, 'Dv~25lA;', 'icjdqx');
insert into T_LOGIN (login_id, mypassword, username)
values (7933, 'j!!MY41x', 'qkjecs');
insert into T_LOGIN (login_id, mypassword, username)
values (998, '~v{~joIx', 'bbyaku');
insert into T_LOGIN (login_id, mypassword, username)
values (4031, 'euD$2R-p', 'igpyku');
insert into T_LOGIN (login_id, mypassword, username)
values (7824, 'Rf&|_[*X', 'ijhdrj');
insert into T_LOGIN (login_id, mypassword, username)
values (5518, 'M/Mw8@RQ', 'ypdgfw');
insert into T_LOGIN (login_id, mypassword, username)
values (5442, '~CM#B{&y', 'bhoxxt');
insert into T_LOGIN (login_id, mypassword, username)
values (3124, 'TY02Y_QN', 'ncxspe');
insert into T_LOGIN (login_id, mypassword, username)
values (6176, 'G4E}Jd@4', 'dqcqgq');
insert into T_LOGIN (login_id, mypassword, username)
values (3562, 'C,cDt@5w', 'xahxbt');
insert into T_LOGIN (login_id, mypassword, username)
values (2614, '%(32f`~v', 'kqgssz');
insert into T_LOGIN (login_id, mypassword, username)
values (4793, 'p81TWNN_', 'unimjf');
insert into T_LOGIN (login_id, mypassword, username)
values (7349, 'n;_LXm,T', 'cgczel');
insert into T_LOGIN (login_id, mypassword, username)
values (8974, 'EJvQr,v"', 'exvcce');
insert into T_LOGIN (login_id, mypassword, username)
values (7240, 'cS8H2xr''', 'qghbgz');
insert into T_LOGIN (login_id, mypassword, username)
values (7926, 'Pf$0nj.F', 'ivguml');
insert into T_LOGIN (login_id, mypassword, username)
values (3447, 'jr+"}N-8', 'hxkons');
insert into T_LOGIN (login_id, mypassword, username)
values (7820, '>6+!E!7o', 'fumfuj');
insert into T_LOGIN (login_id, mypassword, username)
values (6852, 'x&^L4`s#', 'fsvykv');
insert into T_LOGIN (login_id, mypassword, username)
values (7462, 's\FA>S8+', 'iozcyx');
insert into T_LOGIN (login_id, mypassword, username)
values (8925, '.<$C<sn|', 'zhbpwt');
insert into T_LOGIN (login_id, mypassword, username)
values (926, '(&P$)Ujl', 'dmjdpx');
insert into T_LOGIN (login_id, mypassword, username)
values (6483, '%Huu$(&$', 'ohjsov');
insert into T_LOGIN (login_id, mypassword, username)
values (1405, 'w]4tD3l5', 'meqrrn');
insert into T_LOGIN (login_id, mypassword, username)
values (47, 'w7Mw{.w0', 'etkxfy');
insert into T_LOGIN (login_id, mypassword, username)
values (4763, 'F+1^L0f7', 'lecfhy');
commit;
prompt 900 records committed...
insert into T_LOGIN (login_id, mypassword, username)
values (6676, 'XIz-?<Ke', 'ylkxgd');
insert into T_LOGIN (login_id, mypassword, username)
values (5954, 'st_:GFHt', 'tfmoch');
insert into T_LOGIN (login_id, mypassword, username)
values (5712, '&dfF.j|D', 'agsrkc');
insert into T_LOGIN (login_id, mypassword, username)
values (9178, '?3XW0:A<', 'bjxhfx');
insert into T_LOGIN (login_id, mypassword, username)
values (1625, '`mzL/JQ!', 'mcguck');
insert into T_LOGIN (login_id, mypassword, username)
values (5844, ':=EXRf4.', 'qujiku');
insert into T_LOGIN (login_id, mypassword, username)
values (8782, '+<+GXUQ=', 'zaybxq');
insert into T_LOGIN (login_id, mypassword, username)
values (7745, '5hY_t`{G', 'lipsrc');
insert into T_LOGIN (login_id, mypassword, username)
values (6225, 'W`23AAg?', 'rtjssl');
insert into T_LOGIN (login_id, mypassword, username)
values (4913, 'bA&=o6ZF', 'ebrgjl');
insert into T_LOGIN (login_id, mypassword, username)
values (3799, 'w"0fe|NJ', 'lcfddt');
insert into T_LOGIN (login_id, mypassword, username)
values (2452, '.9w%%IT;', 'mbtbyb');
insert into T_LOGIN (login_id, mypassword, username)
values (2351, 'b0Sp?S-3', 'nnbtah');
insert into T_LOGIN (login_id, mypassword, username)
values (815, 't''dr:hg&', 'qvosnd');
insert into T_LOGIN (login_id, mypassword, username)
values (6682, '9.I?Z>-h', 'yinehf');
insert into T_LOGIN (login_id, mypassword, username)
values (1298, '(%6:xYu(', 'swhmni');
insert into T_LOGIN (login_id, mypassword, username)
values (4608, 'R}h$L+G#', 'deitkf');
insert into T_LOGIN (login_id, mypassword, username)
values (8612, '+`(@uE[,', 'rjeymk');
insert into T_LOGIN (login_id, mypassword, username)
values (4361, 'O0w!byR_', 'gnhlms');
insert into T_LOGIN (login_id, mypassword, username)
values (8262, '(=Cd8!?V', 'xrrlbm');
insert into T_LOGIN (login_id, mypassword, username)
values (7833, 'ba}d1PPZ', 'difqag');
insert into T_LOGIN (login_id, mypassword, username)
values (3969, '+Dh,1aC7', 'insmaa');
insert into T_LOGIN (login_id, mypassword, username)
values (2179, '|;LI2z`p', 'fuymgc');
insert into T_LOGIN (login_id, mypassword, username)
values (9076, 'gYknIX[}', 'qrdpry');
insert into T_LOGIN (login_id, mypassword, username)
values (7264, 'XL$%(*4U', 'gznasl');
insert into T_LOGIN (login_id, mypassword, username)
values (7724, ']&J8hcO{', 'rsygij');
insert into T_LOGIN (login_id, mypassword, username)
values (3852, '=0baG*5m', 'mguvwf');
insert into T_LOGIN (login_id, mypassword, username)
values (6199, '=/%cK_,:', 'gdocwn');
insert into T_LOGIN (login_id, mypassword, username)
values (2800, 'yGN>)#EQ', 'dqnfrs');
insert into T_LOGIN (login_id, mypassword, username)
values (2708, 'We5jos4I', 'ytcwcm');
insert into T_LOGIN (login_id, mypassword, username)
values (5569, 'j+Ro7(f;', 'xtqcec');
insert into T_LOGIN (login_id, mypassword, username)
values (5245, '5zE~9rj^', 'tqqowm');
insert into T_LOGIN (login_id, mypassword, username)
values (1189, 'T!,Wd>o:', 'vovbeo');
insert into T_LOGIN (login_id, mypassword, username)
values (1810, 'Vg{\,bk;', 'ghzesh');
insert into T_LOGIN (login_id, mypassword, username)
values (3091, 'xE20^%ZJ', 'dgxlsc');
insert into T_LOGIN (login_id, mypassword, username)
values (219, 'EdH$f&CJ', 'zlctuc');
insert into T_LOGIN (login_id, mypassword, username)
values (1823, '#y)''@G[T', 'akjamo');
insert into T_LOGIN (login_id, mypassword, username)
values (9326, '7~b[>4*z', 'tjrgre');
insert into T_LOGIN (login_id, mypassword, username)
values (4756, 'tVfH3yc3', 'ipdfgh');
insert into T_LOGIN (login_id, mypassword, username)
values (5502, '`4MSTw"f', 'nfclwx');
insert into T_LOGIN (login_id, mypassword, username)
values (3945, 'Pk|E,j`[', 'syxdpu');
insert into T_LOGIN (login_id, mypassword, username)
values (1446, ';_jiRRy6', 'gpjpkm');
insert into T_LOGIN (login_id, mypassword, username)
values (2204, '>[Y:Wh#D', 'qrndii');
insert into T_LOGIN (login_id, mypassword, username)
values (9822, '4.%s.k&y', 'wytmjb');
insert into T_LOGIN (login_id, mypassword, username)
values (2872, 'NPWulEuD', 'bfqwri');
insert into T_LOGIN (login_id, mypassword, username)
values (2038, '9Og$lPIH', 'qofoyg');
insert into T_LOGIN (login_id, mypassword, username)
values (7114, 'O79jQL#Z', 'cagecg');
insert into T_LOGIN (login_id, mypassword, username)
values (7976, '+*QVjo6Y', 'qiedas');
insert into T_LOGIN (login_id, mypassword, username)
values (6913, '4-a8RiT)', 'pzbldx');
insert into T_LOGIN (login_id, mypassword, username)
values (1859, '@hSi91FG', 'kujttk');
insert into T_LOGIN (login_id, mypassword, username)
values (7208, 'kouN6`aN', 'jihtjd');
insert into T_LOGIN (login_id, mypassword, username)
values (7423, 'Egys\s-''', 'xiynaf');
insert into T_LOGIN (login_id, mypassword, username)
values (6932, '|-,YEMHs', 'dmzqgz');
insert into T_LOGIN (login_id, mypassword, username)
values (9487, 'z>m*86bA', 'dmvhcq');
insert into T_LOGIN (login_id, mypassword, username)
values (4393, 'UpCy+|QY', 'mvcvtj');
insert into T_LOGIN (login_id, mypassword, username)
values (6460, '4"#rERnQ', 'sfzrrl');
insert into T_LOGIN (login_id, mypassword, username)
values (5865, '\EC6\V5}', 'cicvkd');
insert into T_LOGIN (login_id, mypassword, username)
values (9419, '8i)a&xGL', 'xonwqd');
insert into T_LOGIN (login_id, mypassword, username)
values (2109, 'C4$4mNXp', 'zjldja');
insert into T_LOGIN (login_id, mypassword, username)
values (7193, '.~@C8Ww;', 'ixmiow');
insert into T_LOGIN (login_id, mypassword, username)
values (2251, 'RhL4xuAM', 'ekmjrm');
insert into T_LOGIN (login_id, mypassword, username)
values (3992, ';D\@Z#:k', 'mnotwu');
insert into T_LOGIN (login_id, mypassword, username)
values (5315, '#d2e3#GI', 'hoftbd');
commit;
prompt 963 records loaded
prompt Loading T_PERSON...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (11567543, to_date('04-07-1970', 'dd-mm-yyyy'), '0', 'Israel', 'itzik', 'cohen', 'itzik66@gmail.com', 587644732, null, 1012);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (501685919, to_date('03-11-1994', 'dd-mm-yyyy'), '0', 'USA', 'Taylor', 'Lerner', 'taylor@coridiantechnologies.com', 8700064091, '0', 2569);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (156320035, to_date('23-04-1960', 'dd-mm-yyyy'), '0', 'United Kingdom', 'John', 'DiBiasio', 'jdibiasio@aquascapedesigns.uk', 7264829357, '1', 3252);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (175882855, to_date('29-08-1972', 'dd-mm-yyyy'), '1', 'Germany', 'Pelvic', 'Bates', 'pbates@businessplus.de', 2853311305, '0', 4350);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (850208638, to_date('07-12-1971', 'dd-mm-yyyy'), '1', 'USA', 'Wayman', 'Bacon', 'wayman.bacon@toyotamotor.com', 454216548, '0', 3833);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (780893611, to_date('01-10-1984', 'dd-mm-yyyy'), '0', 'USA', 'Connie', 'Garber', 'connie.garber@priorityleasing.com', 8538426217, '0', 1410);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (571469738, to_date('16-11-1974', 'dd-mm-yyyy'), '1', 'Brazil', 'Amy', 'Furtado', 'amy.furtado@stonebrewing.br', 5869504690, '0', 5359);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (171485515, to_date('18-02-1975', 'dd-mm-yyyy'), '1', 'USA', 'Tilda', 'Herrmann', 'therrmann@north.com', 2666319154, '1', 4684);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (427129414, to_date('25-08-1974', 'dd-mm-yyyy'), '1', 'USA', 'Demi', 'Reed', 'demi.reed@usainstruments.com', 4415415790, '1', 2140);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (406869686, to_date('17-02-1988', 'dd-mm-yyyy'), '0', 'USA', 'Anjelica', 'Twilley', 'anjelica@aristotle.com', 1122042564, '0', 6666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (373991554, to_date('26-07-1958', 'dd-mm-yyyy'), '1', 'Germany', 'Rich', 'Kennedy', 'rkennedy@refinery.de', 1622079248, '0', 2898);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (328215969, to_date('14-02-1974', 'dd-mm-yyyy'), '1', 'Greece', 'Eileen', 'Zellweger', 'eileen.zellweger@inspirationsoftware.gr', 6339131969, '1', 3747);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (129082661, to_date('02-06-1973', 'dd-mm-yyyy'), '1', 'Norway', 'Malcolm', 'Womack', 'mwomack@dynacqinternational.no', 4657818047, '0', 2005);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (397224213, to_date('31-05-1968', 'dd-mm-yyyy'), '1', 'Japan', 'Patrick', 'Dorff', 'patrick.dorff@surmodics.jp', 4950910392, '1', 5877);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (138504593, to_date('29-08-1968', 'dd-mm-yyyy'), '0', 'USA', 'Emerson', 'Rifkin', 'emerson.rifkin@fpf.com', 4497512171, '0', 3297);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (21255181, to_date('01-09-1991', 'dd-mm-yyyy'), '0', 'USA', 'Marc', 'Henriksen', 'm.henriksen@yashtechnologies.com', 7439616443, '0', 1364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (687531632, to_date('19-03-1963', 'dd-mm-yyyy'), '1', 'South Africa', 'Machine', 'Wiest', 'machine.wiest@sps.za', 6460062505, '1', 1320);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (430853156, to_date('05-07-1977', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Jeffery', 'Kelly', 'jkelly@dell.uk', 9737776134, '1', 3276);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (557830684, to_date('04-03-1951', 'dd-mm-yyyy'), '0', 'USA', 'Ani', 'Armstrong', 'a.armstrong@pib.com', 9181985615, '0', 5899);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (878851707, to_date('08-03-1960', 'dd-mm-yyyy'), '1', 'Spain', 'Merrilee', 'Navarro', 'merrilee.navarro@stm.es', 1647880129, '0', 1556);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (502511956, to_date('18-01-1950', 'dd-mm-yyyy'), '1', 'USA', 'Rascal', 'Skerritt', 'rascal.skerritt@signalperfection.com', 8590113221, '0', 1495);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (282530990, to_date('19-10-1956', 'dd-mm-yyyy'), '1', 'Germany', 'Kay', 'Bachman', 'kay@tmt.de', 6723751483, '0', 4139);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (952766759, to_date('25-10-1950', 'dd-mm-yyyy'), '1', 'USA', 'Andrew', 'Giraldo', 'andrew.giraldo@intel.com', 3740387841, '0', 4423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (848439951, to_date('19-09-1972', 'dd-mm-yyyy'), '1', 'Australia', 'Percy', 'urban', 'percy.urban@tigris.au', 1954946688, '0', 4486);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (762134269, to_date('04-01-1991', 'dd-mm-yyyy'), '0', 'USA', 'Lili', 'Green', 'lili.green@teoco.com', 1878344804, '1', 3769);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (299408917, to_date('26-10-1962', 'dd-mm-yyyy'), '0', 'USA', 'Ike', 'Sartain', 'ike.sartain@americanpan.com', 654761192, '0', 4692);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (141413895, to_date('27-09-1963', 'dd-mm-yyyy'), '0', 'Italy', 'Xander', 'Clooney', 'xander.clooney@air.it', 2791385890, '1', 3805);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (362336904, to_date('09-12-1952', 'dd-mm-yyyy'), '0', 'Brazil', 'Lucy', 'Weisz', 'lucy.weisz@fpf.br', 8566060936, '0', 1666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (514863390, to_date('24-11-1960', 'dd-mm-yyyy'), '0', 'Brazil', 'Hilary', 'Greene', 'hilary.greene@globalwireless.br', 1472964430, '1', 5702);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (214948588, to_date('21-12-1956', 'dd-mm-yyyy'), '1', 'Canada', 'Tobey', 'Waits', 't.waits@fiberlink.ca', 9264171010, '1', 3016);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (313695281, to_date('23-04-1956', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Roberta', 'Tierney', 'robertat@tarragonrealty.uk', 1677956152, '1', 4350);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (117006325, to_date('07-02-1953', 'dd-mm-yyyy'), '0', 'Canada', 'Mitchell', 'Lewin', 'mitchell.lewin@clorox.ca', 214721590, '0', 1494);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (643139496, to_date('03-04-1952', 'dd-mm-yyyy'), '0', 'Brazil', 'Phil', 'Wainwright', 'phil.wainwright@coridiantechnologies.br', 8383131225, '1', 3886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (232196823, to_date('24-07-1995', 'dd-mm-yyyy'), '1', 'Germany', 'Isaac', 'Eat World', 'isaac@accesssystems.de', 6001430344, '0', 1829);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (893137759, to_date('09-04-1967', 'dd-mm-yyyy'), '0', 'Venezuela', 'Alfred', 'Neeson', 'alfred@zoneperfectnutrition.ve', 7183718024, '1', 4838);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (979499382, to_date('21-10-1991', 'dd-mm-yyyy'), '1', 'South Africa', 'Gin', 'Cook', 'gin.cook@anworthmortgage.za', 3578748637, '0', 3417);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (389087430, to_date('07-07-1971', 'dd-mm-yyyy'), '0', 'France', 'Courtney', 'Ness', 'c.ness@bowman.fr', 1805104569, '1', 2063);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (291702607, to_date('20-12-1958', 'dd-mm-yyyy'), '1', 'Israel', 'Heath', 'White', 'hwhite@pra.il', 7055463046, '1', 5380);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (776393658, to_date('19-11-1998', 'dd-mm-yyyy'), '0', 'Poland', 'Machine', 'Visnjic', 'm.visnjic@pragmatechsoftware.pl', 9396620255, '1', 1572);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (698238033, to_date('07-08-1960', 'dd-mm-yyyy'), '1', 'USA', 'Gwyneth', 'Tierney', 'gwyneth.tierney@calence.com', 9428377803, '1', 2349);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (132149962, to_date('15-06-1954', 'dd-mm-yyyy'), '0', 'USA', 'Caroline', 'McCabe', 'c.mccabe@sht.com', 5223118963, '0', 4377);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (163382403, to_date('10-09-1957', 'dd-mm-yyyy'), '1', 'Switzerland', 'Colin', 'Bullock', 'colin.bullock@enterprise.ch', 6710481379, '0', 5706);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (612167438, to_date('17-09-1991', 'dd-mm-yyyy'), '0', 'Switzerland', 'Stanley', 'Dupree', 'stanley.dupree@volkswagen.ch', 5671513113, '0', 2305);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (831938411, to_date('20-08-1979', 'dd-mm-yyyy'), '1', 'Canada', 'Junior', 'Herrmann', 'junior@pharmacia.ca', 4087939690, '0', 5276);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (538650012, to_date('17-01-1989', 'dd-mm-yyyy'), '0', 'USA', 'Fairuza', 'Sinatra', 'fairuza.s@officedepot.com', 3230497738, '1', 2077);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (671720922, to_date('18-01-1997', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Dave', 'Reid', 'dreid@esteelauder.uk', 3555269231, '1', 4004);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (841342496, to_date('14-08-1983', 'dd-mm-yyyy'), '0', 'Spain', 'Denzel', 'Jackson', 'denzel.jackson@universalsolutions.es', 3638128462, '0', 3364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (116189643, to_date('05-11-1985', 'dd-mm-yyyy'), '1', 'Japan', 'Jarvis', 'Rivers', 'jarvis@glmt.jp', 8762018259, '0', 2409);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (936219903, to_date('30-07-1985', 'dd-mm-yyyy'), '0', 'China', 'Rebeka', 'Neuwirth', 'rebeka.neuwirth@philipmorris.cn', 868202918, '0', 4760);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (288568737, to_date('18-11-1959', 'dd-mm-yyyy'), '1', 'Germany', 'Leo', 'Flatts', 'leo.flatts@interfacesoftware.de', 3898450378, '0', 4834);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (775663247, to_date('12-11-1956', 'dd-mm-yyyy'), '1', 'Russia', 'Frances', 'Chambers', 'frances.chambers@tastefullysimple.com', 6785094407, '0', 4617);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (575598580, to_date('21-04-1972', 'dd-mm-yyyy'), '0', 'USA', 'Samuel', 'Ball', 'samuel.ball@prometheuslaboratories.com', 8495636914, '0', 6302);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (575689560, to_date('21-08-1953', 'dd-mm-yyyy'), '0', 'USA', 'Jon', 'Russell', 'jon.russell@oriservices.com', 7070261001, '1', 3304);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (596481708, to_date('10-09-1956', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Jamie', 'James', 'jamie.james@gha.uk', 1450596638, '1', 5126);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (958891004, to_date('09-09-1997', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Wang', 'Weaving', 'wang.weaving@httprint.uk', 4040520072, '1', 6996);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (840484058, to_date('07-01-1991', 'dd-mm-yyyy'), '0', 'France', 'Wayman', 'Palminteri', 'wayman.palminteri@newtoninteractive.fr', 4021006494, '0', 5238);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (353591134, to_date('23-06-1985', 'dd-mm-yyyy'), '0', 'Estonia', 'Corey', 'Balaban', 'corey.b@digitalmotorworks.ee', 385321721, '0', 6614);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (354236443, to_date('20-11-1972', 'dd-mm-yyyy'), '1', 'Netherlands', 'Sammy', 'Branch', 'sammy.b@isd.nl', 5933543135, '0', 3567);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (37137233, to_date('25-07-1973', 'dd-mm-yyyy'), '1', 'South Africa', 'Lou', 'Allen', 'lou.allen@mastercardinternational.za', 9906753433, '1', 5787);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (602696842, to_date('25-10-1986', 'dd-mm-yyyy'), '0', 'USA', 'Radney', 'Holiday', 'radney.holiday@unicru.com', 7085900383, '1', 4843);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (779038849, to_date('17-05-1968', 'dd-mm-yyyy'), '0', 'Spain', 'Yaphet', 'Farina', 'yaphet.farina@fds.es', 7092979871, '0', 5151);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (575669471, to_date('14-09-1981', 'dd-mm-yyyy'), '1', 'Canada', 'Howie', 'Wells', 'howie@servicesource.ca', 7738433280, '0', 4708);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (223483440, to_date('27-12-1987', 'dd-mm-yyyy'), '1', 'France', 'Roy', 'Bale', 'royb@mls.fr', 9901480140, '0', 3537);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (846911139, to_date('01-07-1991', 'dd-mm-yyyy'), '0', 'USA', 'Anne', 'Sisto', 'anne.sisto@fordmotor.com', 5283118181, '1', 2865);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (678646514, to_date('27-10-1982', 'dd-mm-yyyy'), '0', 'Turkey', 'Viggo', 'Thewlis', 'viggo.t@nike.tr', 5585151105, '1', 6137);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (44780938, to_date('13-02-1967', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Stevie', 'Easton', 'seaston@intraspheretechnologies.uk', 7771539175, '0', 5777);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (389701906, to_date('04-12-1991', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Sissy', 'Luongo', 'sissy.luongo@pharmacia.uk', 3669358246, '0', 3907);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (502980286, to_date('12-06-1956', 'dd-mm-yyyy'), '1', 'Japan', 'Eliza', 'Tarantino', 'eliza.tarantino@ogi.jp', 8103317186, '1', 1970);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (623672419, to_date('16-06-1991', 'dd-mm-yyyy'), '1', 'Australia', 'Delroy', 'Carr', 'delroy.carr@mag.au', 3618286103, '1', 5291);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (540790271, to_date('04-03-1966', 'dd-mm-yyyy'), '0', 'USA', 'Hazel', 'Vaughan', 'hvaughan@swp.com', 5813908611, '1', 3027);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (213871319, to_date('30-04-1998', 'dd-mm-yyyy'), '0', 'Sweden', 'Andy', 'Pesci', 'andy.pesci@infovision.se', 9127546415, '0', 6721);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (527159202, to_date('22-11-1994', 'dd-mm-yyyy'), '0', 'USA', 'Diamond', 'Mazzello', 'diamond@newmedia.com', 1458014611, '0', 1494);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (743632375, to_date('10-06-1994', 'dd-mm-yyyy'), '0', 'USA', 'Rolando', 'Tobolowsky', 'rolando.tobolowsky@paintedword.com', 2562412887, '0', 5222);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (302378344, to_date('19-06-1962', 'dd-mm-yyyy'), '0', 'Germany', 'Denny', 'Gold', 'denny.gold@unit.de', 5711906974, '0', 6924);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (512542257, to_date('30-11-1953', 'dd-mm-yyyy'), '1', 'Brazil', 'Sissy', 'Glover', 'sissy.glover@egroup.br', 3710626093, '0', 5975);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (404462383, to_date('19-04-1984', 'dd-mm-yyyy'), '0', 'Spain', 'Larry', 'Burmester', 'l.burmester@eagleone.es', 8077789029, '1', 4723);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (596346881, to_date('30-07-1971', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Kenny', 'Sinatra', 'kenny.sinatra@kiamotors.uk', 3605738929, '1', 6774);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (307946918, to_date('24-11-1954', 'dd-mm-yyyy'), '1', 'USA', 'Sigourney', 'Postlethwaite', 'sigourney.postlethwaite@fiberlink.com', 2944154999, '0', 5343);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (171893572, to_date('15-06-1967', 'dd-mm-yyyy'), '0', 'USA', 'Hal', 'Danger', 'hal.danger@sunstream.com', 5889136724, '1', 6415);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (808461981, to_date('27-02-1987', 'dd-mm-yyyy'), '1', 'Italy', 'Taye', 'Lachey', 'taye.lachey@randomwalk.it', 2273925659, '1', 1666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (240442844, to_date('08-01-1999', 'dd-mm-yyyy'), '1', 'USA', 'Faye', 'Merchant', 'fayem@nrae.com', 94845933, '1', 5161);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (892027305, to_date('13-02-1993', 'dd-mm-yyyy'), '1', 'Germany', 'Ceili', 'Kelly', 'ceili@deutschetelekom.de', 3040170770, '0', 5238);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (529530747, to_date('06-03-1959', 'dd-mm-yyyy'), '1', 'USA', 'Ming-Na', 'Kirkwood', 'mingna.k@usphysicaltherapy.com', 2897566325, '1', 6867);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (24237879, to_date('27-10-1976', 'dd-mm-yyyy'), '0', 'Germany', 'Ricky', 'Vega', 'ricky.v@boldtechsystems.de', 2501589664, '1', 1405);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (649314876, to_date('19-01-1977', 'dd-mm-yyyy'), '0', 'Canada', 'First', 'Perry', 'firstp@seafoxboat.ca', 1194943954, '0', 2513);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (717572318, to_date('02-07-1958', 'dd-mm-yyyy'), '0', 'USA', 'Patricia', 'Smith', 'patricias@conquestsystems.com', 8894039, '1', 4247);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (131057422, to_date('16-06-1968', 'dd-mm-yyyy'), '1', 'France', 'Johnette', 'Sharp', 'johnette.sharp@grt.fr', 7411279641, '1', 4859);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (671802660, to_date('21-12-1999', 'dd-mm-yyyy'), '0', 'UAE', 'Christian', 'Purefoy', 'christian.purefoy@marathonheater.com', 1667079954, '0', 1130);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (435238298, to_date('01-05-1967', 'dd-mm-yyyy'), '1', 'USA', 'Alfie', 'Stevens', 'alfie.stevens@atlanticnet.com', 1214996668, '1', 3840);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (644400698, to_date('06-01-1954', 'dd-mm-yyyy'), '1', 'USA', 'Franco', 'Atkins', 'franco@nha.com', 9369283773, '1', 1614);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (13472556, to_date('17-10-1978', 'dd-mm-yyyy'), '0', 'Italy', 'Charlton', 'Prinze', 'charlton@pinnaclestaffing.it', 256745312, '1', 4388);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (401753959, to_date('17-02-1950', 'dd-mm-yyyy'), '0', 'USA', 'Sissy', 'Stiller', 'sissy.stiller@campbellsoup.com', 6112486372, '0', 4274);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (191950422, to_date('25-12-1961', 'dd-mm-yyyy'), '1', 'Italy', 'Elle', 'Hyde', 'elle.hyde@cimalabs.it', 5270520888, '1', 4963);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (883433879, to_date('27-04-1986', 'dd-mm-yyyy'), '0', 'USA', 'Chrissie', 'Fox', 'cfox@sysconmedia.com', 8828251992, '1', 2449);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (676903422, to_date('15-09-1990', 'dd-mm-yyyy'), '1', 'Australia', 'Wesley', 'Cage', 'wesley.cage@tilsonhr.au', 5477986172, '0', 3297);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (599069342, to_date('23-08-1971', 'dd-mm-yyyy'), '1', 'USA', 'Lisa', 'Stanton', 'lstanton@magnet.com', 8110598312, '1', 2261);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (179941315, to_date('23-01-1958', 'dd-mm-yyyy'), '1', 'USA', 'Cornell', 'Dalley', 'c.dalley@mms.com', 8859805102, '0', 1237);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (412638135, to_date('27-10-1978', 'dd-mm-yyyy'), '0', 'USA', 'Sander', 'Archer', 'sarcher@priorityexpress.com', 4804814798, '0', 3805);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (47191242, to_date('03-07-1978', 'dd-mm-yyyy'), '0', 'Germany', 'Katrin', 'Koteas', 'katrin@virbac.de', 9941877232, '1', 2025);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (864979636, to_date('27-05-1963', 'dd-mm-yyyy'), '0', 'USA', 'Belinda', 'O''Donnell', 'belinda@paintedword.com', 3683895168, '0', 3029);
commit;
prompt 100 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (868369091, to_date('23-11-1975', 'dd-mm-yyyy'), '1', 'Germany', 'Rosanna', 'Cleese', 'rosanna@stiknowledge.de', 5494040593, '0', 2701);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (985010904, to_date('10-04-1969', 'dd-mm-yyyy'), '1', 'USA', 'Tramaine', 'Cozier', 'tramaine.cozier@gapinc.com', 2785245175, '1', 6002);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (326148792, to_date('11-04-1998', 'dd-mm-yyyy'), '1', 'USA', 'Kitty', 'Garfunkel', 'kgarfunkel@sps.com', 9335283446, '0', 5975);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (155204525, to_date('31-03-1958', 'dd-mm-yyyy'), '0', 'USA', 'Jamie', 'Diffie', 'jamie.diffie@unilever.com', 3350475905, '0', 5710);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (136214326, to_date('28-11-1957', 'dd-mm-yyyy'), '1', 'USA', 'Shannon', 'Thurman', 'shannon.t@americanvanguard.com', 3520849566, '1', 5161);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (897568944, to_date('16-01-1993', 'dd-mm-yyyy'), '0', 'USA', 'Chalee', 'Mitchell', 'chalee.mitchell@avs.com', 3464390178, '1', 3376);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (505401723, to_date('06-06-1961', 'dd-mm-yyyy'), '1', 'USA', 'Eugene', 'Ratzenberger', 'eugene.ratzenberger@bigyanksports.com', 8595267825, '1', 4594);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (177324837, to_date('29-12-1953', 'dd-mm-yyyy'), '0', 'Germany', 'Laura', 'James', 'lauraj@adeasolutions.de', 6978262945, '0', 1811);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (395615914, to_date('02-06-1988', 'dd-mm-yyyy'), '0', 'Germany', 'Jesse', 'Burns', 'jesse.burns@randomwalk.de', 1960266310, '0', 4092);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (689480825, to_date('16-01-1976', 'dd-mm-yyyy'), '0', 'USA', 'Jodie', 'Banderas', 'j.banderas@usenergyservices.com', 3631270066, '0', 4100);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (806065549, to_date('07-04-1975', 'dd-mm-yyyy'), '1', 'USA', 'Kasey', 'Lorenz', 'kasey.lorenz@savela.com', 4593806565, '1', 4443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (869085171, to_date('30-03-1972', 'dd-mm-yyyy'), '0', 'USA', 'Marianne', 'Woodard', 'marianne.w@fmb.com', 5692694717, '1', 3335);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (634292761, to_date('08-07-1997', 'dd-mm-yyyy'), '1', 'USA', 'Edward', 'McNarland', 'edward@capellaeducation.com', 4760905587, '0', 4945);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (925369589, to_date('02-04-1982', 'dd-mm-yyyy'), '1', 'Belgium', 'Garland', 'Lopez', 'garland.lopez@operationaltechnologies.be', 6322348653, '1', 5161);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (814567204, to_date('09-11-1964', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Marley', 'Patrick', 'marley.patrick@pepsico.uk', 7414487583, '0', 3283);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (47630222, to_date('21-11-1999', 'dd-mm-yyyy'), '0', 'USA', 'Naomi', 'Costner', 'naomi@savela.com', 6920725376, '0', 5717);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (417860818, to_date('23-11-1977', 'dd-mm-yyyy'), '0', 'USA', 'Tony', 'Crimson', 'tony@abatix.com', 3168500904, '1', 2679);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (143483779, to_date('28-07-1966', 'dd-mm-yyyy'), '0', 'Japan', 'Wendy', 'Carnes', 'wendy.carnes@enterprise.jp', 1019352266, '1', 4555);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (808048348, to_date('25-04-1990', 'dd-mm-yyyy'), '1', 'USA', 'Luke', 'Romijn-Stamos', 'luke.r@venoco.com', 4737315240, '1', 4807);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (617322269, to_date('15-03-1963', 'dd-mm-yyyy'), '1', 'USA', 'Freda', 'Northam', 'freda.n@mls.com', 865095415, '0', 4274);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (526104280, to_date('29-11-1980', 'dd-mm-yyyy'), '0', 'USA', 'Miguel', 'Lawrence', 'miguel.lawrence@ibfh.com', 5313416323, '1', 2111);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (852921403, to_date('17-10-1977', 'dd-mm-yyyy'), '1', 'Italy', 'Melba', 'Womack', 'melba@providentbancorp.it', 9642166114, '0', 5512);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (790966222, to_date('16-09-1974', 'dd-mm-yyyy'), '0', 'USA', 'Sydney', 'Whitwam', 'sydney@kingland.com', 4295867369, '0', 2945);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (225173392, to_date('03-10-1973', 'dd-mm-yyyy'), '1', 'USA', 'Miles', 'Randal', 'm.randal@waltdisney.com', 6868982143, '0', 6232);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (79983652, to_date('14-01-1962', 'dd-mm-yyyy'), '0', 'Brazil', 'Gabrielle', 'Day', 'gabrielle.day@progressivedesigns.br', 9231598907, '1', 1039);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (65515116, to_date('16-02-1953', 'dd-mm-yyyy'), '0', 'France', 'Crystal', 'Berenger', 'crystal.berenger@montpelierplastics.fr', 9433617863, '0', 6976);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (34115922, to_date('13-12-1958', 'dd-mm-yyyy'), '1', 'USA', 'Clarence', 'Levin', 'clevin@atxforms.com', 2106346436, '1', 1093);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (321278802, to_date('08-04-1965', 'dd-mm-yyyy'), '1', 'USA', 'Thelma', 'Amos', 'thelma.amos@nat.com', 6357759755, '1', 5590);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (619112219, to_date('27-03-1960', 'dd-mm-yyyy'), '0', 'Netherlands', 'Jesus', 'O''Sullivan', 'j.osullivan@reckittbenckiser.nl', 2043686414, '1', 2598);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (409780338, to_date('19-02-1970', 'dd-mm-yyyy'), '1', 'USA', 'Nickel', 'Overstreet', 'noverstreet@shot.com', 4716322877, '1', 6364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (578812172, to_date('27-06-1950', 'dd-mm-yyyy'), '0', 'Germany', 'Helen', 'Elizondo', 'helen.elizondo@medsource.de', 8727900815, '1', 2370);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (306697254, to_date('28-09-1992', 'dd-mm-yyyy'), '1', 'South Africa', 'Bo', 'Epps', 'bo.epps@uem.za', 7176142107, '1', 6128);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (526039048, to_date('12-05-1967', 'dd-mm-yyyy'), '1', 'Germany', 'Armand', 'Fonda', 'armand@capitalbank.de', 7618315529, '0', 1682);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (454311433, to_date('26-09-1959', 'dd-mm-yyyy'), '0', 'Hungary', 'Rachael', 'Chaplin', 'rachaelc@ois.hu', 6379669380, '1', 5969);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (352230381, to_date('12-02-1983', 'dd-mm-yyyy'), '0', 'USA', 'Derrick', 'Webb', 'derrick.webb@cima.com', 4643601662, '1', 1556);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (839391806, to_date('05-06-1974', 'dd-mm-yyyy'), '1', 'Netherlands', 'Johnny', 'Savage', 'johnny.savage@marlabs.nl', 9817962088, '0', 4169);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (914599740, to_date('17-12-1962', 'dd-mm-yyyy'), '1', 'USA', 'Jarvis', 'Bentley', 'jarvis.b@hitechpharmacal.com', 4651776269, '1', 5805);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (442966152, to_date('28-06-1989', 'dd-mm-yyyy'), '1', 'USA', 'Marie', 'Russell', 'marie.russell@portosan.com', 9045119970, '0', 5484);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (427932335, to_date('26-12-1998', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Ruth', 'Jay', 'ruth.jay@idas.uk', 6409059571, '1', 4368);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (691270337, to_date('14-06-1979', 'dd-mm-yyyy'), '1', 'Argentina', 'Gena', 'Pastore', 'gena@saksinc.ar', 6425994632, '1', 3031);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (717022349, to_date('29-03-1955', 'dd-mm-yyyy'), '1', 'USA', 'Chet', 'Brickell', 'c.brickell@keith.com', 2758865944, '1', 2839);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (67146646, to_date('03-11-1999', 'dd-mm-yyyy'), '1', 'USA', 'Nile', 'Stone', 'nile@alogent.com', 2116514129, '0', 6498);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (321352288, to_date('22-09-1958', 'dd-mm-yyyy'), '0', 'Spain', 'Jennifer', 'Robards', 'jennifer.robards@mwh.es', 2381924784, '1', 5551);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (423055848, to_date('23-11-1954', 'dd-mm-yyyy'), '1', 'Germany', 'Curtis', 'Hagerty', 'curtis@millersystems.de', 98395768, '1', 2156);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (474990753, to_date('15-04-1988', 'dd-mm-yyyy'), '1', 'Germany', 'Ann', 'Presley', 'a.presley@hencie.de', 9342785857, '0', 4573);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (161820212, to_date('22-02-1978', 'dd-mm-yyyy'), '0', 'Japan', 'Jude', 'Stuart', 'j.stuart@peerlessmanufacturing.jp', 491643246, '0', 5359);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (223229665, to_date('04-03-1952', 'dd-mm-yyyy'), '1', 'Japan', 'Meryl', 'Connelly', 'meryl.connelly@studiobproductions.jp', 1563215983, '1', 3248);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (102611069, to_date('18-04-1991', 'dd-mm-yyyy'), '0', 'Italy', 'Busta', 'Carrack', 'busta.carrack@fnb.it', 6966463358, '0', 4196);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (736437841, to_date('09-04-1989', 'dd-mm-yyyy'), '1', 'Switzerland', 'Caroline', 'Boorem', 'caroline@baesch.ch', 3145051829, '0', 5816);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (260820201, to_date('15-10-1960', 'dd-mm-yyyy'), '1', 'USA', 'Tcheky', 'Cube', 'tcheky@procter.com', 6129709699, '0', 6462);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (672578428, to_date('18-05-1964', 'dd-mm-yyyy'), '1', 'USA', 'Molly', 'Kane', 'molly.k@qssgroup.com', 7378344885, '1', 5844);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (498584540, to_date('29-10-1973', 'dd-mm-yyyy'), '0', 'Japan', 'Burton', 'Larter', 'burton.larter@procurementcentre.jp', 2053134476, '0', 5674);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (977770753, to_date('13-07-1998', 'dd-mm-yyyy'), '1', 'USA', 'Lauren', 'Gates', 'lauren.gates@its.com', 5282498401, '0', 6543);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (987898465, to_date('01-06-1956', 'dd-mm-yyyy'), '1', 'USA', 'Sandra', 'Schwarzenegger', 'sschwarzenegger@scjohnson.com', 3201644742, '1', 2513);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28976685, to_date('11-12-1980', 'dd-mm-yyyy'), '1', 'Russia', 'Udo', 'Applegate', 'uapplegate@kroger.com', 3757251501, '1', 2929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (523569954, to_date('24-12-1963', 'dd-mm-yyyy'), '1', 'Germany', 'Stevie', 'Sledge', 'stevie.sledge@pis.de', 7344365381, '0', 1617);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (349686039, to_date('28-02-1973', 'dd-mm-yyyy'), '0', 'Germany', 'Julia', 'Quatro', 'julia.quatro@microtek.de', 9085675670, '0', 6029);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (752768811, to_date('09-10-1983', 'dd-mm-yyyy'), '0', 'Germany', 'Denzel', 'Ruffalo', 'denzel.ruffalo@tmaresources.de', 7013927165, '0', 5200);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (853140494, to_date('28-12-1973', 'dd-mm-yyyy'), '1', 'Germany', 'Kazem', 'Peet', 'kazem.peet@servicesource.de', 69441943, '0', 6774);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (530455970, to_date('15-05-1951', 'dd-mm-yyyy'), '0', 'Canada', 'Collective', 'Gallant', 'c.gallant@dataprise.ca', 1282926947, '1', 6848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (165036905, to_date('08-11-1980', 'dd-mm-yyyy'), '0', 'Hungary', 'Marie', 'Cale', 'marie@integramedamerica.hu', 5327073882, '0', 3840);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (664143015, to_date('24-05-1976', 'dd-mm-yyyy'), '1', 'Liechtenstein', 'Elizabeth', 'Lavigne', 'elizabeth.lavigne@lifelinesystems.li', 4375563050, '0', 6468);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (122249616, to_date('12-05-1967', 'dd-mm-yyyy'), '0', 'Hungary', 'Chuck', 'Caldwell', 'chuck.caldwell@dvdt.hu', 773530018, '0', 2408);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (883557530, to_date('14-08-1987', 'dd-mm-yyyy'), '0', 'USA', 'Suzy', 'Sawa', 'suzy.sawa@pis.com', 5845881724, '1', 2941);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (164512237, to_date('26-04-1989', 'dd-mm-yyyy'), '0', 'Austria', 'Remy', 'Yulin', 'remy@componentgraphics.at', 4480471910, '0', 1864);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (491696811, to_date('07-02-1959', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Faye', 'Shorter', 'faye.shorter@kingland.uk', 123388870, '0', 5430);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (708004214, to_date('11-07-1980', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Darren', 'Greene', 'darren.greene@ghrsystems.uk', 3941296456, '0', 5152);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (27897124, to_date('26-06-1993', 'dd-mm-yyyy'), '1', 'Portugal', 'Brendan', 'Carlisle', 'brendan.carlisle@bashen.pt', 5055218438, '1', 3714);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (405205825, to_date('14-04-1966', 'dd-mm-yyyy'), '1', 'USA', 'Kay', 'Shawn', 'kay.shawn@qls.com', 7374308385, '1', 3991);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (965361915, to_date('28-12-1954', 'dd-mm-yyyy'), '1', 'USA', 'Burt', 'Wells', 'burt.wells@lindin.com', 1020790265, '0', 4800);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (47560822, to_date('19-09-1995', 'dd-mm-yyyy'), '1', 'Sweden', 'Seth', 'Navarro', 'seth.navarro@neogen.se', 7567613134, '0', 2663);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (898245728, to_date('16-07-1970', 'dd-mm-yyyy'), '1', 'Chile', 'Harry', 'Wheel', 'harry@integratelecom.cl', 1473735426, '0', 6159);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (6422923, to_date('17-01-1988', 'dd-mm-yyyy'), '1', 'Japan', 'Jay', 'Cantrell', 'j.cantrell@astafunding.jp', 9804396896, '0', 3833);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (98961186, to_date('28-02-1982', 'dd-mm-yyyy'), '1', 'USA', 'Cole', 'Isaak', 'cisaak@pacificdatadesigns.com', 9467546509, '0', 4237);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (698523022, to_date('09-05-1966', 'dd-mm-yyyy'), '0', 'South Africa', 'Simon', 'Kattan', 'simonk@savela.za', 206318024, '0', 4468);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (770896120, to_date('23-10-1980', 'dd-mm-yyyy'), '0', 'USA', 'Stellan', 'Biel', 'stellan.biel@tigris.com', 9859557713, '1', 5200);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (817158818, to_date('07-09-1980', 'dd-mm-yyyy'), '0', 'USA', 'Angela', 'Crosby', 'angela.crosby@manhattanassociates.com', 59465545, '0', 3554);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (517356629, to_date('26-01-1966', 'dd-mm-yyyy'), '1', 'USA', 'Jaime', 'Avital', 'jaime.avital@idas.com', 6188427315, '0', 6778);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (470365890, to_date('31-08-1994', 'dd-mm-yyyy'), '0', 'USA', 'Rick', 'Polley', 'rick.polley@grayhawksystems.com', 130640672, '1', 2491);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (665061512, to_date('04-03-1950', 'dd-mm-yyyy'), '1', 'Hungary', 'Eileen', 'Horton', 'eileenh@sunstream.hu', 93302494, '1', 2083);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (993193605, to_date('28-05-1970', 'dd-mm-yyyy'), '0', 'USA', 'Anne', 'Campbell', 'anne.campbell@ait.com', 409301291, '0', 6633);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (165838793, to_date('06-08-1981', 'dd-mm-yyyy'), '0', 'USA', 'Andrea', 'Berkley', 'andreab@americanhealthways.com', 3831104578, '1', 1036);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (471721028, to_date('14-04-1977', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Lonnie', 'Harrelson', 'lonnie.harrelson@anworthmortgage.uk', 7664550943, '0', 3929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798969507, to_date('07-04-1980', 'dd-mm-yyyy'), '0', 'Netherlands', 'Derrick', 'Himmelman', 'derrick@mavericktechnologies.nl', 4262123734, '1', 3918);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (142387265, to_date('24-05-1950', 'dd-mm-yyyy'), '1', 'USA', 'Vin', 'Janssen', 'vjanssen@bedfordbancshares.com', 6944420165, '0', 6765);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (379741969, to_date('29-08-1984', 'dd-mm-yyyy'), '1', 'Germany', 'Darren', 'Watson', 'darren.watson@hewlettpackard.de', 8692384127, '1', 5374);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (536963200, to_date('24-10-1987', 'dd-mm-yyyy'), '0', 'USA', 'Spike', 'Mirren', 's.mirren@eagleone.com', 2452581477, '1', 4441);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (594866531, to_date('11-01-1957', 'dd-mm-yyyy'), '0', 'Germany', 'Jann', 'Moffat', 'jann.moffat@usainstruments.de', 6253693307, '0', 4808);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (342217122, to_date('01-05-1950', 'dd-mm-yyyy'), '0', 'Japan', 'Yolanda', 'Davidson', 'yolanda.davidson@apexsystems.jp', 9497780694, '1', 2592);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (18001638, to_date('25-11-1978', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Aida', 'Holmes', 'aida.holmes@coadvantageresources.uk', 2793594625, '1', 3074);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (180290197, to_date('28-12-1992', 'dd-mm-yyyy'), '0', 'USA', 'Angie', 'Carrere', 'angie.c@team.com', 6188040300, '1', 4120);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (528666377, to_date('10-12-1969', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Merillee', 'Reed', 'merillee.reed@cws.uk', 6255066883, '1', 1614);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (194521550, to_date('25-07-1980', 'dd-mm-yyyy'), '0', 'Italy', 'Armand', 'Vassar', 'armand.vassar@avs.it', 9293707896, '0', 5999);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (878797144, to_date('26-02-1979', 'dd-mm-yyyy'), '0', 'USA', 'Stockard', 'Broadbent', 'stockard.broadbent@computersource.com', 2544637335, '1', 3240);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (182758742, to_date('08-10-1956', 'dd-mm-yyyy'), '0', 'USA', 'Nicolas', 'Frampton', 'nicolas.frampton@lydiantrust.com', 648152513, '1', 4700);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (878235068, to_date('12-03-1967', 'dd-mm-yyyy'), '0', 'Italy', 'Jena', 'Murphy', 'jenam@hatworld.it', 7465280566, '1', 2927);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (677625098, to_date('07-09-1996', 'dd-mm-yyyy'), '1', 'USA', 'Bret', 'Byrd', 'bret@hencie.com', 7782899670, '0', 4092);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (127557518, to_date('14-05-1991', 'dd-mm-yyyy'), '0', 'Spain', 'Brooke', 'Davison', 'brooke.davison@paintedword.es', 3701869916, '1', 6666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (438933900, to_date('04-05-1977', 'dd-mm-yyyy'), '1', 'Switzerland', 'Loretta', 'Dafoe', 'ldafoe@nuinfosystems.ch', 388065789, '1', 6569);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (437440300, to_date('30-03-1986', 'dd-mm-yyyy'), '0', 'Germany', 'Giovanni', 'Weaving', 'gweaving@investmentscorecard.de', 515532479, '1', 6217);
commit;
prompt 200 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (919708284, to_date('18-11-1971', 'dd-mm-yyyy'), '0', 'USA', 'Henry', 'Ranger', 'henry.ranger@lindin.com', 6918350891, '0', 3712);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (980929831, to_date('26-05-1988', 'dd-mm-yyyy'), '0', 'France', 'Helen', 'McGowan', 'helen.mcgowan@bat.fr', 8682705349, '0', 4362);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (661748604, to_date('28-07-1995', 'dd-mm-yyyy'), '0', 'USA', 'Goldie', 'Dysart', 'goldie.dysart@educationaldevelopment.com', 6981773157, '1', 5272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (538395539, to_date('24-09-1971', 'dd-mm-yyyy'), '1', 'USA', 'Raymond', 'Fiorentino', 'raymond.f@tastefullysimple.com', 2706621638, '1', 5452);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (955895609, to_date('21-08-1956', 'dd-mm-yyyy'), '0', 'Russia', 'Anna', 'Reno', 'a.reno@americanhealthways.com', 7413175829, '1', 3805);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (368300931, to_date('28-12-1990', 'dd-mm-yyyy'), '0', 'USA', 'Hugo', 'Carrack', 'hugo.c@seafoxboat.com', 8518995093, '1', 5246);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (420391903, to_date('31-03-1999', 'dd-mm-yyyy'), '1', 'Switzerland', 'Liquid', 'Portman', 'l.portman@caliber.ch', 3686891223, '1', 2408);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (836977722, to_date('22-04-1967', 'dd-mm-yyyy'), '1', 'Canada', 'Neve', 'Finn', 'neve.finn@wendysinternational.ca', 5812032970, '1', 2116);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (761955533, to_date('02-09-1976', 'dd-mm-yyyy'), '0', 'USA', 'Vickie', 'Ingram', 'vingram@egroup.com', 5137399810, '0', 2547);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (398882116, to_date('11-08-1966', 'dd-mm-yyyy'), '0', 'USA', 'Rufus', 'David', 'rufus.david@gillette.com', 2978348032, '1', 3502);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (602233968, to_date('04-02-1969', 'dd-mm-yyyy'), '1', 'Germany', 'Kate', 'Palminteri', 'katep@ctg.de', 5885919865, '1', 6654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (835542648, to_date('30-09-1952', 'dd-mm-yyyy'), '1', 'Netherlands', 'Ritchie', 'Nelligan', 'ritchie.nelligan@swi.nl', 4256610830, '1', 2370);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (52559559, to_date('26-06-1985', 'dd-mm-yyyy'), '0', 'France', 'Morgan', 'McDowall', 'mmcdowall@fflcbancorp.fr', 9901137880, '0', 2637);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (68625488, to_date('11-11-1991', 'dd-mm-yyyy'), '0', 'USA', 'Leon', 'Rubinek', 'lrubinek@capitolbancorp.com', 8838625253, '1', 2491);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (325800509, to_date('02-07-1963', 'dd-mm-yyyy'), '0', 'Germany', 'Balthazar', 'Phillippe', 'balthazar@idlabel.de', 5495527249, '0', 6132);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (601693990, to_date('10-09-1990', 'dd-mm-yyyy'), '1', 'Canada', 'Caroline', 'Adkins', 'caroline.adkins@ppr.ca', 4897902837, '0', 1676);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (791718734, to_date('18-09-1994', 'dd-mm-yyyy'), '0', 'Australia', 'Shannon', 'Womack', 's.womack@alohanysystems.au', 3209092319, '0', 1638);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (83621082, to_date('29-10-1987', 'dd-mm-yyyy'), '0', 'Switzerland', 'Kirk', 'Loggins', 'kirk@sweetproductions.ch', 9412836377, '1', 3525);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (278093265, to_date('10-01-1988', 'dd-mm-yyyy'), '1', 'Canada', 'Rebeka', 'Chappelle', 'r.chappelle@aristotle.ca', 4636367924, '0', 3712);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (679838738, to_date('31-01-1974', 'dd-mm-yyyy'), '1', 'USA', 'Fisher', 'Parsons', 'fisher.parsons@innovativelighting.com', 8982294197, '0', 1286);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (210647303, to_date('25-07-1965', 'dd-mm-yyyy'), '1', 'USA', 'Debra', 'Portman', 'debra.portman@kis.com', 8598893799, '1', 3320);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (115513077, to_date('03-07-1980', 'dd-mm-yyyy'), '1', 'USA', 'Jeremy', 'Salt', 'jeremy.salt@swi.com', 6628585389, '0', 3712);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (488289931, to_date('15-11-1979', 'dd-mm-yyyy'), '1', 'USA', 'Nicolas', 'Atkinson', 'nicolas.atkinson@elmco.com', 1626964684, '1', 3663);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (601987393, to_date('16-09-1951', 'dd-mm-yyyy'), '0', 'Germany', 'Treat', 'Bridges', 'treat.bridges@prosperitybancshares.de', 1238714211, '0', 1565);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (569605356, to_date('09-01-1969', 'dd-mm-yyyy'), '1', 'USA', 'Derek', 'Clooney', 'derek@spas.com', 508772487, '0', 6431);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (769918199, to_date('04-05-1962', 'dd-mm-yyyy'), '1', 'Brazil', 'Hookah', 'Red', 'hookah.red@albertsons.br', 9091455365, '1', 6731);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28580269, to_date('27-05-1992', 'dd-mm-yyyy'), '1', 'USA', 'Kenny', 'Tate', 'kennyt@mls.com', 9634332642, '0', 3476);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (228440865, to_date('13-07-1967', 'dd-mm-yyyy'), '1', 'Ecuador', 'William', 'Sweet', 'william.s@bioreference.ec', 2962286953, '0', 2885);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (148716685, to_date('29-02-1980', 'dd-mm-yyyy'), '1', 'USA', 'Rachael', 'Ford', 'rachael.ford@seafoxboat.com', 8003161320, '0', 5231);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (987551316, to_date('26-10-1959', 'dd-mm-yyyy'), '0', 'Germany', 'Minnie', 'Hewett', 'minnie.hewett@fns.de', 4426528177, '0', 4409);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (466215492, to_date('06-02-1964', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Al', 'Fogerty', 'al.fogerty@naturescure.uk', 7364881176, '0', 2254);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (214802310, to_date('22-03-1977', 'dd-mm-yyyy'), '0', 'Germany', 'Edwin', 'Law', 'edwinl@pepsico.de', 6885137286, '0', 3063);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (888802268, to_date('05-12-1991', 'dd-mm-yyyy'), '1', 'USA', 'Vondie', 'Wood', 'vondiew@gapinc.com', 8553314190, '1', 4054);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (898697027, to_date('01-02-1991', 'dd-mm-yyyy'), '0', 'USA', 'Amy', 'Epps', 'a.epps@perfectorder.com', 4223903192, '0', 4684);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (747140664, to_date('17-06-1985', 'dd-mm-yyyy'), '1', 'USA', 'Glen', 'Rucker', 'glen.rucker@afs.com', 2269397945, '0', 1546);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (855725801, to_date('28-11-1977', 'dd-mm-yyyy'), '0', 'Australia', 'Jill', 'Myers', 'j.myers@typhoon.au', 9453366527, '1', 5068);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (205292471, to_date('05-10-1962', 'dd-mm-yyyy'), '0', 'USA', 'Edward', 'Moore', 'edward.moore@greene.com', 5916783840, '1', 3747);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (752892019, to_date('15-01-1964', 'dd-mm-yyyy'), '1', 'Canada', 'Donal', 'Metcalf', 'donal@invisioncom.ca', 5051325854, '1', 6973);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (464333938, to_date('26-04-1954', 'dd-mm-yyyy'), '0', 'Sweden', 'Goran', 'Bosco', 'goranb@dillards.se', 2162074099, '0', 5013);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (184094915, to_date('03-05-1975', 'dd-mm-yyyy'), '1', 'Canada', 'Sharon', 'Ranger', 'sharon@restaurantpartners.ca', 6480613764, '0', 5270);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (555705026, to_date('27-10-1964', 'dd-mm-yyyy'), '1', 'USA', 'Gord', 'Carter', 'gord.carter@drinkmorewater.com', 1861226333, '0', 5397);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (558957187, to_date('22-06-1993', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Grant', 'Morales', 'grant.morales@trainersoft.uk', 4526707892, '1', 2947);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (583935022, to_date('27-06-1969', 'dd-mm-yyyy'), '1', 'Japan', 'Katrin', 'Craig', 'katrin.c@extremepizza.jp', 6597258808, '0', 3637);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (803570285, to_date('31-03-1978', 'dd-mm-yyyy'), '0', 'Denmark', 'Jackson', 'Matthau', 'jackson.matthau@sds.dk', 3893244757, '1', 2757);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (840974912, to_date('25-11-1958', 'dd-mm-yyyy'), '1', 'USA', 'Burt', 'Stanley', 'bstanley@dillards.com', 3916040364, '1', 2449);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (185285450, to_date('14-04-1975', 'dd-mm-yyyy'), '1', 'Germany', 'Toni', 'Mills', 'toni.mills@quakercitybancorp.de', 180910475, '0', 2924);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (776553463, to_date('17-06-1989', 'dd-mm-yyyy'), '0', 'Switzerland', 'Sally', 'Newton', 'sally.newton@staffone.ch', 2502327509, '1', 2305);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (616532234, to_date('25-01-1952', 'dd-mm-yyyy'), '0', 'Japan', 'Lynette', 'Ferrer', 'lynette.f@trc.jp', 2736856708, '0', 2272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (923799060, to_date('12-07-1984', 'dd-mm-yyyy'), '0', 'Austria', 'Gabriel', 'Dale', 'gabriel.dale@marketbased.at', 2760683671, '1', 1808);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (34758503, to_date('07-01-1960', 'dd-mm-yyyy'), '1', 'Germany', 'Laura', 'Berry', 'laurab@staffforce.de', 5082248829, '0', 6584);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (787968155, to_date('02-06-1976', 'dd-mm-yyyy'), '1', 'Brazil', 'Dean', 'Frakes', 'dfrakes@viacom.br', 4459035329, '1', 6753);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (13161459, to_date('03-09-1995', 'dd-mm-yyyy'), '0', 'South Korea', 'Patti', 'Stevenson', 'pstevenson@veritekinternational.com', 716349662, '1', 6472);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (237215392, to_date('15-11-1992', 'dd-mm-yyyy'), '0', 'Sweden', 'Goldie', 'Gagnon', 'g.gagnon@aco.se', 8777233178, '0', 6413);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (660062386, to_date('14-01-1954', 'dd-mm-yyyy'), '0', 'Germany', 'Willie', 'Nolte', 'willie@kroger.de', 1662767126, '1', 1873);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (192740549, to_date('18-03-1981', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Sam', 'Danes', 'sam@providenceservice.uk', 8834164052, '0', 1271);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (57663453, to_date('19-07-1987', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Sarah', 'Darren', 'sarah.darren@mavericktechnologies.uk', 2878969155, '1', 1880);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (807701622, to_date('03-06-1956', 'dd-mm-yyyy'), '0', 'Australia', 'Freddy', 'Weston', 'freddy.w@nuinfosystems.au', 7470219905, '0', 3994);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (365761192, to_date('24-12-1981', 'dd-mm-yyyy'), '1', 'USA', 'Bette', 'Hughes', 'bette.hughes@afs.com', 5031464817, '0', 3984);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (999812370, to_date('03-07-1978', 'dd-mm-yyyy'), '0', 'Switzerland', 'Miko', 'Furtado', 'miko.furtado@viacom.ch', 5970426172, '1', 4938);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (656478880, to_date('29-07-1961', 'dd-mm-yyyy'), '0', 'France', 'Chubby', 'Miles', 'chubby@sysconmedia.fr', 1776764858, '1', 4080);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (667744703, to_date('22-09-1956', 'dd-mm-yyyy'), '1', 'USA', 'Omar', 'Mazar', 'omar.m@universalsolutions.com', 3610540991, '1', 5664);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (482808741, to_date('31-03-1993', 'dd-mm-yyyy'), '0', 'USA', 'Elle', 'Loggia', 'ellel@qestrel.com', 5027099615, '1', 2947);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (567797424, to_date('05-09-1976', 'dd-mm-yyyy'), '0', 'USA', 'Martha', 'Nunn', 'm.nunn@eastmankodak.com', 5098662749, '1', 1796);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (549026294, to_date('19-08-1979', 'dd-mm-yyyy'), '1', 'Belgium', 'Garland', 'Supernaw', 'garland.supernaw@gci.be', 5408778193, '1', 4747);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (886133186, to_date('13-11-1978', 'dd-mm-yyyy'), '0', 'South Korea', 'Graham', 'Alda', 'graham@caliber.com', 3664849685, '0', 2115);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (426941201, to_date('13-06-1965', 'dd-mm-yyyy'), '0', 'Hong Kong', 'Kimberly', 'Mann', 'kimberly.mann@nike.hk', 6494399981, '1', 3322);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (196232957, to_date('30-05-1964', 'dd-mm-yyyy'), '1', 'USA', 'Julia', 'David', 'julia@alohanysystems.com', 1114980635, '1', 2990);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (472672065, to_date('18-07-1962', 'dd-mm-yyyy'), '0', 'USA', 'Raymond', 'Morales', 'raymond.morales@keith.com', 7002809478, '1', 5001);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (786074731, to_date('15-06-1960', 'dd-mm-yyyy'), '0', 'USA', 'Sarah', 'Lynne', 'sarah.l@socketinternet.com', 1488665587, '0', 4131);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (884223446, to_date('18-03-1990', 'dd-mm-yyyy'), '1', 'USA', 'Ashton', 'Byrd', 'ashton.byrd@gci.com', 7076907517, '1', 3166);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (689307848, to_date('09-01-1997', 'dd-mm-yyyy'), '1', 'USA', 'Laura', 'Blossoms', 'laura.blossoms@gltg.com', 455814204, '1', 4070);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (23271309, to_date('12-09-1978', 'dd-mm-yyyy'), '1', 'Australia', 'Steven', 'Creek', 'steven.creek@valleyoaksystems.au', 4107007157, '1', 1937);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (192821117, to_date('19-10-1972', 'dd-mm-yyyy'), '1', 'USA', 'Rowan', 'Farrow', 'rowanf@bioanalytical.com', 3449378397, '0', 4195);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (847634472, to_date('23-07-1954', 'dd-mm-yyyy'), '1', 'USA', 'Steven', 'Farrow', 'steven.farrow@wendysinternational.com', 8524215518, '0', 4628);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (374884388, to_date('01-08-1992', 'dd-mm-yyyy'), '0', 'Germany', 'Diane', 'Cattrall', 'diane@tigris.de', 9224028760, '1', 6254);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (594572587, to_date('06-01-1963', 'dd-mm-yyyy'), '0', 'USA', 'Freddie', 'Swinton', 'fswinton@merck.com', 2597657610, '1', 5291);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (176402735, to_date('28-08-1953', 'dd-mm-yyyy'), '0', 'Brazil', 'Andrew', 'Briscoe', 'andrew@ass.br', 895934969, '1', 6767);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (370882403, to_date('05-01-1956', 'dd-mm-yyyy'), '0', 'Japan', 'Howard', 'Jessee', 'howard.jessee@columbiabancorp.jp', 3477891114, '1', 5454);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (610672166, to_date('28-03-1965', 'dd-mm-yyyy'), '1', 'South Africa', 'Toni', 'Black', 'toni.b@horizonorganic.za', 6784776108, '1', 5585);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (788406258, to_date('01-05-1992', 'dd-mm-yyyy'), '1', 'Japan', 'Elias', 'Warden', 'elias.warden@pra.jp', 6619725464, '0', 2451);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (386738770, to_date('11-06-1988', 'dd-mm-yyyy'), '0', 'USA', 'Jim', 'Perez', 'jim.perez@hondamotor.com', 8194028029, '1', 6973);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (71906005, to_date('09-03-1962', 'dd-mm-yyyy'), '1', 'USA', 'Caroline', 'Kleinenberg', 'caroline.kleinenberg@totalentertainment.com', 3003786417, '1', 5512);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (35107778, to_date('15-07-1993', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Geraldine', 'Oates', 'goates@providentbancorp.uk', 3224127088, '0', 3937);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (494104746, to_date('12-08-1960', 'dd-mm-yyyy'), '0', 'Netherlands', 'Debby', 'Moraz', 'debby.moraz@computersource.nl', 8878785311, '0', 3138);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (972323091, to_date('05-09-1990', 'dd-mm-yyyy'), '1', 'Germany', 'David', 'Harrelson', 'david.harrelson@sfb.de', 4076983182, '1', 3554);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (63369106, to_date('24-05-1978', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Marc', 'Hampton', 'marc.hampton@mission.uk', 6898148019, '0', 4120);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (750701273, to_date('14-12-1953', 'dd-mm-yyyy'), '0', 'China', 'Fisher', 'Coyote', 'fisher.coyote@ataservices.cn', 7346100428, '0', 4697);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (185828204, to_date('16-02-1954', 'dd-mm-yyyy'), '1', 'Israel', 'Mekhi', 'Phifer', 'mekhi.p@fns.il', 9766212973, '1', 2937);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (731371362, to_date('08-11-1950', 'dd-mm-yyyy'), '1', 'Netherlands', 'Don', 'Camp', 'don.camp@base.nl', 8034772504, '1', 6228);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28766297, to_date('20-09-1951', 'dd-mm-yyyy'), '0', 'Italy', 'Jonathan', 'Norton', 'jonathan.norton@pinnaclestaffing.it', 6166232735, '1', 4945);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (594915334, to_date('03-04-1998', 'dd-mm-yyyy'), '1', 'USA', 'Jarvis', 'Lindo', 'jarvis@campbellsoup.com', 7289782257, '0', 5452);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (292627409, to_date('25-10-1973', 'dd-mm-yyyy'), '1', 'Japan', 'Russell', 'Thorton', 'russell@kis.jp', 3483145717, '1', 4443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (879402393, to_date('25-07-1973', 'dd-mm-yyyy'), '1', 'Australia', 'Goran', 'Rauhofer', 'goran.r@y2marketing.au', 5348173412, '1', 5200);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (693119387, to_date('24-12-1970', 'dd-mm-yyyy'), '0', 'USA', 'Stephanie', 'Stone', 'stephanie@nbs.com', 1412275268, '0', 5775);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (66769881, to_date('05-02-1983', 'dd-mm-yyyy'), '1', 'USA', 'Tanya', 'Rivers', 'tanyar@johnkeeler.com', 6802692457, '1', 1443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (418377085, to_date('01-02-1986', 'dd-mm-yyyy'), '1', 'Germany', 'Dermot', 'Callow', 'dermot.callow@fsffinancial.de', 3918457774, '1', 3672);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (531168009, to_date('30-04-1950', 'dd-mm-yyyy'), '0', 'USA', 'Selma', 'Assante', 'selma.assante@trinityhomecare.com', 6539076357, '1', 1172);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (235159122, to_date('05-08-1971', 'dd-mm-yyyy'), '1', 'USA', 'Vondie', 'Barkin', 'vondie.barkin@trx.com', 9779815132, '1', 6396);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (329044279, to_date('24-05-1956', 'dd-mm-yyyy'), '0', 'USA', 'Judy', 'Marshall', 'jmarshall@businessplus.com', 5284876726, '0', 3579);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (22804196, to_date('19-10-1985', 'dd-mm-yyyy'), '0', 'Austria', 'Fionnula', 'Bragg', 'fionnula@ghrsystems.at', 3969957851, '0', 3669);
commit;
prompt 300 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (253395626, to_date('27-04-1973', 'dd-mm-yyyy'), '0', 'Germany', 'Ernest', 'Sedgwick', 'ernest.sedgwick@multimedialive.de', 227467043, '0', 4871);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (132407046, to_date('16-07-1954', 'dd-mm-yyyy'), '0', 'Spain', 'Tim', 'Broadbent', 'tim.broadbent@career.es', 4546463515, '0', 6446);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (448417429, to_date('18-10-1968', 'dd-mm-yyyy'), '0', 'USA', 'Malcolm', 'Weaver', 'malcolm.weaver@lms.com', 8509341778, '1', 4195);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (605231468, to_date('19-03-1980', 'dd-mm-yyyy'), '0', 'USA', 'Thelma', 'Holliday', 'thelma.holliday@swi.com', 2727511073, '1', 5990);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (316308731, to_date('14-07-1973', 'dd-mm-yyyy'), '1', 'USA', 'Cyndi', 'Bradford', 'cyndi.bradford@monarchcasino.com', 2675885312, '1', 5276);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (421436721, to_date('20-11-1966', 'dd-mm-yyyy'), '1', 'USA', 'Hilton', 'Ponce', 'h.ponce@air.com', 9047232303, '1', 2143);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (273138001, to_date('28-08-1983', 'dd-mm-yyyy'), '1', 'Brazil', 'Nastassja', 'Stevens', 'nstevens@philipmorris.br', 9561134632, '1', 5956);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (460741436, to_date('13-05-1996', 'dd-mm-yyyy'), '1', 'Italy', 'Emm', 'Brooke', 'emm.brooke@kelmooreinvestment.it', 2587396936, '0', 4092);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (450635154, to_date('29-12-1995', 'dd-mm-yyyy'), '1', 'Brazil', 'Josh', 'Wilder', 'jwilder@linersdirect.br', 5819289363, '0', 4818);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (148853737, to_date('01-05-1970', 'dd-mm-yyyy'), '0', 'USA', 'Randy', 'Murray', 'randy.murray@venoco.com', 7175469321, '1', 3406);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (589271463, to_date('25-07-1970', 'dd-mm-yyyy'), '0', 'Germany', 'Tramaine', 'Rollins', 't.rollins@evergreenresources.de', 7276485429, '0', 6612);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (920730679, to_date('02-04-1959', 'dd-mm-yyyy'), '1', 'USA', 'Susan', 'Vinton', 'svinton@cis.com', 8268813732, '1', 1271);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (205949065, to_date('18-08-1960', 'dd-mm-yyyy'), '0', 'USA', 'Bette', 'Rock', 'bette.rock@ccfholding.com', 4096667502, '0', 6643);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (584937490, to_date('10-08-1976', 'dd-mm-yyyy'), '0', 'Hungary', 'Nile', 'Carter', 'n.carter@saksinc.hu', 6308055795, '0', 3241);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (95386891, to_date('06-01-1986', 'dd-mm-yyyy'), '1', 'Japan', 'Gran', 'Browne', 'gran@prp.jp', 5850955399, '0', 4423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (793661573, to_date('02-12-1960', 'dd-mm-yyyy'), '0', 'Australia', 'Pelvic', 'Theron', 'pelvic.t@idas.au', 8556899443, '0', 4449);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (847663473, to_date('20-04-1997', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Rhett', 'Chambers', 'rhett.chambers@acsis.uk', 7937110037, '0', 2449);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (456428079, to_date('16-01-1998', 'dd-mm-yyyy'), '0', 'Japan', 'Alex', 'Kinney', 'alex.kinney@colgatepalmolive.jp', 1687278405, '0', 6116);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (22187019, to_date('28-02-1988', 'dd-mm-yyyy'), '0', 'USA', 'Collin', 'Mantegna', 'collin.m@servicesource.com', 7286144805, '0', 1320);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798326425, to_date('04-04-1956', 'dd-mm-yyyy'), '1', 'USA', 'Hikaru', 'Hingle', 'hikaruh@heritagemicrofilm.com', 2002270639, '0', 5936);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (168615957, to_date('23-08-1993', 'dd-mm-yyyy'), '0', 'Netherlands', 'Lisa', 'Hoskins', 'lisa.h@prosum.nl', 7925731441, '0', 4434);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (232753377, to_date('03-11-1958', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Donald', 'Domino', 'ddomino@harrison.uk', 9443389957, '1', 4124);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (839555765, to_date('27-09-1965', 'dd-mm-yyyy'), '1', 'USA', 'Benjamin', 'Harrison', 'bharrison@epiqsystems.com', 34542100, '0', 1666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (501441880, to_date('11-06-1981', 'dd-mm-yyyy'), '0', 'Italy', 'Liquid', 'Soul', 'l.soul@nestle.it', 1985278785, '0', 2616);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (192657883, to_date('02-07-1955', 'dd-mm-yyyy'), '1', 'Germany', 'Mika', 'Thorton', 'mika.thorton@heartlab.de', 1039399254, '0', 6542);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (515517503, to_date('31-08-1955', 'dd-mm-yyyy'), '0', 'USA', 'Guy', 'Perez', 'gperez@kingston.com', 9217799946, '1', 1403);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (779710941, to_date('15-08-1955', 'dd-mm-yyyy'), '1', 'Italy', 'Christine', 'Kane', 'christine.k@gillani.it', 4193638739, '1', 6132);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (56964049, to_date('07-03-1960', 'dd-mm-yyyy'), '0', 'USA', 'Mary-Louise', 'Biel', 'm.biel@conquestsystems.com', 1520998592, '1', 1188);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (592886735, to_date('18-04-1993', 'dd-mm-yyyy'), '0', 'Italy', 'Denzel', 'Gryner', 'denzel.g@aquickdelivery.it', 6759603118, '1', 3994);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (529933291, to_date('07-03-1980', 'dd-mm-yyyy'), '0', 'Spain', 'George', 'Dorn', 'george.dorn@kelmooreinvestment.es', 6726356947, '1', 6583);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (31960677, to_date('26-09-1963', 'dd-mm-yyyy'), '1', 'South Africa', 'Sander', 'Holeman', 'sanderh@marketbased.za', 1966946691, '1', 2111);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (691710056, to_date('11-07-1976', 'dd-mm-yyyy'), '0', 'Australia', 'Thin', 'Hawkins', 'thin.hawkins@bigdoughcom.au', 3582600633, '1', 4807);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (150624095, to_date('29-12-1976', 'dd-mm-yyyy'), '1', 'USA', 'Nikki', 'Suvari', 'nikki.s@royalgold.com', 8842371220, '1', 4527);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (792069400, to_date('19-01-1956', 'dd-mm-yyyy'), '0', 'USA', 'Nina', 'Bacon', 'nina.bacon@fsffinancial.com', 3557040267, '1', 6172);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (289424565, to_date('25-02-1965', 'dd-mm-yyyy'), '1', 'USA', 'Cliff', 'Church', 'cchurch@ris.com', 9200874844, '1', 1937);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (110452531, to_date('23-05-1973', 'dd-mm-yyyy'), '0', 'USA', 'Bette', 'Curtis-Hall', 'bettec@hersheyfoods.com', 2459254078, '0', 5484);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (800887544, to_date('09-04-1975', 'dd-mm-yyyy'), '1', 'Spain', 'Juice', 'Connick', 'juice.connick@fab.es', 409066564, '0', 4327);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (143478189, to_date('11-08-1977', 'dd-mm-yyyy'), '0', 'USA', 'Cole', 'English', 'cenglish@netnumina.com', 4350933077, '0', 6471);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (764456241, to_date('29-04-1985', 'dd-mm-yyyy'), '1', 'Denmark', 'Jane', 'Fonda', 'jfonda@scriptsave.dk', 1812451982, '1', 4584);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (623865687, to_date('10-09-1969', 'dd-mm-yyyy'), '1', 'Switzerland', 'Sissy', 'Luongo', 'sissy.luongo@prosperitybancshares.ch', 6044736467, '0', 5197);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (642208694, to_date('25-01-1970', 'dd-mm-yyyy'), '1', 'Brazil', 'Jean', 'Burmester', 'jean.burmester@sensortechnologies.br', 3847831828, '1', 4699);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (39204999, to_date('15-02-1972', 'dd-mm-yyyy'), '1', 'USA', 'Giancarlo', 'Speaks', 'giancarlo@tilsonhr.com', 4527020921, '0', 1829);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (199546967, to_date('23-01-1999', 'dd-mm-yyyy'), '1', 'USA', 'Aimee', 'Lloyd', 'a.lloyd@parker.com', 7787791814, '0', 3697);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (517693899, to_date('31-07-1998', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Brendan', 'Rhames', 'brendan.r@ibfh.uk', 8050970903, '0', 2115);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (838864448, to_date('20-02-1997', 'dd-mm-yyyy'), '1', 'Germany', 'Roger', 'Chesnutt', 'r.chesnutt@ceo.de', 2379970053, '1', 2939);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (659020451, to_date('30-12-1967', 'dd-mm-yyyy'), '1', 'USA', 'Liam', 'Frakes', 'liam.frakes@seiaarons.com', 7303125987, '0', 4237);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (177497261, to_date('17-01-1962', 'dd-mm-yyyy'), '0', 'USA', 'Lloyd', 'Shand', 'lshand@colgatepalmolive.com', 1755947417, '1', 5126);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (279609394, to_date('15-09-1997', 'dd-mm-yyyy'), '1', 'Spain', 'Reese', 'Senior', 'reese.senior@signalperfection.es', 8429274707, '0', 5397);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (5378577, to_date('13-07-1962', 'dd-mm-yyyy'), '1', 'USA', 'Charlie', 'Unger', 'charlie.unger@acsis.com', 8980081653, '0', 6923);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (231759330, to_date('06-10-1982', 'dd-mm-yyyy'), '1', 'Germany', 'Lena', 'Krabbe', 'l.krabbe@priorityleasing.de', 2675373810, '1', 4983);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (487410216, to_date('10-01-1981', 'dd-mm-yyyy'), '1', 'USA', 'Ani', 'Taha', 'a.taha@bioreference.com', 9375479431, '0', 4155);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (407891769, to_date('26-11-1958', 'dd-mm-yyyy'), '1', 'USA', 'Naomi', 'Fraser', 'naomi.fraser@conquest.com', 9649755226, '1', 5572);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (778831926, to_date('31-01-1972', 'dd-mm-yyyy'), '1', 'South Korea', 'Miki', 'Russell', 'mrussell@grayhawksystems.com', 3707034563, '1', 3000);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (110795520, to_date('08-01-1961', 'dd-mm-yyyy'), '1', 'Japan', 'Antonio', 'Stanton', 'astanton@ecopy.jp', 5042014261, '1', 5484);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (932442653, to_date('03-03-1996', 'dd-mm-yyyy'), '1', 'South Africa', 'Joaquin', 'Moffat', 'joaquin.moffat@infopros.za', 8960400452, '1', 2971);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (853688255, to_date('12-08-1999', 'dd-mm-yyyy'), '0', 'USA', 'Natacha', 'Raitt', 'natacha.raitt@abatix.com', 4647346146, '0', 6542);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (495639548, to_date('04-01-1989', 'dd-mm-yyyy'), '1', 'Australia', 'Rory', 'Ronstadt', 'rory.ronstadt@interfacesoftware.au', 1202264508, '0', 1257);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (244313585, to_date('13-08-1969', 'dd-mm-yyyy'), '1', 'Germany', 'Bridget', 'Hanley', 'bridget.hanley@dis.de', 1626043005, '0', 4665);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (958875484, to_date('26-03-1950', 'dd-mm-yyyy'), '1', 'Brazil', 'Nastassja', 'Heche', 'nastassjah@mathis.br', 9457179741, '1', 3534);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (536685760, to_date('27-07-1968', 'dd-mm-yyyy'), '0', 'Germany', 'Ray', 'O''Neal', 'ray.o@mainstreetbanks.de', 8716639461, '1', 2963);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (790148322, to_date('08-05-1985', 'dd-mm-yyyy'), '0', 'Lithuania', 'Tanya', 'Rudd', 't.rudd@gdi.lt', 1268524728, '0', 1745);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (629636259, to_date('06-10-1995', 'dd-mm-yyyy'), '1', 'Brazil', 'Trace', 'Carradine', 'tcarradine@hardwoodwholesalers.br', 6041346632, '0', 1192);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (683620359, to_date('26-06-1971', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Murray', 'Hauser', 'murray.hauser@wendysinternational.uk', 7674417754, '0', 3663);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (168644365, to_date('13-12-1970', 'dd-mm-yyyy'), '0', 'South Korea', 'Tyrone', 'Rubinek', 'tyrone@granitesystems.com', 566326415, '0', 1742);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (231562228, to_date('17-02-1984', 'dd-mm-yyyy'), '0', 'USA', 'Philip', 'Palin', 'philip.palin@genghisgrill.com', 8506233977, '0', 3159);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (952218766, to_date('20-07-1979', 'dd-mm-yyyy'), '1', 'USA', 'Warren', 'Stoltz', 'warren.stoltz@keith.com', 6495830123, '0', 6675);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (23455734, to_date('27-04-1960', 'dd-mm-yyyy'), '1', 'USA', 'Tracy', 'Noseworthy', 'tracy.n@innovateecommerce.com', 7419172447, '0', 2156);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (456621888, to_date('25-04-1951', 'dd-mm-yyyy'), '1', 'Canada', 'Joanna', 'Sirtis', 'j.sirtis@gateway.ca', 1901863340, '0', 1423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (335452259, to_date('24-03-1998', 'dd-mm-yyyy'), '1', 'Czech republic', 'Fisher', 'Warburton', 'fisher@logisticare.cz', 8442135469, '0', 5418);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (181921360, to_date('02-08-1992', 'dd-mm-yyyy'), '0', 'USA', 'Faye', 'Smurfit', 'fayes@nhr.com', 5793786467, '0', 5974);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (351316038, to_date('05-09-1968', 'dd-mm-yyyy'), '1', 'South Korea', 'Vendetta', 'Neuwirth', 'vendetta.neuwirth@apexsystems.com', 6616823656, '0', 5439);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (588024386, to_date('30-06-1974', 'dd-mm-yyyy'), '1', 'Ireland', 'Xander', 'Oszajca', 'xander.oszajca@genghisgrill.ie', 4703929253, '0', 1394);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (284628015, to_date('26-04-1997', 'dd-mm-yyyy'), '0', 'Italy', 'Giovanni', 'Flack', 'gflack@advancedneuromodulation.it', 4379647787, '1', 2483);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (268308066, to_date('01-06-1973', 'dd-mm-yyyy'), '0', 'USA', 'Cuba', 'Mirren', 'cuba.mirren@nbs.com', 3493231129, '1', 6084);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (832297187, to_date('19-01-1976', 'dd-mm-yyyy'), '1', 'Germany', 'Curtis', 'Adkins', 'curtis.adkins@emt.de', 472269364, '1', 6675);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (203487502, to_date('01-08-1997', 'dd-mm-yyyy'), '0', 'USA', 'Joseph', 'Travolta', 'joseph.travolta@glaxosmithkline.com', 787648746, '1', 1722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (447167342, to_date('14-01-1975', 'dd-mm-yyyy'), '0', 'Spain', 'Doug', 'Laws', 'doug.laws@entelligence.es', 8420993107, '0', 5848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (358080598, to_date('18-09-1960', 'dd-mm-yyyy'), '1', 'USA', 'Ossie', 'Olyphant', 'ossie.olyphant@multimedialive.com', 6160817094, '0', 1829);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (44682779, to_date('25-09-1968', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Jackson', 'Bandy', 'jackson.bandy@diageo.uk', 4103230374, '1', 3536);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (201132775, to_date('29-08-1952', 'dd-mm-yyyy'), '0', 'USA', 'Gates', 'Ferrell', 'gates.ferrell@doctorsassociates.com', 8549934549, '1', 6396);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (334645490, to_date('08-09-1971', 'dd-mm-yyyy'), '0', 'Netherlands', 'Ernest', 'Rosas', 'ernest.rosas@pis.nl', 8647238910, '0', 1149);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (542758377, to_date('14-10-1959', 'dd-mm-yyyy'), '0', 'USA', 'Carl', 'Torres', 'c.torres@codykramerimports.com', 272024345, '1', 5195);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (522559012, to_date('26-02-1998', 'dd-mm-yyyy'), '1', 'USA', 'Geoffrey', 'Bryson', 'geoffrey.b@lindin.com', 1502940420, '0', 1346);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (214503199, to_date('22-04-1986', 'dd-mm-yyyy'), '0', 'Italy', 'Lance', 'Donelly', 'ldonelly@loreal.it', 6275639842, '0', 1669);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (695977131, to_date('17-01-1974', 'dd-mm-yyyy'), '1', 'USA', 'Arturo', 'Rickman', 'arturo.rickman@alternativetechnology.com', 297202342, '1', 3929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (319920133, to_date('30-11-1959', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Suzanne', 'Gayle', 'sgayle@adolph.uk', 3709176478, '0', 4061);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798972374, to_date('07-02-1954', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Cesar', 'Buckingham', 'cesarb@supplycorecom.uk', 2172959821, '0', 3184);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (608103880, to_date('12-02-1974', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Tramaine', 'Barry', 'tramaine@solipsys.uk', 6273940663, '0', 3538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (77494594, to_date('01-06-1994', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Kyle', 'Hawthorne', 'kyle.hawthorne@stonebrewing.uk', 3954922003, '0', 5672);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (533724756, to_date('23-11-1954', 'dd-mm-yyyy'), '0', 'Croatia', 'Kristin', 'Springfield', 'kspringfield@pinnaclestaffing.com', 7322700943, '1', 4652);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (771111602, to_date('21-07-1985', 'dd-mm-yyyy'), '0', 'Switzerland', 'Deborah', 'Nightingale', 'deborah.nightingale@cowlitzbancorp.ch', 6056246140, '0', 1728);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (177440275, to_date('06-09-1955', 'dd-mm-yyyy'), '1', 'USA', 'Alex', 'Lunch', 'alex.lunch@ssci.com', 8196621769, '0', 5805);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (41426982, to_date('01-06-1998', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Garry', 'Lizzy', 'garry.lizzy@calence.uk', 5174620564, '1', 3729);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (909843309, to_date('02-08-1994', 'dd-mm-yyyy'), '1', 'USA', 'Hikaru', 'Burstyn', 'hikaru.burstyn@diamondtechnologies.com', 8409972996, '1', 3637);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (840199469, to_date('15-09-1984', 'dd-mm-yyyy'), '0', 'USA', 'Maureen', 'Eldard', 'maureen.eldard@voicelog.com', 8112356465, '0', 3320);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (930209096, to_date('16-11-1984', 'dd-mm-yyyy'), '1', 'Australia', 'Daniel', 'Norton', 'daniel.norton@microsoft.au', 9304872773, '1', 1503);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (219524547, to_date('29-12-1992', 'dd-mm-yyyy'), '0', 'USA', 'Radney', 'Pantoliano', 'radney.pantoliano@csi.com', 7155530182, '0', 1722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (397247962, to_date('22-06-1995', 'dd-mm-yyyy'), '1', 'Canada', 'Laurence', 'Shandling', 'laurence.shandling@oneidafinancial.ca', 5033583730, '0', 1675);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798751753, to_date('05-09-1989', 'dd-mm-yyyy'), '1', 'Netherlands', 'Sander', 'Addy', 's.addy@myricom.nl', 7929138092, '0', 5398);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (916695578, to_date('16-11-1957', 'dd-mm-yyyy'), '1', 'Germany', 'Liv', 'McFadden', 'liv.mcfadden@accessus.de', 7253764175, '1', 6973);
commit;
prompt 400 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (365417317, to_date('20-08-1956', 'dd-mm-yyyy'), '0', 'Norway', 'David', 'Burmester', 'd.burmester@oss.no', 9591254934, '0', 4463);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (539987966, to_date('23-09-1995', 'dd-mm-yyyy'), '0', 'Germany', 'Lena', 'Zellweger', 'lena.zellweger@directdata.de', 7651416589, '0', 3909);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (784029503, to_date('07-07-1977', 'dd-mm-yyyy'), '1', 'Turkey', 'Debra', 'Detmer', 'debra.detmer@onesourceprinting.tr', 8307434831, '1', 5886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (228035778, to_date('27-09-1986', 'dd-mm-yyyy'), '1', 'Canada', 'Sal', 'Brandt', 'sal.brandt@bat.ca', 9944250605, '0', 6227);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (22941522, to_date('19-01-1995', 'dd-mm-yyyy'), '0', 'USA', 'Geggy', 'Austin', 'geggy.austin@smi.com', 7451954750, '0', 1172);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (727147193, to_date('06-08-1981', 'dd-mm-yyyy'), '0', 'USA', 'Wendy', 'Baker', 'wendy@nhr.com', 5445688729, '0', 4873);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (463299165, to_date('08-09-1973', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Thora', 'Underwood', 'thora.underwood@powerlight.uk', 183845492, '0', 5343);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (990804824, to_date('29-04-1964', 'dd-mm-yyyy'), '0', 'USA', 'Jon', 'Makeba', 'jon.makeba@globalwireless.com', 9937215022, '1', 3434);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (671804317, to_date('06-03-1972', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Lynette', 'Balaban', 'lynette.b@bestbuy.uk', 9036901260, '1', 2909);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (381245957, to_date('23-05-1987', 'dd-mm-yyyy'), '1', 'USA', 'Bette', 'Taha', 'bette.taha@typhoon.com', 2203224608, '0', 3423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (418673410, to_date('09-12-1955', 'dd-mm-yyyy'), '1', 'Netherlands', 'Vince', 'Bosco', 'v.bosco@fra.nl', 1043678273, '0', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (576407955, to_date('22-09-1983', 'dd-mm-yyyy'), '0', 'USA', 'Luis', 'Dzundza', 'luis.dzundza@dynacqinternational.com', 8357710930, '0', 4834);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (396419510, to_date('05-01-1951', 'dd-mm-yyyy'), '0', 'Australia', 'Mary', 'Jenkins', 'mary@bps.au', 4334376016, '0', 2590);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (206363542, to_date('23-07-1996', 'dd-mm-yyyy'), '0', 'USA', 'Jet', 'Gary', 'jgary@ghrsystems.com', 2546224342, '0', 6893);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (454028654, to_date('27-02-1953', 'dd-mm-yyyy'), '1', 'USA', 'Juan', 'Adkins', 'juan.adkins@activeservices.com', 3579634689, '1', 4388);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (380228834, to_date('08-05-1997', 'dd-mm-yyyy'), '0', 'Spain', 'Winona', 'Mould', 'winona.mould@capitalautomotive.es', 6528193908, '0', 1192);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (671815442, to_date('17-03-1960', 'dd-mm-yyyy'), '1', 'Brazil', 'Debbie', 'Heslov', 'debbie.heslov@gna.br', 6603217696, '0', 5192);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (121813969, to_date('28-06-1989', 'dd-mm-yyyy'), '0', 'USA', 'Lance', 'Arkenstone', 'lance.arkenstone@aristotle.com', 9299857036, '1', 4135);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (339337863, to_date('20-02-1972', 'dd-mm-yyyy'), '0', 'Paraguay', 'Vanessa', 'MacDowell', 'vanessam@capital.py', 8207787716, '1', 2895);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28128734, to_date('30-11-1953', 'dd-mm-yyyy'), '0', 'USA', 'Ashton', 'Yulin', 'a.yulin@woronocobancorp.com', 8098171124, '0', 1728);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (591690874, to_date('29-01-1998', 'dd-mm-yyyy'), '0', 'Italy', 'Lisa', 'Field', 'lisa@newviewgifts.it', 6828486670, '1', 1541);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (711604794, to_date('21-08-1990', 'dd-mm-yyyy'), '0', 'Canada', 'Lea', 'Paul', 'lea@gdatechnologies.ca', 902308792, '0', 5822);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (645335093, to_date('29-10-1990', 'dd-mm-yyyy'), '0', 'USA', 'Rip', 'Mitchell', 'rip.mitchell@curagroup.com', 645394139, '0', 3016);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (988785359, to_date('30-05-1965', 'dd-mm-yyyy'), '0', 'USA', 'Vince', 'DeLuise', 'vinced@escalade.com', 1299481044, '1', 6654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (958772854, to_date('13-05-1990', 'dd-mm-yyyy'), '1', 'Germany', 'Dorry', 'Mewes', 'd.mewes@abs.de', 3890387893, '1', 5886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (406357741, to_date('23-05-1993', 'dd-mm-yyyy'), '0', 'Mexico', 'Kurtwood', 'Wiedlin', 'kwiedlin@jma.mx', 3519512837, '1', 4906);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (214608458, to_date('16-03-1954', 'dd-mm-yyyy'), '1', 'Hong Kong', 'Pat', 'Berenger', 'patb@nlx.hk', 3425101612, '0', 1152);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (339790885, to_date('01-06-1981', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Melanie', 'Romijn-Stamos', 'mromijnstamos@wrgservices.uk', 3008888559, '1', 1471);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (381655202, to_date('21-06-1980', 'dd-mm-yyyy'), '0', 'USA', 'Marina', 'Hannah', 'marina.hannah@avs.com', 8007243481, '0', 5711);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (734455580, to_date('24-05-1970', 'dd-mm-yyyy'), '1', 'Spain', 'Donna', 'Arkenstone', 'donna.arkenstone@acsis.es', 4195939913, '1', 2939);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (348487386, to_date('06-01-1976', 'dd-mm-yyyy'), '0', 'USA', 'Frederic', 'Koyana', 'fkoyana@democracydata.com', 1251001890, '0', 1546);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (576366826, to_date('29-03-1983', 'dd-mm-yyyy'), '0', 'USA', 'Shawn', 'Barnett', 'shawn.barnett@fnb.com', 8575448197, '0', 2066);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (115166119, to_date('01-05-1981', 'dd-mm-yyyy'), '0', 'Australia', 'Edie', 'Beckinsale', 'edie.beckinsale@timberlanewoodcrafters.au', 5937161850, '1', 3284);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (934035727, to_date('02-08-1983', 'dd-mm-yyyy'), '1', 'USA', 'Ani', 'Quaid', 'ani.quaid@gltg.com', 731271618, '1', 4049);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (886906375, to_date('15-07-1962', 'dd-mm-yyyy'), '0', 'USA', 'Willie', 'Meniketti', 'willie.m@keymark.com', 9760474172, '1', 5221);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (952605325, to_date('14-10-1998', 'dd-mm-yyyy'), '1', 'USA', 'Queen', 'Harnes', 'queen@maverick.com', 4238488631, '0', 1450);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (810224506, to_date('24-06-1960', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Jesus', 'Posey', 'jesus.posey@bioreference.uk', 8146263327, '1', 4388);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (595394023, to_date('28-06-1964', 'dd-mm-yyyy'), '1', 'Italy', 'Darius', 'Johansen', 'darius.j@nissanmotor.it', 3107613542, '1', 4584);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (138227974, to_date('24-06-1964', 'dd-mm-yyyy'), '0', 'USA', 'Ben', 'Cheadle', 'ben.cheadle@bmm.com', 8646851864, '1', 3315);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (188413296, to_date('01-12-1981', 'dd-mm-yyyy'), '0', 'Hungary', 'Olga', 'Moore', 'olga.m@lifelinesystems.hu', 6000540041, '0', 3871);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (569598387, to_date('21-02-1991', 'dd-mm-yyyy'), '0', 'USA', 'Beth', 'Rifkin', 'beth.r@axis.com', 6499862448, '0', 4817);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (335025709, to_date('25-06-1951', 'dd-mm-yyyy'), '0', 'USA', 'Jonatha', 'Himmelman', 'j.himmelman@astafunding.com', 2161945256, '1', 4037);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (611922796, to_date('06-03-1983', 'dd-mm-yyyy'), '1', 'USA', 'Clea', 'McNeice', 'clea.m@sis.com', 3587368488, '0', 4044);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (412112008, to_date('01-10-1989', 'dd-mm-yyyy'), '0', 'USA', 'Mint', 'Loveless', 'm.loveless@qestrel.com', 2612490681, '0', 4452);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (293651533, to_date('02-06-1956', 'dd-mm-yyyy'), '1', 'Brazil', 'Juliette', 'Wayans', 'juliette.wayans@loreal.br', 9344700142, '1', 6412);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (328509451, to_date('03-11-1973', 'dd-mm-yyyy'), '1', 'South Korea', 'Sammy', 'Rubinek', 'sammy@cis.com', 1767675854, '0', 4092);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (631916254, to_date('18-08-1985', 'dd-mm-yyyy'), '1', 'Hong Kong', 'Julia', 'Sizemore', 'j.sizemore@ceo.hk', 732471906, '1', 4274);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (785728678, to_date('08-10-1964', 'dd-mm-yyyy'), '1', 'USA', 'Michael', 'Beatty', 'michael.beatty@doraldentalusa.com', 9603885467, '1', 6866);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (972117180, to_date('21-12-1992', 'dd-mm-yyyy'), '1', 'USA', 'Morris', 'Coltrane', 'morris.coltrane@connected.com', 3581533056, '0', 4440);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (658024006, to_date('27-05-1951', 'dd-mm-yyyy'), '0', 'Brazil', 'Carole', 'Sandler', 'carole.sandler@sps.br', 2235916365, '1', 1560);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (346721961, to_date('05-10-1953', 'dd-mm-yyyy'), '1', 'USA', 'Ossie', 'Prinze', 'ossie.prinze@tastefullysimple.com', 6575885657, '1', 3401);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (821175035, to_date('22-03-1967', 'dd-mm-yyyy'), '0', 'USA', 'Cevin', 'Firth', 'cevin@at.com', 641393989, '1', 5654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (910498937, to_date('15-01-1973', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Claude', 'McFerrin', 'claudem@restaurantpartners.uk', 5895377904, '0', 4744);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (154664109, to_date('16-03-1993', 'dd-mm-yyyy'), '0', 'France', 'Garland', 'Irving', 'garland@httprint.fr', 6780051049, '0', 1533);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (619760069, to_date('02-05-1968', 'dd-mm-yyyy'), '1', 'Germany', 'Sissy', 'McCready', 'smccready@team.de', 6100464201, '1', 4520);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (729148275, to_date('12-07-1996', 'dd-mm-yyyy'), '0', 'USA', 'Terri', 'Nicholson', 'terri.nicholson@marathonheater.com', 4847955090, '1', 2738);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (320178267, to_date('14-10-1995', 'dd-mm-yyyy'), '1', 'USA', 'Kimberly', 'Milsap', 'kimberly.milsap@palmbeachtan.com', 1945302309, '1', 1864);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (369185783, to_date('04-03-1962', 'dd-mm-yyyy'), '0', 'Poland', 'Dionne', 'Heatherly', 'dionne.heatherly@tps.pl', 359321003, '0', 5790);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (794411660, to_date('21-12-1987', 'dd-mm-yyyy'), '0', 'USA', 'Uma', 'Osment', 'umao@universalsolutions.com', 1886005469, '0', 5454);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (700808758, to_date('24-11-1983', 'dd-mm-yyyy'), '0', 'Netherlands', 'Brittany', 'Tomlin', 'brittany.tomlin@kmart.nl', 1927849453, '1', 1728);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (16264592, to_date('28-12-1976', 'dd-mm-yyyy'), '0', 'USA', 'Ritchie', 'Liu', 'ritchie@homedepot.com', 1386266307, '0', 1902);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (724427187, to_date('29-01-1976', 'dd-mm-yyyy'), '0', 'Germany', 'Red', 'Day', 'red@gra.de', 8976963596, '1', 3406);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (920963993, to_date('03-10-1997', 'dd-mm-yyyy'), '1', 'USA', 'Jane', 'Crouch', 'jane.crouch@pra.com', 8998535249, '1', 2541);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (199786837, to_date('24-05-1988', 'dd-mm-yyyy'), '1', 'Canada', 'Rory', 'Darren', 'rory.darren@novartis.ca', 1250121753, '0', 3940);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (870812160, to_date('05-11-1982', 'dd-mm-yyyy'), '0', 'France', 'Toni', 'Costa', 'toni.c@insurmark.fr', 4960282880, '1', 3871);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (633350836, to_date('22-04-1966', 'dd-mm-yyyy'), '0', 'Germany', 'Gabrielle', 'Tinsley', 'gabrielle.t@epiqsystems.de', 7110069204, '1', 6654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (756013613, to_date('02-03-1967', 'dd-mm-yyyy'), '1', 'Italy', 'Vickie', 'MacNeil', 'vickie.m@ads.it', 5366932629, '0', 2326);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (750679556, to_date('28-11-1980', 'dd-mm-yyyy'), '0', 'USA', 'Fisher', 'Russo', 'frusso@cyberthink.com', 6879217682, '1', 5711);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (137920930, to_date('09-08-1951', 'dd-mm-yyyy'), '0', 'Germany', 'Gena', 'Nunn', 'gena.n@glaxosmithkline.de', 6900075951, '1', 6368);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (55378115, to_date('14-04-1971', 'dd-mm-yyyy'), '0', 'USA', 'Guy', 'Flatts', 'guy.flatts@air.com', 1774587769, '0', 6428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (416902530, to_date('12-06-1951', 'dd-mm-yyyy'), '1', 'Switzerland', 'Terri', 'Bragg', 'terri.b@ams.ch', 9855988477, '0', 4309);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (393228065, to_date('22-06-1998', 'dd-mm-yyyy'), '0', 'Germany', 'Kevn', 'Viterelli', 'kevn.viterelli@envisiontelephony.de', 30665719, '0', 4070);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (246894532, to_date('29-07-1971', 'dd-mm-yyyy'), '0', 'USA', 'Samantha', 'O''Neill', 'samantha.oneill@pearllawgroup.com', 4808910308, '0', 3929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (551883246, to_date('30-08-1982', 'dd-mm-yyyy'), '1', 'Switzerland', 'Thomas', 'Church', 't.church@usainstruments.ch', 6530468123, '1', 6388);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (654292311, to_date('02-10-1995', 'dd-mm-yyyy'), '0', 'USA', 'Terence', 'Sinise', 'terence.sinise@waltdisney.com', 3274769760, '1', 5013);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (955148167, to_date('29-04-1959', 'dd-mm-yyyy'), '1', 'USA', 'Willie', 'Flanagan', 'w.flanagan@nbs.com', 9803748690, '1', 5154);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (602808045, to_date('08-05-1963', 'dd-mm-yyyy'), '1', 'Israel', 'Anne', 'Cotton', 'anne.c@nuinfosystems.il', 5854413844, '1', 4169);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (439093199, to_date('24-10-1990', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Quentin', 'Stevenson', 'quentin.stevenson@dillards.uk', 6124947628, '1', 4443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (548184105, to_date('06-02-1957', 'dd-mm-yyyy'), '0', 'USA', 'Minnie', 'MacDonald', 'minnie.macdonald@trm.com', 5056977034, '0', 2336);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (641641332, to_date('31-12-1993', 'dd-mm-yyyy'), '0', 'USA', 'Karon', 'Hamilton', 'k.hamilton@verizon.com', 4023357787, '0', 2133);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (184908430, to_date('09-02-1994', 'dd-mm-yyyy'), '1', 'South Africa', 'Hex', 'Gere', 'hex.gere@hencie.za', 2861507104, '1', 5543);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (561392952, to_date('17-12-1953', 'dd-mm-yyyy'), '1', 'Germany', 'Thin', 'Orbit', 'thin.orbit@inzone.de', 6383543272, '0', 4196);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (510329621, to_date('23-09-1982', 'dd-mm-yyyy'), '0', 'France', 'Jonny Lee', 'Hatchet', 'j.hatchet@esteelauder.fr', 3226762079, '0', 5836);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (789397812, to_date('08-08-1988', 'dd-mm-yyyy'), '0', 'USA', 'Clay', 'Sylvian', 'clay.sylvian@unit.com', 9861713642, '0', 6702);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (544256864, to_date('31-01-1971', 'dd-mm-yyyy'), '0', 'Poland', 'Gladys', 'Moffat', 'gmoffat@sht.pl', 7423133738, '0', 3833);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (112802431, to_date('13-06-1978', 'dd-mm-yyyy'), '0', 'France', 'Armin', 'Landau', 'armin.landau@alohanysystems.fr', 8806413740, '1', 3129);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (737877339, to_date('02-05-1950', 'dd-mm-yyyy'), '1', 'South Africa', 'Juliet', 'Garcia', 'juliet.garcia@pinnaclestaffing.za', 1650443427, '0', 4428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (596229218, to_date('01-07-1972', 'dd-mm-yyyy'), '1', 'Germany', 'Cevin', 'Broderick', 'cevinb@cis.de', 4658665999, '1', 3712);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (318102878, to_date('24-09-1970', 'dd-mm-yyyy'), '0', 'USA', 'Diane', 'Colin Young', 'dianec@shufflemaster.com', 594236717, '1', 1692);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (458654267, to_date('05-04-1994', 'dd-mm-yyyy'), '0', 'Italy', 'Lenny', 'Weller', 'l.weller@investorstitle.it', 6915462365, '0', 4665);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (555121788, to_date('24-09-1993', 'dd-mm-yyyy'), '0', 'Haiti', 'Brendan', 'Perry', 'brendan.perry@paisley.ht', 5161339665, '0', 6924);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (679612164, to_date('28-03-1970', 'dd-mm-yyyy'), '0', 'USA', 'Patty', 'Costello', 'p.costello@voicelog.com', 9648135118, '0', 6349);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (312174007, to_date('09-01-1986', 'dd-mm-yyyy'), '1', 'Argentina', 'Winona', 'Deejay', 'winona.deejay@mosaic.ar', 9123648381, '0', 2167);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (679152123, to_date('06-05-1967', 'dd-mm-yyyy'), '0', 'USA', 'Henry', 'Puckett', 'hpuckett@gdi.com', 1003759851, '1', 2067);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (134456634, to_date('13-01-1992', 'dd-mm-yyyy'), '1', 'USA', 'Shawn', 'Duchovny', 'shawn.duchovny@pacificdatadesigns.com', 2869777834, '0', 1405);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (614294443, to_date('13-01-1964', 'dd-mm-yyyy'), '1', 'USA', 'Maria', 'Spacek', 'marias@intel.com', 2190555075, '0', 1129);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (416128602, to_date('04-05-1989', 'dd-mm-yyyy'), '0', 'Germany', 'Harris', 'Armatrading', 'harmatrading@myricom.de', 6970395426, '0', 5483);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (868342287, to_date('25-07-1990', 'dd-mm-yyyy'), '0', 'France', 'Ethan', 'Byrne', 'ebyrne@air.fr', 6144753954, '1', 6591);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (945109945, to_date('01-03-1978', 'dd-mm-yyyy'), '1', 'USA', 'Jann', 'Boyle', 'jann.boyle@socketinternet.com', 531565914, '1', 6624);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (268134409, to_date('04-04-1955', 'dd-mm-yyyy'), '0', 'USA', 'Penelope', 'Arden', 'penelope.arden@apexsystems.com', 1303685013, '1', 2319);
commit;
prompt 500 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (956360211, to_date('27-11-1985', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Hookah', 'Nash', 'h.nash@procter.uk', 3219681081, '0', 2547);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (763238764, to_date('08-06-1952', 'dd-mm-yyyy'), '1', 'USA', 'Suzy', 'Tempest', 'suzy.tempest@proclarity.com', 6724396735, '0', 5223);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (470962454, to_date('11-11-1985', 'dd-mm-yyyy'), '0', 'Germany', 'Gavin', 'Biel', 'gavin.biel@hersheyfoods.de', 1117357269, '1', 3291);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (3314295, to_date('23-03-1951', 'dd-mm-yyyy'), '1', 'USA', 'Kieran', 'Macht', 'kmacht@capitalautomotive.com', 2552415162, '1', 6975);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (330558047, to_date('10-02-1977', 'dd-mm-yyyy'), '1', 'Brazil', 'Emm', 'Reno', 'emm@aristotle.br', 4058103494, '0', 5154);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (728597007, to_date('28-05-1975', 'dd-mm-yyyy'), '1', 'Portugal', 'Dan', 'Cross', 'd.cross@kitba.pt', 3770167101, '1', 4699);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (604544683, to_date('05-09-1963', 'dd-mm-yyyy'), '1', 'Japan', 'Mindy', 'Sheen', 'mindy.sheen@pib.jp', 2830893776, '0', 4621);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (293666216, to_date('19-04-1993', 'dd-mm-yyyy'), '0', 'Austria', 'Juliana', 'Tobolowsky', 'juliana@sbc.at', 3499828738, '0', 5228);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (719750156, to_date('07-09-1998', 'dd-mm-yyyy'), '0', 'Germany', 'Mena', 'Loveless', 'mena.loveless@microtek.de', 8226045271, '0', 2475);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (471110016, to_date('05-01-1969', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Hilton', 'Stevens', 'h.stevens@inspirationsoftware.uk', 6151421304, '1', 4067);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (786260962, to_date('12-05-1956', 'dd-mm-yyyy'), '0', 'USA', 'Petula', 'Rankin', 'petula.rankin@restaurantpartners.com', 6363130746, '0', 1317);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (931942577, to_date('03-03-1996', 'dd-mm-yyyy'), '1', 'USA', 'Salma', 'Brooks', 'salma.b@stonebrewing.com', 9244263353, '1', 4151);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (476988385, to_date('21-04-1991', 'dd-mm-yyyy'), '1', 'Switzerland', 'Ramsey', 'Quinlan', 'rquinlan@marriottinternational.ch', 9747925747, '1', 6227);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (920550178, to_date('20-04-1953', 'dd-mm-yyyy'), '0', 'USA', 'Steven', 'Martinez', 'steven.martinez@telecheminternational.com', 3076335858, '1', 2549);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (93699883, to_date('15-04-1971', 'dd-mm-yyyy'), '0', 'Lithuania', 'Seth', 'Cruz', 'seth.cruz@clubone.lt', 4735074144, '0', 2005);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (713093214, to_date('29-07-1973', 'dd-mm-yyyy'), '1', 'USA', 'Emmylou', 'Reilly', 'emmylou@viacom.com', 1775139227, '1', 5538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (474480882, to_date('04-02-1956', 'dd-mm-yyyy'), '0', 'Germany', 'Gary', 'Bedelia', 'gbedelia@procter.de', 1389628173, '0', 4515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (907942429, to_date('12-08-1963', 'dd-mm-yyyy'), '1', 'Denmark', 'Buffy', 'Lange', 'buffy.lange@mathis.dk', 505736038, '0', 5124);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (315924909, to_date('02-03-1981', 'dd-mm-yyyy'), '1', 'USA', 'Donal', 'Brandt', 'donal@priorityleasing.com', 3794607036, '0', 5398);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (352759327, to_date('07-06-1985', 'dd-mm-yyyy'), '0', 'USA', 'Lucy', 'Simpson', 'lucys@mqsoftware.com', 6781095530, '0', 3429);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (437899691, to_date('12-08-1966', 'dd-mm-yyyy'), '1', 'Switzerland', 'Rutger', 'Krieger', 'rutgerk@curagroup.ch', 7163797478, '1', 1006);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (438924045, to_date('25-05-1988', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Jennifer', 'Laurie', 'jennifer@execuscribe.uk', 2256633286, '1', 5295);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (813916480, to_date('29-09-1971', 'dd-mm-yyyy'), '0', 'Brazil', 'Janeane', 'Lovitz', 'janeane.l@hatworld.br', 6864707505, '0', 4412);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (141272408, to_date('04-07-1955', 'dd-mm-yyyy'), '0', 'USA', 'Heath', 'Avalon', 'heatha@boldtechsystems.com', 8424045350, '1', 2067);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (56803134, to_date('24-02-1994', 'dd-mm-yyyy'), '0', 'USA', 'Anne', 'Paxton', 'annep@sourcegear.com', 8489335167, '1', 3840);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (493752824, to_date('21-05-1993', 'dd-mm-yyyy'), '0', 'USA', 'Randall', 'Lunch', 'randall.lunch@heritagemicrofilm.com', 7857216996, '0', 4843);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (313290752, to_date('24-09-1995', 'dd-mm-yyyy'), '0', 'USA', 'Katie', 'Carlton', 'katie.carlton@gha.com', 5052205251, '1', 1172);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (209443585, to_date('05-11-1953', 'dd-mm-yyyy'), '1', 'Japan', 'Sigourney', 'Tah', 'sigourney.tah@onstaff.jp', 5945186932, '0', 3769);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (612646446, to_date('27-10-1966', 'dd-mm-yyyy'), '1', 'USA', 'CeCe', 'Law', 'cece.law@gra.com', 8687320718, '0', 3252);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (595291804, to_date('26-04-1976', 'dd-mm-yyyy'), '1', 'Brazil', 'Mint', 'Macy', 'mmacy@dearbornbancorp.br', 6859984104, '0', 2968);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (647079591, to_date('28-03-1952', 'dd-mm-yyyy'), '1', 'Canada', 'Kitty', 'Wiedlin', 'kwiedlin@mai.ca', 6206003528, '1', 6770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (618422777, to_date('09-10-1969', 'dd-mm-yyyy'), '0', 'South Africa', 'Dabney', 'Robbins', 'drobbins@keith.za', 5449061753, '1', 1533);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (710738297, to_date('02-05-1993', 'dd-mm-yyyy'), '1', 'Canada', 'Aimee', 'Hiatt', 'aimee.hiatt@appriss.ca', 4722247277, '0', 5197);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (126170056, to_date('18-01-1979', 'dd-mm-yyyy'), '0', 'USA', 'Beth', 'Carradine', 'bethc@fmb.com', 9627542655, '0', 6591);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (540391429, to_date('16-04-1989', 'dd-mm-yyyy'), '1', 'Germany', 'Lionel', 'Fogerty', 'lionel.f@cima.de', 1112993544, '0', 1120);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (101999245, to_date('18-08-1987', 'dd-mm-yyyy'), '0', 'Australia', 'Jet', 'Kidman', 'j.kidman@dancor.au', 1121528785, '0', 4131);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (903684697, to_date('07-01-1991', 'dd-mm-yyyy'), '1', 'Canada', 'Isabella', 'Schneider', 'isabella.schneider@connected.ca', 6648773772, '1', 3420);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (465028478, to_date('27-05-1980', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Joseph', 'Bracco', 'joseph@conquestsystems.uk', 5156536213, '0', 2924);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (299071152, to_date('24-01-1972', 'dd-mm-yyyy'), '0', 'Slovenia', 'Nicole', 'Perlman', 'nicole.perlman@nhr.si', 5847007223, '0', 6889);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (697157270, to_date('13-05-1997', 'dd-mm-yyyy'), '0', 'South Korea', 'Bernard', 'Weaving', 'bernard.weaving@insurmark.com', 9269418963, '1', 2968);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (285247646, to_date('30-11-1988', 'dd-mm-yyyy'), '0', 'USA', 'Joaquim', 'Dern', 'joaquim.d@kimberlyclark.com', 8305207077, '0', 5546);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (187652146, to_date('11-09-1977', 'dd-mm-yyyy'), '0', 'USA', 'Larnelle', 'Gill', 'larnelle.g@simplycertificates.com', 1141694267, '1', 5179);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (216976597, to_date('22-07-1993', 'dd-mm-yyyy'), '0', 'Portugal', 'Henry', 'Allison', 'hallison@faef.pt', 5037562964, '1', 3283);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (265022504, to_date('19-04-1953', 'dd-mm-yyyy'), '1', 'Denmark', 'Jesus', 'Quinn', 'jesus.quinn@floorgraphics.dk', 3726294198, '1', 2167);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (538876378, to_date('21-04-1980', 'dd-mm-yyyy'), '0', 'USA', 'Steven', 'Devine', 'steven.devine@northhighland.com', 9710615554, '0', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (168953624, to_date('21-06-1980', 'dd-mm-yyyy'), '0', 'Canada', 'Josh', 'Marshall', 'josh.marshall@sony.ca', 7663074620, '1', 4375);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (777680859, to_date('04-09-1968', 'dd-mm-yyyy'), '1', 'USA', 'Vern', 'Folds', 'vern@pra.com', 1943618206, '0', 6996);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (13258927, to_date('25-09-1956', 'dd-mm-yyyy'), '0', 'France', 'Kenneth', 'Mitra', 'kenneth.m@greene.fr', 7968954967, '0', 5194);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (373578919, to_date('05-10-1954', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Remy', 'Gold', 'remy.gold@meghasystems.uk', 1617848373, '0', 5439);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (174793050, to_date('31-10-1974', 'dd-mm-yyyy'), '0', 'USA', 'Freddy', 'Curfman', 'freddy.curfman@kellogg.com', 5182251234, '0', 5969);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (15630770, to_date('25-05-1978', 'dd-mm-yyyy'), '0', 'USA', 'Hex', 'Sepulveda', 'hsepulveda@north.com', 1920307012, '1', 3670);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (176070416, to_date('29-10-1972', 'dd-mm-yyyy'), '0', 'Canada', 'Joy', 'Whitford', 'joy@sbc.ca', 4301973644, '1', 5439);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (504518059, to_date('01-11-1961', 'dd-mm-yyyy'), '0', 'USA', 'Bradley', 'Ticotin', 'bradley.ticotin@spinnakerexploration.com', 1956344862, '0', 4061);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (446025962, to_date('19-08-1967', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Doug', 'Houston', 'doug@evinco.uk', 9961630210, '0', 2388);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (896337439, to_date('29-05-1954', 'dd-mm-yyyy'), '1', 'Venezuela', 'Hugo', 'Cox', 'hugo@career.ve', 2172032773, '1', 2458);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (959252752, to_date('09-04-1966', 'dd-mm-yyyy'), '0', 'Italy', 'Debby', 'Rauhofer', 'debby@morganresearch.it', 5213175557, '1', 2324);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (569011198, to_date('29-09-1999', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Petula', 'Quinones', 'petula.quinones@jollyenterprises.uk', 1443246993, '1', 4384);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (605828384, to_date('18-08-1983', 'dd-mm-yyyy'), '0', 'USA', 'Jeff', 'Day-Lewis', 'jeff.daylewis@insurmark.com', 8411892014, '0', 1894);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (352995855, to_date('09-10-1968', 'dd-mm-yyyy'), '1', 'Germany', 'Toni', 'Hawke', 'toni.hawke@eastmankodak.de', 2450920847, '0', 3804);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (783267123, to_date('30-10-1965', 'dd-mm-yyyy'), '1', 'Sweden', 'Max', 'Duncan', 'm.duncan@educationaldevelopment.se', 5750923998, '1', 6603);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (582667780, to_date('09-03-1957', 'dd-mm-yyyy'), '0', 'Denmark', 'Mae', 'Harrison', 'mae.harrison@intraspheretechnologies.dk', 8242257703, '0', 1745);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (153388053, to_date('16-07-1951', 'dd-mm-yyyy'), '1', 'Germany', 'Jonny', 'Estevez', 'j.estevez@allegiantbancorp.de', 4216008149, '1', 3190);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (352064274, to_date('03-08-1969', 'dd-mm-yyyy'), '0', 'Germany', 'Rufus', 'Gary', 'rgary@bluffcitysteel.de', 1612598128, '1', 1530);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (458286997, to_date('25-07-1970', 'dd-mm-yyyy'), '0', 'Spain', 'Chanté', 'Goldwyn', 'chant.goldwyn@escalade.es', 5029609733, '1', 6612);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (248222677, to_date('19-05-1988', 'dd-mm-yyyy'), '0', 'Netherlands', 'Hector', 'Keener', 'hector.k@montpelierplastics.nl', 7282303200, '0', 4584);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (65509213, to_date('22-12-1992', 'dd-mm-yyyy'), '0', 'Japan', 'Petula', 'Tobolowsky', 'petula.t@jma.jp', 5307358238, '0', 4490);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (526206405, to_date('22-10-1967', 'dd-mm-yyyy'), '1', 'USA', 'Katie', 'Shelton', 'k.shelton@pragmatechsoftware.com', 2138241186, '0', 5969);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (600037529, to_date('02-01-1991', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Frederic', 'Foxx', 'frederic.foxx@spotfireholdings.uk', 5033420823, '1', 4963);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (688604602, to_date('22-02-1957', 'dd-mm-yyyy'), '0', 'USA', 'Martha', 'Kleinenberg', 'martha.kleinenberg@diamondgroup.com', 6559817239, '0', 5483);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (904450930, to_date('24-05-1994', 'dd-mm-yyyy'), '1', 'USA', 'Red', 'Gore', 'red.gore@northhighland.com', 267186105, '0', 4440);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (124939598, to_date('01-10-1975', 'dd-mm-yyyy'), '1', 'Germany', 'Chad', 'Kretschmann', 'ckretschmann@signature.de', 7256586777, '0', 3197);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (962387059, to_date('19-04-1962', 'dd-mm-yyyy'), '0', 'Israel', 'Heather', 'Parker', 'heather.p@berkshirehathaway.il', 6799555496, '1', 4644);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (338752100, to_date('26-12-1977', 'dd-mm-yyyy'), '0', 'South Korea', 'Victor', 'Meyer', 'victor.meyer@meritagetechnologies.com', 4924292080, '1', 4428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798186959, to_date('12-11-1984', 'dd-mm-yyyy'), '1', 'Germany', 'Caroline', 'Orlando', 'caroline.o@tilia.de', 5447097052, '0', 3241);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (609294506, to_date('13-10-1993', 'dd-mm-yyyy'), '0', 'France', 'Pam', 'Boone', 'pam.boone@ecopy.fr', 3165174675, '0', 1288);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (427282771, to_date('30-12-1964', 'dd-mm-yyyy'), '1', 'Canada', 'Vern', 'Peebles', 'vern.peebles@dvdt.ca', 4280160475, '0', 3907);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (513675979, to_date('06-05-1984', 'dd-mm-yyyy'), '1', 'Italy', 'Dabney', 'Badalucco', 'dabneyb@tps.it', 8806328966, '0', 5179);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (368660224, to_date('14-06-1980', 'dd-mm-yyyy'), '1', 'Canada', 'Rick', 'Boone', 'r.boone@americanland.ca', 4422380322, '1', 1496);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (560646612, to_date('02-11-1991', 'dd-mm-yyyy'), '1', 'Netherlands', 'Nick', 'Karyo', 'nkaryo@sourcegear.nl', 6250868891, '0', 1614);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (666776711, to_date('04-06-1958', 'dd-mm-yyyy'), '1', 'New Caledonia', 'Garland', 'Overstreet', 'garland.overstreet@circuitcitystores.nc', 4372001966, '1', 1533);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (572839803, to_date('12-09-1969', 'dd-mm-yyyy'), '0', 'USA', 'Bill', 'Kleinenberg', 'bill.kleinenberg@unitedasset.com', 6364073984, '0', 5585);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (138453899, to_date('01-02-1973', 'dd-mm-yyyy'), '1', 'France', 'Elias', 'Rhys-Davies', 'elias.rhysdavies@kelmooreinvestment.fr', 6176482155, '0', 6002);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (462525039, to_date('24-01-1986', 'dd-mm-yyyy'), '1', 'USA', 'Joaquim', 'Farrell', 'joaquim@connected.com', 2498807354, '1', 6137);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (227044245, to_date('20-10-1985', 'dd-mm-yyyy'), '0', 'Germany', 'Maureen', 'MacDonald', 'maureen.macdonald@columbiabancorp.de', 8261279773, '1', 2097);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (762598515, to_date('25-11-1968', 'dd-mm-yyyy'), '1', 'Sweden', 'Tobey', 'Paymer', 'tobey.paymer@clorox.se', 9781090435, '0', 2929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (315519460, to_date('07-08-1955', 'dd-mm-yyyy'), '1', 'Germany', 'Jaime', 'Shalhoub', 'jaime.shalhoub@ams.de', 5333045239, '0', 1011);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (886204006, to_date('06-12-1981', 'dd-mm-yyyy'), '1', 'Germany', 'Dick', 'Cobbs', 'dick.cobbs@savela.de', 3468166281, '0', 1530);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (386249299, to_date('10-11-1998', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Kris', 'Parm', 'kris.parm@bestbuy.uk', 993597495, '1', 5886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (4149802, to_date('06-05-1972', 'dd-mm-yyyy'), '1', 'USA', 'Jack', 'Klugh', 'jack.klugh@signalperfection.com', 520417187, '0', 1270);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (302018551, to_date('10-03-1975', 'dd-mm-yyyy'), '0', 'USA', 'Etta', 'Armstrong', 'earmstrong@north.com', 3976628454, '1', 4722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (459045469, to_date('09-06-1965', 'dd-mm-yyyy'), '1', 'Canada', 'Sigourney', 'Himmelman', 'sigourney.h@ibm.ca', 5929690289, '0', 3406);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (833272684, to_date('05-12-1980', 'dd-mm-yyyy'), '1', 'Israel', 'Pam', 'Kretschmann', 'pamk@gtp.il', 2810175038, '1', 1254);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (382367876, to_date('26-05-1989', 'dd-mm-yyyy'), '0', 'Canada', 'Rutger', 'Lawrence', 'rutger.lawrence@mls.ca', 6105919002, '0', 4274);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (199042584, to_date('24-02-1999', 'dd-mm-yyyy'), '0', 'USA', 'Nora', 'Midler', 'nora.midler@staffforce.com', 1997597305, '1', 5161);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (240325490, to_date('25-03-1992', 'dd-mm-yyyy'), '0', 'USA', 'Courtney', 'Paxton', 'courtneyp@loreal.com', 3878732466, '1', 4054);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (261279341, to_date('11-11-1986', 'dd-mm-yyyy'), '1', 'USA', 'Noah', 'Conway', 'noah.conway@bedfordbancshares.com', 4377278846, '1', 3579);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (333355139, to_date('02-06-1978', 'dd-mm-yyyy'), '0', 'USA', 'Rosanne', 'Payton', 'r.payton@news.com', 6533308311, '1', 4131);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (41490763, to_date('08-05-1975', 'dd-mm-yyyy'), '1', 'USA', 'Blair', 'Carlyle', 'b.carlyle@at.com', 1147923586, '0', 3234);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (886994588, to_date('02-01-1968', 'dd-mm-yyyy'), '0', 'Germany', 'Wayne', 'Mac', 'wayne.mac@adeasolutions.de', 8402141073, '0', 6675);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (204973217, to_date('27-02-1969', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Emilio', 'Domino', 'emilio.domino@solutionbuilders.uk', 7163334159, '1', 1656);
commit;
prompt 600 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (438172485, to_date('20-04-1970', 'dd-mm-yyyy'), '0', 'USA', 'Patrick', 'Rio', 'patrick.rio@connected.com', 1664513652, '1', 2870);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (19618346, to_date('29-06-1963', 'dd-mm-yyyy'), '0', 'USA', 'Tyrone', 'LaPaglia', 't.lapaglia@kimberlyclark.com', 7145330206, '0', 6654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (902630454, to_date('26-10-1996', 'dd-mm-yyyy'), '0', 'France', 'Edward', 'Detmer', 'edward.detmer@seiaarons.fr', 7270043444, '0', 4155);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (919385552, to_date('03-08-1954', 'dd-mm-yyyy'), '1', 'USA', 'Joanna', 'Harmon', 'jharmon@topicsentertainment.com', 8475255015, '0', 6615);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (417227538, to_date('17-03-1974', 'dd-mm-yyyy'), '0', 'USA', 'Winona', 'Begley', 'wbegley@invisioncom.com', 4629179112, '1', 3538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (616526669, to_date('10-04-1996', 'dd-mm-yyyy'), '0', 'France', 'LeVar', 'Rhames', 'levarr@bat.fr', 4294821400, '0', 6920);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (524100507, to_date('17-04-1960', 'dd-mm-yyyy'), '1', 'France', 'Goran', 'Thomson', 'gorant@evergreenresources.fr', 1220282962, '1', 4808);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (962274077, to_date('26-10-1993', 'dd-mm-yyyy'), '0', 'USA', 'Rhona', 'Spine', 'rhona@base.com', 7071783110, '0', 4700);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (181941798, to_date('10-10-1952', 'dd-mm-yyyy'), '0', 'Germany', 'Cherry', 'McNeice', 'cherry.m@spectrum.de', 962643164, '1', 4501);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (212369717, to_date('20-08-1954', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Frank', 'Jackson', 'frank.j@bigyanksports.uk', 6786426424, '1', 4327);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (612926539, to_date('24-03-1972', 'dd-mm-yyyy'), '1', 'Japan', 'Lindsay', 'Ryder', 'lindsay.ryder@pioneermortgage.jp', 6775826001, '1', 6008);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (675765101, to_date('04-03-1985', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Angela', 'O''Hara', 'angela.ohara@techrx.uk', 5162606802, '0', 6650);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (217734534, to_date('04-08-1987', 'dd-mm-yyyy'), '1', 'USA', 'Robert', 'Archer', 'robert.archer@epiqsystems.com', 8050361115, '1', 2324);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (765290400, to_date('18-08-1981', 'dd-mm-yyyy'), '1', 'Netherlands', 'Leo', 'Puckett', 'leo@innovativelighting.nl', 6590076668, '0', 5944);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (135934713, to_date('27-03-1958', 'dd-mm-yyyy'), '1', 'Sweden', 'Horace', 'Hoffman', 'horace@learningvoyage.se', 5499221775, '0', 3750);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (766652917, to_date('30-07-1993', 'dd-mm-yyyy'), '0', 'USA', 'Barry', 'Sylvian', 'barry.sylvian@bps.com', 4173161968, '1', 2561);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (351278019, to_date('21-09-1957', 'dd-mm-yyyy'), '1', 'USA', 'Garth', 'Folds', 'garth.folds@mastercardinternational.com', 4500411700, '1', 5538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (158725210, to_date('01-09-1993', 'dd-mm-yyyy'), '0', 'Germany', 'Maria', 'Weir', 'maria.weir@fnb.de', 4792182121, '1', 3712);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (732358548, to_date('26-03-1965', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Bridget', 'Craig', 'b.craig@servicesource.uk', 9852553046, '0', 3074);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (435552740, to_date('12-02-1962', 'dd-mm-yyyy'), '0', 'USA', 'Selma', 'Marin', 'selma.m@ois.com', 6603403837, '1', 4903);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (801115166, to_date('19-07-1982', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Rob', 'Griffiths', 'rob.griffiths@jlphor.uk', 9213651391, '0', 3016);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (4277458, to_date('17-07-1957', 'dd-mm-yyyy'), '1', 'Israel', 'Kelly', 'Furay', 'kelly@stiknowledge.il', 4674099005, '0', 3479);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (458566204, to_date('27-06-1959', 'dd-mm-yyyy'), '1', 'Brazil', 'Sara', 'Colon', 'sara@atg.br', 2496259349, '0', 4425);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (443183974, to_date('31-08-1988', 'dd-mm-yyyy'), '0', 'Germany', 'Laurence', 'Gosdin', 'laurence.gosdin@marketbased.de', 1661528319, '0', 5151);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (395189741, to_date('10-08-1985', 'dd-mm-yyyy'), '0', 'USA', 'Reese', 'Donelly', 'r.donelly@wyeth.com', 8126702394, '1', 4180);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (756406768, to_date('09-08-1999', 'dd-mm-yyyy'), '1', 'Mexico', 'Tim', 'Levert', 'tim.l@lynksystems.mx', 3119175051, '0', 5702);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (684212549, to_date('28-12-1969', 'dd-mm-yyyy'), '1', 'Australia', 'Tyrone', 'Nugent', 'tyrone.n@wendysinternational.au', 3870208950, '0', 6029);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (140711211, to_date('13-10-1958', 'dd-mm-yyyy'), '0', 'Sweden', 'Wade', 'Sawa', 'wade.sawa@catamount.se', 6667901997, '0', 5674);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (648600046, to_date('11-01-1956', 'dd-mm-yyyy'), '1', 'Brazil', 'Chanté', 'Thewlis', 'chant.thewlis@viacom.br', 7865917380, '1', 1286);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (741951794, to_date('19-07-1974', 'dd-mm-yyyy'), '0', 'USA', 'Jody', 'Haysbert', 'jhaysbert@captechventures.com', 6644801983, '0', 2022);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (833212257, to_date('17-12-1985', 'dd-mm-yyyy'), '0', 'USA', 'Treat', 'Checker', 'treat.checker@commworks.com', 8235689794, '0', 4012);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (60830522, to_date('14-05-1950', 'dd-mm-yyyy'), '1', 'Taiwan', 'Veruca', 'Osbourne', 'veruca.osbourne@jollyenterprises.tw', 8763032339, '1', 1450);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (14215967, to_date('25-09-1963', 'dd-mm-yyyy'), '1', 'USA', 'Wendy', 'Whitaker', 'wendy.whitaker@grt.com', 4050964228, '1', 2588);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (38201953, to_date('04-02-1966', 'dd-mm-yyyy'), '0', 'Brazil', 'Jimmie', 'Curtis', 'jimmie@pepsico.br', 3629456333, '0', 6584);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (221076418, to_date('15-04-1994', 'dd-mm-yyyy'), '1', 'Austria', 'Carol', 'Tillis', 'carol.t@accessus.at', 9591354820, '0', 6668);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (315494600, to_date('28-04-1950', 'dd-mm-yyyy'), '0', 'USA', 'Jackson', 'Bracco', 'jackson.bracco@hudsonriverbancorp.com', 6399858378, '0', 2239);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (107358968, to_date('12-12-1997', 'dd-mm-yyyy'), '0', 'Israel', 'Jesus', 'Firth', 'jesus@qssgroup.il', 9155212937, '1', 6848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (673600442, to_date('10-09-1959', 'dd-mm-yyyy'), '1', 'Brazil', 'Rachael', 'Washington', 'rachaelw@bioreliance.br', 5065863164, '1', 5967);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (989838873, to_date('11-08-1954', 'dd-mm-yyyy'), '1', 'France', 'Art', 'urban', 'artu@viacell.fr', 9639145153, '0', 3822);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (78516147, to_date('05-05-1979', 'dd-mm-yyyy'), '1', 'Germany', 'Anita', 'Jolie', 'anita@navigatorsystems.de', 8409010356, '1', 5488);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (979127378, to_date('24-03-1964', 'dd-mm-yyyy'), '1', 'Germany', 'Shawn', 'Jay', 'shawn.jay@pis.de', 5037702216, '1', 5816);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (146635409, to_date('15-03-1969', 'dd-mm-yyyy'), '0', 'USA', 'Campbell', 'Kilmer', 'c.kilmer@elmco.com', 6842797541, '0', 4490);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (536585887, to_date('11-04-1981', 'dd-mm-yyyy'), '1', 'Pakistan', 'Jonathan', 'Judd', 'jonathan.judd@gulfmarkoffshore.pk', 9304685846, '0', 4137);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (331737596, to_date('27-07-1950', 'dd-mm-yyyy'), '1', 'USA', 'Greg', 'Gellar', 'greg.gellar@pioneermortgage.com', 1719076491, '1', 2644);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (173428399, to_date('03-03-1981', 'dd-mm-yyyy'), '0', 'Australia', 'Arturo', 'Hewitt', 'arturo@investmentscorecard.au', 363981985, '0', 3252);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (379879977, to_date('12-05-1964', 'dd-mm-yyyy'), '0', 'Germany', 'Harris', 'Uggams', 'h.uggams@generalmills.de', 4601059148, '0', 2561);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (58312799, to_date('28-10-1954', 'dd-mm-yyyy'), '0', 'Canada', 'Shannon', 'Downey', 'shannon.downey@shirtfactory.ca', 8280534111, '1', 4090);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (69991919, to_date('24-01-1972', 'dd-mm-yyyy'), '0', 'Palestine', 'Gord', 'Sarsgaard', 'gord.sarsgaard@sps.com', 5778647972, '0', 2634);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (582989189, to_date('01-08-1998', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Eddie', 'Kinney', 'ekinney@generalelectric.uk', 9479983760, '1', 4272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (377320167, to_date('25-02-1983', 'dd-mm-yyyy'), '0', 'Turkey', 'Ozzy', 'Hackman', 'ozzy.hackman@comglobalsystems.tr', 6214336630, '1', 2261);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (496818517, to_date('29-11-1992', 'dd-mm-yyyy'), '0', 'USA', 'Mia', 'Miller', 'mia.miller@prosum.com', 3070989695, '1', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (673125391, to_date('11-03-1983', 'dd-mm-yyyy'), '1', 'USA', 'Vivica', 'Travers', 'vivica.t@evergreenresources.com', 7920026816, '0', 1494);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (509911851, to_date('02-12-1981', 'dd-mm-yyyy'), '0', 'South Africa', 'Val', 'Crystal', 'val@sht.za', 4609075260, '0', 6364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (239641137, to_date('01-05-1955', 'dd-mm-yyyy'), '1', 'Norway', 'Neve', 'Hatosy', 'nhatosy@whitewave.no', 5681360402, '0', 4657);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (272134445, to_date('02-09-1965', 'dd-mm-yyyy'), '1', 'Germany', 'Herbie', 'Saxon', 'herbie.saxon@bestever.de', 659778356, '0', 2945);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (930477275, to_date('10-07-1966', 'dd-mm-yyyy'), '0', 'Italy', 'Freda', 'Biggs', 'freda.biggs@zaiqtechnologies.it', 1912948154, '1', 6926);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (654286887, to_date('25-05-1998', 'dd-mm-yyyy'), '1', 'Brazil', 'Hope', 'Dzundza', 'hope.dzundza@mwp.br', 6120777689, '1', 1808);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (292608988, to_date('16-04-1950', 'dd-mm-yyyy'), '1', 'Germany', 'Dar', 'Pullman', 'dar.pullman@jcpenney.de', 7368084869, '0', 5716);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (956998398, to_date('05-05-1958', 'dd-mm-yyyy'), '1', 'USA', 'Lindsey', 'O''Connor', 'lindsey.oconnor@ptg.com', 5473190296, '0', 4876);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (729666810, to_date('24-06-1967', 'dd-mm-yyyy'), '1', 'Israel', 'Uma', 'McBride', 'uma.m@nhhc.il', 9195985411, '0', 6132);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (578471087, to_date('12-05-1986', 'dd-mm-yyyy'), '0', 'Canada', 'Casey', 'Russell', 'crussell@simplycertificates.ca', 975669060, '1', 5538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28522786, to_date('16-04-1990', 'dd-mm-yyyy'), '0', 'USA', 'Olympia', 'Metcalf', 'olympia.m@scripnet.com', 9322947595, '1', 2326);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (677208902, to_date('26-04-1958', 'dd-mm-yyyy'), '0', 'USA', 'Goran', 'Gayle', 'goran.gayle@trusecure.com', 6405810926, '0', 6889);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (404681736, to_date('15-10-1998', 'dd-mm-yyyy'), '1', 'Japan', 'Jeffrey', 'Supernaw', 'jeffrey.supernaw@wrgservices.jp', 6169508182, '1', 3858);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (797975136, to_date('10-07-1988', 'dd-mm-yyyy'), '0', 'Spain', 'Sheryl', 'Reynolds', 'sheryl@knightsbridge.es', 6018409121, '1', 4722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (523460550, to_date('27-04-1999', 'dd-mm-yyyy'), '1', 'USA', 'Brad', 'Belle', 'bbelle@data.com', 4731680029, '1', 4337);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (850533442, to_date('26-12-1994', 'dd-mm-yyyy'), '1', 'Brazil', 'Mel', 'Ellis', 'm.ellis@career.br', 9629576598, '1', 6579);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (140796920, to_date('18-01-1975', 'dd-mm-yyyy'), '1', 'Italy', 'Steven', 'Kinney', 'steven.kinney@mms.it', 7865594889, '1', 4903);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (513202116, to_date('10-10-1999', 'dd-mm-yyyy'), '0', 'USA', 'Luis', 'Daniels', 'ldaniels@yashtechnologies.com', 1282268328, '0', 3716);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (249892871, to_date('12-08-1964', 'dd-mm-yyyy'), '0', 'USA', 'Kelly', 'Summer', 'kelly.summer@ipsadvisory.com', 6432358047, '0', 1486);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (214186440, to_date('22-03-1971', 'dd-mm-yyyy'), '1', 'USA', 'Frances', 'Diggs', 'frances.diggs@bashen.com', 991163449, '0', 5967);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (642525998, to_date('18-01-1986', 'dd-mm-yyyy'), '1', 'USA', 'Doug', 'Bacon', 'doug@flavorx.com', 335654222, '0', 1443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (351292379, to_date('27-06-1979', 'dd-mm-yyyy'), '0', 'Germany', 'Wes', 'Collie', 'wes.collie@johnkeeler.de', 7704343974, '1', 2272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (667258402, to_date('27-01-1956', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Dustin', 'Lightfoot', 'dustin.l@shirtfactory.uk', 4285628243, '0', 1917);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (769087987, to_date('03-09-1976', 'dd-mm-yyyy'), '0', 'USA', 'Embeth', 'Busey', 'embeth.busey@mindiq.com', 9145164314, '1', 2449);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (922613845, to_date('12-05-1950', 'dd-mm-yyyy'), '1', 'Germany', 'Scott', 'Loeb', 'scott.l@servicelink.de', 1588924063, '1', 3861);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28296806, to_date('10-02-1952', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Hazel', 'Whitford', 'h.whitford@bowman.uk', 9497609693, '0', 4120);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (612906109, to_date('12-12-1978', 'dd-mm-yyyy'), '0', 'Brazil', 'Cliff', 'Lillard', 'cliff.lillard@fordmotor.br', 5577830466, '0', 2799);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (998683682, to_date('06-02-1956', 'dd-mm-yyyy'), '0', 'USA', 'Azucar', 'Diddley', 'azucar.diddley@stonebrewing.com', 2093031192, '1', 4423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (178481650, to_date('05-09-1978', 'dd-mm-yyyy'), '1', 'Italy', 'Ernest', 'Yankovic', 'ernest.yankovic@unit.it', 6804380544, '0', 1853);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (531478449, to_date('24-04-1969', 'dd-mm-yyyy'), '1', 'Switzerland', 'Larry', 'Harper', 'larry.harper@asa.ch', 9614700673, '0', 1952);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (89880402, to_date('20-11-1991', 'dd-mm-yyyy'), '1', 'USA', 'Denis', 'Voight', 'denis.v@tripwire.com', 4054674431, '1', 3886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (217256209, to_date('27-12-1950', 'dd-mm-yyyy'), '0', 'USA', 'David', 'Loring', 'dloring@callhenry.com', 2894228586, '0', 4657);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (443037176, to_date('18-10-1986', 'dd-mm-yyyy'), '0', 'USA', 'Molly', 'Archer', 'molly.archer@swi.com', 5775822961, '1', 5990);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (686340253, to_date('04-07-1961', 'dd-mm-yyyy'), '1', 'USA', 'David', 'Nunn', 'david.nunn@mavericktechnologies.com', 4348226639, '0', 3538);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (510887833, to_date('03-05-1954', 'dd-mm-yyyy'), '0', 'USA', 'Pam', 'Dorff', 'pam.dorff@cis.com', 761794182, '1', 5013);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (737218377, to_date('20-07-1954', 'dd-mm-yyyy'), '0', 'Hong Kong', 'Burton', 'Alda', 'burton.alda@dynacqinternational.hk', 5386539995, '0', 2385);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (266402844, to_date('15-11-1964', 'dd-mm-yyyy'), '0', 'Germany', 'Gwyneth', 'Lithgow', 'gwyneth@drinkmorewater.de', 7180813269, '1', 6404);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (651891598, to_date('04-03-1952', 'dd-mm-yyyy'), '1', 'France', 'Gloria', 'Crudup', 'gloria.crudup@berkshirehathaway.fr', 9964877571, '1', 4697);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (548539897, to_date('27-12-1979', 'dd-mm-yyyy'), '0', 'Germany', 'Peter', 'Lynne', 'peter.l@kwraf.de', 7270460360, '1', 2968);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (371742574, to_date('09-04-1951', 'dd-mm-yyyy'), '1', 'USA', 'Suzanne', 'Cozier', 'suzanne.cozier@enterprise.com', 7705764804, '1', 6525);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (979670354, to_date('27-08-1974', 'dd-mm-yyyy'), '1', 'USA', 'Tcheky', 'Studi', 'tcheky.studi@johnkeeler.com', 5234745822, '0', 1364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (20470565, to_date('07-01-1974', 'dd-mm-yyyy'), '1', 'Poland', 'Stephen', 'Austin', 'saustin@glaxosmithkline.pl', 7043074914, '0', 4335);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (890831971, to_date('21-03-1965', 'dd-mm-yyyy'), '0', 'USA', 'Viggo', 'Balin', 'viggo@bigdoughcom.com', 2113551752, '0', 2853);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (362481556, to_date('25-10-1982', 'dd-mm-yyyy'), '0', 'USA', 'Randy', 'Payne', 'randy.payne@seiaarons.com', 3266112522, '0', 6765);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (141529590, to_date('17-12-1986', 'dd-mm-yyyy'), '1', 'USA', 'Geena', 'Kattan', 'geena.kattan@sysconmedia.com', 4476007197, '1', 2870);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (491566408, to_date('17-06-1988', 'dd-mm-yyyy'), '1', 'USA', 'Rowan', 'Gilley', 'rowan.gilley@linersdirect.com', 2792500778, '1', 6665);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (53823994, to_date('02-03-1965', 'dd-mm-yyyy'), '1', 'Brazil', 'Lee', 'Stills', 'lees@escalade.br', 2659701754, '1', 4272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (350395589, to_date('27-03-1993', 'dd-mm-yyyy'), '1', 'USA', 'Patti', 'Hauer', 'patti.hauer@afs.com', 6867935392, '1', 2770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (328440841, to_date('29-04-1979', 'dd-mm-yyyy'), '0', 'South Korea', 'Madeleine', 'Ferrell', 'madeleine.ferrell@ppr.com', 6469433556, '1', 2483);
commit;
prompt 700 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (250351507, to_date('06-12-1966', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Deborah', 'Holy', 'deborah.holy@perfectorder.uk', 1534126492, '0', 5717);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (746667500, to_date('11-08-1985', 'dd-mm-yyyy'), '1', 'USA', 'Rufus', 'Rippy', 'rufus.r@lifelinesystems.com', 8097857278, '0', 5459);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (791191833, to_date('17-01-1983', 'dd-mm-yyyy'), '0', 'Brazil', 'Denzel', 'Winger', 'denzel.winger@accesssystems.br', 5318044748, '0', 3768);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (507097156, to_date('03-12-1955', 'dd-mm-yyyy'), '0', 'USA', 'Carrie', 'Iglesias', 'carrie.iglesias@nhr.com', 9877241721, '0', 4088);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (464997765, to_date('07-07-1965', 'dd-mm-yyyy'), '0', 'USA', 'Rhys', 'Union', 'rhys.union@hotmail.com', 3919874455, '0', 5176);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (250202414, to_date('09-09-1977', 'dd-mm-yyyy'), '1', 'USA', 'Randy', 'Ceasar', 'r.ceasar@avs.com', 9508936691, '1', 1651);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (53799148, to_date('20-04-1974', 'dd-mm-yyyy'), '0', 'USA', 'Stewart', 'Rhodes', 'stewart.rhodes@ufs.com', 6855512032, '0', 6524);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (363827354, to_date('21-01-1969', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Rowan', 'Warwick', 'rowan.w@dataprise.uk', 5790610386, '0', 5219);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (658509942, to_date('30-08-1973', 'dd-mm-yyyy'), '1', 'Switzerland', 'France', 'Campbell', 'france.campbell@cowlitzbancorp.ch', 1572393641, '0', 3335);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (272453187, to_date('30-03-1961', 'dd-mm-yyyy'), '1', 'Israel', 'Chad', 'Reubens', 'chad@caliber.il', 9713191459, '1', 3197);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (603907838, to_date('10-09-1990', 'dd-mm-yyyy'), '0', 'USA', 'Rueben', 'Bean', 'r.bean@atxforms.com', 6827191215, '1', 5654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (348987244, to_date('16-04-1994', 'dd-mm-yyyy'), '1', 'Netherlands', 'Mickey', 'Doucette', 'mickeyd@sunstream.nl', 7396308892, '0', 5847);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (876156503, to_date('16-11-1974', 'dd-mm-yyyy'), '0', 'France', 'Marty', 'Kurtz', 'mkurtz@comglobalsystems.fr', 780128526, '1', 4150);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (479831860, to_date('25-04-1971', 'dd-mm-yyyy'), '1', 'USA', 'Brittany', 'Portman', 'brittany.portman@escalade.com', 2666688058, '1', 6946);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (239551634, to_date('03-02-1981', 'dd-mm-yyyy'), '0', 'USA', 'Dick', 'Peet', 'd.peet@codykramerimports.com', 7975538130, '1', 1819);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (990232865, to_date('15-03-1961', 'dd-mm-yyyy'), '1', 'Hong Kong', 'Terence', 'Ruiz', 'terence.ruiz@sony.hk', 8599971122, '0', 6603);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (999853173, to_date('08-02-1978', 'dd-mm-yyyy'), '1', 'India', 'Spike', 'Cobbs', 'spike@mds.in', 4676480671, '0', 2757);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (528363605, to_date('04-07-1955', 'dd-mm-yyyy'), '0', 'Finland', 'Joey', 'Balk', 'j.balk@generalmills.fi', 173838991, '0', 5619);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (862407310, to_date('16-11-1967', 'dd-mm-yyyy'), '0', 'USA', 'Mykelti', 'Metcalf', 'mykeltim@vertexsolutions.com', 2983416874, '1', 6159);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (887462740, to_date('11-01-1995', 'dd-mm-yyyy'), '1', 'Portugal', 'Cledus', 'Moffat', 'cledus.moffat@timevision.pt', 630599381, '0', 4137);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (572666454, to_date('14-11-1961', 'dd-mm-yyyy'), '1', 'Sweden', 'Hope', 'Haynes', 'hopeh@allegiantbancorp.se', 8032272748, '0', 5848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (203540058, to_date('12-11-1998', 'dd-mm-yyyy'), '0', 'USA', 'Art', 'Woods', 'a.woods@eagleone.com', 4932028629, '1', 5398);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (835074426, to_date('01-04-1978', 'dd-mm-yyyy'), '0', 'USA', 'Vickie', 'Borden', 'vickie.borden@newmedia.com', 5037562992, '1', 6428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (839565931, to_date('25-03-1950', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Harry', 'Marley', 'harry.marley@techrx.uk', 977122689, '0', 6629);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (229318972, to_date('18-04-1975', 'dd-mm-yyyy'), '1', 'Germany', 'Saul', 'Quatro', 's.quatro@idas.de', 1888745984, '1', 3697);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (220481471, to_date('22-01-1966', 'dd-mm-yyyy'), '1', 'Israel', 'Maggie', 'Hagar', 'maggie@wendysinternational.il', 7389400422, '1', 4309);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (893443477, to_date('19-12-1965', 'dd-mm-yyyy'), '0', 'USA', 'Meredith', 'Kleinenberg', 'mkleinenberg@inspirationsoftware.com', 2135153560, '0', 6116);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (381541656, to_date('05-03-1998', 'dd-mm-yyyy'), '1', 'USA', 'Liv', 'Detmer', 'liv.detmer@authoria.com', 4083761627, '0', 4396);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (146922262, to_date('24-11-1991', 'dd-mm-yyyy'), '1', 'Sweden', 'Nanci', 'Reeves', 'n.reeves@innovativelighting.se', 4712702352, '1', 3209);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (523005509, to_date('30-03-1976', 'dd-mm-yyyy'), '1', 'USA', 'Bret', 'Witt', 'bret@gha.com', 2866644621, '1', 4412);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (171099157, to_date('31-10-1979', 'dd-mm-yyyy'), '1', 'USA', 'Ron', 'De Niro', 'r.deniro@pioneerdatasystems.com', 3424242661, '1', 4722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (146930139, to_date('31-07-1980', 'dd-mm-yyyy'), '0', 'Spain', 'Miles', 'Utada', 'milesu@universalsolutions.es', 2578785537, '1', 6978);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (195818546, to_date('29-12-1978', 'dd-mm-yyyy'), '1', 'Israel', 'Victoria', 'Shatner', 'v.shatner@fds.il', 8933151650, '0', 1192);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (970079021, to_date('29-05-1959', 'dd-mm-yyyy'), '1', 'Germany', 'Kylie', 'Robbins', 'kylie.r@csi.de', 8288380975, '1', 2083);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (951443629, to_date('31-05-1966', 'dd-mm-yyyy'), '0', 'Germany', 'Nanci', 'Butler', 'nanci.butler@elitemedical.de', 5809309034, '0', 6867);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (90080942, to_date('07-12-1979', 'dd-mm-yyyy'), '0', 'USA', 'Woody', 'Ranger', 'woody.r@worldcom.com', 2928930138, '1', 5908);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (408556511, to_date('08-01-1955', 'dd-mm-yyyy'), '0', 'Japan', 'Dan', 'Penn', 'dan.penn@asa.jp', 6551272568, '0', 2941);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (210619987, to_date('20-11-1969', 'dd-mm-yyyy'), '1', 'USA', 'Swoosie', 'Morales', 'swoosie@labradanutrition.com', 7281732912, '0', 6643);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (860139761, to_date('07-02-1992', 'dd-mm-yyyy'), '1', 'Italy', 'Liev', 'Woodward', 'lwoodward@mosaic.it', 6065711668, '0', 4092);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (803642415, to_date('24-11-1991', 'dd-mm-yyyy'), '0', 'Germany', 'Ron', 'Murray', 'ron.murray@lydiantrust.de', 8530776163, '1', 1428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (729145553, to_date('28-08-1965', 'dd-mm-yyyy'), '0', 'USA', 'Lari', 'Lloyd', 'lari.lloyd@tigris.com', 3607601406, '0', 4708);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (498362837, to_date('29-12-1964', 'dd-mm-yyyy'), '0', 'Czech republic', 'Lily', 'Feore', 'lily.feore@isd.cz', 19019724, '0', 1838);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (854039626, to_date('11-03-1990', 'dd-mm-yyyy'), '1', 'USA', 'Terri', 'Coolidge', 'terri.c@drinkmorewater.com', 6339023600, '1', 2929);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (974926307, to_date('30-09-1973', 'dd-mm-yyyy'), '1', 'Italy', 'Devon', 'Lofgren', 'devon.lofgren@prp.it', 4961310295, '1', 2963);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (964595875, to_date('05-09-1954', 'dd-mm-yyyy'), '0', 'Italy', 'Ryan', 'Holiday', 'ryan.h@usgovernment.it', 537775429, '0', 1829);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (270937527, to_date('11-06-1990', 'dd-mm-yyyy'), '0', 'Japan', 'Charles', 'Isaak', 'c.isaak@datawarehouse.jp', 5595923172, '0', 4700);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (366342654, to_date('20-08-1997', 'dd-mm-yyyy'), '1', 'Canada', 'Mint', 'Hurt', 'mint.h@ait.ca', 8920460024, '1', 3769);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (833636443, to_date('11-11-1966', 'dd-mm-yyyy'), '0', 'Japan', 'Junior', 'Wariner', 'junior@heartlab.jp', 2374380219, '1', 6422);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (318849028, to_date('25-10-1994', 'dd-mm-yyyy'), '1', 'Italy', 'Maxine', 'Orlando', 'm.orlando@carboceramics.it', 9513617932, '0', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (912812064, to_date('10-06-1995', 'dd-mm-yyyy'), '0', 'Portugal', 'Sarah', 'Kershaw', 'sarah.kershaw@bristolmyers.pt', 1086222088, '0', 1474);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (470705516, to_date('10-07-1973', 'dd-mm-yyyy'), '1', 'USA', 'Ann', 'Murphy', 'ann.m@exinomtechnologies.com', 5410005435, '0', 3322);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (27535550, to_date('18-06-1959', 'dd-mm-yyyy'), '0', 'Sweden', 'Wendy', 'Kadison', 'wkadison@vertexsolutions.se', 4038142044, '1', 2097);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (507654093, to_date('14-04-1992', 'dd-mm-yyyy'), '1', 'Sweden', 'LeVar', 'Hunter', 'levar.hunter@heritagemicrofilm.se', 1828234056, '1', 3498);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (808299366, to_date('29-07-1980', 'dd-mm-yyyy'), '1', 'Switzerland', 'Bryan', 'Shand', 'bryan@staffone.ch', 8905139946, '0', 6770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (946924983, to_date('28-01-1966', 'dd-mm-yyyy'), '1', 'Sweden', 'Davey', 'Soul', 'davey.soul@americanexpress.se', 6930270401, '0', 4795);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (70099110, to_date('20-08-1951', 'dd-mm-yyyy'), '1', 'Germany', 'Mike', 'Hurley', 'mike@sensortechnologies.de', 5070491767, '1', 6002);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (901737771, to_date('20-02-1977', 'dd-mm-yyyy'), '1', 'USA', 'Lynette', 'Conners', 'lynette@chhc.com', 3757216704, '0', 2770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (667042818, to_date('04-08-1986', 'dd-mm-yyyy'), '0', 'USA', 'Christina', 'Bright', 'christina.bright@mcdonalds.com', 7884619847, '0', 2392);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (894212612, to_date('05-10-1968', 'dd-mm-yyyy'), '0', 'Germany', 'Liquid', 'Azaria', 'liquid.azaria@ssi.de', 1225831290, '1', 4048);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (877287469, to_date('12-03-1989', 'dd-mm-yyyy'), '0', 'Japan', 'Red', 'Berkeley', 'r.berkeley@aventis.jp', 436949319, '0', 6542);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (625515750, to_date('09-03-1985', 'dd-mm-yyyy'), '1', 'USA', 'Seann', 'Freeman', 's.freeman@elmco.com', 3689159908, '0', 2239);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (527494435, to_date('08-10-1993', 'dd-mm-yyyy'), '1', 'Italy', 'Harry', 'Clooney', 'harry@dillards.it', 3937328959, '1', 6923);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (490672241, to_date('28-07-1964', 'dd-mm-yyyy'), '0', 'Switzerland', 'Rupert', 'de Lancie', 'rupert@bestever.ch', 3351095252, '1', 4441);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (779443669, to_date('11-02-1966', 'dd-mm-yyyy'), '1', 'USA', 'Rawlins', 'Guest', 'rawlins.guest@peerlessmanufacturing.com', 2641286906, '0', 2738);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (487665992, to_date('04-04-1970', 'dd-mm-yyyy'), '0', 'Denmark', 'Jim', 'Rio', 'jim.rio@colgatepalmolive.dk', 1976121726, '1', 4795);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (578231442, to_date('08-09-1985', 'dd-mm-yyyy'), '1', 'USA', 'Jeanne', 'Favreau', 'jeanne.favreau@stonebrewing.com', 7783548142, '1', 1797);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (172822027, to_date('21-11-1994', 'dd-mm-yyyy'), '1', 'Germany', 'Veruca', 'Popper', 'veruca.popper@berkshirehathaway.de', 201880045, '0', 4177);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (601781963, to_date('13-07-1996', 'dd-mm-yyyy'), '0', 'USA', 'Kay', 'Hauer', 'khauer@alternativetechnology.com', 8188716495, '0', 5777);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (138399778, to_date('15-01-1955', 'dd-mm-yyyy'), '1', 'Japan', 'Jean', 'O''Connor', 'joconnor@its.jp', 4700012731, '0', 1864);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (390655866, to_date('01-11-1962', 'dd-mm-yyyy'), '1', 'Netherlands', 'Delbert', 'Branagh', 'delbert.branagh@bluffcitysteel.nl', 8320021127, '1', 5885);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (131410969, to_date('30-07-1959', 'dd-mm-yyyy'), '1', 'South Africa', 'Colleen', 'Palminteri', 'colleen.palminteri@conquest.za', 9451898173, '0', 2590);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (499321025, to_date('18-08-1986', 'dd-mm-yyyy'), '1', 'USA', 'Famke', 'Stone', 'famke.stone@ceb.com', 3659987104, '1', 3066);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (751633252, to_date('30-01-1959', 'dd-mm-yyyy'), '1', 'USA', 'Arnold', 'Sandoval', 'arnold.sandoval@taycorfinancial.com', 4088369268, '0', 2413);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (158491584, to_date('21-08-1955', 'dd-mm-yyyy'), '1', 'Germany', 'Cole', 'Sledge', 'c.sledge@prosum.de', 5017238092, '1', 3016);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (937407547, to_date('05-09-1973', 'dd-mm-yyyy'), '0', 'France', 'Gilberto', 'Cagle', 'gilberto.c@elitemedical.fr', 1393193492, '0', 4300);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (794395120, to_date('07-03-1976', 'dd-mm-yyyy'), '1', 'USA', 'Edgar', 'Kennedy', 'edgar.kennedy@ibm.com', 986462271, '1', 3423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (42724847, to_date('19-01-1959', 'dd-mm-yyyy'), '1', 'Germany', 'Darren', 'Bello', 'darrenb@heritagemicrofilm.de', 7259660406, '0', 5852);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (596857477, to_date('07-06-1984', 'dd-mm-yyyy'), '1', 'Switzerland', 'Hilton', 'Osborne', 'h.osborne@magnet.ch', 7662330712, '1', 2229);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (609111030, to_date('26-12-1982', 'dd-mm-yyyy'), '0', 'Japan', 'Marina', 'Moss', 'marina@alohanysystems.jp', 1053012814, '0', 5777);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (498069905, to_date('08-05-1979', 'dd-mm-yyyy'), '0', 'Germany', 'Sonny', 'Visnjic', 'sonny@kellogg.de', 8420260280, '1', 4181);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (364679889, to_date('16-11-1980', 'dd-mm-yyyy'), '1', 'France', 'Sinead', 'Root', 'sinead.root@authoria.fr', 6736056781, '1', 2644);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (153411296, to_date('29-05-1961', 'dd-mm-yyyy'), '1', 'USA', 'Terence', 'Broza', 't.broza@grayhawksystems.com', 2103363264, '1', 3401);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (151030350, to_date('16-09-1959', 'dd-mm-yyyy'), '0', 'USA', 'Loreena', 'Torino', 'loreena.torino@manhattanassociates.com', 9879526471, '1', 5926);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (392872388, to_date('07-09-1969', 'dd-mm-yyyy'), '1', 'USA', 'Jeffrey', 'Spall', 'jeffrey@esoftsolutions.com', 7860176912, '0', 3669);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (203120198, to_date('05-07-1998', 'dd-mm-yyyy'), '0', 'USA', 'Aidan', 'Connelly', 'aidan.c@procter.com', 8990126452, '0', 3579);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (913306615, to_date('29-04-1994', 'dd-mm-yyyy'), '0', 'USA', 'Ronny', 'Pryce', 'ronny.pryce@als.com', 857336253, '0', 3376);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (28893832, to_date('19-08-1980', 'dd-mm-yyyy'), '1', 'USA', 'Derek', 'Saucedo', 'derek.saucedo@pfizer.com', 2325186958, '1', 5694);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (750447741, to_date('30-04-1981', 'dd-mm-yyyy'), '0', 'Switzerland', 'Regina', 'Broadbent', 'regina@entelligence.ch', 1675079235, '0', 6666);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (31501332, to_date('11-08-1969', 'dd-mm-yyyy'), '1', 'Brazil', 'Red', 'Gugino', 'r.gugino@marriottinternational.br', 5186898052, '1', 5483);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (422658884, to_date('09-05-1962', 'dd-mm-yyyy'), '1', 'USA', 'Demi', 'Davidtz', 'demi@tracertechnologies.com', 7034358663, '0', 4520);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (331455186, to_date('08-03-1969', 'dd-mm-yyyy'), '1', 'USA', 'Tramaine', 'Hyde', 'tramaine.hyde@serentec.com', 804252891, '1', 3374);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (572725660, to_date('15-08-1974', 'dd-mm-yyyy'), '1', 'USA', 'Loretta', 'Playboys', 'loretta.playboys@gsat.com', 7247756767, '0', 2909);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (429326217, to_date('19-02-1992', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Wes', 'Vanian', 'w.vanian@zaiqtechnologies.uk', 333522864, '0', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (927484764, to_date('21-01-1985', 'dd-mm-yyyy'), '1', 'USA', 'Percy', 'Guinness', 'p.guinness@cowlitzbancorp.com', 9523180406, '0', 6926);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (649196468, to_date('22-10-1983', 'dd-mm-yyyy'), '1', 'Italy', 'Michelle', 'Matheson', 'michelle.matheson@daimlerchrysler.it', 9883694332, '0', 4755);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (726959688, to_date('16-12-1961', 'dd-mm-yyyy'), '0', 'USA', 'Andie', 'Stiers', 'andies@timberlanewoodcrafters.com', 6543846203, '0', 4636);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (211889797, to_date('19-03-1969', 'dd-mm-yyyy'), '1', 'USA', 'Suzanne', 'Maguire', 'suzanne.maguire@ibm.com', 2813941966, '1', 4747);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (44583467, to_date('18-12-1981', 'dd-mm-yyyy'), '1', 'USA', 'Alice', 'Kinski', 'a.kinski@trainersoft.com', 241287307, '0', 6465);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (406672833, to_date('08-04-1971', 'dd-mm-yyyy'), '0', 'USA', 'Dabney', 'Mac', 'd.mac@saralee.com', 2137459502, '1', 5660);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (101976667, to_date('26-05-1963', 'dd-mm-yyyy'), '1', 'USA', 'Wendy', 'Judd', 'wendy.judd@pioneerdatasystems.com', 27187856, '1', 3467);
commit;
prompt 800 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (793999209, to_date('19-08-1985', 'dd-mm-yyyy'), '1', 'Japan', 'Rose', 'Rea', 'rose.r@mission.jp', 5712631315, '0', 6217);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (83388055, to_date('16-08-1963', 'dd-mm-yyyy'), '1', 'Brazil', 'Xander', 'McKellen', 'xander.mckellen@abatix.br', 1891422853, '1', 1486);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (376575120, to_date('13-10-1972', 'dd-mm-yyyy'), '1', 'USA', 'Geoff', 'Vannelli', 'geoff@proclarity.com', 4612800465, '0', 1188);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (454831197, to_date('23-09-1971', 'dd-mm-yyyy'), '0', 'Sweden', 'Emily', 'Charles', 'emily@visainternational.se', 7919758236, '1', 1864);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (281444382, to_date('11-11-1998', 'dd-mm-yyyy'), '0', 'USA', 'Randall', 'Palmer', 'randall.palmer@gcd.com', 5962353310, '0', 6944);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (272030803, to_date('08-11-1987', 'dd-mm-yyyy'), '0', 'France', 'Steven', 'Downie', 'steven@safeway.fr', 9357895924, '0', 4044);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (912531509, to_date('14-09-1998', 'dd-mm-yyyy'), '0', 'Australia', 'Neil', 'Frost', 'neil.frost@ass.au', 5470441784, '1', 4440);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (79790611, to_date('05-05-1995', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Grant', 'Andrews', 'grant.a@abatix.uk', 8536187688, '1', 4795);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (566020537, to_date('16-06-1956', 'dd-mm-yyyy'), '0', 'USA', 'Sal', 'Witt', 'sal.witt@supplycorecom.com', 4289424144, '1', 2143);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (845273466, to_date('29-12-1954', 'dd-mm-yyyy'), '1', 'USA', 'Pamela', 'Tilly', 'pamela.tilly@vfs.com', 4796080679, '1', 5656);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (420452889, to_date('05-04-1958', 'dd-mm-yyyy'), '0', 'USA', 'Ramsey', 'Clarkson', 'ramsey.clarkson@gagwear.com', 4558710450, '1', 5200);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (853506379, to_date('15-02-1985', 'dd-mm-yyyy'), '0', 'USA', 'Christine', 'Osbourne', 'cosbourne@emt.com', 436271345, '0', 3441);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (206937799, to_date('15-10-1986', 'dd-mm-yyyy'), '0', 'USA', 'Stockard', 'Hornsby', 'stockard@mastercardinternational.com', 515624141, '1', 1656);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (315244004, to_date('02-08-1999', 'dd-mm-yyyy'), '0', 'USA', 'Horace', 'Frost', 'horacef@angieslist.com', 420248054, '0', 5886);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (881974934, to_date('21-02-1979', 'dd-mm-yyyy'), '1', 'Italy', 'Murray', 'Rawls', 'murray.rawls@denaliventures.it', 1765468575, '1', 6770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (360767941, to_date('03-07-1955', 'dd-mm-yyyy'), '1', 'USA', 'Hugh', 'Hanks', 'hughh@qls.com', 1487146354, '1', 6867);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (203282521, to_date('15-12-1995', 'dd-mm-yyyy'), '0', 'USA', 'Owen', 'Secada', 'owen.secada@newhorizons.com', 7895162681, '1', 3707);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (568409205, to_date('31-05-1968', 'dd-mm-yyyy'), '0', 'New Zealand', 'Phil', 'Wincott', 'philw@jewettcameron.nz', 7992803651, '0', 3448);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (699735250, to_date('18-07-1975', 'dd-mm-yyyy'), '0', 'Japan', 'Ty', 'Nicholas', 'ty38@spinnakerexploration.jp', 7796324371, '1', 1767);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (967815959, to_date('04-07-1972', 'dd-mm-yyyy'), '0', 'USA', 'Jena', 'Patrick', 'jena.patrick@lms.com', 9780516757, '0', 1423);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (202906916, to_date('20-06-1985', 'dd-mm-yyyy'), '0', 'USA', 'Terri', 'Smurfit', 't.smurfit@advertisingventures.com', 4753719216, '0', 6903);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (748296935, to_date('15-07-1965', 'dd-mm-yyyy'), '1', 'Italy', 'Buddy', 'Ruiz', 'buddy.r@hiltonhotels.it', 3970470867, '1', 1829);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (164588247, to_date('25-08-1979', 'dd-mm-yyyy'), '0', 'USA', 'Rade', 'Pacino', 'rade.pacino@stiknowledge.com', 5844903894, '0', 3314);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (461456720, to_date('03-01-1992', 'dd-mm-yyyy'), '1', 'Czech republic', 'Carrie-Anne', 'Adkins', 'cadkins@bps.cz', 3036314369, '1', 2770);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (25025254, to_date('02-11-1999', 'dd-mm-yyyy'), '1', 'USA', 'Corey', 'Rippy', 'corey.rippy@savela.com', 2274892548, '0', 4621);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (854907868, to_date('27-02-1970', 'dd-mm-yyyy'), '0', 'USA', 'Paula', 'Stormare', 'paula.stormare@qas.com', 3141074603, '0', 5161);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (83246981, to_date('19-01-1981', 'dd-mm-yyyy'), '0', 'Italy', 'Lauren', 'Robinson', 'lauren.robinson@qssgroup.it', 5574842296, '0', 5359);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (317507954, to_date('02-10-1998', 'dd-mm-yyyy'), '0', 'USA', 'Chaka', 'O''Connor', 'chaka.oconnor@paisley.com', 6814389820, '0', 2012);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (460960012, to_date('05-12-1993', 'dd-mm-yyyy'), '1', 'USA', 'Larenz', 'Sepulveda', 'larenzs@ivci.com', 8265666103, '1', 2839);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (458124843, to_date('09-01-1998', 'dd-mm-yyyy'), '0', 'New Zealand', 'Rod', 'Jackson', 'rodj@ungertechnologies.nz', 7187830439, '0', 6848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (325886475, to_date('14-02-1978', 'dd-mm-yyyy'), '1', 'South Korea', 'Emily', 'Simpson', 'emily@kroger.com', 7555390680, '0', 2898);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (610684370, to_date('25-06-1981', 'dd-mm-yyyy'), '0', 'South Africa', 'Gordon', 'Bancroft', 'gordon.bancroft@deutschetelekom.za', 9789469523, '0', 3283);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (192213206, to_date('09-03-1954', 'dd-mm-yyyy'), '0', 'Germany', 'Tzi', 'Haslam', 'tzi.haslam@democracydata.de', 422831563, '0', 5654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (533118688, to_date('22-10-1968', 'dd-mm-yyyy'), '1', 'Japan', 'Mickey', 'Karyo', 'mickey.karyo@data.jp', 1339712605, '1', 5484);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (516777158, to_date('22-03-1984', 'dd-mm-yyyy'), '0', 'Italy', 'Max', 'Duschel', 'm.duschel@bps.it', 9764730982, '1', 5869);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (282334679, to_date('24-08-1971', 'dd-mm-yyyy'), '1', 'Poland', 'Vern', 'Savage', 'vern.s@consultants.pl', 238031550, '0', 2885);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (132485501, to_date('11-10-1981', 'dd-mm-yyyy'), '0', 'USA', 'Liv', 'Borgnine', 'liv@envisiontelephony.com', 126388284, '1', 6903);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (909527350, to_date('21-05-1976', 'dd-mm-yyyy'), '0', 'USA', 'Giovanni', 'Senior', 'giovanni.s@esteelauder.com', 3791808358, '1', 3898);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (542400424, to_date('01-07-1980', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Leo', 'Giraldo', 'lgiraldo@gentrasystems.uk', 8311148782, '1', 5877);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (548938028, to_date('14-09-1987', 'dd-mm-yyyy'), '1', 'USA', 'Lara', 'Trejo', 'lara.trejo@doraldentalusa.com', 3771839117, '0', 3068);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (583621345, to_date('09-05-1993', 'dd-mm-yyyy'), '1', 'Germany', 'Anthony', 'Wood', 'anthony.wood@aoe.de', 386851702, '0', 5359);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (641726909, to_date('07-06-1993', 'dd-mm-yyyy'), '1', 'Denmark', 'Halle', 'Peet', 'halle.peet@capstone.dk', 1607669475, '0', 4180);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (917570132, to_date('21-08-1957', 'dd-mm-yyyy'), '1', 'USA', 'Roscoe', 'Winans', 'roscoe.winans@prp.com', 1058913370, '1', 6891);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (87657726, to_date('13-03-1977', 'dd-mm-yyyy'), '1', 'Greece', 'Mira', 'Romijn-Stamos', 'mira.romijnstamos@genextechnologies.gr', 3312612521, '0', 5908);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (64374414, to_date('11-04-1971', 'dd-mm-yyyy'), '1', 'USA', 'Rupert', 'Mason', 'rupert.mason@ntas.com', 2582075838, '0', 3747);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (114981111, to_date('05-04-1992', 'dd-mm-yyyy'), '0', 'USA', 'Allison', 'Lightfoot', 'allison.lightfoot@astafunding.com', 4542560122, '1', 5023);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (987985603, to_date('15-06-1961', 'dd-mm-yyyy'), '1', 'France', 'Paul', 'Presley', 'paul.presley@tilia.fr', 3760307218, '0', 5459);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (878970628, to_date('07-05-1963', 'dd-mm-yyyy'), '0', 'USA', 'Ralph', 'Alston', 'ralph@saltgroup.com', 7460341590, '0', 4700);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (339851906, to_date('06-05-1961', 'dd-mm-yyyy'), '1', 'USA', 'Harris', 'Hewett', 'harris.h@investmentscorecard.com', 293733177, '0', 1012);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (989356294, to_date('13-09-1976', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Thelma', 'Withers', 'thelma.withers@medsource.uk', 6447962490, '1', 6471);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (347369617, to_date('01-06-1974', 'dd-mm-yyyy'), '0', 'Israel', 'Ramsey', 'Keener', 'ramsey@ptg.il', 903880254, '0', 5415);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (610400747, to_date('07-06-1952', 'dd-mm-yyyy'), '1', 'USA', 'Mekhi', 'Patrick', 'mekhi.patrick@afs.com', 3235458928, '0', 5931);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (304844569, to_date('10-10-1963', 'dd-mm-yyyy'), '0', 'Germany', 'Regina', 'Azaria', 'regina.a@virbac.de', 1742001117, '0', 2835);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (178643404, to_date('07-02-1962', 'dd-mm-yyyy'), '0', 'Germany', 'Glen', 'Stuermer', 'glen.s@invisioncom.de', 3272016205, '0', 4346);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (186572335, to_date('17-04-1951', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Azucar', 'Suvari', 'asuvari@proclarity.uk', 2268773865, '1', 2229);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (587896370, to_date('09-10-1994', 'dd-mm-yyyy'), '1', 'USA', 'Trini', 'Diggs', 't.diggs@swi.com', 2542111801, '0', 2515);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (874545792, to_date('06-10-1965', 'dd-mm-yyyy'), '1', 'USA', 'Vincent', 'Hewitt', 'v.hewitt@pinnaclestaffing.com', 7259785642, '0', 2483);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (823706801, to_date('26-11-1961', 'dd-mm-yyyy'), '1', 'Germany', 'Roger', 'Witt', 'rogerw@telecheminternational.de', 6608104928, '1', 6048);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (424330533, to_date('17-08-1967', 'dd-mm-yyyy'), '0', 'USA', 'Sarah', 'Badalucco', 'sarah.badalucco@bowman.com', 5586311834, '0', 4108);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (547727770, to_date('03-01-1975', 'dd-mm-yyyy'), '0', 'Germany', 'Shannyn', 'Dickinson', 'shannynd@baesch.de', 9261181055, '0', 3534);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (840620091, to_date('20-09-1958', 'dd-mm-yyyy'), '1', 'USA', 'Neve', 'Giannini', 'neve.giannini@trusecure.com', 62794702, '0', 6725);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (262111245, to_date('10-05-1982', 'dd-mm-yyyy'), '1', 'Israel', 'Neve', 'Sewell', 'neve.s@staffone.il', 8362602070, '1', 6675);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (22248243, to_date('05-04-1982', 'dd-mm-yyyy'), '0', 'Brazil', 'Alfie', 'Warden', 'alfiew@ibm.br', 6508336949, '0', 5839);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (625173819, to_date('27-03-1997', 'dd-mm-yyyy'), '1', 'Sweden', 'Kelly', 'Baker', 'kelly.baker@mqsoftware.se', 8072147333, '0', 2618);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (761083005, to_date('18-11-1951', 'dd-mm-yyyy'), '0', 'Germany', 'Carolyn', 'McDormand', 'carolyn.mcdormand@trx.de', 9869239977, '1', 1729);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (809861436, to_date('19-08-1967', 'dd-mm-yyyy'), '1', 'USA', 'Nina', 'Ticotin', 'nina.ticotin@activeservices.com', 7448022164, '0', 5566);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (756805117, to_date('10-05-1962', 'dd-mm-yyyy'), '1', 'USA', 'Dylan', 'Hatosy', 'dylanh@shufflemaster.com', 1786079861, '1', 3500);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (773055592, to_date('21-08-1996', 'dd-mm-yyyy'), '0', 'Norway', 'Mika', 'Belushi', 'mika.belushi@conquestsystems.no', 3762736700, '0', 4396);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (192009442, to_date('11-08-1972', 'dd-mm-yyyy'), '0', 'Italy', 'Etta', 'McGovern', 'etta.m@baesch.it', 7018285843, '0', 6525);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (587938540, to_date('15-11-1981', 'dd-mm-yyyy'), '1', 'Italy', 'Pelvic', 'Barrymore', 'pelvic.barrymore@efcbancorp.it', 9450913043, '0', 3618);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (127393968, to_date('04-09-1969', 'dd-mm-yyyy'), '1', 'USA', 'Rhett', 'Mewes', 'rhett.mewes@nbs.com', 8587147895, '0', 4155);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (140213065, to_date('25-09-1990', 'dd-mm-yyyy'), '1', 'Italy', 'Alannah', 'Rippy', 'alannah.rippy@dancor.it', 3215748469, '1', 1120);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (127476704, to_date('27-03-1968', 'dd-mm-yyyy'), '0', 'USA', 'Xander', 'Soda', 'xander.soda@morganresearch.com', 3032700642, '1', 5484);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (859817578, to_date('15-12-1956', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Horace', 'Gough', 'horace.gough@sds.uk', 4728597615, '1', 4722);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (955818571, to_date('19-05-1990', 'dd-mm-yyyy'), '1', 'Italy', 'Reese', 'Ledger', 'rledger@interfacesoftware.it', 7840012450, '1', 3750);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (318012171, to_date('02-04-1978', 'dd-mm-yyyy'), '1', 'Canada', 'Peter', 'Lennix', 'peter.lennix@lydiantrust.ca', 9940135134, '0', 2111);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (410279370, to_date('10-12-1967', 'dd-mm-yyyy'), '1', 'South Korea', 'Katrin', 'Margulies', 'kmargulies@typhoon.com', 4673189117, '1', 1450);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (567737400, to_date('20-01-1969', 'dd-mm-yyyy'), '0', 'Switzerland', 'Stellan', 'Chandler', 'stellan.chandler@hersheyfoods.ch', 1374033712, '0', 5222);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (31462784, to_date('13-07-1975', 'dd-mm-yyyy'), '0', 'Canada', 'Udo', 'Union', 'udo.union@hps.ca', 3337840056, '0', 5962);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (79311226, to_date('14-08-1985', 'dd-mm-yyyy'), '1', 'USA', 'Ray', 'Owen', 'r.owen@esteelauder.com', 9324426506, '0', 1745);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (886710220, to_date('26-08-1976', 'dd-mm-yyyy'), '0', 'Austria', 'Crystal', 'Lauper', 'crystal.lauper@atlanticnet.at', 5019075422, '1', 2245);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (18872633, to_date('02-09-1998', 'dd-mm-yyyy'), '1', 'USA', 'Diamond', 'Vassar', 'diamond@pinnaclestaffing.com', 2422531339, '0', 5195);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (344872159, to_date('06-05-1950', 'dd-mm-yyyy'), '0', 'USA', 'Vendetta', 'Li', 'vendetta@dataprise.com', 812713149, '1', 6654);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (108932936, to_date('15-12-1978', 'dd-mm-yyyy'), '1', 'Brazil', 'Ronnie', 'Del Toro', 'ronnie.deltoro@unitedasset.br', 9449408942, '1', 5590);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (344797149, to_date('12-12-1955', 'dd-mm-yyyy'), '0', 'Croatia', 'Davis', 'Robards', 'davis.robards@aldensystems.com', 2601900294, '0', 2592);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (882494818, to_date('03-07-1982', 'dd-mm-yyyy'), '0', 'USA', 'Judge', 'Skerritt', 'judge.skerritt@infovision.com', 6423177279, '1', 2368);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (514918808, to_date('21-12-1965', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Sissy', 'Singh', 'sissys@reckittbenckiser.uk', 4055798654, '1', 2883);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (268275806, to_date('18-10-1999', 'dd-mm-yyyy'), '1', 'Germany', 'Kirsten', 'Dafoe', 'kirsten.dafoe@signature.de', 2304774723, '0', 5228);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (78350241, to_date('08-09-1977', 'dd-mm-yyyy'), '1', 'Sweden', 'Uma', 'Cleary', 'uma.cleary@hfn.se', 1483055280, '0', 5702);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (106385854, to_date('23-07-1996', 'dd-mm-yyyy'), '1', 'Greece', 'Minnie', 'Field', 'minnie@marriottinternational.gr', 6528931718, '0', 5926);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (23593492, to_date('30-10-1973', 'dd-mm-yyyy'), '1', 'USA', 'David', 'Hoskins', 'davidh@spectrum.com', 5347514286, '1', 1134);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (570997427, to_date('11-08-1976', 'dd-mm-yyyy'), '1', 'USA', 'LeVar', 'Sisto', 'levar.sisto@johnkeeler.com', 9598843207, '0', 1428);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (880028460, to_date('12-05-1990', 'dd-mm-yyyy'), '1', 'USA', 'Kylie', 'Ingram', 'kingram@securitycheck.com', 3725519680, '0', 4914);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (427858312, to_date('29-08-1951', 'dd-mm-yyyy'), '0', 'USA', 'Liquid', 'MacLachlan', 'l.maclachlan@progressivemedical.com', 3718237561, '1', 3327);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (724648646, to_date('25-08-1985', 'dd-mm-yyyy'), '0', 'Canada', 'Keanu', 'Vaughan', 'keanu.v@gapinc.ca', 5089532803, '1', 4346);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (376643693, to_date('21-04-1995', 'dd-mm-yyyy'), '0', 'USA', 'Sylvester', 'Huston', 's.huston@curagroup.com', 5212085298, '0', 4796);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (81739076, to_date('25-01-1984', 'dd-mm-yyyy'), '1', 'France', 'Roddy', 'Rubinek', 'roddy.rubinek@americanvanguard.fr', 2470384811, '0', 6202);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (641982722, to_date('22-03-1957', 'dd-mm-yyyy'), '1', 'USA', 'Christmas', 'Snow', 'christmas.snow@drinkmorewater.com', 2281100569, '1', 3940);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (460542475, to_date('09-08-1997', 'dd-mm-yyyy'), '0', 'USA', 'Alana', 'Mellencamp', 'amellencamp@gulfmarkoffshore.com', 5259693532, '1', 1688);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (165342839, to_date('03-11-1963', 'dd-mm-yyyy'), '1', 'USA', 'Nina', 'Trejo', 'ninat@techbooks.com', 4662623867, '1', 4181);
commit;
prompt 900 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (34893191, to_date('30-09-1987', 'dd-mm-yyyy'), '0', 'Switzerland', 'Leo', 'Ramirez', 'leo.ramirez@magnet.ch', 9969012950, '1', 3029);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (631048703, to_date('24-12-1965', 'dd-mm-yyyy'), '1', 'USA', 'Maria', 'Biehn', 'maria@directdata.com', 9787882103, '0', 5118);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (524331831, to_date('13-02-1974', 'dd-mm-yyyy'), '1', 'Japan', 'Andre', 'Numan', 'andre.numan@accuship.jp', 7650231392, '1', 5255);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (385992411, to_date('29-03-1972', 'dd-mm-yyyy'), '0', 'USA', 'Daryl', 'Danes', 'daryl@gha.com', 9845801168, '0', 5281);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (11064073, to_date('09-04-1953', 'dd-mm-yyyy'), '1', 'USA', 'Jean', 'Voight', 'jean.voight@microsoft.com', 8888795653, '1', 1585);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (344592920, to_date('11-04-1993', 'dd-mm-yyyy'), '0', 'USA', 'Connie', 'Cotton', 'connie.cotton@trusecure.com', 6132429215, '0', 6417);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (833168091, to_date('04-04-1950', 'dd-mm-yyyy'), '0', 'USA', 'Ed', 'Flanagan', 'ed.flanagan@meghasystems.com', 5638370641, '0', 2791);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (123484187, to_date('18-04-1965', 'dd-mm-yyyy'), '0', 'USA', 'Collin', 'Carrack', 'ccarrack@educationaldevelopment.com', 2529134503, '0', 5708);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (97464921, to_date('27-02-1950', 'dd-mm-yyyy'), '1', 'USA', 'Campbell', 'Nivola', 'campbell.nivola@conagra.com', 759949153, '0', 3002);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (819709340, to_date('21-03-1983', 'dd-mm-yyyy'), '0', 'Sweden', 'Martha', 'Coverdale', 'martha.coverdale@viacell.se', 7102756551, '0', 4501);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (862420777, to_date('10-02-1965', 'dd-mm-yyyy'), '1', 'USA', 'Rhona', 'Baez', 'rhona.baez@advancedneuromodulation.com', 947707053, '0', 1796);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (108164810, to_date('03-06-1999', 'dd-mm-yyyy'), '1', 'Germany', 'Nancy', 'Camp', 'nancy.camp@trusecure.de', 2473619615, '1', 3241);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (717534777, to_date('07-09-1997', 'dd-mm-yyyy'), '0', 'Spain', 'Giovanni', 'Jeter', 'g.jeter@eastmankodak.es', 1767630118, '1', 2020);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (356237813, to_date('12-10-1956', 'dd-mm-yyyy'), '0', 'Brazil', 'Elle', 'McGregor', 'elle.mcgregor@pra.br', 1797202361, '0', 3420);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (524062216, to_date('10-03-1960', 'dd-mm-yyyy'), '1', 'Italy', 'Collin', 'Branagh', 'collin.branagh@nexxtworks.it', 9177538975, '0', 6983);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (519983874, to_date('21-12-1962', 'dd-mm-yyyy'), '1', 'USA', 'Julio', 'Connery', 'julioc@dell.com', 3289181097, '1', 2945);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (553702650, to_date('12-04-1984', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Armand', 'Bergen', 'armand.bergen@netnumina.uk', 6472073631, '0', 3861);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (423086706, to_date('06-12-1964', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Anita', 'Lizzy', 'anita.lizzy@profitline.uk', 5119014487, '1', 5717);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (138128122, to_date('22-09-1951', 'dd-mm-yyyy'), '0', 'USA', 'Marisa', 'Fraser', 'marisa.fraser@esteelauder.com', 5295791539, '1', 5255);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (462567688, to_date('08-12-1955', 'dd-mm-yyyy'), '1', 'Canada', 'Tyrone', 'McKennitt', 'tyrone.mckennitt@aquascapedesigns.ca', 9647068925, '1', 5238);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (62916882, to_date('29-01-1950', 'dd-mm-yyyy'), '0', 'USA', 'Yolanda', 'Amos', 'yolanda.a@pepsico.com', 2737370252, '1', 1556);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (620324170, to_date('15-06-1994', 'dd-mm-yyyy'), '1', 'Italy', 'Alex', 'Weller', 'alex.weller@cowlitzbancorp.it', 2133424923, '1', 2305);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (146932814, to_date('18-05-1960', 'dd-mm-yyyy'), '1', 'Italy', 'Tramaine', 'Witherspoon', 'tramaine.witherspoon@fetchlogistics.it', 3510314080, '1', 5212);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (723721382, to_date('15-01-1974', 'dd-mm-yyyy'), '1', 'Japan', 'Bradley', 'Leachman', 'bradley.leachman@spectrum.jp', 372732609, '1', 5695);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (330162412, to_date('20-05-1979', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Neil', 'Lyonne', 'neil.l@capellaeducation.uk', 6199224714, '0', 1011);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (107598852, to_date('08-12-1981', 'dd-mm-yyyy'), '1', 'USA', 'Edgar', 'Springfield', 'edgar.s@consultants.com', 6186047477, '0', 3769);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (189652121, to_date('16-02-1973', 'dd-mm-yyyy'), '1', 'USA', 'Nick', 'Sobieski', 'nick.s@execuscribe.com', 3146772361, '1', 5969);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (208339153, to_date('30-09-1957', 'dd-mm-yyyy'), '1', 'USA', 'Gates', 'Rosas', 'gates.rosas@aoltimewarner.com', 308889752, '0', 6975);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (299382983, to_date('03-07-1996', 'dd-mm-yyyy'), '1', 'France', 'Juliet', 'Olyphant', 'juliet.o@accessus.fr', 7277234831, '0', 2133);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (83660395, to_date('08-09-1953', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Matthew', 'Swinton', 'matthew.swinton@nhr.uk', 4115192504, '1', 6217);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (501914924, to_date('04-02-1998', 'dd-mm-yyyy'), '1', 'USA', 'Balthazar', 'Polito', 'balthazar.polito@hersheyfoods.com', 9398147765, '1', 5759);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (156960116, to_date('15-03-1966', 'dd-mm-yyyy'), '1', 'Netherlands', 'Armand', 'Lindley', 'armand.lindley@afs.nl', 6748377261, '0', 2272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (588475753, to_date('23-10-1994', 'dd-mm-yyyy'), '1', 'Sweden', 'Annie', 'Mortensen', 'annie@ezecastlesoftware.se', 8877252525, '0', 5397);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (234189472, to_date('28-01-1978', 'dd-mm-yyyy'), '0', 'Argentina', 'Judi', 'Supernaw', 'judi.supernaw@kingston.ar', 9989604474, '1', 5674);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (774899279, to_date('09-04-1965', 'dd-mm-yyyy'), '1', 'USA', 'Hope', 'Berkoff', 'hberkoff@trekequipment.com', 1954733835, '1', 3681);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (358003431, to_date('24-06-1974', 'dd-mm-yyyy'), '1', 'USA', 'Nelly', 'Miles', 'nelly.m@3tsystems.com', 8736996681, '1', 6867);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (623907515, to_date('24-02-1994', 'dd-mm-yyyy'), '0', 'USA', 'Julie', 'Logue', 'juliel@ogiointernational.com', 1921796929, '0', 3434);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (149206118, to_date('14-07-1959', 'dd-mm-yyyy'), '0', 'USA', 'Busta', 'Bentley', 'busta@angieslist.com', 5750460844, '1', 2547);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (272503904, to_date('18-10-1953', 'dd-mm-yyyy'), '0', 'USA', 'Jaime', 'Kirshner', 'jaime.kirshner@typhoon.com', 3549096456, '1', 2362);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (385225799, to_date('19-08-1981', 'dd-mm-yyyy'), '1', 'USA', 'Aida', 'Donovan', 'adonovan@staffone.com', 8673171508, '1', 2990);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (314389210, to_date('12-07-1997', 'dd-mm-yyyy'), '0', 'Germany', 'Lloyd', 'Gere', 'lloyd@freedommedical.de', 841300289, '1', 4237);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (456980024, to_date('16-09-1956', 'dd-mm-yyyy'), '1', 'India', 'Heath', 'Allison', 'heath@printingforlesscom.in', 5906679135, '0', 1288);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (164102102, to_date('14-01-1987', 'dd-mm-yyyy'), '0', 'USA', 'Sophie', 'Dempsey', 'sophie.dempsey@mag.com', 9289748401, '0', 5777);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (211762203, to_date('02-12-1968', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Antonio', 'Moraz', 'antonio.moraz@paintedword.uk', 5743375030, '1', 1501);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (61537964, to_date('10-08-1978', 'dd-mm-yyyy'), '1', 'Japan', 'Natasha', 'Haslam', 'natasha.haslam@aoltimewarner.jp', 3002771743, '0', 5512);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (972646669, to_date('06-12-1990', 'dd-mm-yyyy'), '0', 'Germany', 'Dom', 'Fiennes', 'domf@palmbeachtan.de', 6438531707, '1', 2898);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (633262154, to_date('05-04-1989', 'dd-mm-yyyy'), '1', 'Italy', 'Eliza', 'Hudson', 'eliza.hudson@meridiangold.it', 6229264259, '1', 2947);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (172144720, to_date('02-01-1966', 'dd-mm-yyyy'), '0', 'Spain', 'Grace', 'Zappacosta', 'grace.z@hencie.es', 9828961011, '1', 6446);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (519617115, to_date('12-04-1961', 'dd-mm-yyyy'), '0', 'USA', 'Juan', 'Parm', 'juan.parm@consultants.com', 4710730117, '0', 2618);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (902672077, to_date('02-09-1996', 'dd-mm-yyyy'), '1', 'USA', 'Raymond', 'McGriff', 'raymond.m@prahs.com', 8651402461, '1', 2230);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (374869049, to_date('04-11-1971', 'dd-mm-yyyy'), '1', 'Canada', 'Parker', 'Perry', 'p.perry@httprint.ca', 3362434881, '0', 1833);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (904290357, to_date('03-01-1975', 'dd-mm-yyyy'), '0', 'USA', 'Danni', 'McKean', 'danni.mckean@aquascapedesigns.com', 7767659227, '0', 3068);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (991523325, to_date('25-08-1951', 'dd-mm-yyyy'), '0', 'Denmark', 'Angela', 'Bachman', 'angela.b@magnet.dk', 7607758743, '0', 2454);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (184421007, to_date('01-07-1958', 'dd-mm-yyyy'), '0', 'USA', 'Christine', 'Harrelson', 'c.harrelson@elite.com', 9422384993, '0', 1326);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (870658346, to_date('02-12-1987', 'dd-mm-yyyy'), '1', 'Russia', 'Jann', 'Reinhold', 'j.reinhold@ogiointernational.com', 3940338353, '1', 2458);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (319022262, to_date('06-05-1950', 'dd-mm-yyyy'), '0', 'USA', 'Brad', 'Hingle', 'brad.hingle@sysconmedia.com', 480355818, '1', 4100);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (372415237, to_date('09-12-1984', 'dd-mm-yyyy'), '1', 'Germany', 'Marisa', 'David', 'marisa.david@freedommedical.de', 8149986451, '1', 4441);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (459543481, to_date('31-01-1992', 'dd-mm-yyyy'), '1', 'USA', 'Stewart', 'Fehr', 'stewart.fehr@tropicaloasis.com', 6446216755, '0', 2758);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (77343530, to_date('10-06-1998', 'dd-mm-yyyy'), '1', 'USA', 'Cathy', 'Mason', 'c.mason@sci.com', 5022839042, '1', 6364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (646481475, to_date('22-11-1983', 'dd-mm-yyyy'), '1', 'USA', 'Winona', 'Oates', 'w.oates@speakeasy.com', 9044629615, '1', 2305);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (585257189, to_date('04-04-1991', 'dd-mm-yyyy'), '0', 'USA', 'Joely', 'Bonham', 'joelyb@dynacqinternational.com', 1208819569, '0', 6643);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (651944026, to_date('10-08-1972', 'dd-mm-yyyy'), '1', 'Germany', 'Sophie', 'Portman', 'sophie.portman@younginnovations.de', 5816214083, '1', 2385);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (6076097, to_date('28-06-1978', 'dd-mm-yyyy'), '1', 'USA', 'Dabney', 'Paymer', 'dabney@trusecure.com', 4557106712, '0', 1158);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (263647781, to_date('22-10-1986', 'dd-mm-yyyy'), '1', 'Brazil', 'Nicolas', 'Idle', 'nicolasi@trx.br', 1664657339, '1', 6048);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (964704292, to_date('13-09-1990', 'dd-mm-yyyy'), '1', 'USA', 'Balthazar', 'Underwood', 'b.underwood@astafunding.com', 8827714352, '1', 3366);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (902592123, to_date('19-07-1956', 'dd-mm-yyyy'), '0', 'Denmark', 'Ving', 'Depp', 'ving.d@kiamotors.dk', 3409034180, '0', 2115);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (459423567, to_date('04-04-1961', 'dd-mm-yyyy'), '1', 'USA', 'Ronny', 'Portman', 'rportman@wrgservices.com', 6827791344, '1', 6848);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (879666371, to_date('28-08-1985', 'dd-mm-yyyy'), '1', 'USA', 'Treat', 'Campbell', 't.campbell@fmb.com', 9442557882, '0', 5339);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (546828776, to_date('24-05-1965', 'dd-mm-yyyy'), '0', 'Japan', 'Julia', 'Bragg', 'julia.bragg@conagra.jp', 1804673464, '1', 1443);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (121274565, to_date('19-11-1980', 'dd-mm-yyyy'), '0', 'Italy', 'Cyndi', 'Jordan', 'cyndi@horizon.it', 7130826492, '1', 3409);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798573767, to_date('01-11-1997', 'dd-mm-yyyy'), '1', 'Brazil', 'Denny', 'Griffith', 'denny.griffith@efcbancorp.br', 1152666076, '0', 2140);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (443041967, to_date('02-03-1984', 'dd-mm-yyyy'), '0', 'USA', 'Daryl', 'Thomas', 'daryl.thomas@comnetinternational.com', 859803621, '1', 4927);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (957316936, to_date('09-10-1958', 'dd-mm-yyyy'), '0', 'USA', 'Liam', 'Root', 'liam.root@securitycheck.com', 4835874466, '0', 4927);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (71118643, to_date('18-08-1979', 'dd-mm-yyyy'), '1', 'Indonesia', 'Chi', 'Brickell', 'chi.brickell@ivorysystems.id', 1244895781, '0', 6861);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (398385604, to_date('24-05-1951', 'dd-mm-yyyy'), '1', 'USA', 'Larnelle', 'Mraz', 'larnellem@hatworld.com', 6028020218, '0', 5126);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (748990157, to_date('30-08-1958', 'dd-mm-yyyy'), '1', 'Canada', 'Melba', 'Blossoms', 'melba.blossoms@paisley.ca', 7413862417, '1', 1316);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (542062742, to_date('08-04-1963', 'dd-mm-yyyy'), '1', 'Switzerland', 'Betty', 'Wiest', 'betty@invisioncom.ch', 2818535799, '1', 5246);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (338439804, to_date('19-04-1952', 'dd-mm-yyyy'), '1', 'Japan', 'Bobby', 'Weaving', 'bobby.weaving@shar.jp', 2282379265, '0', 1172);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (22403853, to_date('03-04-1951', 'dd-mm-yyyy'), '1', 'Germany', 'Balthazar', 'Newman', 'b.newman@uem.de', 1056581067, '1', 4315);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (531691115, to_date('03-05-1982', 'dd-mm-yyyy'), '1', 'USA', 'Mary Beth', 'Marx', 'marybeth.marx@pepsico.com', 6705271517, '1', 1676);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (998341728, to_date('30-06-1953', 'dd-mm-yyyy'), '1', 'USA', 'Ricky', 'Sedgwick', 'r.sedgwick@fpf.com', 6067708173, '1', 5660);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (422471261, to_date('10-07-1951', 'dd-mm-yyyy'), '0', 'USA', 'Gran', 'Wong', 'g.wong@typhoon.com', 8963887223, '0', 6440);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (798386264, to_date('11-07-1996', 'dd-mm-yyyy'), '0', 'Brazil', 'Adam', 'Holliday', 'adam@royalgold.br', 7742266265, '1', 5001);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (947708201, to_date('26-06-1993', 'dd-mm-yyyy'), '0', 'Iceland', 'Tracy', 'Wainwright', 'tracy.wainwright@meridiangold.is', 367854152, '0', 6228);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (6473519, to_date('09-09-1983', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Kris', 'Gary', 'kris.gary@nhr.uk', 3581990688, '1', 4272);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (755119298, to_date('29-04-1995', 'dd-mm-yyyy'), '1', 'USA', 'Terence', 'Mahoney', 'terencem@cws.com', 5838082288, '0', 1813);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (638412177, to_date('10-07-1960', 'dd-mm-yyyy'), '0', 'Germany', 'Keanu', 'Kristofferson', 'kkristofferson@webgroup.de', 3076088083, '1', 3053);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (521521125, to_date('04-07-1950', 'dd-mm-yyyy'), '1', 'USA', 'Gord', 'Guilfoyle', 'gguilfoyle@inzone.com', 4500344729, '0', 4088);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (995907709, to_date('22-06-1972', 'dd-mm-yyyy'), '1', 'Australia', 'Frederic', 'Heston', 'frederic.heston@telesynthesis.au', 5197746417, '0', 1364);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (464942539, to_date('17-05-1974', 'dd-mm-yyyy'), '1', 'USA', 'Casey', 'Gooding', 'casey.gooding@terrafirma.com', 7180261581, '1', 1565);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (707830196, to_date('30-01-1955', 'dd-mm-yyyy'), '1', 'United Kingdom', 'Jeff', 'Schwarzenegger', 'jeffs@mathis.uk', 2879241182, '1', 2839);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (335599580, to_date('26-01-1951', 'dd-mm-yyyy'), '0', 'Japan', 'Kitty', 'Bean', 'kitty.bean@serentec.jp', 2565727088, '0', 5908);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (164921883, to_date('04-09-1962', 'dd-mm-yyyy'), '0', 'Australia', 'Josh', 'Cash', 'j.cash@streetglow.au', 3645453426, '1', 5674);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (783334985, to_date('11-10-1986', 'dd-mm-yyyy'), '0', 'Canada', 'Belinda', 'Kattan', 'belinda@sears.ca', 3641316130, '1', 6471);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (415035799, to_date('26-06-1953', 'dd-mm-yyyy'), '1', 'Australia', 'Sigourney', 'Def', 'sdef@pioneerdatasystems.au', 9370826076, '1', 4699);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (459214195, to_date('04-11-1998', 'dd-mm-yyyy'), '0', 'United Kingdom', 'Nikka', 'Rydell', 'nikka.r@loreal.uk', 1832058419, '0', 4707);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (353641021, to_date('24-11-1990', 'dd-mm-yyyy'), '1', 'USA', 'Patti', 'Goodall', 'patti.g@timberlanewoodcrafters.com', 6771338696, '0', 2454);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (696812919, to_date('01-12-1959', 'dd-mm-yyyy'), '1', 'USA', 'Tea', 'Meniketti', 'tea.meniketti@kwraf.com', 4869435197, '1', 5338);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (336467158, to_date('24-03-1974', 'dd-mm-yyyy'), '1', 'USA', 'Graham', 'Crimson', 'graham@egroup.com', 1754439361, '1', 4304);
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (993577935, to_date('20-05-1960', 'dd-mm-yyyy'), '0', 'USA', 'Embeth', 'Tarantino', 'embeth@mms.com', 3910621353, '0', 6428);
commit;
prompt 1000 records committed...
insert into T_PERSON (idperson, birthdate, kodgender, citizenship, fname, lname, email, phone, status, addr_id)
values (29387220, to_date('09-06-1980', 'dd-mm-yyyy'), '1', 'USA', 'Johnette', 'McPherson', 'johnette.m@allegiantbancorp.com', 5389193213, '1', 1808);
commit;
prompt 1001 records loaded
prompt Loading T_EMPLOYEE...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (5011, to_date('03-07-2000', 'dd-mm-yyyy'), 506788856, 'itzik@MOH.HEALTH.GOV.IL', 6011, 11567543);
commit;
prompt 1 records loaded
prompt Loading T_ROLE...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2110, 'researcher', 'check the medicine', 3011);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4295, 'lokg', 'ghg dyzp kfhbk zbtkz', 4751);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9095, 'abuj', 'fokwx gztyh tfbk vxj', 2770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3601, 'htjrapev', 'lolmmwh mxkjugv mol ero', 4307);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1044, 'frbstl', 'crkv ihhgao fjcoe gllws', 7270);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8576, 'czqrm', 'lohlggt oki zjbkc uqh', 3149);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3887, 'igsfehccv', 'kxiux nqycgza nky separh', 3964);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1867, 'utmyme', 'ebxqb pupbyx inj zyqjg', 6891);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4384, 'itbtfrh', 'ubkewij lrfnu oacmooa rvn', 3758);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2469, 'eujqpaq', 'lcvykij xjyfxx dsasw czjd', 9567);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1485, 'ejjxvjep', 'hpupts fvj krqa nuqbdyl', 7459);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2413, 'fwuwsrkvm', 'vabl gjzwoem fehp qwjud', 3581);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5028, 'imuri', 'wolbqv qyce wmch drhz', 836);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (229, 'gxzyrgdsh', 'bpfyd zftzqf pxmq beqnq', 6719);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6373, 'lhfbsjxcu', 'piucvb wmmfvq vrgigk yzevlvd', 9027);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5046, 'oyyrwyjeea', 'ovsg jiv pvmbv nuh', 4190);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4645, 'biol', 'ltbe ioxvbdt ucveh fcefoyk', 2774);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3907, 'ppxnbl', 'cwhx amlv hya lqen', 7633);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1272, 'ubpb', 'ndgxx gifaaf fwhdfp cbqtnc', 4184);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1733, 'dwb', 'rvj fih lqpam mtruwf', 1544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (185, 'itf', 'avym saalx srbosv jiu', 3964);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3460, 'eydjfrlwi', 'dspn sbed vqq ernyge', 3396);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7086, 'zvlrbucgg', 'jawtz edf tsco ugffi', 7215);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2072, 'ktqnxxbet', 'chczfv fdwoj tyanq xtz', 1746);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7043, 'khzqxr', 'brmf zmyoa vhfobd camgu', 91);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3621, 'tsm', 'flbgix yuuedu hryevsi fxas', 5972);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (849, 'ectvi', 'xwayqa fiyt hfwwz dwz', 853);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3100, 'duxmha', 'ylnbg xunp ywab orofdwk', 610);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7372, 'cnvbknwo', 'clldr rmbravc eua hwfnhmq', 7722);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8597, 'sghgaefau', 'glsx frck vurythx jpmk', 487);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9243, 'xamwuwkt', 'ztcw tcrsegv bultgyh kfi', 2479);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1655, 'yxztswwf', 'mczzuv grblm ysl ncelqd', 3572);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8670, 'hdjfy', 'szgi rmgxh ykmg xhtwhwk', 3067);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2265, 'bmlnimuc', 'ctwdh zcc zultpb myldt', 2617);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2421, 'wyrdulgz', 'bbcdy jmlr uux iewcs', 9474);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1704, 'qkg', 'rckr vwq sfkq cezrl', 2326);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (849, 'pqowqpkhen', 'ucsixe ffs ccdmapo klnsdj', 1039);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3322, 'fydq', 'xatznx gvjjzgd pnsmg gxz', 4447);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4214, 'tpfpqfnw', 'niqix dtzcil smyrvtw frdwj', 3474);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8782, 'acwxns', 'jbxpv icsw pkkhpua vhfwkxe', 9902);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6760, 'zwpznrtf', 'jhdktsg hauilf ooedrb ljkoa', 1787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4286, 'gcos', 'wxtvch inm dex dxehd', 4015);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (680, 'scxuhjb', 'fht ydw fshq ypz', 122);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3937, 'prkoqhqfuh', 'cyis vyca kibmj cpotrf', 4381);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1794, 'olffxxjlq', 'yoov fqxwmen hqnv zfr', 9471);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8852, 'dgq', 'bfo kzr oyyeyql zfn', 712);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4827, 'dcx', 'sjw cjwkvnl arlgm uamdzd', 8255);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7775, 'jrehug', 'nflst knxha hdyx eqvqsui', 8494);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4574, 'tpua', 'cflarrr itdyhsg fdiochv knhtefj', 7675);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7806, 'vpqpfhavhi', 'omnt ubqqp lldro sxzixr', 2959);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7371, 'etbp', 'fnraofq zaab qtrvce mxaj', 1106);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2441, 'ilk', 'immz zmoay untnkq ltqvtye', 2343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6885, 'dtkxn', 'ejxyuy kyzttu dhamyl nir', 3981);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9127, 'mtcmzvbf', 'eicl ohrlq tsrkjh rech', 4650);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7742, 'diqosv', 'aeocygx uxdjh mveoo hhovxto', 6470);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9266, 'lytvqnk', 'lrtd jwqu cfacuwa ymarmli', 7270);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8118, 'qcydpve', 'kxg uaiht upxpcqm mqcbnu', 6993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1659, 'hltboyl', 'ceui artanvg jwixin aicbb', 2497);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2233, 'eqtdiizs', 'npcxt usvczdh scv blch', 2048);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2799, 'elstsigjlj', 'oopv cvzrbml tiuhwk wzw', 9459);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (736, 'pchy', 'wsqjusb qhu umcs jdn', 9510);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3982, 'fts', 'rkne frn ituqj ibsrpg', 8255);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7521, 'nvdmigsuqh', 'jmy wmbk ofsm geou', 7703);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8176, 'plxhljqqej', 'gbkvodq dhfoe ute mdtyvma', 8937);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6086, 'kwoxpvxa', 'vmma oeogxd ikxqib vwxku', 5673);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6708, 'kth', 'nbr zuk kxaoc ekcxfb', 3339);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4769, 'fzpykrnkpj', 'fwt ywwa ydcnrs acchpc', 6661);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5463, 'jbnwty', 'oduondr ikevrhz otnc nywm', 6042);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9836, 'dutkvkrtw', 'rbrti dcu bdfv ghmzj', 2916);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9939, 'oukf', 'ebvufit qew khh qaa', 9481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1247, 'bgmwbppso', 'caut firtpdw gwf qgv', 1315);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4952, 'gwsnuovsip', 'knsf wnqpi zok qmxw', 2959);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4169, 'rxoltylab', 'nqjwfdk qcvlzvv uctwj szdcei', 1222);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4276, 'dycc', 'akgyj rsywpre curwdv lefrh', 1070);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4307, 'hwmkqir', 'akugq bfbfq zpk vaq', 1856);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (227, 'zaypduan', 'unx gvoc vnsoe hda', 8703);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8305, 'rps', 'leaq fapkxw wrvcli hcj', 7943);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2142, 'xojzjsugx', 'rqbdwqz nehpmbe mmjx zwhbguj', 9393);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2849, 'ssuqmmjjsz', 'mci hok agkh gwhr', 167);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (666, 'cyqd', 'fsj guei joylmsm svkkhd', 7921);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6165, 'lmk', 'troy xiye keofe nvrbm', 9205);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1137, 'ynj', 'gns xzkwb ooof wnk', 4733);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2264, 'fhgxqbwzxh', 'fiyf bzu crzda fzhwh', 7960);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2876, 'zivcpzwf', 'qtpjqvs imugnpk xblub wve', 3951);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7362, 'dqcrjx', 'sqanlrv pzjmi nhlrdov vyr', 7270);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8919, 'apycuwznur', 'kigqynv bdkge klu duldi', 7352);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8989, 'niyojzooj', 'lbzrffd ijp rstcn mioclb', 280);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9890, 'tqw', 'zukkr pmoxck lndeij zecot', 718);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3576, 'tzdugi', 'opf npw mgoa hkv', 3643);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8295, 'stkqzbpd', 'prwwx xouv jmg tbagi', 7483);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6630, 'aubqjnmogk', 'qjjo sfafgv osgctr xnzkq', 8808);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3029, 'fcrlb', 'rtvye ddowyi xmfox kwgzis', 3809);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1640, 'qgvyrloa', 'qfu tsqb gudlirs krvtrnq', 4022);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7269, 'ovtvsnzyrv', 'unnx ilreqe bhhst ouvpl', 8157);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4197, 'pjskxlwqyh', 'borj tvnyh qytvyta inr', 7084);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1208, 'bhwid', 'bxwb swqolc vmuui vjh', 384);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5878, 'wpg', 'klng wwgfeo tbu mggpm', 8732);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5032, 'pyu', 'bvrrici wvs oqwksnh ybnkiu', 4534);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3654, 'obdngjrnxh', 'ifu aoziol rbjb hzprpv', 1156);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7256, 'hqljqspi', 'biwme aoh eupn ylo', 1509);
commit;
prompt 100 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8145, 'ndqsnhzu', 'qzi xrplr hethg khitlt', 4993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2118, 'vgav', 'gqqaa lfwnn szuf kbpbbuo', 622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7207, 'rvaytu', 'gydbsh prhc vodq fbvqc', 2959);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9433, 'ptvxlznqje', 'zcs kdarx uquw yzn', 4705);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1599, 'xkq', 'imucv fwl uxrabgn paxkf', 8576);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7106, 'yjmxiq', 'uppnoj ycotu owirw obhkz', 4822);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6642, 'gqlulsgw', 'bomtg ydkzxd ohnulrh hrdsez', 288);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (652, 'xcfojrqqj', 'jbaaq bvh ctrj nht', 6409);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5911, 'ktrdl', 'fdf sfgzhq utwgwn xmkqecv', 4996);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9832, 'qrzodlmk', 'mdc lhed cfm tvbqzkt', 4979);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1588, 'uxqjpbh', 'xzk szmrhk olqrn pbpvgnr', 712);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3327, 'uwzgaedyhs', 'nhrwuip lfnow zidcn efng', 4353);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6162, 'iopypmrjg', 'hdirt mco gwd rzuv', 5354);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2027, 'wrtdsx', 'jhdw mug kcqzsa msdnfe', 7129);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4311, 'bqgaa', 'ogmpt aykoh qlk ftldw', 8836);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9685, 'kfmiawdshy', 'wzxxzj nopuhai uoisn gvi', 4411);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (544, 'fbowblt', 'pfxi mvxzzb ddxrl sqgnndf', 5127);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1398, 'yejrdtfv', 'skfthf muzszp joj pxgqhf', 2456);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4239, 'wjvejsw', 'uqyie jnrd rgi epq', 7037);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6254, 'skhos', 'bsi fbctk xxl izgw', 1031);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8865, 'ege', 'yxyotgr icqnp qskauv wrv', 3739);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (44, 'ywiurthot', 'iwdwxy buaf tist ucc', 4914);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7699, 'adsxwcoof', 'lgejevw odb jra rgaue', 8372);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9654, 'zrypeivts', 'bwz hxrtyn munm ubvykya', 7304);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4268, 'gasn', 'srmbles xjjt ktq qpwcz', 1070);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4710, 'xgcfwzkrrx', 'pxygd eyuk xtkfqmu wbuoue', 3809);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3639, 'qnvwed', 'xtdgpde hkab fsv xmtdo', 2715);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (804, 'wgeza', 'fsfwhp iuwrec nqsblnv fffuuyn', 6979);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7407, 'rndvcuoc', 'ezd cvutd ekm oen', 8674);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2750, 'xxexzgnby', 'hpg bikpf ljpce cjogl', 6532);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9821, 'ndjvrcymr', 'ukcy uddnqj vxjszz zef', 3001);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7849, 'ccwwlt', 'nbo hypp gcv cbgmzih', 8929);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4671, 'eecfdeinn', 'tond akhmafx uzo bayspwh', 2182);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5270, 'afdrg', 'tij teh eiri xfh', 4051);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8578, 'snpxeb', 'ralh ojgs dsl ygblo', 3306);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8560, 'zqegqbr', 'keprwuf dpt edovg hopwr', 2099);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3724, 'tgdlfric', 'hxcgpyd plqnyw ytyb oditrtn', 4311);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2636, 'rjcwwkm', 'jxlpnsd fhn bdy nkquew', 1947);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9837, 'mpyyau', 'kasmsy sbl kedj qyxxl', 4512);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1053, 'kga', 'zhsmo rexcs lvnxbsa cxz', 8750);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4448, 'lyjnwvi', 'tloxwug mozsx tuoo vxyjf', 280);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4485, 'shbyw', 'ntp ygyet yqdy lwl', 9708);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3640, 'paetu', 'rhie wbqocn lazijd vniut', 8057);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1965, 'sqlrxubc', 'xzyjxi wqw gjm dguth', 7282);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5310, 'zcttith', 'fdwtkb fxyp pjz hemfn', 8770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6230, 'mdbcqll', 'arliwv jblab xueswh tibapdn', 6914);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (961, 'bjiejfxw', 'vrv esjqea cwgdhdn czwflq', 4265);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3568, 'rlbkzey', 'xyrxb rtss sfh ljqk', 5233);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9589, 'polngmwhm', 'jesc sihmph gfhosjz gfxo', 4411);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4879, 'dlby', 'qxvw xkktr awvhhso eodpwe', 7727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8885, 'cszs', 'pgvx vgstqo wme duy', 3149);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7181, 'kducd', 'sldz pcqugv hyicm zjtokyv', 6798);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9779, 'wazq', 'qbwcfca ymzyaq onfqfl kbloqog', 2637);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1715, 'nmkqlkhb', 'ocgj lipxyax tpanho ngklo', 604);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (445, 'dvenmpqb', 'tzvimq xwgzvvj ayjmwxv mtupnl', 633);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4999, 'ydpxfilc', 'wuygric zvs baaevv gclp', 8053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2360, 'ewj', 'gytg yidtt rzt zvujekd', 3653);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7998, 'vsd', 'jcus wxdcosk diwuvus zpnwy', 9902);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4839, 'nwnrftuxpp', 'exw gjsqwcp cttjowy izuoe', 7923);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2374, 'qvlaypwws', 'vkc qyx mcjz olulzmd', 1872);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (439, 'yequ', 'rdsoj utaltgi chroliw oboxe', 2637);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (615, 'ary', 'jeh lfqmyjy eytzk gmxi', 727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (784, 'yiotyr', 'xmf knm ewuxvov apgrquu', 9994);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5060, 'akumkxcvat', 'pudjy mefrch fbpk omt', 2799);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2573, 'afqouxra', 'ftdj bfa kwguism tpkb', 2777);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6273, 'grvjgsi', 'ykoo qqqtwnt dtp plzcmeg', 3218);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2102, 'dcsldgewv', 'niefqza jrdhvdr bfarpg kpcx', 143);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6191, 'khmfynctn', 'tsglrf qyjvcrs zvlmo kwlxd', 2435);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5005, 'uydtmi', 'nivtkzj nbhygp zuqgkvl yagpw', 8413);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2579, 'vlgb', 'twp ejrr buwih fexkv', 2617);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6470, 'wqqbgvt', 'nxpb qqqhscg cntv vdqldx', 4993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9356, 'vkngm', 'skhi zzk vjipb vlb', 7860);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7196, 'vrcpmwva', 'muruh rdkdkd zhs itsif', 631);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1474, 'njtawysfv', 'jdb wfk vjmry btf', 4830);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9872, 'paylbcubh', 'zez abiopk yzs flfr', 815);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8281, 'qczza', 'wxkxze unpiobb clga khle', 2657);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (631, 'edx', 'mlurne tdkdu upu dplwi', 3058);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4470, 'mjwpn', 'hvt zogn piesm eroz', 9564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (967, 'ufsqwrdv', 'gbpty ftbj nru lekgwm', 2240);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3425, 'ekisppu', 'ccvvl ros fscuu xapg', 2583);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9718, 'bjxlu', 'oil txuzk rbbcyiv xdwwhjw', 2637);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8322, 'yfy', 'urz ssumz jpq rpfbh', 4015);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4822, 'amla', 'zifa emiuy twbbcjq hvqa', 2302);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4968, 'jxefcnp', 'afoj fkrp svow ouy', 6973);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4248, 'gzi', 'zeybuhl cmfx frp vsaz', 4447);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9892, 'bcomlyg', 'pmhpsm pshz xqulf dbmqf', 8873);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9763, 'nifthg', 'swlk rws kyipzw iwdacxh', 9388);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5857, 'smirqpvwla', 'ofy bhwds crow hzm', 8257);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6145, 'gfpmd', 'hrxecq osqbqiw troqm xqpn', 5620);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2944, 'zljtxjsc', 'fgb yccnl flb djpsp', 3067);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (940, 'ivm', 'jsu jomgei pqbonj jljpspx', 1517);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1495, 'lcnknbp', 'rihae flues znrr lmj', 8528);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5229, 'sdsyma', 'ewldql nqqm akpac njyo', 3389);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8784, 'kqyps', 'zcx pxh bofp mxyevre', 8710);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8111, 'juy', 'jrjq qtup redijx hsy', 7363);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3538, 'enluwhxndd', 'qjpv fnlu voug bysi', 9338);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2808, 'jknlmtxt', 'ffdvgl duhzt wty fqoc', 4904);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8347, 'nntg', 'gwpxg wqj gurldoc wfnwt', 5624);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3620, 'ldwvu', 'etbyh dcwz chrp vlez', 8343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1454, 'sbtqwinj', 'srjlu vtm eyts fnax', 9867);
commit;
prompt 200 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4335, 'jywqdy', 'lkkm ozvtsk knb kysj', 6306);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5583, 'qmtotw', 'bkiew gcnuiza uanvbn jxn', 4448);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1224, 'oqhkl', 'oubk harkvf pobpmw mbk', 6576);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4950, 'tkrhwyjg', 'mfbz ylc qffv lsdzsd', 6283);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8506, 'hvimy', 'laemua ynmukyj flne dxtykx', 4266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2785, 'yintgcgbu', 'pyrzpy ihh bobyprp zpqfyc', 333);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3484, 'synijsvk', 'bcdqr sta xpqq pht', 422);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (198, 'zqzmqg', 'vvkj axfflj otsgx oxjypef', 9028);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4650, 'efk', 'mrrbzd spwshli nrsdm owzcw', 3728);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8221, 'pbvj', 'eaxfpc jfnw xvmqn yyxsnaq', 7930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5260, 'ahuibbae', 'xkbq jstp wqf lusnnic', 9210);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6789, 'urn', 'tnuxzjg vpg lom ixzpxo', 4381);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1951, 'wzdb', 'cvlp hycsn ltrtz isnwq', 9474);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2702, 'qgptqb', 'vkjcunr pwj tlcbao zztjut', 5233);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8969, 'bmyqsec', 'iqafve idmrkzc oxporh rtppwlx', 7447);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7061, 'nlhxlqm', 'fxw dpuxed nqpon txgw', 9899);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5730, 'bkotabomu', 'rxumni qmbxcmf pjcknq eod', 4358);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7183, 'mohplailp', 'fprdjya vbjw vtxatqt iapfwqu', 8636);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1773, 'ezbqrlrrb', 'omhphnd ohq thfkxj depadbe', 1813);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7214, 'fnvi', 'xixz nxurfbz jos swgi', 9474);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1271, 'ler', 'qpecv zoazhig rrji hof', 5475);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3053, 'hqj', 'yusq jfbzht ivym gcsaji', 9564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7194, 'yackkjn', 'rincvr okueasx upsc butqb', 2401);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6395, 'mslvnawft', 'ghkswm gztaycj tyms cjcspp', 3005);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3783, 'tnoa', 'jxals rzx tqf fwjoh', 8151);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1244, 'kkg', 'oavhwyh hefpw fryeaw mau', 1480);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2974, 'dvstqp', 'ntlw ggmzad pxv rejknt', 9737);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6727, 'vdpspypb', 'hbbd asfalxr nlk qrd', 8770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5367, 'rjzswof', 'kjczlke xrpvje yzt ffabzu', 5198);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8409, 'yvwjayf', 'wggn fdktl bfuqx vbp', 2188);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4170, 'rukgg', 'xjjmi uijlwm csf qjdai', 9459);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6627, 'puv', 'byk htvz dubukb gaik', 8005);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1394, 'xijewvmobk', 'qzfwcrl iglbz gfa cxxxz', 7614);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5922, 'oog', 'fmzozo wjigo mrx euljbb', 2664);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3471, 'fpaoz', 'hzxm gtgx wjqczp uavy', 8761);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5994, 'rqgqvryjm', 'htp xbg kbedpty ayhfbz', 836);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3608, 'yisnoosr', 'vbxgoz bplvxe dyxeveo szqqn', 8256);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5170, 'geklxmji', 'ajazvf akn wbx yvjkh', 8151);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5307, 'hkvpgjiumx', 'irpkk fgmts fxvj enrs', 4343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5379, 'bfsyo', 'blz cypkme zdfb uloe', 8944);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6467, 'vkcjgzjb', 'rab fjwjyhz pnhbp vvadz', 7352);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6240, 'vohhdz', 'jlriau ncvlqn pbnfu zzq', 5724);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6483, 'yvvdhomtje', 'ibyoozy rnd zfei lutdrdy', 8429);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9943, 'tjflrvoal', 'yzfsyf cfstp hwens yqce', 1825);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9214, 'adypan', 'sjxo hyapkr fqsj pzf', 3165);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6801, 'qovnu', 'xgw yblxoj kuaeew ysgxxh', 1012);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6997, 'aqrrtgzxz', 'igi bqbhqd vhadon vahtomw', 6798);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9327, 'wbtx', 'rtdw rvwfcgb ehhkmxd labkfex', 1351);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3952, 'gmpl', 'egd vatzuu wozkin ediyfq', 9236);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1869, 'rigbbs', 'mgcfdn cufjz gxdbeqq qtouwcp', 6272);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8252, 'huzq', 'gspp ndcgiv lmm sorg', 8201);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3398, 'tthtat', 'trp fjai jtsfy ijzm', 5874);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (438, 'tfeu', 'tqr uxrovy vuiczc mwpru', 8028);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8797, 'jgcksryuh', 'fklbwyw acv qjxhfg abjlid', 1952);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1811, 'rsl', 'vwmktyc qsq ljnn qbm', 9469);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1716, 'iwqo', 'pmwc acelk fqpweva sgb', 5787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9331, 'nfb', 'dqrd khrjvy eninepa yjadq', 8548);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (780, 'jgytijk', 'eribra iqwx mmpu erofwg', 3038);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1433, 'fid', 'oamhj hlbcu hinkqy zogn', 1279);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (729, 'lrvk', 'tqocsm nybkyj ulx aykpfi', 999);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6698, 'cmorzh', 'furzyju kxrrbko qxk tat', 8622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1657, 'bumtt', 'vej dnn vrzupy kosvyct', 6979);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6543, 'mafoaded', 'jmdui pbd wwk gpkw', 9059);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2955, 'sjzxs', 'sca lfq ljm mmhoj', 7411);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6233, 'gda', 'limi veu pzjqco tdp', 1947);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8931, 'lmkhtz', 'iumxogq egeg vlu uzoelwv', 1053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4725, 'fqv', 'hwpsti rcbffxg pdjggyb gbmv', 191);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7154, 'ews', 'cete rftuj hbeqwgo yehe', 7483);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (974, 'oulyx', 'clg spdv qssi otvi', 9205);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2053, 'ffmf', 'ohwuqxz nnfzo qkzj mbyn', 7045);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6774, 'airvvy', 'xorw vqmv gtwlov ponh', 1389);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3190, 'lzhu', 'cfwhkdy zmljlmj kfj xgdv', 3005);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2914, 'nebalkzjd', 'csytnom geiay lynqji yxtqdts', 384);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2296, 'hvg', 'hnb ggmvtmg jwnlknr oshjqhu', 6863);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (97, 'dxcftjyo', 'mho jlz dnxugd qblreh', 6196);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4292, 'egbplvrqx', 'ljjxoij uspo iqebpx fcdod', 7789);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5449, 'eewgxmt', 'ejrjxl ctue mrgek zevraua', 8320);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4908, 'fzugzg', 'oul ssinbuu lahwau utlkiy', 151);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1749, 'ackz', 'jfcsr khkgj decw vuqmjbt', 3275);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8077, 'hrz', 'dhoqrph hljcudc hqlj gdogmj', 2563);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6191, 'iprwsqns', 'saybosw sdfj xfek mim', 2048);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8018, 'neowiyayjo', 'ohmsz dinf zpyfp rvn', 7702);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7604, 'unlex', 'kzkdlo blqby yof ptwsw', 2528);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8798, 'jwbjlj', 'juegx biharp rej ffw', 3572);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3860, 'fdytrcgyn', 'mqo wdvxe ynhgaw sdoijg', 8198);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9410, 'pykbxytz', 'hvcb lprgq opwlqlm mgq', 5475);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2616, 'nykkmiizju', 'but dqsco fieii anuvi', 1738);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (290, 'tykoqufvph', 'fml pvmy jzn cojrgpv', 9253);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3232, 'zctki', 'ggtoyy ritwgx keplc egie', 5226);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9464, 'djrlhtf', 'vfu feux ghlq dzqtrla', 2057);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (407, 'pazyk', 'hpp qktz ffrszb ehpzn', 7601);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1926, 'hqjmvthf', 'tvfy qfwzn poie ozneo', 2777);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2633, 'cmuormh', 'awvj jdv cdw wgzsdo', 668);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9241, 'nkej', 'cjquwb syttbm axgv yvnipss', 2182);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8835, 'tatuscfjq', 'wuohd tyv gjacy nte', 5724);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4481, 'zhtewoubt', 'fhgtxuc xttodli axyhlrz urfs', 4000);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7436, 'phcuiu', 'kyrddxz nhukydm aori khcju', 6073);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4356, 'chxma', 'oqskobo jaso wcklzqm vln', 4131);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9286, 'isjfrdri', 'siz czkvc rpafnpv tqvxq', 4056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9473, 'nrk', 'usrkt kjengt swlrhd hhqcdlm', 4786);
commit;
prompt 300 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5322, 'fkahjjbdwm', 'ggsaeo fauizke tlimb ygxmrlf', 229);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8878, 'hrjxqxap', 'ikyrzve rrvfft ewovvs feflg', 8939);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6827, 'sszzshgjde', 'mgeg tvm qvj nytjtsh', 8280);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4325, 'rkb', 'ubr mjfbyr kdow snllu', 9063);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9868, 'cclf', 'yay pemii shm kkvsklv', 959);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3753, 'cbyvbj', 'uup fuyj ayx xzegwf', 2768);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1455, 'nqco', 'esc rqx tlp gwhp', 3151);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9245, 'tjnnwasoor', 'ccv uccr uexj djkap', 6993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5340, 'cgxmqazc', 'xinj pyeo rfx emiq', 5769);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3164, 'cjoehppl', 'lpkrhof okrflc hpqgdbb rea', 30);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4798, 'uuye', 'oazyvy xitw epn gsayps', 5313);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9686, 'xxjgyrvo', 'ngagcx vzvyu nanjfd montc', 3218);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8498, 'docrp', 'cbc agb ooo fnqth', 422);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1631, 'qwybssegl', 'opxibg uhzrdzf qexm see', 7298);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8738, 'lxjgx', 'lpj vrpll xqyzyv zswmzwg', 2248);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2678, 'qpmebmq', 'qgnkpek bxdogy fvwi pnfiln', 9029);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9821, 'acpgiirafb', 'wlipbl rrhd fyxo bxoi', 9902);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5885, 'dlgqagqxs', 'bzoyzt juysb lcjmtg xxv', 9672);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1071, 'hia', 'ehlfz zrwznjr auiu gyjstaw', 8548);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5916, 'rxqu', 'coiblr fnavrgs sazczzp dduzsln', 8011);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9673, 'llioruapj', 'cjth rxp cfoi uknm', 5142);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4588, 'zznkgoskt', 'disy airppcu fozgus xuopb', 6677);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9573, 'ijbaoqat', 'ojticf sexmmca kkdbfz ingqznc', 6528);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3869, 'pgdk', 'gjq nlydv btolahj qvuy', 6661);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5320, 'ufrczvan', 'tgktd vrlplur nmwyykq nac', 3464);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7514, 'tror', 'gdwjdc ildvkjg slyk whrx', 5261);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6558, 'ekqstpc', 'ijodzei jhoq mdsq dnshz', 7702);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9631, 'fiihyfcgup', 'bgqqtxx shm rbnhbmb pxinv', 7924);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6115, 'gwyaawipdm', 'iprc eex igic kfniz', 3427);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1327, 'ihpevsro', 'zezcv asfy mtf vmgwh', 4546);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2463, 'akoqfr', 'jvqlxgf dxgv oufx onesqwk', 9253);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3486, 'afxaijmys', 'crdz kweooik igzfoe kzrnph', 4407);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3956, 'iygywv', 'kqoq bjmopax dalrdfs qbntvk', 3109);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7023, 'pkztnx', 'jha iuy hul fdgmdgw', 6196);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6198, 'xwth', 'pmpx idl hltgld gfmsewi', 1315);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (39, 'dykod', 'nhye hvpdt rvsanur kfx', 8946);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7101, 'kolis', 'hbksr bvefw rvmtqxu qqtduy', 7193);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7264, 'cxya', 'ppbogj saig olt tcfpu', 3870);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8172, 'mna', 'dit vlokbkf rux vdkw', 1472);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7110, 'zwwjuhy', 'lmrphwi ntnp ubh kucqkph', 76);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8955, 'kjpsor', 'xrb qhq krapv zwtbld', 5780);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8896, 'wbjxsjjv', 'fobff gpraw tceipp moajmsu', 8178);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9941, 'rrcgxmlqf', 'ecyri eya lsstgh uran', 8300);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5303, 'syedvf', 'qjlsa bvsvhrl frvjkeq xvt', 5593);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6648, 'bxkaftt', 'munrq eegnjwp yykbkjv qlnjrel', 4244);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5941, 'pjkvrjoinq', 'xur tbxqubb oodpc hohuz', 3981);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (84, 'pqy', 'jtpxv fsjwi kwgwpia bblakx', 3405);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1801, 'alflt', 'mpeks pfv whsm makt', 6259);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2379, 'lierta', 'elcdd nnf juyt oqwvj', 6301);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (44, 'gzgiyyxxqu', 'idcuak iuxbpsg xfmrrj phr', 8672);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1340, 'qqzd', 'rskq lzicobc ajpm knhf', 7664);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (441, 'nhsz', 'gtwejxb ylwgkjx wjrs npttw', 9052);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9675, 'kadcarctn', 'qovhtx cvm vjgt slngf', 3011);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8899, 'nrbhrofes', 'cpwgeh wlbpj quoxmps dcwayvl', 7601);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8005, 'qijf', 'mrcl znbq shjl nvocj', 8564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1862, 'cxspxd', 'zdvqq pyk mwv erjeuz', 9236);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6819, 'xgnhqhfgme', 'ewmn nklexiz stfpn tqma', 7336);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2100, 'jniuc', 'bzgjrw wpxwwng ptjbhwa ysco', 8732);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (753, 'ggkynwdfn', 'pyz lbqulp ifmeg qjg', 8930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8662, 'erbpbpa', 'qwo kle ekwey cspgbi', 4751);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3917, 'kiakxdsyf', 'ujinc bnpry ykcw vuxi', 183);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (678, 'pgpeekqa', 'uxt fpvgllr bdcl mss', 6301);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4478, 'ojbx', 'zpdxp glnuby bamegt hos', 2316);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (620, 'znezdfm', 'rphvf mixxvq urz lkynu', 6042);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3648, 'yohjtsnln', 'jxm chfyge mhztcvy gfftzes', 2994);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7090, 'cgd', 'oswx zrxx icrk enzhpyt', 4616);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (368, 'pojxr', 'rxji uxwrtpj dzyk hoh', 1825);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7346, 'edlau', 'jwvz qsywl srcva yxqq', 2316);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1020, 'smlqhffys', 'eruco lwn cqmjd kudv', 1746);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3530, 'ptuwbf', 'zkbt xofw wogjwt dhkbtv', 9644);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7068, 'qnnlrfg', 'xgfreb rpphqx zkil ipcusz', 2654);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9499, 'fryvwmuim', 'pwv ipczkaq ksvk qqgm', 4425);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9535, 'cyziq', 'wfa jennpka vfbba bywem', 9737);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1838, 'ngv', 'bziww dohf ivxplv lcsms', 4861);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4628, 'mdxfx', 'csokeya emvjx nvqjafq qcs', 5153);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8831, 'qpnlzxb', 'cntjzd czljyuz xzxxqv qfph', 3719);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (233, 'vhxbdmxgo', 'dhjaedt wyctew noxhoo mlbdrc', 9481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4204, 'mmocqbr', 'xkqyue wrkkdh buoumpj ekk', 2656);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8633, 'wmqmm', 'oqdqh owknyy kjl qbymzt', 8028);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5482, 'qfhjnedp', 'tdw iccfys ixp bknqs', 2754);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9162, 'wtwtcjnoa', 'qlw cifaqnv riq gcsj', 4787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3693, 'qltwoggm', 'wdiztkl gsln yspj cybd', 7849);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2131, 'alyt', 'zra pvqlvkd hussk fhbm', 3854);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1403, 'hrfkcfkvx', 'evigik kqw vmbfyj cnwut', 5982);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1556, 'plsfnpj', 'luyuwzt cdyz mucznvx con', 2343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5226, 'nnt', 'tdidvjk vcfxq cfrrg mpbbidh', 4015);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8916, 'lhithg', 'svmrep fmhmqv uxntqd yhd', 8079);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1341, 'cagnngxsa', 'uhywwe nagw vyo olry', 4358);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2727, 'hcrebyh', 'gmurrov eyr dpucus hio', 2795);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8788, 'rpufn', 'qllckpt ikywot kedaihd dzhlmg', 7065);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4541, 'mzvuc', 'utkfpre lnk qjr jqdt', 8057);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1899, 'kjpn', 'sfyk pft hpvsqo bqkw', 5282);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5218, 'gwacfm', 'btwxmhl gkcmriy gpyz bjzocg', 30);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7077, 'gsfnadt', 'hxql ncfvkp gvsumfc mit', 1787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1688, 'huxx', 'byscd nbcza ndjsr qpdyzcx', 2264);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (969, 'ycgj', 'mgwqfcd qwbd ewyida kchtw', 8057);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2397, 'wnespxrvx', 'yeda oxd jbpqexv opfx', 854);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5917, 'hcxjp', 'lrtdz whw zuoetq djohfdc', 5851);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9526, 'nnabwumacj', 'gzc yvqcrk ninth ayvow', 40);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2909, 'oxdhlj', 'hcekmiz xjd xvhlvp qsijl', 3783);
commit;
prompt 400 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4657, 'ybvfrpok', 'rqyh eoxxkfw ilvrn flgjq', 3739);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1312, 'qop', 'tttqdtc yrhgzxy wsum pfmfmy', 191);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1076, 'sxoyrnk', 'ivw sxhmthx arvz qtd', 1724);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1316, 'abtkakdrxk', 'jul uqmj moquv qwcln', 2528);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8426, 'fgsgeiiiz', 'yrocllh gbbbh lph zkubn', 8539);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3116, 'kjz', 'sbwlb vkoi zpfpo euguv', 8732);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3157, 'lyyyggomiv', 'aryvuww hyoayl fbvy nbefynh', 668);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2639, 'awjqf', 'fwpjwr lqdijet ouancm zludnmg', 7076);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8915, 'tfuv', 'uvxadq rzrbkbq kgnhlej zuk', 1219);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5140, 'hrblclhe', 'hrwdd ddbv kgghst runbd', 5040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8659, 'kwjhsxg', 'tbbwtr dsl qkqnlzu vrrgpu', 5039);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1917, 'shg', 'laypa zbdluv hhjrn fmda', 7804);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6952, 'lgauxmlbu', 'tgdnhq ujt gqfajkq bxngi', 8266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2863, 'fdizrurm', 'zuajwab rub ebeje vpz', 322);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5333, 'cnwiu', 'nujq myazb lwsuezs oojr', 2874);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8915, 'iljiyfludh', 'juqess fmty ufovd mgzdxwy', 6303);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5538, 'twhircpsw', 'fise mccw ekfw wqgjdu', 3031);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8654, 'rjxdmsgxvz', 'gwoompt sqcpw cihhofy uar', 4871);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4645, 'gozthefphw', 'qaewh rxgohp ruwz vpz', 384);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2409, 'yipa', 'igvdcc vlgnx cfc ycdd', 8096);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8500, 'qebn', 'rhreh pwau iey mcgm', 8246);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6070, 'ptkcw', 'xskx bfpe kcfxlg dcox', 8672);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2413, 'eiuuusu', 'ajp kjicq pjj xwhjn', 252);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7255, 'tqbetweu', 'myxjmtm gywhg vuky gka', 2343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (730, 'fslcildo', 'wjdoxk mgvlo oogds tcufrzk', 6993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (816, 'uubwpisjae', 'glv kxuzhz slp esyav', 3289);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6023, 'ludzbmygw', 'day mhh gkzqr cooejx', 6546);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7224, 'anfpsurznj', 'xnbg eulvq cdriji okxada', 1720);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4810, 'wddfhajx', 'rkavgvu rxjbqbg ingnuf wmvp', 3636);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6532, 'itiml', 'llimy afj lklph ugiid', 5652);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (923, 'hlaxzn', 'yuik tuuof pvmfdo luymfi', 7866);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3618, 'anrqgktei', 'pcn dzxpxpa tacpgp dvzbex', 8512);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6498, 'dhn', 'gihpshl iebnx tzczntw zgmqv', 4830);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (300, 'fljhdget', 'iqf tcdhf ccbus dzfokl', 143);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4438, 'rqxayh', 'mmbjop ylsuz ilxre bia', 7065);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6481, 'fiamnzjuff', 'gcftk fmy hmncv mlmsonf', 8937);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2737, 'pgjmai', 'rja dtoh qho san', 9062);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9678, 'qnesw', 'yrkxwd oqi rqqrhti moxe', 9469);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9222, 'lyvnellqqo', 'rbmfomb nvwkowj ynkwn gqvy', 9225);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7932, 'uuhvllj', 'dftbk kibkou qkmfca fxwbri', 5766);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8843, 'zbp', 'aopnvxe kouvsej kib fqozhho', 8808);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2467, 'ssdbfvdcy', 'gcgfox afnnrid ljtxs rwuurm', 1222);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2540, 'uymwod', 'pxzg tefab efvxf wwucjl', 8319);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2935, 'quljw', 'venoynj yjd rwynpbb usi', 853);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3489, 'ndeavsims', 'pqhsof nslvel yqhol wtrp', 8246);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4051, 'orshxgh', 'oip ofbg aph wfbck', 8028);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8922, 'drprbxeg', 'jld nlixng mmsv vcbxxt', 3884);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6690, 'fkmttm', 'gmw pswvnr mumsz rornoye', 8722);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2527, 'ziklhjbarw', 'mevv qnx hrgsh rjgcum', 2064);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1874, 'amkvtjcxmk', 'vuqjgnj hiqq fek smzuowh', 7727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2221, 'utyn', 'xacinu jyq zzw xcmss', 622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2449, 'elzdm', 'woyejhh thbb swew udz', 6416);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6733, 'zuq', 'ayedg owaxc wlxfj rea', 8674);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5154, 'echwrtobx', 'lxwal dzzd nlb yzlcm', 946);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4675, 'qzyf', 'qufco ruehdt fvfgde rmebet', 2645);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3314, 'axyjgkbp', 'rshqn iwrip eltpznh vkwspe', 3298);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2384, 'pts', 'hnunl xzxzpql ajpoxo nlcr', 5544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7442, 'ydx', 'pttgrt gbhpue hsbuff vfubqdd', 8848);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5622, 'yhxyhxu', 'zcqfqk nbyv chvqq bqnwdf', 4056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5111, 'byvxex', 'dmijuc vruxyi jgbx midbjf', 1787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2042, 'bgxsdx', 'liadyhq mfnteea xinsr ngbogz', 5199);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8214, 'bggbtzmsa', 'wcuqy dmrcen nutfptd zcvh', 6782);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3758, 'wdisdwn', 'lmgw zhpxu dna dqqqey', 7640);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6119, 'tpockuh', 'ndvxp sqbmyfv vosyvu gsf', 7483);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1118, 'mlkxwjvvyz', 'rod kkcpe xsbo llb', 5593);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1332, 'wgkn', 'aoqft xaxa brkoxxn masfz', 2622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5719, 'ymyjcom', 'sha hyu gzvsl yhqsmbu', 8413);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7469, 'aruew', 'zgg compb frlcgtu izxzb', 1746);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9054, 'lryeh', 'ttqan bfntxw pmfoj phawwlb', 668);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6617, 'vdizceame', 'euftam esz nucnhgl ihmt', 4311);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8854, 'jskxaibme', 'czyank oxjv knoyrad act', 1458);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8375, 'geuchzw', 'wrddcb fflgz zokye edtj', 3396);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7608, 'ntrtmwrjqh', 'alyixli zracz xyospeb blhhfs', 3783);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4046, 'osg', 'eikzw aixzap tlu ycgnw', 5766);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6978, 'eappccxg', 'upvsf rlerls ieadsw ejdedpn', 1080);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (631, 'ihls', 'gac kpy kvetut zziwup', 4202);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (253, 'byrspx', 'aygfs wzvzs kkyvb zjpcz', 2542);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5937, 'xcfnzir', 'ibjqxb onyg prlc dxxkmsb', 5179);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4499, 'hcmbvkjri', 'bvombo lqcj coax uevhrne', 7633);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5043, 'ykwrbbihp', 'kpme ezewusm uxq uprf', 7664);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9674, 'sukheix', 'fge cvjte wgzco gnmuork', 2099);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9424, 'hxu', 'jvxelk fbji ihlw cmj', 4407);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7423, 'gqmzfdcro', 'iyz ipetuxj gbvpxs exjz', 5412);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8278, 'pemddn', 'otyr axhdedz twz odxre', 7675);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2582, 'ocfnuux', 'ktztn ljrib obh uzmoex', 7727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7207, 'ummzuuqp', 'skxu wwtifkq acysm vlay', 1354);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5218, 'ptpihy', 'ivmv ulcxkx juudppd kye', 621);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5669, 'ayibteg', 'bsnf homqh afhuji gpje', 9955);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9166, 'xcfadaxxee', 'wsvp cgbn gxoeq bzzkwz', 4425);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7737, 'zbufsgr', 'zwwn lqzcoum hbm yfobfy', 6497);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1792, 'egoxmyp', 'oow swro gzohm jgn', 4650);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5777, 'chiv', 'hizf qav ccybz vfvze', 9253);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (29, 'terhqcn', 'uyqroy uufflos qzxl zsrovgn', 3282);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2034, 'lscvatbbt', 'ndqsjh zzid vevaf slxhng', 3464);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2885, 'qngnnfqr', 'exppfxy twg hiyfbmb wyr', 6024);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2708, 'ssoisxao', 'rokcx krqo ctrql xffif', 7614);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7894, 'yfiocxwuad', 'rxwt ptrl piruyf golqzw', 9108);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3312, 'xvjxdnqll', 'snnglic rbbco woemz veavaop', 64);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7852, 'phcu', 'ayti mbk tjqrjer apsjbgd', 739);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1686, 'rxh', 'apert jxfw syjyri hld', 3372);
commit;
prompt 500 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3657, 'tsfvyzwu', 'faoeyof bdaln cecdr lvsgql', 5349);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3083, 'qltu', 'ehy zulizi lsqx gmkkx', 4660);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3790, 'brru', 'rxycwbb tibgtmi dyr usqk', 4265);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8313, 'bydmbvv', 'fisjwh dlmzm mjm hhtkes', 5053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4088, 'qwvbrm', 'famav puq xabthi hmtr', 7277);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6984, 'ihy', 'jtqc wtz ktsqxzz sgxm', 3848);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9237, 'ijxcr', 'hzazwyk pocvrep bnsgzy uisxeha', 2606);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4765, 'zmluthjze', 'hxnge yraf cuah tnhwk', 4112);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3683, 'kxtry', 'xlkbini dxfb aqsd rxz', 9342);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1890, 'auvquo', 'mrvw xggbwk yij twnp', 2302);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7272, 'uqp', 'lbuvq vup siw eozwm', 6073);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4041, 'muno', 'sgdgj izkpomp ipbfs yyu', 91);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (801, 'rahxt', 'zwpypoc ofvkdfu wzfgyod hdacd', 668);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7826, 'fnthow', 'exff bbaia xjjb zvqypbm', 9037);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2340, 'zoawpk', 'pfvhq mpedfpz ujnh jidxugw', 5430);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2046, 'shhtbeoop', 'ebny zmcbprb xkgh blekm', 1517);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8998, 'cuvanatw', 'farss stb zmapu gjzejm', 9028);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1294, 'berndi', 'sispd cisgb zelim cavtjx', 4195);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (696, 'dnfaeyh', 'hvizd rcqpptl zgwgipt jkkvls', 1346);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6983, 'lnatzq', 'txf ataufe zbfo qnywreu', 8930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (411, 'chpvoz', 'curqzfm wom idr sqpz', 8166);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (294, 'ebak', 'dnexk vzrfv pkslw lcwuw', 191);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (942, 'rxa', 'qlxhjt sojv mkgph egp', 9486);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9937, 'zfjw', 'royvsux umd lzr umc', 959);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4523, 'inbhreb', 'apylyp fjcfdb oechrk nar', 40);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4464, 'wurvvy', 'yomgb qwbsr osvayxi axedwq', 7939);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9603, 'pzpheofhty', 'yxba aupn hyqzgmn oozgbc', 5730);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3710, 'ehgpb', 'vfuvav bvx otg ujodu', 1952);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2403, 'wfa', 'jnyw udxuwch pjog ego', 8564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1354, 'ldzwow', 'ynkqo nvph blsxh zuyitb', 2099);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (662, 'rwf', 'pkazu oenu reop oibun', 6150);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1455, 'azygmp', 'ubbd lfzlcs yaruqh siaa', 8011);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1890, 'valijjoi', 'bluggg jcw stubn qre', 6727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4984, 'kmyfh', 'gcgcci nqipvza npddv tpx', 3289);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4196, 'ujmlub', 'luubzs bkkh usgtul gnzdbj', 1129);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9051, 'ckx', 'duvzuv wgs hgwd tfxntbs', 5593);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7113, 'kmu', 'seisyo hragnox mhekuj yslf', 8257);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9930, 'vpafforzw', 'xvtpm qnegxhp fwrntbr hdphbej', 1872);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2255, 'tlwfzbtg', 'smxoom nvf knxp uddcso', 8930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4379, 'hwq', 'fimlsa nbmh gpve trjp', 7825);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2693, 'nbu', 'hptm rmhmbp afuni hiku', 4411);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (642, 'tlodtgrb', 'nndi nljtqk prkmid obfaip', 9809);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (413, 'jtbhtgerke', 'wzs nrrp cfw gnppb', 9737);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8353, 'nawmv', 'tshczw ztz qowjae hgeien', 7037);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6911, 'oxrctb', 'azjzo eaahjo kvuwx rwc', 5475);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6064, 'kfb', 'pspfyzi bsonqc rvnlpxq oeayf', 6283);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4359, 'jszwk', 'rjdyvg ifre aryv nkb', 4993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1462, 'fguvir', 'xdpnss kmnwsqh mfiqnsy shqaurq', 2601);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9192, 'cgnlsqdth', 'cqdlya mblrz qonhcz qnto', 6223);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7751, 'suko', 'ayzha yzm gavy jgj', 4448);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (354, 'gnhifp', 'pqmg ndfd ovvc qinbz', 9437);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3403, 'hrvwxzq', 'kkid urmkue hrzz jmrx', 4198);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4091, 'nrrck', 'utecs wgxnnf oyr jjlhn', 5747);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3914, 'mlspmd', 'lnz cdsv rgd geqeq', 7065);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4020, 'wpgjhjqj', 'jrphs kajlrj hyy ugw', 7564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (801, 'ygd', 'vnuq qehy coco zui', 7823);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1003, 'daitkdcd', 'xwiq hztnt fkp wngv', 2617);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3244, 'gzbl', 'usiht mdau iqjf bzn', 6736);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3709, 'kferqt', 'vgle kxaus swfgnb yss', 5470);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7901, 'huhlbqfl', 'qdi csnxm rywgem nokzku', 8576);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3403, 'zilzow', 'arkxj qmttg qjdkft bjduk', 1746);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1768, 'bybetsi', 'fbazz gukoc igdo fui', 167);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1009, 'wjhijp', 'iqkuu fwn qtqx hnal', 2953);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4069, 'qczuoq', 'pmtwo dmj hqnzsmw lhxb', 9253);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9977, 'faqcdftbrv', 'qkcfyf zxobmm onie knoyzhu', 3951);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3935, 'deqdvb', 'csqjtcs txmexg qlxhisw wchm', 4544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2736, 'zyis', 'dnwzpan plgtbez zftvlx fnycub', 7763);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8671, 'fnd', 'jlvy jznhcl zjpv wlr', 631);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3295, 'nlulpx', 'rhmfenv ybmiyoa vxjux tolfw', 3824);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8766, 'khfhlp', 'jbxaza hug xrlfjri zpjl', 3742);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9802, 'hohu', 'eqr nfdlte olkm hfqkw', 7703);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3499, 'isk', 'lrdljms ofnc tuscpa hdut', 40);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5717, 'dkv', 'zynurv kqkslh usvesc mjsge', 3928);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7485, 'ddqvccy', 'fbeckp bnb horotu egwxsg', 8930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2771, 'srzwpjk', 'vwmap hqrkvdr tit dszdkv', 3427);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7521, 'cqt', 'mmbm ovtso qdrt dib', 4102);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3322, 'ldbfgx', 'uadrgt gswl rvkuobw upxgg', 5127);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3593, 'obo', 'mqm vcrc wizsqf fweyzl', 2188);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6745, 'dngtpc', 'dsb hdtdi aiar paflbo', 9560);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4699, 'myjfvmov', 'sigu dtevuyn apknufi vua', 946);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7707, 'kezrug', 'kkwie liw ivua wdetu', 4425);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7157, 'vmprcxkysc', 'waisvro qvwjwxa jkpllt tvkef', 8178);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3005, 'utlzptphgu', 'acga qpwd vws wxq', 3396);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8267, 'isrtfmvr', 'urwi owd htdcvgq oplymp', 6205);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9493, 'yaigrpb', 'fgdc psfkdt pxwmbwl etrzmx', 404);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6432, 'sesatm', 'cffn qghywjw epoa csqoocs', 322);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3600, 'klibqvfqv', 'ejwrmeb nlay iaskbqe wdkici', 6306);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1773, 'klryfxw', 'ocrykq auljwkj lsdwt ltkonki', 7084);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5480, 'ddfvtfm', 'chcrfk ehl szl yod', 6303);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2361, 'zksnuk', 'xvsvh qlyvbxi hborsf cqmhcb', 6584);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (506, 'qrqecztl', 'uolwslc huparbz rhsmpx knrbh', 9902);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9071, 'icovjlwweu', 'ayxe hfvxaw fguts jzplgt', 2072);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9930, 'stkcst', 'nik kjlsw xxvu rmfhx', 6109);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (200, 'qbrxbgm', 'bace urgt bjy isfrvbg', 8703);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3427, 'syrkws', 'key dha rpjyc ssfbql', 4178);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4427, 'qzuohzq', 'oom ewkkwr aal xnac', 6736);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7913, 'ifauyypq', 'ome jww vokwigy xazmtya', 5200);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5838, 'rgyzuos', 'jfy fhgylso uybepvz ubdqnlj', 625);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5448, 'avmwchj', 'lpexry wptlm gfwa tcqial', 7061);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2354, 'zuq', 'erzhbp qtpg ihor jidncb', 4448);
commit;
prompt 600 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (80, 'opygbebzva', 'jxltzbp oskqvzg bnbd kldkke', 2326);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5836, 'aijch', 'decik vqoavx cndnj lmpiej', 4733);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7435, 'cnmwdxsqb', 'yzea ylkmg pmb mgwmhh', 3424);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6090, 'ojpohw', 'vmw ahzd dxefwc dez', 1389);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7170, 'pahod', 'yvlh hrov ncdtb ggkmjd', 1149);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9852, 'lwzmu', 'rrdn vffd nlhydp lzenaa', 5917);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4404, 'jrnkbtv', 'zwj whuj ngioqda mgfx', 5787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8385, 'gfbdeyu', 'ycqpuxh slu nau jul', 7972);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2167, 'cqdl', 'ndhk asj nvqp yrzcrpn', 2606);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1406, 'kuniobl', 'idnw ila dolupz gyqfju', 6211);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2966, 'oajm', 'zxqwif aak nsyy bsm', 7053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (233, 'rtd', 'fvavi wef cwxrrxu enmqjad', 4786);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3685, 'zvvzdfzk', 'wehxhjv xppf vnua mvwpk', 7195);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6997, 'oycqty', 'pyf gmehb oqs jvptcf', 5686);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6679, 'gadxikugu', 'jndfot rcz oofjr cfil', 3331);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1592, 'hngfjjse', 'gdqdbi scgk xmidmj pzzgbiz', 8202);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8983, 'wclhrgg', 'ligpev agv exlcxq rujqgh', 3396);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9530, 'svrxmyjb', 'ceg iqo qpxo nvxd', 622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9463, 'yco', 'nxlbft uaa lcw yyfu', 8341);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7967, 'iuthfwr', 'hvmzp gcjpwga nzrfc vguvuuc', 9527);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7169, 'oziod', 'qiz whanol ylzb dit', 4112);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1968, 'rhaouokx', 'nmvngug jolzue fdpzyo prfzn', 7750);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2944, 'yzmokik', 'acq mwvo onzascc mdm', 482);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (842, 'per', 'spheae inqyxhr ofhtdyd sgocbd', 212);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8240, 'wovc', 'rcuapi mxtuqje mumina pfxvpuu', 3042);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1367, 'wnktkkzfr', 'bftpuid rks zbcqwdc nuiaglb', 6325);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1834, 'fbvdxp', 'pcoydd hfjo jyhtzd xumavih', 2039);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7314, 'bpftn', 'lcfb shxo pbv fsw', 4770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1604, 'ofye', 'xtx ztfabf pwfwo rhafxqb', 9253);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1513, 'ynowr', 'ufurzs kycmelk wazs cbm', 2039);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4114, 'ltmhsxbe', 'fdmlvo vnmouv dmb ttki', 7978);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4682, 'uxeqnvbt', 'prve ssp wqjuq ets', 3424);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5709, 'onc', 'dhhv xxo qibxfu ymismf', 682);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (924, 'acobxrbo', 'syjl nnj feslw lsc', 4112);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1148, 'xpknrudjdn', 'agnroug jufls lmvj enesz', 6532);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7016, 'obfsrnvze', 'oqohlz smymot opkj drjp', 2774);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6473, 'tjsh', 'uiy pbk kfddr hshgcus', 5419);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9168, 'ccyb', 'rztx bwxpsxh dffdqs knkqoae', 2711);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8163, 'llkuyysr', 'wxfyjai lit kjac ova', 3872);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9987, 'pjru', 'enfwn jhpjf vdgu hromtg', 6746);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1654, 'ymgwysia', 'lemsoe qpwx jlk amxbsb', 7053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5529, 'afpfhvgvaa', 'zfoxjr wxdyvfg ycjgr ahpcayc', 1787);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9849, 'jinuh', 'wjiglrg fodmu fimqyb hltj', 5127);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1161, 'qvmu', 'edqvj chjn izbbbi xewbyqo', 3306);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9341, 'iam', 'gweq xtmb ggtuiv zmdkoee', 4056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5988, 'hjnzikyl', 'hcv fty myewi tthc', 5354);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6471, 'oywgmemqx', 'jjnj opmtsjt gwydqa hbcnm', 9079);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (31, 'djw', 'ucvh xzkfx knn lnjqs', 6973);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7771, 'eqrmitbxs', 'uuax ezmkdr ypzp mqgjn', 128);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3764, 'zzebejt', 'gdrqj oftncov yqsol jfw', 3424);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3181, 'ombqzf', 'cfnfw vwrbkh tjsqxd nfdx', 122);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (996, 'xnoqxixs', 'hzyisi vzrwv xgdcpr mrqe', 5108);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6392, 'prdck', 'wmae rqljrmp qvk ccqzi', 6798);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8452, 'garqtuxxd', 'ckv ecrfbg vuequpw sxuy', 3064);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9789, 'rubodnb', 'sexrkbe wbe crst bbgwsf', 271);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4727, 'oeblnwxymp', 'xato llhuy mkj xixdugy', 6019);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5808, 'jxybvdugjd', 'bnonm yynp jbg phep', 1735);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6544, 'gdtwmbk', 'kgiybw tvqp ddifm saymsz', 785);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7128, 'jfnyy', 'mwmfr ric tnncb jnmvjtl', 4754);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3754, 'bjpxxhcc', 'jegsqm kevdly jvkgv ypm', 5410);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2602, 'ggnqerfp', 'zmsnyk vpurod hwaws hlhekkn', 6694);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4604, 'uyjct', 'ktjct eetgznm fsa mbn', 4266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1373, 'qudfll', 'lnpadb vkbnvp neu xqzok', 312);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6192, 'euluxfaa', 'ncd xxy clkamz pimtkbz', 2916);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4832, 'fogry', 'slm tpuck egheugd cio', 4143);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9967, 'eblajdv', 'wynjmys gsyas azteopy plkkfup', 154);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (25, 'bdcuztehlw', 'eoger etzs zpouji vzs', 9225);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8070, 'plqmzr', 'ctxgt hlok rwvlqow onwecx', 5726);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4301, 'lelsyz', 'ychv shluw dkejuv wnh', 4266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5978, 'bxukrlqgj', 'ijwhz wns zmmuqq aataqpo', 7304);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7432, 'vmiagobw', 'ascqz gvzsypz wkdj pjsxsks', 8926);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1606, 'hijzilruuj', 'gotfc ywafb kun wiws', 8937);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (442, 'qmageve', 'oslo dssr zzan udmshkm', 6914);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7407, 'tlbjnx', 'xffst sjepc xoavij nactxbs', 7459);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (758, 'gpuahrkcks', 'udrvb dfbsgui zuayiyb iuqkxh', 6289);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5104, 'vvjzzi', 'dblnqm bymc qwireej gom', 3362);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4331, 'acltxwukj', 'ykmrsvi ewwplay uiljv wuxz', 7202);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2248, 'znsmviktf', 'vtkhke ueaidu imrpovj xbmvan', 5040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8812, 'jcesbdnc', 'uvrbvk lhmcbjy ffqdi pgoop', 6761);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8238, 'wngmu', 'lgovogk jqj rqkza kdm', 5040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7487, 'bozeu', 'cchytra vkfw ksumimg nkgxoi', 7304);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9862, 'ftxlhmmob', 'hmendlv tuhu ybwfwu kdcjys', 9021);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1283, 'qjl', 'qgfvl gaxhwu barcl kbkuuo', 9266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6998, 'kwx', 'upudl qgxtb kcyted svzmqli', 11);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (922, 'ocykfpwuqq', 'aien gpceqjh zeee iuclo', 6043);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9432, 'amgfdy', 'uitmbpa dsbpr japxgr dogl', 8416);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7460, 'tne', 'xzuug ltlqrv yqfqmeo mjajwp', 854);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (272, 'cjwlbogbha', 'mliekhi jjq nfr aydpk', 1118);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2084, 'ssym', 'hdz nyght gfnjq iiolwhk', 3651);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6795, 'yjftaokw', 'nvif jvzeq ajmin nesfh', 3156);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7370, 'hrbsntwqi', 'cvk ymd hhao tzux', 9261);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4611, 'vcfqrnx', 'axrv rxmttp zupwav eas', 4040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7043, 'nnq', 'zvlho lexib tacdelx yhvl', 4058);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2397, 'svbndcc', 'zef vzi rsrc ahb', 5412);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5408, 'gmiu', 'ouylw oxmt nqw cgr', 9484);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (37, 'ydwkka', 'urout unztcgt rnggjdd dhp', 5248);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1607, 'pnmqedza', 'akuns kudo yhnj pwie', 3396);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1565, 'ixryftlq', 'urkr aqne vkyv scbncp', 128);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9013, 'jegb', 'ujekkhw ybb unayw egdd', 489);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1618, 'leuad', 'oxpotnx atl pftwl okr', 2129);
commit;
prompt 700 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3909, 'tozluy', 'iqvwxb yqjq cqdi lpvosio', 3038);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (561, 'ywro', 'pkqhv iukz eps nrfd', 2994);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6104, 'molng', 'leaic fjgrknx fsi lcelj', 2882);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4978, 'ilbcfzq', 'nvetni upi shuh xly', 3266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1046, 'dsyg', 'anxhdo mqr okmtf qxzch', 9940);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3252, 'jrbgygbchl', 'qrojbto ccobsjd npbh auk', 7710);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6977, 'qhixul', 'frbfxc odeejfl oyy zpr', 8246);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (90, 'oyp', 'wtcpkk pndpohd spsgzz pxh', 6863);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6138, 'nbqjwcgayh', 'zrow tps gapmfc axnsap', 2817);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2194, 'izyrj', 'cst vqorx pdbfr nwpjf', 4138);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8080, 'erlhgnwc', 'jccl ayykeu mytwtc wolqbjn', 9233);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3886, 'kumfrs', 'dgyc xwasbgx botlqg lmo', 2343);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4441, 'rek', 'ekvo vdglvl maiftn qny', 319);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6163, 'tuqyr', 'wnlhfij exchki urufkq lhsx', 8481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5207, 'rivyrn', 'zyqbpb jyo nnwshz ywkmrj', 3558);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2527, 'ccpol', 'xzpzk aqdwjb ccqxf yqglkag', 8930);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8594, 'zwmses', 'jkfe rmh lfwrtuj ewjkxe', 9708);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (302, 'rwfxs', 'rigsxq den rmobyr riy', 1544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1964, 'yxxsnakzrt', 'zjfc euirnpt nmtrnqg hqmi', 1274);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1573, 'spfutkhhni', 'nhs hsn bqdxqf jkykrc', 4040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4764, 'lveqfnwdd', 'xkle qhwc kbes byrwway', 7215);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (731, 'viivc', 'cfnyn obru pafwiil puphsdc', 7277);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4970, 'erir', 'qpra axm rdsr sva', 1090);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9002, 'tglcxc', 'vasom vropi plzlws buuqms', 2521);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7993, 'mcja', 'buvd uxnzt rguvmcu mhd', 3848);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1147, 'nvczem', 'xnmwg rzxk rca pqjfir', 8612);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8917, 'imvsn', 'sjnhkc dmxi auj dljza', 1476);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7285, 'xjzunyanww', 'ladqri eswwrq ismwp ayialj', 2329);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2919, 'vwnw', 'rgokrs qsgtpcc trqy pnug', 2726);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7757, 'vwvrb', 'dzkgyah oaszqj ctvq ihrb', 5397);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7407, 'ylpyfto', 'gfpqzn xoupfqg azuom szr', 9271);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6686, 'uxghhpmes', 'chzsyuo mmbuw kzav xaq', 9037);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2874, 'glfd', 'bchr qqywwjg kvndxot cckvm', 1219);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9969, 'dhczcppu', 'omlawuc gbj lkcsp sxvtng', 631);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2102, 'lsmyeoapsh', 'uknca tsqktbe wer zohamo', 99);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7464, 'kjcnlcoq', 'ihiob jxpq mdrnom etypt', 922);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5242, 'javvll', 'yfdbl dnuf lrsuao uobvbk', 9483);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5431, 'giknwp', 'phl pmv ntz sbsdc', 1720);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6704, 'yew', 'mzh bwyax bmvf fnrhb', 1705);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4714, 'xdsxyjt', 'liehvk wvhdsp lbj tluodh', 9206);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7457, 'dsrhjyuct', 'zjf nwvop slnvi iibnbb', 1198);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8727, 'tbxu', 'wbetw cpucx hwl kzriko', 8732);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5780, 'olqzegkf', 'ywh cjtukl qlmnd vouaypi', 7776);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9271, 'lrx', 'yydg joeauiw msdk fasl', 2678);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9736, 'ojrkevv', 'yrw jwhhoml dqip keiq', 5061);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5829, 'wwkbnkoxln', 'qsfdulb oylcvwc gnqd dhh', 8246);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9831, 'fgkpogvnv', 'ijstky sxl kjrbsi avzkbdh', 9416);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3610, 'mdeoba', 'izhewh iap eoa qndtifv', 9525);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6218, 'lbwdkkzs', 'bze ordjl mtw sbmriwl', 4751);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3019, 'ulepvysnxs', 'mhaxwye qmyfh ndiz hprt', 8413);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9308, 'hyb', 'jyqjzyg soca hhebmwh apf', 4118);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4347, 'cupymiog', 'bnme cjnf nqc fup', 2556);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9409, 'qad', 'oyg oegv dbwrwc mtji', 4512);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6740, 'tyhf', 'szbn seuop aqrnaj ujo', 3558);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4344, 'goxbduv', 'nkdg pzuqev xioone sdsezbb', 5724);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2240, 'imvay', 'pzuomv kjbcrjn ootabo yktdw', 5836);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5524, 'mtniikf', 'ddrm hkdii hkwprst wryklo', 2056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5075, 'wllvvapl', 'kno xnkvw rumrb xzmw', 5769);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8183, 'cspavszjp', 'rqr asyhrxs ikexir twrl', 1090);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5452, 'dhboz', 'wmjsw qooza onqhaam qln', 6081);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9925, 'gkqggmnw', 'jtghun sjsdk gsrd srqtpq', 7924);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8819, 'ekfgryytpm', 'jomhl ybpz jgimd isnvnn', 9021);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9180, 'wkzqpkef', 'nnvmv tvrnpeh ziispj yjoc', 5356);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1516, 'ifhwl', 'frf cyz olponyq yecdda', 7750);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5253, 'wdomg', 'tlc hpom ntl qpidf', 7897);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7383, 'grdvztpyyv', 'imvpimc qiit owpbq yqsps', 1351);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3403, 'arozzln', 'pbvmyq kwtj odyzyr sfq', 3884);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3915, 'hvpz', 'xgactwy nfmrsgc tnn yspqrni', 6286);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1363, 'ammbrqle', 'elhetv juvr oyzwsr qavudv', 2613);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6114, 'dsei', 'irbh hyatvtl xsmfu njr', 1351);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4350, 'bzetzn', 'wtcfn isoaobc dyzzjhz lhuc', 7337);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8247, 'qqeghwktv', 'ootm peae fgzn rzlyij', 4095);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9371, 'wcvh', 'rvxb psdg ytvojpd etuncd', 4726);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2713, 'kdlgdmleap', 'ovlwcyp bjsa epymaji ywd', 2072);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1281, 'baqafv', 'hjn aun iyhuvda eiurx', 6415);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9836, 'qjenm', 'qjevi mltv plnnrl rin', 8548);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2689, 'iovhi', 'hfriybj crj wilay pnzypso', 9481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (856, 'ynfmok', 'uhybvm kvyk zzlxzts jxpsicz', 8877);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3421, 'mldhcs', 'qvqh zuyrvmz lvurw vpdqn', 6229);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9067, 'lhb', 'ocbfc ijbj rdfosn olbqx', 6879);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2682, 'hpnumae', 'tpeampv knziy zrymvd wxhyf', 5299);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7279, 'twobdl', 'qvlay yxaj gsxpjt hcn', 2832);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (423, 'filhird', 'dfswf khcn rfdjmsd idnbaic', 8622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6259, 'nromoegn', 'evf szy hurjvbh ydvkd', 288);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6465, 'huncgrlbgr', 'fxlyobk kar tcoee hakmuou', 2832);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2666, 'ddhul', 'wxmjg cwwtg ekeixkd cjxe', 6418);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8903, 'dhdoc', 'frzllsh fqa ahu fvvgxnp', 5620);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2876, 'bjzjycftnh', 'bkkqy kkprki skv yuqe', 7061);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4961, 'qyekbpvcmq', 'ruodz mrugu qjeevil cvhuv', 1590);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8956, 'usiaugfz', 'gsrnkc tvp muoll pogbhfk', 2622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1141, 'bhjldydezf', 'zdr cbfw qkwnj pfvfaq', 3643);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6711, 'rfgxerb', 'poc hrun utfsiem vqcfs', 8162);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9682, 'wskclot', 'pwupd uoaiv ntwemq apyaosc', 8291);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (343, 'lnilbm', 'mpuyc gifms tuletv ktcak', 271);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5395, 'iwha', 'amvw peeo klelwzq pztl', 5092);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5319, 'fxp', 'clst vpnqok bpb ovhniwh', 6576);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9337, 'rbaqohrzi', 'vogpbrn upbw hotng jmm', 5189);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7758, 'bine', 'ctpp dwdqu iasw uqvsx', 8312);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6515, 'azyvzw', 'wluxwea bhb tiwqj koikkcg', 2140);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2017, 'brmksvd', 'hsbfj axckt cuglfez koiqneo', 122);
commit;
prompt 800 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (804, 'hdl', 'kdew yimt ayeitn ntiivx', 8926);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7933, 'nzys', 'xqajx msj nyswx ifvmbs', 7202);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5629, 'diulhvpdud', 'obptadc out xhmr tetsou', 1346);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5557, 'vweufv', 'nksvfo gqys dtu vztfyu', 8622);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1554, 'skkvzej', 'ext henxffd ymnszb dyej', 4307);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5555, 'hqrhfde', 'wjvkbj hemhn pzir bmdasf', 8372);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1586, 'esm', 'abta vmysv ttirzd boqha', 5049);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8547, 'nizfieu', 'abkw ywiyn zjrj yhjskv', 4822);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9234, 'jpsacqepk', 'rnd jlzt cyjmhw csgcirb', 8490);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (782, 'zcvuudoda', 'pnu akxulg bat jdmd', 8612);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1503, 'lpf', 'jsbxnie yxjul idi zeqfcta', 255);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2371, 'pddmwyqdt', 'uguvot gyq sej rckqmm', 6497);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3157, 'hww', 'paljj iqet larcqyo lhlito', 6390);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9525, 'kfgjk', 'vcrhdyj qgt wrin tbbujw', 8201);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4123, 'tsrm', 'ehmk ainh lwxiy gxyyahy', 5189);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1748, 'elc', 'ktjeth prwm pjcatq kdiimi', 595);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1237, 'limy', 'tmijs zzzfnr wdyfndp vqvcha', 4544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3819, 'dkkbvjkw', 'pjbjg orcfxus vsmkh vanvs', 7750);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2882, 'axwojne', 'hzgqz yxm rirvk lcrar', 2142);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7952, 'drlxndg', 'vpxomyw iiui fbqwgkh lkudsi', 8381);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6392, 'vryki', 'eow lrsu lqza dkij', 4254);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4085, 'xxainfofsw', 'qxtv ikx dgtkudj iph', 4685);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6651, 'klwcpfjh', 'sjak duh smir now', 5515);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2388, 'brrgqtpp', 'zso uob nrkh jgo', 6761);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8904, 'bdsguht', 'jtlvk bdyw xgx wkwnrzo', 993);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6928, 'znlcmij', 'emi lhmd pxgmw xxyic', 5027);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9268, 'ugjffmuo', 'vop ecgpdhh eke czl', 8200);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6172, 'wzvrifcyc', 'sazizz dzq fahlq yecx', 3349);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2549, 'eth', 'gquqtsf riecdft imv sjn', 2874);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9514, 'wuxnn', 'hzxasi gtwqx aravbx eozxdf', 2830);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8779, 'vziqg', 'jaxnjpo deu gno wkb', 8770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8117, 'cwhjbs', 'xgiep jiafflv pptnial vid', 6863);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8882, 'jnjxvor', 'tgc yof blrfnf hveyqgj', 1356);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (193, 'qosryoaxg', 'iebcaee sfno bmxhlni lqb', 4311);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7152, 'iffg', 'ejyw vbixpn dku zrgalq', 1357);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5628, 'yrxpnaknw', 'hawhffi ndrfbxj nyzop kmoled', 7084);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9013, 'wkx', 'fjki hulk oatxa mczgsh', 946);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1706, 'bmesgxvfo', 'quh vfvedv dmvwx zlj', 5354);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2513, 'itmzwuxcv', 'yqxh sswuetx jsnff hfvb', 9708);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6036, 'qwek', 'oltn pcqvx jed evunkmo', 9233);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1382, 'ijqsdwa', 'xmavwda phyowvq ihmdpj eij', 1106);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5806, 'wos', 'znrwu jlsnp wzvj oxq', 8779);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1197, 'iqqtrx', 'pojrj spjf zebgen gfwcztw', 3783);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8099, 'lmjle', 'tymvw bmpp byhpi ilbw', 4335);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6793, 'abbkcuoh', 'ukdgk cmoa pvol ppn', 8416);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5066, 'hlnitsjwu', 'vvyhww wbzzaya dsd cmwgm', 564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2411, 'tcjtvsw', 'yrp pkaifvs adfwy mogddjz', 9261);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9483, 'kuinqhpqk', 'hecmeh nxays kbvopq pnq', 6452);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5326, 'kvwygk', 'xrrbbfe vik wdn asmyyfs', 9342);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5985, 'zsijapsw', 'bfk vbjit poaalla kcobc', 3275);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5306, 'pxyeyck', 'obvl pyj vxax vofec', 1705);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8442, 'vofwizvzqd', 'jsj gdtqbqg krcx wajvlc', 7564);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1417, 'gtxi', 'zkfkpqh qvm xwgnqv nbhxp', 8481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2578, 'qio', 'rsktu hywja bcbvf jjy', 7503);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3294, 'sgsnkdhot', 'sufmv ozswtcw jwqb whrbi', 9940);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9103, 'hgyvvrcso', 'qed frtzy devk jkphxji', 9953);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3516, 'vteuot', 'ldmulc ghd ucotjfs kdstk', 2354);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (76, 'aqlxgwc', 'qogy epilfmw cqish qrxpxay', 7053);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7816, 'gmlmaibbgy', 'lqno gke jvugna dnyko', 8616);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (959, 'bgnsfdkcn', 'tkwiwd runely qfqh pzwl', 8470);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1076, 'gur', 'untxxu webhe giyoi pxfbpm', 6212);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8924, 'trf', 'xqh jan qlz gdtey', 9567);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7419, 'ofnjc', 'wkbjhh mgwxeeg ezokcm zqklvx', 2248);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1559, 'rohhw', 'gnez jhlsja jsu fssun', 1315);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3203, 'snbtcpvws', 'hzy fkyyfl ttiwqlw gqt', 8722);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3652, 'hwiw', 'qtxsigb vpsfx qbqldw blgno', 9096);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2221, 'saeziu', 'cdyzusw putbd cdlgl dae', 7175);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5609, 'kchcyzof', 'wnm rbbsv csb mjk', 2056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (632, 'frhsbktdqf', 'zmzy zvmgfdn nkhztk jxu', 5624);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2750, 'sybzo', 'cbmrv hcfj esuwccf teqj', 3063);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (503, 'ggotzzv', 'sxxf rbayrei srq yitnek', 4978);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2907, 'xoeni', 'sumu mqtvkb yuoxd ydu', 3649);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7561, 'cpve', 'fqwmm fyir jnksvnw edmt', 3256);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6455, 'zhogzkqpfo', 'dgh gigrjwx gmvcx vabs', 9416);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (738, 'mmqn', 'vwrm ipkwyk worylx gytc', 7166);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4945, 'ixssx', 'zqljn mrezox gaa xnsj', 6979);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5018, 'ztrfs', 'ykmtcpl ybu macjap fvrd', 5441);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5056, 'ftf', 'jzmc gcphp mkze lew', 4266);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2180, 'siqvwvatpe', 'synof pbccwz aedmxjp mhu', 6884);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1333, 'ngkxugrh', 'ntwzd gfrkt fkg iwszykj', 4726);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2072, 'hgftnlozh', 'fqjfjru dqbk tgd khr', 3183);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (521, 'eaci', 'xrtrl mwlsqqc ysjsrs cvs', 1131);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6595, 'gdkgttt', 'bcezqjm zxy byvxmyx lyygcw', 4974);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8300, 'kukdq', 'dmpgmg wfxgg zslabll leemvk', 167);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1908, 'vsodvbg', 'eeidatp iecoj sqm ukwtde', 941);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5876, 'cvuywiwo', 'uuj tdym zpvqf xekt', 6209);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9133, 'vbhyipz', 'pmzxj foeh cwpxunz rufeu', 2552);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8879, 'gblcefzfu', 'rsclk kbo vvih wyipoy', 7841);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1542, 'obheif', 'ahgaj bzturqc vhol lsfd', 9550);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6494, 'ujcpni', 'hdcrcp jvb jlnmjk nvv', 8880);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (557, 'svclefme', 'yys eqovv zpj dootbky', 6302);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7330, 'buq', 'qreg ssxw pvs rwbp', 4058);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9960, 'txuekhaqiz', 'kxym hpqrt bcqdx bfcvkt', 5686);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7840, 'yywei', 'mbthv iqp voxxpy qoez', 3459);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3604, 'yerues', 'qcd oiv jrutoi thfrds', 9631);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1886, 'gmqm', 'etnn mcf qmdw hnj', 7866);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5198, 'urdgnq', 'mcgubby rfawpw qzcko xsjvx', 6572);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7714, 'wyoqcwxd', 'jaejdh tsrdmxf fhsd hdhd', 2994);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6409, 'neuf', 'tgkran wyec jnbjpzy fmqilz', 2832);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1196, 'etuwspfz', 'koyv fuopdz woby ozia', 7348);
commit;
prompt 900 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (934, 'aaylt', 'izf xba apgsfj xrkmh', 1031);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8793, 'otydh', 'qywvf igw ygduzr mftrlbs', 6994);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7373, 'omflcfjlm', 'yyy oqobxv sps zlx', 8202);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (185, 'iqdczof', 'qpcb dmfasi jpi rcti', 9037);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6297, 'auvmt', 'giqpb daav xqoj osimf', 4534);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (666, 'aaocfeufh', 'wccfp djhe dddi ednb', 7084);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1993, 'etsuckpbr', 'yfwvw zoxd zrdud chdzbkj', 8929);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8079, 'uxiasosgz', 'psu pqp fbcopv lfe', 9211);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4221, 'yptfmtt', 'ypsjl sijsx xnuj yrfoqc', 7336);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3659, 'mbnq', 'xvmlrqo uvvjy ftclz thx', 8737);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (926, 'ynhxqwtqco', 'eurcl bpyhg xqj rxlclc', 5441);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5155, 'opseyea', 'gtk ytabdrd joqia qzfg', 4056);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1950, 'ndwprqm', 'tnss vgrlz mgny iazd', 3078);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9957, 'kebs', 'yycrxd fjs aiwhnu zsamcre', 7897);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (220, 'jlesyn', 'tfpkb iwtqria rfcuclu snmc', 7680);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9356, 'xykgeemlfp', 'susxzjp xqy lgnd weokbs', 6283);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3165, 'ytxjrawvxy', 'tdpec fixs ptdjz kdvai', 5730);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1385, 'rfeydcgj', 'jykyhvh sjdk dikqpt izrzijs', 5724);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5035, 'oxdpogitu', 'xterd ldau iatbza tjvlysv', 5515);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7358, 'uwah', 'jnu tqy rpjy tbgutca', 2435);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6245, 'tar', 'tonvkaa tiq bohy lslb', 5852);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5475, 'ahngeg', 'fodiu cggfl jpxcad kxxzbjs', 1315);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3986, 'gdxby', 'rdn jgydwy mazkz fwue', 5040);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4136, 'ytrhube', 'yhui jjse bejtn kxva', 7910);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9955, 'wquqruph', 'guxlayx fmppsel kki lfzxs', 1445);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6037, 'avaiupnnhk', 'pgwgk tduvyot fraz flprjxv', 8737);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5997, 'njghcao', 'zmva ztat vzp xpbkow', 7924);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5019, 'zng', 'zqtled iznn nwtra sfnesr', 2637);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8049, 'gelwlkfj', 'bkivvw vkz zlwglpz hytwdvy', 2312);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6633, 'ioiaoog', 'ugtk wyxwbnm pxk wbdefm', 3449);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6913, 'zsissaujy', 'zle ngna vbbi qlqwv', 2982);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7212, 'uqvitx', 'qsxv key bwfs suijswc', 2264);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9906, 'klxoqzjxnv', 'xbte rfg cguwxb wwxss', 4000);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (398, 'prjw', 'vbqw yabvaj ncdb cjksqdc', 5745);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9387, 'lguhi', 'ussmae dzyrug kzdgh tpyenwp', 5730);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1580, 'bfia', 'hjj twgoqn qhegw slnb', 7680);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2273, 'eraxskf', 'ilpgzed khw qvgvkok geuwqrq', 9063);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4224, 'njhdrsan', 'paudxb nfqwz rfawn bpe', 3293);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5709, 'bodgtti', 'bhhgdxa lyzad hkpd emyvm', 9063);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9711, 'fpqvkxe', 'cmpzhc jvsd knkc bwgyul', 4058);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3298, 'kmn', 'ntr dholni uumh hjpvyuz', 8769);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5531, 'kbhsnhd', 'cgwm fiwvbjs wosbnsn omyig', 7860);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6566, 'twwj', 'vjquos pgtnt wdgk cxzzm', 2895);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8657, 'fxdv', 'prv prkbczy mqxpe uwdbrw', 5780);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4970, 'yigcjecgnp', 'ocltv tjywzxd dto hrmw', 8341);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8758, 'edr', 'wtye ntohd trvr orqwbea', 4982);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3428, 'hvbya', 'bnk nagj rtyd kqssld', 625);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (746, 'nywmgz', 'kjmulng bkrao elu ciw', 9279);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1107, 'ewa', 'zweqwz mbqsvhr dhz rwbcgku', 3659);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5600, 'bcnox', 'kdj zrd xjq zjcz', 668);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3392, 'ipie', 'pbxzug ecdsykg wnvmfgk hxqqqv', 9698);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2534, 'brp', 'yaktpb kmgtz mksg iggqkw', 4946);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7117, 'igrhnudyi', 'cyb gnyrto jgncd jufu', 2673);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (781, 'fartujez', 'thte iztxsxi mtw jxuu', 8325);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5505, 'naaszjycj', 'wsiz tptnlqu yocgf iiyfwz', 4254);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8561, 'nyihmuwgkk', 'sblu dlerhs yuxex vocc', 2388);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8272, 'ohkpcbp', 'puemzqu ruya vzxood ukdktp', 2435);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6549, 'tmfo', 'oij xvymy gnyewb ugesx', 6648);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6844, 'ichdjws', 'hnzq aotv sjkgbc zvp', 4864);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1259, 'dcwlrj', 'kza qjnip ere vbf', 2795);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5547, 'mlun', 'vvs iuhqsx ghhjk mtjxche', 6727);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8275, 'bnjyjhm', 'xelg xqa vhc pqik', 312);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3091, 'gsubymlje', 'zgb eln pzron zhweq', 1544);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5396, 'pyfrbgyxpr', 'mokksfd wwaz zsd ffnmh', 3783);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6581, 'odg', 'zov lvuopo mgtw cbgyaa', 7389);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (754, 'lrn', 'gzhh jyzrt ifnokz naqjul', 1031);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1829, 'afm', 'uwrx zbac cpv kvbarpn', 1149);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3375, 'lyg', 'vvzjh yzkdtr otgv ownc', 2830);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3079, 'afirsiqey', 'jofploi twe ker demgwdb', 4353);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8916, 'axl', 'cgdufe jhdsrae xxkrt dwutz', 5441);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5196, 'yqkhzrt', 'ayctb nwqxish poigjcg bhnx', 9084);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2872, 'gplghadh', 'mmqyyh hpv ecpmj goy', 6303);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6761, 'bbvmle', 'mdmjkxw cgdxhs gwc kchojhi', 436);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9966, 'mqxdazyh', 'ttzhmh ejin hubo ftcfl', 2583);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6384, 'vxpauzgdlu', 'qssko wvhf eslescd rvl', 7910);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (359, 'lciym', 'guef gbnuwut nxtxf kcurfi', 2774);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (187, 'rbl', 'sfruoud kxnbs tvsaa mzazc', 3968);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2760, 'gugmy', 'gujwjxo fzna svfb mrx', 9749);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5694, 'crvicul', 'nrhigrv idtw fkcmp qth', 465);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6688, 'kjgws', 'rgqsib nylx xkgr fvomgcs', 4198);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7930, 'ynldw', 'qrbxzwx ygok hoxh ntntkf', 3848);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5614, 'gpbpegkvm', 'nuf rwk aaqbw mzg', 8612);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1879, 'acyvhqmwl', 'ewll oynzogd izkxdsz ogio', 6761);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (1045, 'uzhrrk', 'fsbypwr shnz cny max', 5686);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (9715, 'veotdktp', 'zwmp eyseoke ilqf katvtqi', 7643);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5939, 'wknhba', 'ztgjru lfhvfld hdknz raz', 4428);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (445, 'xqt', 'tda mvyslwz elumn dzm', 8770);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2272, 'cycef', 'nzzu zgizv hefj cnp', 5620);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4336, 'rxt', 'xcgf khvsz gqlb orgwpc', 7830);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4608, 'kvhudt', 'zqoci skways qjqn dlh', 9350);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (7783, 'ulskhsjt', 'uvx slayyx efifs hqzd', 1483);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (5651, 'miqhiru', 'hdhimt ltdqw vxiz jgspst', 6703);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (8939, 'qcddu', 'ofx frzncr knk wynby', 4481);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (4104, 'npmgdwmbut', 'eqogs bybu onsemdn qmsngp', 2974);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (6940, 'ncjjaobee', 'oocdsr hqeks wuyfcw gteafgg', 7352);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2342, 'dlfuxcgpri', 'wiyo ajctbl rmsns wuvroyh', 5652);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (380, 'rcjdgoyz', 'nei pgua uqkgo xfmcdbk', 6081);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2192, 'hqjqbwt', 'gst stun pvyftyd mwzdc', 7978);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (3444, 'pzsv', 'boyr sepd eoria feybdql', 2953);
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2690, 'glthytwi', 'buwu dra djvwf gwee', 3004);
commit;
prompt 1000 records committed...
insert into T_ROLE (role_id, role_name, role_desc, dept_id)
values (2733, 'bmlcwwgkza', 'spmw nsaj srl xgzz', 4198);
commit;
prompt 1001 records loaded
prompt Loading T_EMPROLE...
insert into T_EMPROLE (emp_id, role_id, dept_id)
values (5011, 2110, 3011);
commit;
prompt 1 records loaded
prompt Loading T_JOB_REVIEW...
insert into T_JOB_REVIEW (job_id, start_date, end_date, progress, dept_id, role_id, emp_id)
values (312, to_date('01-01-2018', 'dd-mm-yyyy'), to_date('02-03-2018', 'dd-mm-yyyy'), 'confirm the covid', 3011, 2110, 5011);
commit;
prompt 1 records loaded
prompt Loading T_SALARY...
insert into T_SALARY (sal_id, val, sal_date, emp_id)
values (7011, 20000, to_date('10-02-2021', 'dd-mm-yyyy'), 5011);
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for T_ADDRDEPT...
alter table T_ADDRDEPT enable constraint SYS_C007401;
alter table T_ADDRDEPT enable constraint SYS_C007402;
prompt Enabling foreign key constraints for T_PERSON...
alter table T_PERSON enable constraint SYS_C007378;
prompt Enabling foreign key constraints for T_EMPLOYEE...
alter table T_EMPLOYEE enable constraint SYS_C007386;
alter table T_EMPLOYEE enable constraint SYS_C007387;
prompt Enabling foreign key constraints for T_ROLE...
alter table T_ROLE enable constraint SYS_C007363;
prompt Enabling foreign key constraints for T_EMPROLE...
alter table T_EMPROLE enable constraint SYS_C007413;
alter table T_EMPROLE enable constraint SYS_C007414;
prompt Enabling foreign key constraints for T_JOB_REVIEW...
alter table T_JOB_REVIEW enable constraint SYS_C007396;
alter table T_JOB_REVIEW enable constraint SYS_C007397;
prompt Enabling foreign key constraints for T_SALARY...
alter table T_SALARY enable constraint SYS_C007408;
prompt Enabling triggers for T_ADDRESS...
alter table T_ADDRESS enable all triggers;
prompt Enabling triggers for T_DEPARTMENT...
alter table T_DEPARTMENT enable all triggers;
prompt Enabling triggers for T_ADDRDEPT...
alter table T_ADDRDEPT enable all triggers;
prompt Enabling triggers for T_LOGIN...
alter table T_LOGIN enable all triggers;
prompt Enabling triggers for T_PERSON...
alter table T_PERSON enable all triggers;
prompt Enabling triggers for T_EMPLOYEE...
alter table T_EMPLOYEE enable all triggers;
prompt Enabling triggers for T_ROLE...
alter table T_ROLE enable all triggers;
prompt Enabling triggers for T_EMPROLE...
alter table T_EMPROLE enable all triggers;
prompt Enabling triggers for T_JOB_REVIEW...
alter table T_JOB_REVIEW enable all triggers;
prompt Enabling triggers for T_SALARY...
alter table T_SALARY enable all triggers;

set feedback on
set define on
prompt Done
