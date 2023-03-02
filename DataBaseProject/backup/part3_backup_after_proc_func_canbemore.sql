prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by User on יום חמישי 03 יוני 2021
set feedback off
set define off

prompt Disabling triggers for T_EMPLOYEE...
alter table T_EMPLOYEE disable all triggers;
prompt Disabling triggers for T_EMPROLE...
alter table T_EMPROLE disable all triggers;
prompt Disabling triggers for T_JOB_REVIEW...
alter table T_JOB_REVIEW disable all triggers;
prompt Disabling triggers for T_PURCHASINGWORKER...
alter table T_PURCHASINGWORKER disable all triggers;
prompt Disabling triggers for T_PURCHASE...
alter table T_PURCHASE disable all triggers;
prompt Disabling triggers for T_SALARY...
alter table T_SALARY disable all triggers;
prompt Disabling foreign key constraints for T_EMPLOYEE...
alter table T_EMPLOYEE disable constraint SYS_C007344;
alter table T_EMPLOYEE disable constraint SYS_C007345;
prompt Disabling foreign key constraints for T_EMPROLE...
alter table T_EMPROLE disable constraint SYS_C007373;
alter table T_EMPROLE disable constraint SYS_C007374;
prompt Disabling foreign key constraints for T_JOB_REVIEW...
alter table T_JOB_REVIEW disable constraint SYS_C007383;
alter table T_JOB_REVIEW disable constraint SYS_C007384;
prompt Disabling foreign key constraints for T_PURCHASINGWORKER...
alter table T_PURCHASINGWORKER disable constraint FK_T_EMPLOYEE;
prompt Disabling foreign key constraints for T_PURCHASE...
alter table T_PURCHASE disable constraint SYS_C007395;
prompt Disabling foreign key constraints for T_SALARY...
alter table T_SALARY disable constraint SYS_C008265;
prompt Deleting T_SALARY...
delete from T_SALARY;
commit;
prompt Deleting T_PURCHASE...
delete from T_PURCHASE;
commit;
prompt Deleting T_PURCHASINGWORKER...
delete from T_PURCHASINGWORKER;
commit;
prompt Deleting T_JOB_REVIEW...
delete from T_JOB_REVIEW;
commit;
prompt Deleting T_EMPROLE...
delete from T_EMPROLE;
commit;
prompt Deleting T_EMPLOYEE...
delete from T_EMPLOYEE;
commit;
prompt Loading T_EMPLOYEE...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (5011, to_date('10-02-1985', 'dd-mm-yyyy'), 506788856, 'itzik@MOH.HEALTH.GOV.IL', 6011, 11567543);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (1, to_date('07-06-1983', 'dd-mm-yyyy'), null, 'desmond.lizzy@ubp.com', null, 1);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (2, to_date('06-03-1986', 'dd-mm-yyyy'), null, 'radney.s@mls.nz', null, 2);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (3, to_date('03-07-2000', 'dd-mm-yyyy'), null, 'crydell@montpelierplastics.au', null, 3);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (4, to_date('22-07-1986', 'dd-mm-yyyy'), null, 'april.moffat@ksj.ch', null, 4);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (5, to_date('13-07-1978', 'dd-mm-yyyy'), null, 'adam.haslam@staffforce.com', null, 5);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (6, to_date('13-06-1987', 'dd-mm-yyyy'), null, 'xander.hawthorne@glaxosmithkli', null, 6);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (7, to_date('10-08-1971', 'dd-mm-yyyy'), null, 'gates.n@trx.id', null, 7);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (8, to_date('08-01-1972', 'dd-mm-yyyy'), null, 'jeffery.hutch@dancor.br', null, 8);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (9, to_date('19-04-2002', 'dd-mm-yyyy'), null, 'juliac@egroup.au', null, 9);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (10, to_date('16-10-1991', 'dd-mm-yyyy'), null, 'kyra@midwestmedia.de', null, 10);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (11, to_date('27-01-1975', 'dd-mm-yyyy'), null, 'brothers.waits@healthscribe.de', null, 11);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (12, to_date('05-12-1983', 'dd-mm-yyyy'), null, 'julie@linersdirect.com', null, 12);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (13, to_date('22-04-1991', 'dd-mm-yyyy'), null, 'nelly.macneil@directdata.com', null, 13);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (14, to_date('02-06-1992', 'dd-mm-yyyy'), null, 'nik.cumming@procurementcentre.', null, 14);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (15, to_date('28-02-1988', 'dd-mm-yyyy'), null, 'patrick.morse@abs.com', null, 15);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (16, to_date('06-12-1989', 'dd-mm-yyyy'), null, 'tia.lapointe@dillards.com', null, 16);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (17, to_date('02-07-1980', 'dd-mm-yyyy'), null, 'donal.ricci@connected.com', null, 17);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (18, to_date('24-05-1990', 'dd-mm-yyyy'), null, 'keith.westerberg@mcdonalds.com', null, 18);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (19, to_date('16-10-1988', 'dd-mm-yyyy'), null, 'g.pleasure@hondamotor.in', null, 19);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (20, to_date('26-06-1994', 'dd-mm-yyyy'), null, 'chad.newman@lfg.de', null, 20);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (21, to_date('10-01-1999', 'dd-mm-yyyy'), null, 'grege@unilever.es', null, 21);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (22, to_date('04-04-1970', 'dd-mm-yyyy'), null, 'm.hawkins@sandyspringbancorp.j', null, 22);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (23, to_date('09-02-1984', 'dd-mm-yyyy'), null, 'gilbert.gallant@powerlight.uk', null, 23);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (24, to_date('16-10-1976', 'dd-mm-yyyy'), null, 'elisabeth.gough@jollyenterpris', null, 24);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (25, to_date('11-03-1998', 'dd-mm-yyyy'), null, 'lennie.wahlberg@at.uk', null, 25);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (26, to_date('06-12-1990', 'dd-mm-yyyy'), null, 'tsavage@parker.br', null, 26);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (27, to_date('09-08-1982', 'dd-mm-yyyy'), null, 'earl.keen@yumbrands.com', null, 27);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (28, to_date('15-04-1971', 'dd-mm-yyyy'), null, 'graced@pharmafab.de', null, 28);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (29, to_date('18-10-1973', 'dd-mm-yyyy'), null, 'clint.rydell@msdw.be', null, 29);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (30, to_date('09-12-1996', 'dd-mm-yyyy'), null, 'pierce.cleary@paisley.com', null, 30);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (31, to_date('03-09-1978', 'dd-mm-yyyy'), null, 'skattan@oss.jp', null, 31);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (32, to_date('06-04-1998', 'dd-mm-yyyy'), null, 'gordie.maguire@mcdonalds.com', null, 32);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (33, to_date('10-04-1989', 'dd-mm-yyyy'), null, 'h.bates@pinnaclestaffing.com', null, 33);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (34, to_date('24-01-1973', 'dd-mm-yyyy'), null, 'rferry@operationaltechnologies', null, 34);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (35, to_date('21-10-1999', 'dd-mm-yyyy'), null, 'julia.posener@baesch.ca', null, 35);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (36, to_date('09-02-1971', 'dd-mm-yyyy'), null, 'edgar@spinnakerexploration.ge', null, 36);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (37, to_date('11-09-1983', 'dd-mm-yyyy'), null, 'rodney.caldwell@tigris.com', null, 37);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (38, to_date('18-11-2000', 'dd-mm-yyyy'), null, 'albert.vicious@healthscribe.co', null, 38);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (39, to_date('08-08-1997', 'dd-mm-yyyy'), null, 'emilio.palmieri@daimlerchrysle', null, 39);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (40, to_date('06-05-1998', 'dd-mm-yyyy'), null, 'd.weston@mcdonalds.it', null, 40);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (41, to_date('28-01-1986', 'dd-mm-yyyy'), null, 'lois.c@prahs.de', null, 41);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (42, to_date('20-11-1985', 'dd-mm-yyyy'), null, 'jimmie.duvall@oneidafinancial.', null, 42);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (43, to_date('17-06-2001', 'dd-mm-yyyy'), null, 'edurning@enterprise.jp', null, 43);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (44, to_date('06-02-1994', 'dd-mm-yyyy'), null, 'dhatchet@lms.ca', null, 44);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (45, to_date('08-03-1974', 'dd-mm-yyyy'), null, 'tmcpherson@jma.uk', null, 45);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (46, to_date('03-02-1987', 'dd-mm-yyyy'), null, 'sona@authoria.com', null, 46);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (47, to_date('28-08-1977', 'dd-mm-yyyy'), null, 'chad.craig@pacificdatadesigns.', null, 47);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (48, to_date('01-12-1982', 'dd-mm-yyyy'), null, 'ahmad.boone@genghisgrill.com', null, 48);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (49, to_date('12-05-1987', 'dd-mm-yyyy'), null, 'chloe.birch@alternativetechnol', null, 49);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (50, to_date('17-12-1998', 'dd-mm-yyyy'), null, 'lydias@alogent.jp', null, 50);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (51, to_date('24-04-1980', 'dd-mm-yyyy'), null, 'gabrielh@timberlanewoodcrafter', null, 51);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (52, to_date('22-02-1976', 'dd-mm-yyyy'), null, 'sean.davies@nsd.com', null, 52);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (53, to_date('25-10-1998', 'dd-mm-yyyy'), null, 'c.beck@viacell.com', null, 53);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (54, to_date('15-05-1992', 'dd-mm-yyyy'), null, 'keanu.chambers@lydiantrust.com', null, 54);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (55, to_date('26-08-1994', 'dd-mm-yyyy'), null, 'lunger@emt.ch', null, 55);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (56, to_date('07-10-1978', 'dd-mm-yyyy'), null, 'melba.d@news.com', null, 56);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (57, to_date('03-04-1974', 'dd-mm-yyyy'), null, 'debra@pscinfogroup.com', null, 57);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (58, to_date('03-04-1980', 'dd-mm-yyyy'), null, 'carrieanne.zevon@paintedword.d', null, 58);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (59, to_date('03-11-1987', 'dd-mm-yyyy'), null, 'mickey.latifah@infovision.com', null, 59);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (60, to_date('29-04-1982', 'dd-mm-yyyy'), null, 'm.wine@diamondtechnologies.com', null, 60);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (61, to_date('14-07-1981', 'dd-mm-yyyy'), null, 'loreena.ontiveros@refinery.com', null, 61);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (62, to_date('10-04-1980', 'dd-mm-yyyy'), null, 't.rains@max.com', null, 62);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (63, to_date('12-04-2000', 'dd-mm-yyyy'), null, 'hosborne@conagra.de', null, 63);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (64, to_date('19-09-1988', 'dd-mm-yyyy'), null, 'ljudd@fab.com', null, 64);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (65, to_date('08-11-1994', 'dd-mm-yyyy'), null, 'zooeys@its.de', null, 65);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (66, to_date('09-01-1972', 'dd-mm-yyyy'), null, 'kurt@scripnet.br', null, 66);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (67, to_date('11-01-1985', 'dd-mm-yyyy'), null, 'taryn.hauser@nobrainerblindsco', null, 67);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (68, to_date('22-02-1972', 'dd-mm-yyyy'), null, 'omarn@taycorfinancial.es', null, 68);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (69, to_date('13-06-1990', 'dd-mm-yyyy'), null, 'tyrone.ronstadt@alternativetec', null, 69);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (70, to_date('28-11-1982', 'dd-mm-yyyy'), null, 'jodie@credopetroleum.fi', null, 70);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (71, to_date('03-06-1985', 'dd-mm-yyyy'), null, 'kevn.deschanel@fsffinancial.co', null, 71);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (72, to_date('29-07-1996', 'dd-mm-yyyy'), null, 'mae.arkin@providentbancorp.de', null, 72);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (73, to_date('05-06-1973', 'dd-mm-yyyy'), null, 'angelina.rucker@trusecure.it', null, 73);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (74, to_date('26-05-1987', 'dd-mm-yyyy'), null, 'adriend@alternativetechnology.', null, 74);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (75, to_date('24-09-1985', 'dd-mm-yyyy'), null, 'lucy.dean@ppr.com', null, 75);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (76, to_date('10-05-1970', 'dd-mm-yyyy'), null, 'terrence.duncan@qssgroup.com', null, 76);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (77, to_date('06-05-1987', 'dd-mm-yyyy'), null, 'jarvis.hatfield@tastefullysimp', null, 77);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (78, to_date('06-10-1991', 'dd-mm-yyyy'), null, 'freddy.macpherson@bat.nl', null, 78);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (79, to_date('14-09-1989', 'dd-mm-yyyy'), null, 'tisaak@mavericktechnologies.pl', null, 79);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (80, to_date('12-09-1982', 'dd-mm-yyyy'), null, 'gilbert.brolin@wyeth.ch', null, 80);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (81, to_date('13-01-1987', 'dd-mm-yyyy'), null, 'val.hector@pfizer.de', null, 81);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (82, to_date('30-11-1992', 'dd-mm-yyyy'), null, 'nicholash@vesta.de', null, 82);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (83, to_date('04-06-1977', 'dd-mm-yyyy'), null, 'chi.mcgowan@ezecastlesoftware.', null, 83);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (84, to_date('11-08-2002', 'dd-mm-yyyy'), null, 'luis.sevigny@oss.com', null, 84);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (85, to_date('16-06-1986', 'dd-mm-yyyy'), null, 'tyronek@hiltonhotels.com', null, 85);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (86, to_date('20-06-1970', 'dd-mm-yyyy'), null, 'kurtwood.sample@myricom.de', null, 86);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (87, to_date('05-03-1974', 'dd-mm-yyyy'), null, 'jakez@gillani.de', null, 87);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (88, to_date('11-07-1993', 'dd-mm-yyyy'), null, 'antoniob@extremepizza.com', null, 88);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (89, to_date('26-04-1983', 'dd-mm-yyyy'), null, 'sona.tripplehorn@sfb.com', null, 89);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (90, to_date('15-10-1984', 'dd-mm-yyyy'), null, 'austin.klein@shufflemaster.uk', null, 90);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (91, to_date('06-06-1983', 'dd-mm-yyyy'), null, 'k.danger@dancor.com', null, 91);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (92, to_date('24-03-1995', 'dd-mm-yyyy'), null, 'jackie@generalelectric.com', null, 92);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (93, to_date('21-04-1978', 'dd-mm-yyyy'), null, 'gcrow@tarragonrealty.be', null, 93);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (94, to_date('10-01-1995', 'dd-mm-yyyy'), null, 'thora.richards@printingforless', null, 94);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (95, to_date('17-03-1984', 'dd-mm-yyyy'), null, 'cate.masur@viacom.com', null, 95);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (96, to_date('28-01-1978', 'dd-mm-yyyy'), null, 'levar.calle@terrafirma.com', null, 96);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (97, to_date('27-11-1987', 'dd-mm-yyyy'), null, 'guy.c@whitewave.com', null, 97);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (98, to_date('21-08-1983', 'dd-mm-yyyy'), null, 'arturo.shand@processplus.de', null, 98);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (99, to_date('29-03-1996', 'dd-mm-yyyy'), null, 'lshort@scripnet.fr', null, 99);
commit;
prompt 100 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (100, to_date('17-08-1994', 'dd-mm-yyyy'), null, 'hope.schwarzenegger@trekequipm', null, 100);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (101, to_date('30-12-1999', 'dd-mm-yyyy'), null, 'nelly@pacificdatadesigns.jp', null, 101);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (102, to_date('28-01-1993', 'dd-mm-yyyy'), null, 'geraldine.quinlan@cws.se', null, 102);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (103, to_date('21-08-1976', 'dd-mm-yyyy'), null, 'lesley.marsden@hfg.il', null, 103);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (104, to_date('14-10-1990', 'dd-mm-yyyy'), null, 'harvey.g@bioreference.com', null, 104);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (105, to_date('03-07-1983', 'dd-mm-yyyy'), null, 'kelly.chestnut@authoria.ch', null, 105);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (106, to_date('16-01-1996', 'dd-mm-yyyy'), null, 'a.belles@nbs.dk', null, 106);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (107, to_date('29-06-1976', 'dd-mm-yyyy'), null, 'natasha@prosperitybancshares.p', null, 107);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (108, to_date('22-04-1983', 'dd-mm-yyyy'), null, 'taye.nelson@nexxtworks.com', null, 108);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (109, to_date('11-04-1981', 'dd-mm-yyyy'), null, 'suzanney@deutschetelekom.com', null, 109);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (110, to_date('01-07-1981', 'dd-mm-yyyy'), null, 'isaiah@ungertechnologies.jp', null, 110);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (111, to_date('18-06-1991', 'dd-mm-yyyy'), null, 'martha.pantoliano@ctg.com', null, 111);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (112, to_date('15-04-1991', 'dd-mm-yyyy'), null, 'davidg@columbiabancorp.il', null, 112);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (113, to_date('25-04-1970', 'dd-mm-yyyy'), null, 'andrea@magnet.dk', null, 113);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (114, to_date('05-04-1995', 'dd-mm-yyyy'), null, 'janeane.steagall@pharmacia.com', null, 114);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (115, to_date('29-01-1982', 'dd-mm-yyyy'), null, 'g.nivola@talx.com', null, 115);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (116, to_date('26-12-1997', 'dd-mm-yyyy'), null, 'hilton.m@royalgold.hk', null, 116);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (117, to_date('27-09-1980', 'dd-mm-yyyy'), null, 'h.branch@naturescure.br', null, 117);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (119, to_date('23-05-1979', 'dd-mm-yyyy'), null, 'esnider@monarchcasino.tw', null, 119);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (120, to_date('26-04-1975', 'dd-mm-yyyy'), null, 'cloris@trc.com', null, 120);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (121, to_date('22-10-1986', 'dd-mm-yyyy'), null, 'pat.robards@shirtfactory.au', null, 121);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (122, to_date('15-06-1998', 'dd-mm-yyyy'), null, 'brent.vega@onstaff.de', null, 122);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (123, to_date('14-05-1997', 'dd-mm-yyyy'), null, 'vondie@tarragonrealty.dk', null, 123);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (125, to_date('29-01-1975', 'dd-mm-yyyy'), null, 'seann.holeman@dataprise.ar', null, 125);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (126, to_date('18-08-1999', 'dd-mm-yyyy'), null, 'n.nicholas@talx.fr', null, 126);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (127, to_date('18-10-1971', 'dd-mm-yyyy'), null, 'bret.harris@tps.de', null, 127);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (128, to_date('30-04-1991', 'dd-mm-yyyy'), null, 'ike.gleeson@pioneermortgage.co', null, 128);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (129, to_date('11-01-2001', 'dd-mm-yyyy'), null, 'catherine.shatner@data.br', null, 129);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (132, to_date('26-06-1984', 'dd-mm-yyyy'), null, 'vienna.hiatt@pscinfogroup.uk', null, 132);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (133, to_date('25-12-1981', 'dd-mm-yyyy'), null, 'dgarner@allegiantbancorp.it', null, 133);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (134, to_date('03-05-1996', 'dd-mm-yyyy'), null, 'levar@bioreference.com', null, 134);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (135, to_date('17-08-1970', 'dd-mm-yyyy'), null, 'j.popper@nissanmotor.it', null, 135);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (136, to_date('14-07-2000', 'dd-mm-yyyy'), null, 'harris.damon@simplycertificate', null, 136);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (137, to_date('06-02-1986', 'dd-mm-yyyy'), null, 'swoosie.whitford@nbs.es', null, 137);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (138, to_date('01-12-1983', 'dd-mm-yyyy'), null, 'lloyd@gltg.br', null, 138);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (139, to_date('22-01-1983', 'dd-mm-yyyy'), null, 'chant.coltrane@newmedia.de', null, 139);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (140, to_date('24-09-1997', 'dd-mm-yyyy'), null, 'ossie.sweeney@sis.si', null, 140);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (143, to_date('15-12-1981', 'dd-mm-yyyy'), null, 'hilton.child@floorgraphics.pl', null, 143);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (144, to_date('18-08-1983', 'dd-mm-yyyy'), null, 'radei@cowlitzbancorp.uk', null, 144);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (145, to_date('11-03-1977', 'dd-mm-yyyy'), null, 'kenny@reckittbenckiser.it', null, 145);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (146, to_date('03-07-1995', 'dd-mm-yyyy'), null, 'guy@webgroup.jp', null, 146);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (147, to_date('11-05-1990', 'dd-mm-yyyy'), null, 'd.heston@magnet.com', null, 147);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (148, to_date('15-01-1989', 'dd-mm-yyyy'), null, 'angelina.lorenz@stm.it', null, 148);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (149, to_date('15-08-1996', 'dd-mm-yyyy'), null, 'kurt.dourif@nexxtworks.de', null, 149);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (150, to_date('05-08-1993', 'dd-mm-yyyy'), null, 'avril.applegate@prometheuslabo', null, 150);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (153, to_date('28-03-1979', 'dd-mm-yyyy'), null, 'kwahlberg@profitline.ar', null, 153);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (154, to_date('02-10-1990', 'dd-mm-yyyy'), null, 'carrieanne@quakercitybancorp.c', null, 154);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (155, to_date('09-07-1990', 'dd-mm-yyyy'), null, 'first.smith@ufs.com', null, 155);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (156, to_date('21-03-1972', 'dd-mm-yyyy'), null, 'sean.k@teoco.com', null, 156);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (157, to_date('06-11-1989', 'dd-mm-yyyy'), null, 'kenneth.c@ntas.is', null, 157);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (158, to_date('07-06-1978', 'dd-mm-yyyy'), null, 'devon@cooktek.com', null, 158);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (159, to_date('04-04-1979', 'dd-mm-yyyy'), null, 'n.napolitano@progressivedesign', null, 159);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (160, to_date('05-09-1981', 'dd-mm-yyyy'), null, 'rebecca@nmr.fr', null, 160);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (162, to_date('20-06-2001', 'dd-mm-yyyy'), null, 'rosario.curry@pinnaclestaffing', null, 162);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (163, to_date('14-10-1997', 'dd-mm-yyyy'), null, 'jdavies@tilsonlandscape.com', null, 163);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (164, to_date('04-04-1993', 'dd-mm-yyyy'), null, 'lorrainei@spinnakerexploration', null, 164);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (165, to_date('25-12-1974', 'dd-mm-yyyy'), null, 'kasey.arjona@johnson.com', null, 165);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (166, to_date('01-02-1992', 'dd-mm-yyyy'), null, 'rik@sci.be', null, 166);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (168, to_date('30-05-1986', 'dd-mm-yyyy'), null, 'julioe@infovision.jp', null, 168);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (169, to_date('27-04-1976', 'dd-mm-yyyy'), null, 'kylie.carnes@qls.uk', null, 169);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (170, to_date('19-02-1995', 'dd-mm-yyyy'), null, 'casey@pharmacia.ca', null, 170);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (171, to_date('11-11-1992', 'dd-mm-yyyy'), null, 'mira.goldblum@gra.ca', null, 171);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (172, to_date('13-09-1992', 'dd-mm-yyyy'), null, 'vince.b@kis.com', null, 172);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (175, to_date('09-12-1988', 'dd-mm-yyyy'), null, 'jody.tucker@kingland.za', null, 175);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (176, to_date('30-12-1993', 'dd-mm-yyyy'), null, 'rupertw@accuship.fi', null, 176);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (177, to_date('07-02-1991', 'dd-mm-yyyy'), null, 'elizabeth.everett@visionarysys', null, 177);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (178, to_date('13-11-1984', 'dd-mm-yyyy'), null, 'ramsey.shepard@oss.de', null, 178);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (179, to_date('07-12-1984', 'dd-mm-yyyy'), null, 'emma.brody@onstaff.ch', null, 179);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (180, to_date('12-09-2001', 'dd-mm-yyyy'), null, 'matt.snider@prosum.au', null, 180);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (181, to_date('15-05-1990', 'dd-mm-yyyy'), null, 'stephanie.willis@prosperityban', null, 181);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (184, to_date('31-05-1977', 'dd-mm-yyyy'), null, 'jay.sanders@entelligence.it', null, 184);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (185, to_date('14-11-1999', 'dd-mm-yyyy'), null, 'mel.avalon@meghasystems.de', null, 185);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (186, to_date('23-08-1982', 'dd-mm-yyyy'), null, 'tea.kinnear@mwh.hu', null, 186);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (187, to_date('13-09-1986', 'dd-mm-yyyy'), null, 'harrison.dawson@gci.fr', null, 187);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (188, to_date('29-10-2001', 'dd-mm-yyyy'), null, 'tommy@gagwear.de', null, 188);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (189, to_date('01-12-1971', 'dd-mm-yyyy'), null, 'a.holliday@americanvanguard.ch', null, 189);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (190, to_date('18-11-1979', 'dd-mm-yyyy'), null, 'd.wilson@chipssolutions.jp', null, 190);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (191, to_date('12-05-1979', 'dd-mm-yyyy'), null, 'mia@diageo.fr', null, 191);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (192, to_date('26-05-1988', 'dd-mm-yyyy'), null, 'joely.k@execuscribe.com', null, 192);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (193, to_date('13-07-1982', 'dd-mm-yyyy'), null, 'e.pacino@emt.in', null, 193);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (194, to_date('28-12-1977', 'dd-mm-yyyy'), null, 'christinek@grayhawksystems.fi', null, 194);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (195, to_date('18-02-1988', 'dd-mm-yyyy'), null, 'tcheky.hauser@cooktek.com', null, 195);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (196, to_date('11-12-1986', 'dd-mm-yyyy'), null, 'james.warren@kitba.pk', null, 196);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (197, to_date('11-11-1984', 'dd-mm-yyyy'), null, 'mfiennes@acsis.com', null, 197);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (198, to_date('01-12-2000', 'dd-mm-yyyy'), null, 'lynn.silverman@bmm.ch', null, 198);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (199, to_date('13-01-2000', 'dd-mm-yyyy'), null, 'holly@valleyoaksystems.de', null, 199);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (200, to_date('06-07-1983', 'dd-mm-yyyy'), null, 'jimmy.bridges@maverick.is', null, 200);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (201, to_date('13-10-1987', 'dd-mm-yyyy'), null, 'benjaminc@pscinfogroup.com', null, 201);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (202, to_date('13-05-1980', 'dd-mm-yyyy'), null, 'crispin.cooper@spd.au', null, 202);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (203, to_date('20-11-1978', 'dd-mm-yyyy'), null, 'm.curry@vesta.de', null, 203);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (204, to_date('30-12-1990', 'dd-mm-yyyy'), null, 'drenfro@bedfordbancshares.jp', null, 204);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (205, to_date('30-01-1982', 'dd-mm-yyyy'), null, 'moe@keymark.com', null, 205);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (206, to_date('28-04-2002', 'dd-mm-yyyy'), null, 'andre.wilson@sfmai.com', null, 206);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (207, to_date('06-11-1995', 'dd-mm-yyyy'), null, 'tkahn@noodles.il', null, 207);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (208, to_date('03-05-2000', 'dd-mm-yyyy'), null, 'salh@epamsystems.uk', null, 208);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (209, to_date('07-10-1972', 'dd-mm-yyyy'), null, 'joely@msdw.dk', null, 209);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (210, to_date('06-08-1972', 'dd-mm-yyyy'), null, 'gordie.b@globalwireless.com', null, 210);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (211, to_date('23-01-1971', 'dd-mm-yyyy'), null, 'janice.platt@ungertechnologies', null, 211);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (212, to_date('12-05-1977', 'dd-mm-yyyy'), null, 'jimmy.kinnear@marriottinternat', null, 212);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (213, to_date('10-08-1993', 'dd-mm-yyyy'), null, 'jodie.willard@hudsonriverbanco', null, 213);
commit;
prompt 200 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (214, to_date('08-06-2002', 'dd-mm-yyyy'), null, 'temueras@manhattanassociates.p', null, 214);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (215, to_date('02-02-1989', 'dd-mm-yyyy'), null, 'melba.spiner@mms.com', null, 215);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (216, to_date('03-03-2002', 'dd-mm-yyyy'), null, 'steven.woodward@noodles.za', null, 216);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (217, to_date('04-04-1981', 'dd-mm-yyyy'), null, 'joshuah@deutschetelekom.hk', null, 217);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (218, to_date('18-08-1981', 'dd-mm-yyyy'), null, 'chad.frakes@spenser.com', null, 218);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (219, to_date('25-03-1992', 'dd-mm-yyyy'), null, 'nora.molina@fiberlink.ch', null, 219);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (220, to_date('23-11-1976', 'dd-mm-yyyy'), null, 'karen.m@evergreenresources.it', null, 220);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (221, to_date('17-12-2001', 'dd-mm-yyyy'), null, 'asewell@employerservices.com', null, 221);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (222, to_date('28-04-1998', 'dd-mm-yyyy'), null, 'cmeyer@hfg.at', null, 222);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (223, to_date('16-12-1971', 'dd-mm-yyyy'), null, 'kay.flanagan@gra.de', null, 223);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (224, to_date('05-11-1988', 'dd-mm-yyyy'), null, 'o.cochran@tilsonlandscape.de', null, 224);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (225, to_date('09-04-1970', 'dd-mm-yyyy'), null, 'n.page@infopros.com', null, 225);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (226, to_date('20-02-1978', 'dd-mm-yyyy'), null, 'chudson@atlanticnet.br', null, 226);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (227, to_date('16-10-1976', 'dd-mm-yyyy'), null, 'nicky.rizzo@anheuserbusch.com', null, 227);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (228, to_date('28-03-1979', 'dd-mm-yyyy'), null, 'marty.smurfit@sensortechnologi', null, 228);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (229, to_date('27-05-1989', 'dd-mm-yyyy'), null, 'gabrielle@technica.de', null, 229);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (230, to_date('12-02-1986', 'dd-mm-yyyy'), null, 'ed.speaks@prosum.com', null, 230);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (231, to_date('26-08-1974', 'dd-mm-yyyy'), null, 'tlevert@meritagetechnologies.c', null, 231);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (232, to_date('12-01-1976', 'dd-mm-yyyy'), null, 'claire@waltdisney.com', null, 232);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (233, to_date('25-03-1995', 'dd-mm-yyyy'), null, 'scarradine@airmethods.com', null, 233);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (234, to_date('25-10-1993', 'dd-mm-yyyy'), null, 'marcd@johnson.com', null, 234);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (235, to_date('03-11-1989', 'dd-mm-yyyy'), null, 'eliza.miller@dbprofessionals.h', null, 235);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (236, to_date('12-06-2002', 'dd-mm-yyyy'), null, 'victor.b@americanland.de', null, 236);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (237, to_date('25-08-1984', 'dd-mm-yyyy'), null, 'andy.norton@sunstream.jp', null, 237);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (238, to_date('05-03-1986', 'dd-mm-yyyy'), null, 'ian@webgroup.com', null, 238);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (239, to_date('23-11-1974', 'dd-mm-yyyy'), null, 'wtarantino@tmaresources.de', null, 239);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (240, to_date('19-08-2002', 'dd-mm-yyyy'), null, 'wesley.owen@stm.br', null, 240);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (241, to_date('28-03-1985', 'dd-mm-yyyy'), null, 'shelbyv@flavorx.com', null, 241);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (242, to_date('05-10-1987', 'dd-mm-yyyy'), null, 'lreiner@gtp.com', null, 242);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (243, to_date('02-05-1976', 'dd-mm-yyyy'), null, 'murray.hatchet@3tsystems.jp', null, 243);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (244, to_date('10-07-1995', 'dd-mm-yyyy'), null, 'kazem.vega@ads.uk', null, 244);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (245, to_date('18-06-1979', 'dd-mm-yyyy'), null, 'ike.hartnett@vesta.au', null, 245);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (246, to_date('12-06-1998', 'dd-mm-yyyy'), null, 'danielp@generalelectric.ca', null, 246);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (247, to_date('19-09-1987', 'dd-mm-yyyy'), null, 'christopher.horizon@ezecastles', null, 247);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (248, to_date('13-10-1993', 'dd-mm-yyyy'), null, 'patrickb@americanexpress.com', null, 248);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (249, to_date('14-08-1989', 'dd-mm-yyyy'), null, 'jonny.sepulveda@mattel.uk', null, 249);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (250, to_date('04-07-1977', 'dd-mm-yyyy'), null, 'collective.i@campbellsoup.com', null, 250);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (251, to_date('02-11-1993', 'dd-mm-yyyy'), null, 'jackie.moss@mathis.in', null, 251);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (252, to_date('20-12-1983', 'dd-mm-yyyy'), null, 'rascals@maverick.com', null, 252);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (253, to_date('20-05-1996', 'dd-mm-yyyy'), null, 'k.rickman@fetchlogistics.com', null, 253);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (254, to_date('26-12-2001', 'dd-mm-yyyy'), null, 'lenny.krieger@bigdoughcom.com', null, 254);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (255, to_date('09-05-2002', 'dd-mm-yyyy'), null, 'richier@ach.com', null, 255);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (256, to_date('18-01-1988', 'dd-mm-yyyy'), null, 'crystalo@powerlight.com', null, 256);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (257, to_date('01-07-1988', 'dd-mm-yyyy'), null, 'campbell@democracydata.au', null, 257);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (258, to_date('04-09-1985', 'dd-mm-yyyy'), null, 'tom.holeman@atlanticnet.ch', null, 258);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (259, to_date('25-03-2000', 'dd-mm-yyyy'), null, 'r.chappelle@zoneperfectnutriti', null, 259);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (260, to_date('25-06-2001', 'dd-mm-yyyy'), null, 'patrick.carrey@marketfirst.com', null, 260);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (261, to_date('02-08-1985', 'dd-mm-yyyy'), null, 'vickie.elizabeth@typhoon.com', null, 261);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (262, to_date('29-06-2000', 'dd-mm-yyyy'), null, 'edgar.cummings@sfmai.de', null, 262);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (263, to_date('06-07-1973', 'dd-mm-yyyy'), null, 'danni.stuart@cendant.in', null, 263);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (264, to_date('28-12-1997', 'dd-mm-yyyy'), null, 'cheech.kahn@newviewgifts.br', null, 264);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (265, to_date('30-05-1996', 'dd-mm-yyyy'), null, 'judy.p@asapstaffing.com', null, 265);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (266, to_date('24-11-1990', 'dd-mm-yyyy'), null, 'naomi.crystal@gci.ca', null, 266);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (267, to_date('14-12-1976', 'dd-mm-yyyy'), null, 'lesleyd@capitalbank.pl', null, 267);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (268, to_date('28-05-1975', 'dd-mm-yyyy'), null, 'jolin@sunstream.com', null, 268);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (269, to_date('02-10-1985', 'dd-mm-yyyy'), null, 'al51@bps.com', null, 269);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (270, to_date('25-12-1993', 'dd-mm-yyyy'), null, 'etta@mitsubishimotors.com', null, 270);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (271, to_date('11-12-2001', 'dd-mm-yyyy'), null, 'f.steenburgen@parker.com', null, 271);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (272, to_date('28-06-1996', 'dd-mm-yyyy'), null, 'cledus@msdw.it', null, 272);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (273, to_date('22-05-1999', 'dd-mm-yyyy'), null, 'lara.p@integramedamerica.com', null, 273);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (274, to_date('24-07-1998', 'dd-mm-yyyy'), null, 'aida.studi@priorityexpress.com', null, 274);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (275, to_date('31-05-2002', 'dd-mm-yyyy'), null, 'kenny.s@anheuserbusch.com', null, 275);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (276, to_date('26-07-1978', 'dd-mm-yyyy'), null, 'ossie.lovitz@infinity.de', null, 276);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (277, to_date('29-11-1993', 'dd-mm-yyyy'), null, 'susang@coridiantechnologies.br', null, 277);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (278, to_date('01-09-1989', 'dd-mm-yyyy'), null, 'radney.g@efcbancorp.br', null, 278);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (279, to_date('10-10-1979', 'dd-mm-yyyy'), null, 'drew@sony.is', null, 279);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (280, to_date('19-11-1989', 'dd-mm-yyyy'), null, 'famke.stigers@evinco.com', null, 280);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (281, to_date('22-08-1985', 'dd-mm-yyyy'), null, 'drhysdavies@tarragonrealty.jp', null, 281);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (282, to_date('16-08-2000', 'dd-mm-yyyy'), null, 'kelli@pra.dk', null, 282);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (283, to_date('15-03-1993', 'dd-mm-yyyy'), null, 'tamala.balin@dvdt.com', null, 283);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (284, to_date('07-12-1982', 'dd-mm-yyyy'), null, 'charlize.jeter@fetchlogistics.', null, 284);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (285, to_date('01-04-1985', 'dd-mm-yyyy'), null, 'tilda.d@vesta.nz', null, 285);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (286, to_date('23-02-1974', 'dd-mm-yyyy'), null, 'warren.sledge@socketinternet.c', null, 286);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (287, to_date('28-01-1994', 'dd-mm-yyyy'), null, 'hilary.hurley@telecheminternat', null, 287);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (288, to_date('15-11-1980', 'dd-mm-yyyy'), null, 'aavital@priorityexpress.ca', null, 288);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (289, to_date('21-08-1976', 'dd-mm-yyyy'), null, 'jonathan.waite@tastefullysimpl', null, 289);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (290, to_date('20-03-1987', 'dd-mm-yyyy'), null, 'larry@mms.fr', null, 290);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (291, to_date('27-01-2001', 'dd-mm-yyyy'), null, 'bhopkins@kellogg.com', null, 291);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (292, to_date('26-03-2000', 'dd-mm-yyyy'), null, 'yolanda.berry@educationaldevel', null, 292);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (293, to_date('25-10-1983', 'dd-mm-yyyy'), null, 'lara.zane@capitolbancorp.au', null, 293);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (294, to_date('28-05-1978', 'dd-mm-yyyy'), null, 'carl.tomlin@vfs.au', null, 294);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (295, to_date('08-10-1997', 'dd-mm-yyyy'), null, 'dean.w@usainstruments.com', null, 295);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (296, to_date('17-10-1978', 'dd-mm-yyyy'), null, 'beniciok@efcbancorp.br', null, 296);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (297, to_date('21-10-1975', 'dd-mm-yyyy'), null, 'sarah.kirkwood@marketbased.com', null, 297);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (298, to_date('14-04-1983', 'dd-mm-yyyy'), null, 'ned.downie@glmt.jp', null, 298);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (299, to_date('02-12-2000', 'dd-mm-yyyy'), null, 'timothym@verizon.com', null, 299);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (300, to_date('19-03-1995', 'dd-mm-yyyy'), null, 'stevie@kiamotors.ca', null, 300);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (302, to_date('22-10-1986', 'dd-mm-yyyy'), null, 'rosanna@career.com', null, 302);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (303, to_date('02-06-1987', 'dd-mm-yyyy'), null, 'g.schneider@trm.com', null, 303);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (304, to_date('24-02-1986', 'dd-mm-yyyy'), null, 'stockard.v@prahs.jp', null, 304);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (305, to_date('19-03-1973', 'dd-mm-yyyy'), null, 'toshiro.sossamon@officedepot.c', null, 305);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (306, to_date('24-05-1993', 'dd-mm-yyyy'), null, 'eric.gore@seafoxboat.za', null, 306);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (308, to_date('10-06-1987', 'dd-mm-yyyy'), null, 'allison.coverdale@inzone.au', null, 308);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (309, to_date('18-10-1988', 'dd-mm-yyyy'), null, 'dvanderbeek@glacierbancorp.jp', null, 309);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (310, to_date('09-04-1979', 'dd-mm-yyyy'), null, 'karen.gandolfini@saralee.fr', null, 310);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (311, to_date('28-01-1975', 'dd-mm-yyyy'), null, 'janeane.webb@credopetroleum.de', null, 311);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (312, to_date('15-04-1971', 'dd-mm-yyyy'), null, 'powers.kingsley@kroger.com', null, 312);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (314, to_date('30-07-1990', 'dd-mm-yyyy'), null, 'denzel.s@nhr.com', null, 314);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (315, to_date('23-07-1981', 'dd-mm-yyyy'), null, 'd.carter@telepoint.com', null, 315);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (316, to_date('31-10-2000', 'dd-mm-yyyy'), null, 'n.andrews@tilsonlandscape.uk', null, 316);
commit;
prompt 300 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (317, to_date('15-10-1971', 'dd-mm-yyyy'), null, 'lin@avs.uk', null, 317);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (318, to_date('01-08-1997', 'dd-mm-yyyy'), null, 'r.northam@monarchcasino.de', null, 318);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (320, to_date('12-03-1970', 'dd-mm-yyyy'), null, 'r.rio@airmethods.at', null, 320);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (321, to_date('05-04-1975', 'dd-mm-yyyy'), null, 'seann.mahood@canterburypark.ca', null, 321);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (322, to_date('04-03-1975', 'dd-mm-yyyy'), null, 'yaphet.rhodes@swp.au', null, 322);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (323, to_date('12-10-1972', 'dd-mm-yyyy'), null, 'marley.s@monitronicsinternatio', null, 323);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (324, to_date('26-07-1999', 'dd-mm-yyyy'), null, 'uma.sutherland@calence.nl', null, 324);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (327, to_date('05-06-1972', 'dd-mm-yyyy'), null, 'king.cronin@callhenry.com', null, 327);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (328, to_date('02-05-1972', 'dd-mm-yyyy'), null, 'jeremy.shelton@newhorizons.at', null, 328);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (329, to_date('28-12-1978', 'dd-mm-yyyy'), null, 'brad.robbins@elitemedical.com', null, 329);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (330, to_date('23-06-2000', 'dd-mm-yyyy'), null, 'paula.winwood@shufflemaster.co', null, 330);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (331, to_date('03-12-1970', 'dd-mm-yyyy'), null, 'kasey.cetera@apexsystems.se', null, 331);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (332, to_date('17-08-1980', 'dd-mm-yyyy'), null, 'catel@kmart.de', null, 332);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (333, to_date('14-08-1973', 'dd-mm-yyyy'), null, 'josh.koyana@dvdt.br', null, 333);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (334, to_date('09-03-1997', 'dd-mm-yyyy'), null, 'marley.chapman@ataservices.uk', null, 334);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (337, to_date('01-03-1991', 'dd-mm-yyyy'), null, 'nelly.english@signalperfection', null, 337);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (338, to_date('18-11-1982', 'dd-mm-yyyy'), null, 'allison.hanley@voicelog.fr', null, 338);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (339, to_date('14-05-2000', 'dd-mm-yyyy'), null, 'vanessa@enterprise.com', null, 339);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (340, to_date('12-03-1971', 'dd-mm-yyyy'), null, 'neve.noseworthy@lynksystems.co', null, 340);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (341, to_date('31-05-1983', 'dd-mm-yyyy'), null, 'dennisc@floorgraphics.com', null, 341);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (342, to_date('24-02-1999', 'dd-mm-yyyy'), null, 'halle.gibbons@astafunding.pe', null, 342);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (343, to_date('26-02-1982', 'dd-mm-yyyy'), null, 'tea.gallant@canterburypark.de', null, 343);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (344, to_date('29-01-1990', 'dd-mm-yyyy'), null, 'mike.burrows@astafunding.com', null, 344);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (347, to_date('18-03-1998', 'dd-mm-yyyy'), null, 'laurie.conlee@mms.ca', null, 347);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (348, to_date('06-08-1985', 'dd-mm-yyyy'), null, 'jhanks@waltdisney.com', null, 348);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (349, to_date('18-02-1973', 'dd-mm-yyyy'), null, 'marley.d@manhattanassociates.a', null, 349);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (350, to_date('04-12-1970', 'dd-mm-yyyy'), null, 'lydia.suvari@vertexsolutions.d', null, 350);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (351, to_date('26-12-1978', 'dd-mm-yyyy'), null, 'vgryner@aristotle.au', null, 351);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (352, to_date('21-01-1981', 'dd-mm-yyyy'), null, 'jimmy.pollack@mainstreetbanks.', null, 352);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (354, to_date('05-11-1970', 'dd-mm-yyyy'), null, 'emilio.ruiz@kramontrealty.com', null, 354);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (355, to_date('03-12-1991', 'dd-mm-yyyy'), null, 'lari.rhodes@wellsfinancial.br', null, 355);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (356, to_date('06-02-1989', 'dd-mm-yyyy'), null, 'l.bloch@infovision.com', null, 356);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (357, to_date('23-10-1980', 'dd-mm-yyyy'), null, 'bonnie@pioneerdatasystems.uk', null, 357);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (358, to_date('03-11-1989', 'dd-mm-yyyy'), null, 'hookah.l@stiknowledge.ec', null, 358);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (361, to_date('07-01-1991', 'dd-mm-yyyy'), null, 'molly.singletary@esoftsolution', null, 361);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (362, to_date('14-06-1993', 'dd-mm-yyyy'), null, 'percy.snipes@cardtronics.ca', null, 362);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (363, to_date('24-01-1998', 'dd-mm-yyyy'), null, 'dwight.neil@aoe.jp', null, 363);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (364, to_date('31-05-1992', 'dd-mm-yyyy'), null, 'lydia.coughlan@electricalsolut', null, 364);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (365, to_date('08-08-1973', 'dd-mm-yyyy'), null, 'rosco.myers@mse.com', null, 365);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (366, to_date('02-04-1978', 'dd-mm-yyyy'), null, 'manu.griggs@microsoft.com', null, 366);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (367, to_date('18-02-1990', 'dd-mm-yyyy'), null, 'percyr@safeway.com', null, 367);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (368, to_date('03-10-1971', 'dd-mm-yyyy'), null, 'dsweeney@sourcegear.fr', null, 368);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (369, to_date('09-08-1970', 'dd-mm-yyyy'), null, 'noah.holeman@telesynthesis.au', null, 369);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (370, to_date('27-01-1979', 'dd-mm-yyyy'), null, 'alfie.mahoney@sfgo.de', null, 370);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (371, to_date('09-01-2002', 'dd-mm-yyyy'), null, 'phoebe.secada@mathis.com', null, 371);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (372, to_date('12-03-1985', 'dd-mm-yyyy'), null, 'rutgere@eagleone.com', null, 372);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (373, to_date('16-11-1993', 'dd-mm-yyyy'), null, 'armin.s@educationaldevelopment', null, 373);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (374, to_date('29-02-1988', 'dd-mm-yyyy'), null, 'amanda.wood@homedepot.com', null, 374);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (375, to_date('09-04-1990', 'dd-mm-yyyy'), null, 'stellan.broza@sfgo.com', null, 375);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (376, to_date('12-03-1980', 'dd-mm-yyyy'), null, 'fionnula.g@fmi.com', null, 376);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (377, to_date('10-12-1984', 'dd-mm-yyyy'), null, 'chi.tyson@gagwear.com', null, 377);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (378, to_date('27-12-2000', 'dd-mm-yyyy'), null, 'dbassett@usenergyservices.com', null, 378);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (379, to_date('22-04-1982', 'dd-mm-yyyy'), null, 'dermot.mclean@pharmafab.com', null, 379);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (380, to_date('30-08-1972', 'dd-mm-yyyy'), null, 'c.nielsen@prosperitybancshares', null, 380);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (381, to_date('12-10-1997', 'dd-mm-yyyy'), null, 'robby.monk@microsoft.de', null, 381);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (382, to_date('29-05-1981', 'dd-mm-yyyy'), null, 'anjelica.mandrell@cooktek.au', null, 382);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (383, to_date('22-05-1983', 'dd-mm-yyyy'), null, 'talvin.jackson@bluffcitysteel.', null, 383);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (384, to_date('09-06-1997', 'dd-mm-yyyy'), null, 'bsevigny@kis.be', null, 384);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (385, to_date('27-04-2001', 'dd-mm-yyyy'), null, 'sissy.springfield@employerserv', null, 385);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (386, to_date('02-11-1992', 'dd-mm-yyyy'), null, 'carlos.ledger@teoco.com', null, 386);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (387, to_date('22-09-1999', 'dd-mm-yyyy'), null, 'alexc@viacom.com', null, 387);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (388, to_date('04-06-1984', 'dd-mm-yyyy'), null, 'stellan.devito@technica.com', null, 388);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (389, to_date('04-03-1984', 'dd-mm-yyyy'), null, 'molly.quinlan@commworks.de', null, 389);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (390, to_date('27-08-1991', 'dd-mm-yyyy'), null, 'matthew.w@onesourceprinting.jp', null, 390);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (391, to_date('17-01-2001', 'dd-mm-yyyy'), null, 'adrien.wine@gillani.com', null, 391);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (392, to_date('30-04-1979', 'dd-mm-yyyy'), null, 'ali.firth@staffone.lt', null, 392);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (393, to_date('23-06-1973', 'dd-mm-yyyy'), null, 'j.hector@mse.ch', null, 393);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (394, to_date('31-07-1995', 'dd-mm-yyyy'), null, 'quentin.clark@kingston.es', null, 394);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (395, to_date('08-08-1993', 'dd-mm-yyyy'), null, 'karen.overstreet@pharmacia.es', null, 395);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (396, to_date('04-01-1987', 'dd-mm-yyyy'), null, 'robby.richter@totalentertainme', null, 396);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (397, to_date('18-07-1974', 'dd-mm-yyyy'), null, 'maura.schock@operationaltechno', null, 397);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (398, to_date('15-04-2002', 'dd-mm-yyyy'), null, 'lois.k@scooterstore.com', null, 398);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (399, to_date('31-10-1991', 'dd-mm-yyyy'), null, 'claude.eastwood@peerlessmanufa', null, 399);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (400, to_date('16-07-1975', 'dd-mm-yyyy'), null, 'sinead.h@ntas.com', null, 400);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (401, to_date('05-11-1988', 'dd-mm-yyyy'), null, 'allison@mwh.com', null, 401);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (402, to_date('18-05-1997', 'dd-mm-yyyy'), null, 'jose.phifer@commworks.com', null, 402);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (403, to_date('15-10-2000', 'dd-mm-yyyy'), null, 'eileen.macpherson@usainstrumen', null, 403);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (404, to_date('03-01-1997', 'dd-mm-yyyy'), null, 'gino@capellaeducation.com', null, 404);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (405, to_date('30-01-1989', 'dd-mm-yyyy'), null, 'billy.ticotin@pinnaclestaffing', null, 405);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (406, to_date('02-04-1999', 'dd-mm-yyyy'), null, 'busta@dis.com', null, 406);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (407, to_date('01-04-1991', 'dd-mm-yyyy'), null, 'sona.pleasure@ceo.fr', null, 407);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (408, to_date('16-07-1970', 'dd-mm-yyyy'), null, 'ginog@mindworks.com', null, 408);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (409, to_date('30-10-2001', 'dd-mm-yyyy'), null, 'judd.lucas@vitacostcom.com', null, 409);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (410, to_date('16-05-1971', 'dd-mm-yyyy'), null, 'warren.barry@surmodics.jp', null, 410);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (411, to_date('05-10-1991', 'dd-mm-yyyy'), null, 'vendettat@pra.jp', null, 411);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (412, to_date('26-09-1975', 'dd-mm-yyyy'), null, 'mjeffreys@ait.de', null, 412);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (413, to_date('31-03-2001', 'dd-mm-yyyy'), null, 'cpeniston@aoe.nl', null, 413);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (414, to_date('12-11-2001', 'dd-mm-yyyy'), null, 'richardb@bioreference.com', null, 414);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (415, to_date('12-10-1976', 'dd-mm-yyyy'), null, 'asisto@biosite.ca', null, 415);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (416, to_date('25-06-1989', 'dd-mm-yyyy'), null, 'moe@hatworld.com', null, 416);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (417, to_date('09-06-1983', 'dd-mm-yyyy'), null, 'grahamt@capstone.nl', null, 417);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (418, to_date('08-12-1994', 'dd-mm-yyyy'), null, 'fiona.griffith@volkswagen.com', null, 418);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (419, to_date('26-12-1973', 'dd-mm-yyyy'), null, 'tarav@investmentscorecard.dk', null, 419);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (420, to_date('09-10-1987', 'dd-mm-yyyy'), null, 'oliver.s@mathis.com', null, 420);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (421, to_date('25-11-1999', 'dd-mm-yyyy'), null, 'davis.price@sysconmedia.ch', null, 421);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (422, to_date('29-04-1988', 'dd-mm-yyyy'), null, 'jackson.saucedo@accuship.uk', null, 422);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (423, to_date('28-01-1981', 'dd-mm-yyyy'), null, 'derek.gray@vms.com', null, 423);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (424, to_date('28-01-1974', 'dd-mm-yyyy'), null, 'tom.caine@zoneperfectnutrition', null, 424);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (425, to_date('18-10-1971', 'dd-mm-yyyy'), null, 'ossiep@americanland.com', null, 425);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (426, to_date('09-10-1992', 'dd-mm-yyyy'), null, 'russell.sampson@linersdirect.j', null, 426);
commit;
prompt 400 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (427, to_date('15-03-2002', 'dd-mm-yyyy'), null, 'j.shearer@dancor.uk', null, 427);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (428, to_date('02-06-1998', 'dd-mm-yyyy'), null, 'c.gallant@younginnovations.ca', null, 428);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (429, to_date('06-08-1987', 'dd-mm-yyyy'), null, 'spike.lightfoot@mms.mx', null, 429);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (430, to_date('31-03-1979', 'dd-mm-yyyy'), null, 'dwight.k@securitycheck.in', null, 430);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (431, to_date('23-09-1985', 'dd-mm-yyyy'), null, 's.crowe@cardinalcartridge.de', null, 431);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (432, to_date('08-12-1970', 'dd-mm-yyyy'), null, 'larry.beck@bigdoughcom.com', null, 432);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (433, to_date('06-07-1995', 'dd-mm-yyyy'), null, 'melba.landau@democracydata.za', null, 433);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (434, to_date('28-03-1980', 'dd-mm-yyyy'), null, 'frankie@telesynthesis.com', null, 434);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (435, to_date('01-09-1999', 'dd-mm-yyyy'), null, 'olga.sinise@americanpan.com', null, 435);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (436, to_date('03-01-1984', 'dd-mm-yyyy'), null, 'j.drive@drinkmorewater.uk', null, 436);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (437, to_date('21-10-1977', 'dd-mm-yyyy'), null, 'm.reinhold@maverick.com', null, 437);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (438, to_date('13-10-1971', 'dd-mm-yyyy'), null, 'ralph.vanderbeek@hiltonhotels.', null, 438);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (439, to_date('21-12-1997', 'dd-mm-yyyy'), null, 'ralph@globalwireless.com', null, 439);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (440, to_date('18-04-2000', 'dd-mm-yyyy'), null, 'juliette.diggs@logisticare.uk', null, 440);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (441, to_date('17-03-1994', 'dd-mm-yyyy'), null, 'lindsey.sinise@navigatorsystem', null, 441);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (442, to_date('18-08-1988', 'dd-mm-yyyy'), null, 'jonathan.gilley@hotmail.com', null, 442);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (443, to_date('27-02-1990', 'dd-mm-yyyy'), null, 'bernard.greene@ezecastlesoftwa', null, 443);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (444, to_date('26-07-1982', 'dd-mm-yyyy'), null, 'kasey.worrell@elitemedical.com', null, 444);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (445, to_date('30-08-1990', 'dd-mm-yyyy'), null, 'colleen.ramirez@curagroup.dk', null, 445);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (446, to_date('21-12-1974', 'dd-mm-yyyy'), null, 'oliver.parm@deutschetelekom.de', null, 446);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (447, to_date('21-10-1998', 'dd-mm-yyyy'), null, 'lmacy@ungertechnologies.es', null, 447);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (448, to_date('28-11-1986', 'dd-mm-yyyy'), null, 'hal.cale@dillards.com', null, 448);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (449, to_date('29-08-1987', 'dd-mm-yyyy'), null, 'rade@universalsolutions.com', null, 449);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (450, to_date('02-08-1997', 'dd-mm-yyyy'), null, 'solomon.begley@pra.es', null, 450);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (451, to_date('05-12-1971', 'dd-mm-yyyy'), null, 'j.ripley@topicsentertainment.m', null, 451);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (452, to_date('03-08-1971', 'dd-mm-yyyy'), null, 'rhys.weisberg@at.com', null, 452);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (453, to_date('04-10-1987', 'dd-mm-yyyy'), null, 'brendana@atlanticnet.at', null, 453);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (454, to_date('20-01-1970', 'dd-mm-yyyy'), null, 'andrew.kretschmann@aci.com', null, 454);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (455, to_date('12-08-1979', 'dd-mm-yyyy'), null, 'cevin.h@capitolbancorp.de', null, 455);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (456, to_date('22-08-1990', 'dd-mm-yyyy'), null, 'peter@pearllawgroup.com', null, 456);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (457, to_date('18-04-1987', 'dd-mm-yyyy'), null, 'tom@nbs.com', null, 457);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (458, to_date('19-02-2000', 'dd-mm-yyyy'), null, 'rachid@kiamotors.com', null, 458);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (459, to_date('27-07-1992', 'dd-mm-yyyy'), null, 'benjamin@saksinc.com', null, 459);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (460, to_date('27-10-1973', 'dd-mm-yyyy'), null, 'nharnes@mattel.com', null, 460);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (461, to_date('22-08-1975', 'dd-mm-yyyy'), null, 'deborah.sweeney@merck.au', null, 461);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (462, to_date('14-02-1974', 'dd-mm-yyyy'), null, 'gin.hutton@telwares.de', null, 462);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (463, to_date('21-06-1971', 'dd-mm-yyyy'), null, 'rosanna.m@investorstitle.com', null, 463);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (464, to_date('27-06-1994', 'dd-mm-yyyy'), null, 'mykelti.lennix@streetglow.de', null, 464);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (465, to_date('09-08-1981', 'dd-mm-yyyy'), null, 'frankie.plowright@monarchcasin', null, 465);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (466, to_date('28-07-1988', 'dd-mm-yyyy'), null, 'charlize.dukakis@portosan.com', null, 466);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (467, to_date('27-09-1989', 'dd-mm-yyyy'), null, 'ewan.wahlberg@seafoxboat.com', null, 467);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (468, to_date('12-03-1976', 'dd-mm-yyyy'), null, 'darius.himmelman@nha.mo', null, 468);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (469, to_date('16-10-1970', 'dd-mm-yyyy'), null, 'chloe@surmodics.ch', null, 469);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (470, to_date('25-11-1971', 'dd-mm-yyyy'), null, 'michael.turturro@signature.de', null, 470);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (471, to_date('03-12-1986', 'dd-mm-yyyy'), null, 'meryl@capital.at', null, 471);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (472, to_date('15-10-1974', 'dd-mm-yyyy'), null, 'rosanna.feuerstein@avs.br', null, 472);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (473, to_date('16-09-1980', 'dd-mm-yyyy'), null, 'dannib@efcbancorp.com', null, 473);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (474, to_date('20-02-1994', 'dd-mm-yyyy'), null, 'lucinda@summitenergy.com', null, 474);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (475, to_date('01-05-2000', 'dd-mm-yyyy'), null, 'stewartm@midwestmedia.com', null, 475);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (476, to_date('16-09-1987', 'dd-mm-yyyy'), null, 'judge.osment@supplycorecom.com', null, 476);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (477, to_date('18-04-1993', 'dd-mm-yyyy'), null, 'victoria.nelson@grs.com', null, 477);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (478, to_date('10-01-1977', 'dd-mm-yyyy'), null, 'merrill@parker.br', null, 478);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (479, to_date('24-12-1990', 'dd-mm-yyyy'), null, 'ed24@fds.com', null, 479);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (482, to_date('11-04-1971', 'dd-mm-yyyy'), null, 'al.coolidge@staffforce.uk', null, 482);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (483, to_date('01-01-2000', 'dd-mm-yyyy'), null, 'nancyd@aldensystems.ca', null, 483);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (484, to_date('30-06-1972', 'dd-mm-yyyy'), null, 'v.dafoe@eagleone.com', null, 484);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (485, to_date('18-04-1979', 'dd-mm-yyyy'), null, 'frances.tambor@scripnet.fr', null, 485);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (486, to_date('04-05-1995', 'dd-mm-yyyy'), null, 'al.kennedy@alohanysystems.com', null, 486);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (487, to_date('28-07-1991', 'dd-mm-yyyy'), null, 'casey.davies@usdairyproducers.', null, 487);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (488, to_date('14-12-1979', 'dd-mm-yyyy'), null, 'wayman@talx.fr', null, 488);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (491, to_date('29-10-1987', 'dd-mm-yyyy'), null, 'angie@deutschetelekom.jp', null, 491);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (492, to_date('10-06-1983', 'dd-mm-yyyy'), null, 'pam.cassel@globalwireless.com', null, 492);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (493, to_date('26-11-1975', 'dd-mm-yyyy'), null, 'k.shand@outsourcegroup.com', null, 493);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (494, to_date('10-06-1999', 'dd-mm-yyyy'), null, 'desmonde@ubp.com', null, 494);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (495, to_date('05-12-1991', 'dd-mm-yyyy'), null, 'christian.lonsdale@greene.cy', null, 495);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (496, to_date('15-12-1972', 'dd-mm-yyyy'), null, 'jeffery.potter@swp.com', null, 496);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (497, to_date('07-05-1974', 'dd-mm-yyyy'), null, 'ray.r@veritekinternational.fr', null, 497);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (499, to_date('04-10-1988', 'dd-mm-yyyy'), null, 'mbullock@gsat.com', null, 499);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (500, to_date('14-06-1991', 'dd-mm-yyyy'), null, 'antonio.byrd@ahl.com', null, 500);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (501, to_date('13-11-1976', 'dd-mm-yyyy'), null, 'clay.coward@millersystems.nl', null, 501);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (502, to_date('15-11-1982', 'dd-mm-yyyy'), null, 'terence.griffin@mosaic.com', null, 502);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (503, to_date('10-09-1991', 'dd-mm-yyyy'), null, 'rufus.penn@teoco.com', null, 503);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (504, to_date('14-05-1998', 'dd-mm-yyyy'), null, 'ernie.mac@dillards.de', null, 504);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (507, to_date('17-04-1989', 'dd-mm-yyyy'), null, 'j.ryder@americanexpress.com', null, 507);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (508, to_date('13-03-1978', 'dd-mm-yyyy'), null, 'jon.darren@dbprofessionals.uk', null, 508);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (509, to_date('28-01-1977', 'dd-mm-yyyy'), null, 'miki@circuitcitystores.com', null, 509);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (510, to_date('02-08-2000', 'dd-mm-yyyy'), null, 'ritchie.paymer@comnetinternati', null, 510);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (511, to_date('27-03-1977', 'dd-mm-yyyy'), null, 'minnie@boldtechsystems.li', null, 511);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (512, to_date('10-12-1971', 'dd-mm-yyyy'), null, 'pablo.jovovich@viacell.com', null, 512);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (513, to_date('28-05-2001', 'dd-mm-yyyy'), null, 'orlando.minogue@conquestsystem', null, 513);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (514, to_date('19-09-1989', 'dd-mm-yyyy'), null, 'brad.royparnell@keith.at', null, 514);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (515, to_date('25-04-1976', 'dd-mm-yyyy'), null, 'powersg@prp.uk', null, 515);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (516, to_date('06-12-1984', 'dd-mm-yyyy'), null, 'vbush@dis.nl', null, 516);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (519, to_date('02-08-1971', 'dd-mm-yyyy'), null, 'lari.lofgren@adolph.jp', null, 519);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (520, to_date('13-02-1989', 'dd-mm-yyyy'), null, 'clay.g@atlanticcredit.es', null, 520);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (521, to_date('06-02-1975', 'dd-mm-yyyy'), null, 'jackie.tomei@spinnakerexplorat', null, 521);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (522, to_date('17-09-1974', 'dd-mm-yyyy'), null, 'ani.thorton@ccb.se', null, 522);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (523, to_date('19-08-1989', 'dd-mm-yyyy'), null, 'jann.cummings@sprint.com', null, 523);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (524, to_date('09-09-1976', 'dd-mm-yyyy'), null, 'nile.hunter@jcpenney.com', null, 524);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (525, to_date('02-05-2001', 'dd-mm-yyyy'), null, 'harry@oneidafinancial.com', null, 525);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (527, to_date('27-09-1977', 'dd-mm-yyyy'), null, 'lonnie.gershon@priorityexpress', null, 527);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (528, to_date('20-01-1985', 'dd-mm-yyyy'), null, 'marylouise.senior@logisticare.', null, 528);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (529, to_date('06-03-2001', 'dd-mm-yyyy'), null, 'cyndi.brothers@slt.com', null, 529);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (530, to_date('27-03-1986', 'dd-mm-yyyy'), null, 'wade.luongo@gentrasystems.nl', null, 530);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (531, to_date('20-04-1976', 'dd-mm-yyyy'), null, 'jill.rockwell@lloydgroup.com', null, 531);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (532, to_date('28-02-2000', 'dd-mm-yyyy'), null, 'willie.sewell@bestever.de', null, 532);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (535, to_date('17-12-1984', 'dd-mm-yyyy'), null, 'kieran.mazzello@sps.de', null, 535);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (536, to_date('07-07-1973', 'dd-mm-yyyy'), null, 's.carrey@kimberlyclark.uk', null, 536);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (537, to_date('04-09-1970', 'dd-mm-yyyy'), null, 'solomon@verizon.com', null, 537);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (538, to_date('10-06-1986', 'dd-mm-yyyy'), null, 'beth.piven@fpf.com', null, 538);
commit;
prompt 500 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (539, to_date('09-09-1980', 'dd-mm-yyyy'), null, 'ddepp@grt.cr', null, 539);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (540, to_date('15-05-1986', 'dd-mm-yyyy'), null, 'leslie.leto@talx.com', null, 540);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (541, to_date('25-01-1993', 'dd-mm-yyyy'), null, 'jackie.johansen@smartdrawcom.j', null, 541);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (542, to_date('20-10-1998', 'dd-mm-yyyy'), null, 'wang.tierney@ivorysystems.com', null, 542);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (543, to_date('21-11-1981', 'dd-mm-yyyy'), null, 'marylouise@catamount.com', null, 543);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (544, to_date('26-01-1976', 'dd-mm-yyyy'), null, 'renew@genghisgrill.se', null, 544);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (545, to_date('30-03-1976', 'dd-mm-yyyy'), null, 'denny.v@career.com', null, 545);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (546, to_date('20-02-1994', 'dd-mm-yyyy'), null, 't.kattan@qestrel.com', null, 546);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (547, to_date('15-05-1998', 'dd-mm-yyyy'), null, 'marisa@dcgroup.com', null, 547);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (548, to_date('03-07-1972', 'dd-mm-yyyy'), null, 'harvey.venora@onesourceprintin', null, 548);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (549, to_date('15-08-1989', 'dd-mm-yyyy'), null, 'natascha.capshaw@terrafirma.uk', null, 549);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (550, to_date('04-07-1993', 'dd-mm-yyyy'), null, 'dianne.applegate@evinco.es', null, 550);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (551, to_date('28-01-1992', 'dd-mm-yyyy'), null, 'nathan.b@vfs.com', null, 551);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (552, to_date('12-06-1979', 'dd-mm-yyyy'), null, 'cevin.dorff@benecongroup.hk', null, 552);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (553, to_date('01-10-1981', 'dd-mm-yyyy'), null, 'b.yorn@nhr.no', null, 553);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (554, to_date('15-07-1975', 'dd-mm-yyyy'), null, 'mrourke@hardwoodwholesalers.nl', null, 554);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (555, to_date('19-02-1998', 'dd-mm-yyyy'), null, 'mary.henriksen@mai.it', null, 555);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (556, to_date('07-05-1975', 'dd-mm-yyyy'), null, 'c.lopez@spectrum.com', null, 556);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (557, to_date('11-11-1988', 'dd-mm-yyyy'), null, 'john@avr.com', null, 557);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (558, to_date('06-06-1999', 'dd-mm-yyyy'), null, 'alana.numan@myricom.au', null, 558);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (559, to_date('25-07-1980', 'dd-mm-yyyy'), null, 'charlie.shelton@ivorysystems.d', null, 559);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (560, to_date('11-03-1987', 'dd-mm-yyyy'), null, 'kirk.fierstein@telepoint.com', null, 560);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (561, to_date('21-08-1985', 'dd-mm-yyyy'), null, 'gilbert.rollins@kimberlyclark.', null, 561);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (562, to_date('05-08-1995', 'dd-mm-yyyy'), null, 'daryle.l@hospitalsolutions.il', null, 562);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (563, to_date('03-07-1975', 'dd-mm-yyyy'), null, 'nelly.spall@clubone.com', null, 563);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (564, to_date('20-12-1996', 'dd-mm-yyyy'), null, 'mcartlidge@pharmafab.jp', null, 564);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (565, to_date('19-07-1977', 'dd-mm-yyyy'), null, 'r.donofrio@grt.com', null, 565);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (566, to_date('12-03-1992', 'dd-mm-yyyy'), null, 'clarence.e@circuitcitystores.i', null, 566);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (567, to_date('15-06-1975', 'dd-mm-yyyy'), null, 'albert.broderick@marketbased.c', null, 567);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (568, to_date('29-01-2002', 'dd-mm-yyyy'), null, 'm.phoenix@timberlanewoodcrafte', null, 568);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (569, to_date('20-04-1973', 'dd-mm-yyyy'), null, 'albertina@quakercitybancorp.se', null, 569);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (570, to_date('02-01-1987', 'dd-mm-yyyy'), null, 'alfred@conquest.lk', null, 570);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (571, to_date('19-04-2001', 'dd-mm-yyyy'), null, 'fcervine@meridiangold.com', null, 571);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (572, to_date('02-09-1989', 'dd-mm-yyyy'), null, 'sburrows@mitsubishimotors.de', null, 572);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (573, to_date('25-12-1988', 'dd-mm-yyyy'), null, 'cathyl@jewettcameron.com', null, 573);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (574, to_date('21-06-1983', 'dd-mm-yyyy'), null, 'l.gilley@aquascapedesigns.pl', null, 574);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (575, to_date('10-03-1995', 'dd-mm-yyyy'), null, 'r.stigers@sds.br', null, 575);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (576, to_date('05-05-1981', 'dd-mm-yyyy'), null, 'burth@dps.it', null, 576);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (577, to_date('06-11-1998', 'dd-mm-yyyy'), null, 'vern.b@ivci.no', null, 577);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (578, to_date('23-02-1985', 'dd-mm-yyyy'), null, 'mindy@saralee.com', null, 578);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (579, to_date('11-03-1979', 'dd-mm-yyyy'), null, 'laurence.thewlis@virbac.com', null, 579);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (580, to_date('07-02-1988', 'dd-mm-yyyy'), null, 'hookah.n@fra.com', null, 580);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (581, to_date('01-07-1999', 'dd-mm-yyyy'), null, 'merrill@accesssystems.dk', null, 581);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (582, to_date('23-10-1999', 'dd-mm-yyyy'), null, 'fairuza.gayle@johnkeeler.com', null, 582);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (583, to_date('30-06-1994', 'dd-mm-yyyy'), null, 'danny.reilly@pearllawgroup.com', null, 583);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (584, to_date('27-01-1980', 'dd-mm-yyyy'), null, 'wendy.close@trm.com', null, 584);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (585, to_date('08-10-1991', 'dd-mm-yyyy'), null, 'jeanne.seagal@news.ca', null, 585);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (586, to_date('02-08-1971', 'dd-mm-yyyy'), null, 'mika@johnson.br', null, 586);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (587, to_date('26-08-1972', 'dd-mm-yyyy'), null, 'd.stiller@novartis.it', null, 587);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (588, to_date('27-11-1975', 'dd-mm-yyyy'), null, 'ettar@kramontrealty.com', null, 588);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (589, to_date('22-05-1976', 'dd-mm-yyyy'), null, 'coley.wayans@linacsystems.br', null, 589);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (590, to_date('11-07-1995', 'dd-mm-yyyy'), null, 'kevin.gertner@servicelink.ca', null, 590);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (591, to_date('14-09-1990', 'dd-mm-yyyy'), null, 'demi@waltdisney.ch', null, 591);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (592, to_date('23-04-1986', 'dd-mm-yyyy'), null, 'collin@dsp.de', null, 592);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (593, to_date('06-03-1979', 'dd-mm-yyyy'), null, 'saulp@biosite.ca', null, 593);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (594, to_date('10-03-1986', 'dd-mm-yyyy'), null, 'maury@techbooks.es', null, 594);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (595, to_date('25-06-1980', 'dd-mm-yyyy'), null, 'mkelly@simplycertificates.com', null, 595);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (596, to_date('12-08-2000', 'dd-mm-yyyy'), null, 'cyndi@sms.com', null, 596);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (597, to_date('22-02-1988', 'dd-mm-yyyy'), null, 'i.donelly@summitenergy.com', null, 597);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (598, to_date('05-05-1987', 'dd-mm-yyyy'), null, 'kevin.lane@nhhc.com', null, 598);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (599, to_date('18-04-1975', 'dd-mm-yyyy'), null, 'mpayne@glaxosmithkline.at', null, 599);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (600, to_date('18-07-1979', 'dd-mm-yyyy'), null, 'frank.warren@prahs.com', null, 600);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (601, to_date('16-04-1978', 'dd-mm-yyyy'), null, 'ricardo.sharp@tlsservicebureau', null, 601);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (602, to_date('23-10-1996', 'dd-mm-yyyy'), null, 'owen@nsd.com', null, 602);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (603, to_date('03-03-1992', 'dd-mm-yyyy'), null, 'chubby@mms.com', null, 603);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (604, to_date('02-10-1975', 'dd-mm-yyyy'), null, 'austin@commworks.com', null, 604);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (605, to_date('14-02-1974', 'dd-mm-yyyy'), null, 'anjelica.walker@flavorx.no', null, 605);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (606, to_date('28-05-1984', 'dd-mm-yyyy'), null, 'juliana.borgnine@americanhealt', null, 606);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (607, to_date('13-10-1990', 'dd-mm-yyyy'), null, 'ronnie.oszajca@surmodics.com', null, 607);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (608, to_date('28-09-1977', 'dd-mm-yyyy'), null, 'cece@wav.uk', null, 608);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (609, to_date('06-09-1990', 'dd-mm-yyyy'), null, 'd.bachman@alogent.si', null, 609);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (610, to_date('21-06-1974', 'dd-mm-yyyy'), null, 'suzym@powerlight.com', null, 610);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (611, to_date('12-06-1993', 'dd-mm-yyyy'), null, 'juliet@arkidata.au', null, 611);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (612, to_date('04-07-1985', 'dd-mm-yyyy'), null, 'terri.flanery@progressivedesig', null, 612);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (613, to_date('19-05-1996', 'dd-mm-yyyy'), null, 'patricia.zane@tarragonrealty.i', null, 613);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (614, to_date('16-03-1972', 'dd-mm-yyyy'), null, 'josh.alston@invisioncom.de', null, 614);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (615, to_date('05-04-1997', 'dd-mm-yyyy'), null, 'murray@heritagemicrofilm.com', null, 615);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (616, to_date('20-07-1974', 'dd-mm-yyyy'), null, 'kweber@procter.de', null, 616);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (617, to_date('04-03-1997', 'dd-mm-yyyy'), null, 'seth.b@gna.com', null, 617);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (618, to_date('24-02-1978', 'dd-mm-yyyy'), null, 'kirsten.cozier@trm.com', null, 618);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (619, to_date('07-01-1970', 'dd-mm-yyyy'), null, 'g.willis@berkshirehathaway.br', null, 619);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (620, to_date('07-12-1983', 'dd-mm-yyyy'), null, 'patrick.dealmeida@bigdoughcom.', null, 620);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (621, to_date('12-11-1984', 'dd-mm-yyyy'), null, 'claudev@canterburypark.com', null, 621);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (622, to_date('26-02-1996', 'dd-mm-yyyy'), null, 'betty.romijnstamos@httprint.co', null, 622);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (623, to_date('13-07-1985', 'dd-mm-yyyy'), null, 'stephen.garber@saksinc.com', null, 623);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (624, to_date('23-06-1982', 'dd-mm-yyyy'), null, 'jared@bat.tr', null, 624);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (625, to_date('04-05-1970', 'dd-mm-yyyy'), null, 'leon.neville@zaiqtechnologies.', null, 625);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (626, to_date('04-12-1978', 'dd-mm-yyyy'), null, 'geraldine.s@oriservices.de', null, 626);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (627, to_date('06-06-1987', 'dd-mm-yyyy'), null, 'scarlett.stigers@pioneermortga', null, 627);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (628, to_date('09-04-1974', 'dd-mm-yyyy'), null, 'frankie.crosby@tama.tr', null, 628);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (629, to_date('21-10-2000', 'dd-mm-yyyy'), null, 'balthazar.c@ams.de', null, 629);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (630, to_date('23-06-2000', 'dd-mm-yyyy'), null, 'r.davis@evergreenresources.com', null, 630);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (631, to_date('18-11-1990', 'dd-mm-yyyy'), null, 'liam@evergreenresources.com', null, 631);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (632, to_date('13-04-1974', 'dd-mm-yyyy'), null, 'samantha.g@catamount.de', null, 632);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (633, to_date('07-02-1979', 'dd-mm-yyyy'), null, 'elijah.kelly@restaurantpartner', null, 633);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (634, to_date('11-05-2001', 'dd-mm-yyyy'), null, 'ccandy@sysconmedia.de', null, 634);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (635, to_date('06-11-1993', 'dd-mm-yyyy'), null, 'rosco.krabbe@pulaskifinancial.', null, 635);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (636, to_date('07-10-1970', 'dd-mm-yyyy'), null, 'd.connery@techbooks.fr', null, 636);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (637, to_date('12-05-1981', 'dd-mm-yyyy'), null, 'rodney.m@printingforlesscom.br', null, 637);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (638, to_date('04-06-1982', 'dd-mm-yyyy'), null, 'stockard.hagar@mqsoftware.com', null, 638);
commit;
prompt 600 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (639, to_date('23-10-1987', 'dd-mm-yyyy'), null, 'v.royparnell@its.com', null, 639);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (640, to_date('05-08-1979', 'dd-mm-yyyy'), null, 'brundgren@hfg.com', null, 640);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (641, to_date('20-01-1976', 'dd-mm-yyyy'), null, 'lynn.ruffalo@kellogg.com', null, 641);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (642, to_date('04-02-1996', 'dd-mm-yyyy'), null, 'jerry.a@ntas.fr', null, 642);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (643, to_date('29-05-1991', 'dd-mm-yyyy'), null, 'rachid@apexsystems.com', null, 643);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (644, to_date('07-10-2002', 'dd-mm-yyyy'), null, 'chris.dean@ptg.com', null, 644);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (645, to_date('23-09-1997', 'dd-mm-yyyy'), null, 'eugene.cazale@kingston.jp', null, 645);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (646, to_date('08-02-1985', 'dd-mm-yyyy'), null, 'k.vince@tastefullysimple.com', null, 646);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (647, to_date('09-11-1990', 'dd-mm-yyyy'), null, 'alicia.page@gci.com', null, 647);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (648, to_date('29-06-1973', 'dd-mm-yyyy'), null, 'natascha.s@hps.fi', null, 648);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (649, to_date('03-05-1994', 'dd-mm-yyyy'), null, 'gilbert@apexsystems.jp', null, 649);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (650, to_date('01-07-1980', 'dd-mm-yyyy'), null, 'jeremy.kingsley@pinnaclestaffi', null, 650);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (651, to_date('10-09-1981', 'dd-mm-yyyy'), null, 'e.dorff@officedepot.ca', null, 651);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (652, to_date('25-02-1970', 'dd-mm-yyyy'), null, 'dpurefoy@daimlerchrysler.de', null, 652);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (653, to_date('21-08-1980', 'dd-mm-yyyy'), null, 'ckimball@gagwear.com', null, 653);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (654, to_date('27-10-1990', 'dd-mm-yyyy'), null, 'ernie.f@glaxosmithkline.ca', null, 654);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (655, to_date('06-01-1992', 'dd-mm-yyyy'), null, 'jonatha@saksinc.se', null, 655);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (658, to_date('29-09-1976', 'dd-mm-yyyy'), null, 'alfie.leigh@sandyspringbancorp', null, 658);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (659, to_date('07-01-1980', 'dd-mm-yyyy'), null, 't.keith@northhighland.br', null, 659);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (660, to_date('28-01-1972', 'dd-mm-yyyy'), null, 'janeane.l@air.de', null, 660);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (661, to_date('10-01-1982', 'dd-mm-yyyy'), null, 'tmiles@novartis.fr', null, 661);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (662, to_date('23-10-1978', 'dd-mm-yyyy'), null, 'kathyd@educationaldevelopment.', null, 662);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (663, to_date('07-01-1982', 'dd-mm-yyyy'), null, 'j.ontiveros@hospitalsolutions.', null, 663);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (664, to_date('12-10-1999', 'dd-mm-yyyy'), null, 'clint.prinze@fmt.hu', null, 664);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (665, to_date('21-12-1972', 'dd-mm-yyyy'), null, 'r.viterelli@kwraf.de', null, 665);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (667, to_date('08-04-1986', 'dd-mm-yyyy'), null, 'willem.kretschmann@spd.com', null, 667);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (668, to_date('21-11-1974', 'dd-mm-yyyy'), null, 'red.gooding@fsffinancial.uk', null, 668);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (669, to_date('17-08-1984', 'dd-mm-yyyy'), null, 'miko.l@capitalbank.de', null, 669);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (670, to_date('19-03-1982', 'dd-mm-yyyy'), null, 'b.sizemore@mwp.ec', null, 670);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (671, to_date('21-02-1984', 'dd-mm-yyyy'), null, 'sam.dickinson@cima.com', null, 671);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (674, to_date('03-06-1991', 'dd-mm-yyyy'), null, 'lario@deutschetelekom.de', null, 674);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (675, to_date('05-11-1983', 'dd-mm-yyyy'), null, 'peter.gordon@kmart.com', null, 675);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (676, to_date('27-09-1979', 'dd-mm-yyyy'), null, 'mmorrison@drinkmorewater.nl', null, 676);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (677, to_date('28-05-1978', 'dd-mm-yyyy'), null, 'ethan.gatlin@ceb.es', null, 677);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (678, to_date('14-07-1973', 'dd-mm-yyyy'), null, 'natalie.rippy@techrx.nl', null, 678);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (679, to_date('18-12-1985', 'dd-mm-yyyy'), null, 'k.green@labradanutrition.com', null, 679);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (680, to_date('02-09-1994', 'dd-mm-yyyy'), null, 'trey.tarantino@elite.de', null, 680);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (681, to_date('02-06-1989', 'dd-mm-yyyy'), null, 'kate.capshaw@capital.il', null, 681);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (684, to_date('03-08-1978', 'dd-mm-yyyy'), null, 'v.payne@linksys.com', null, 684);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (685, to_date('11-06-1988', 'dd-mm-yyyy'), null, 'frankie.a@uem.ca', null, 685);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (686, to_date('16-01-1980', 'dd-mm-yyyy'), null, 'ceili.ripley@fmi.br', null, 686);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (687, to_date('26-11-1982', 'dd-mm-yyyy'), null, 'wrodriguez@ipsadvisory.uk', null, 687);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (688, to_date('25-12-1981', 'dd-mm-yyyy'), null, 'arturol@atlanticcredit.de', null, 688);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (689, to_date('01-04-1975', 'dd-mm-yyyy'), null, 'coley.thomson@verizon.com', null, 689);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (690, to_date('05-01-1971', 'dd-mm-yyyy'), null, 'spatrick@baesch.com', null, 690);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (691, to_date('01-11-1972', 'dd-mm-yyyy'), null, 'jeanneh@mitsubishimotors.it', null, 691);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (692, to_date('20-05-1993', 'dd-mm-yyyy'), null, 'freda.hersh@printcafesoftware.', null, 692);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (695, to_date('08-07-1976', 'dd-mm-yyyy'), null, 'willem.edmunds@multimedialive.', null, 695);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (696, to_date('09-01-1979', 'dd-mm-yyyy'), null, 'dar.archer@iss.fi', null, 696);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (697, to_date('05-09-1977', 'dd-mm-yyyy'), null, 'bebe.roundtree@exinomtechnolog', null, 697);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (698, to_date('27-10-1974', 'dd-mm-yyyy'), null, 'lupe.mcclinton@oriservices.de', null, 698);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (699, to_date('19-10-1974', 'dd-mm-yyyy'), null, 'brenda.aniston@cima.com', null, 699);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (700, to_date('02-07-1979', 'dd-mm-yyyy'), null, 'nils.summer@mathis.ch', null, 700);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (701, to_date('26-04-1997', 'dd-mm-yyyy'), null, 'kyliep@dvdt.nl', null, 701);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (702, to_date('21-02-1972', 'dd-mm-yyyy'), null, 'd.oakenfold@grayhawksystems.co', null, 702);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (704, to_date('21-09-1995', 'dd-mm-yyyy'), null, 's.gough@digitalmotorworks.il', null, 704);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (705, to_date('01-12-2001', 'dd-mm-yyyy'), null, 'warrenp@topicsentertainment.br', null, 705);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (706, to_date('14-07-1995', 'dd-mm-yyyy'), null, 'heathw@topicsentertainment.ca', null, 706);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (707, to_date('21-11-1979', 'dd-mm-yyyy'), null, 'lionel.rawls@trainersoft.com', null, 707);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (708, to_date('15-01-1989', 'dd-mm-yyyy'), null, 'rene.mclachlan@max.com', null, 708);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (711, to_date('11-06-1970', 'dd-mm-yyyy'), null, 'cloris@surmodics.no', null, 711);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (712, to_date('19-04-1992', 'dd-mm-yyyy'), null, 'scarlett.vassar@usenergyservic', null, 712);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (713, to_date('03-01-1973', 'dd-mm-yyyy'), null, 'kevng@execuscribe.de', null, 713);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (714, to_date('08-06-1984', 'dd-mm-yyyy'), null, 'gilbert.taha@ufs.com', null, 714);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (715, to_date('29-08-1980', 'dd-mm-yyyy'), null, 'dustin.curtishall@irissoftware', null, 715);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (716, to_date('19-06-2000', 'dd-mm-yyyy'), null, 'ike.forrest@genghisgrill.com', null, 716);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (717, to_date('06-11-1988', 'dd-mm-yyyy'), null, 'j.giraldo@kelmooreinvestment.c', null, 717);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (719, to_date('28-11-1978', 'dd-mm-yyyy'), null, 'rebeka.teng@base.com', null, 719);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (720, to_date('21-03-1978', 'dd-mm-yyyy'), null, 'claude.collins@idas.uk', null, 720);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (721, to_date('13-06-1985', 'dd-mm-yyyy'), null, 'stephanie.curtishall@mds.ch', null, 721);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (722, to_date('05-02-1989', 'dd-mm-yyyy'), null, 'johnnie.tanon@seafoxboat.uk', null, 722);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (723, to_date('08-04-1998', 'dd-mm-yyyy'), null, 'jonathan.balin@blueoceansoftwa', null, 723);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (724, to_date('01-01-1973', 'dd-mm-yyyy'), null, 't.milsap@dcgroup.fr', null, 724);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (725, to_date('09-03-1979', 'dd-mm-yyyy'), null, 'saffron@innovativelighting.it', null, 725);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (726, to_date('27-08-1990', 'dd-mm-yyyy'), null, 'sandra.hector@unilever.il', null, 726);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (727, to_date('23-05-1979', 'dd-mm-yyyy'), null, 'rascal.palminteri@advertisingv', null, 727);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (728, to_date('24-01-1979', 'dd-mm-yyyy'), null, 'elisabeth.lynskey@shar.ch', null, 728);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (729, to_date('28-03-1996', 'dd-mm-yyyy'), null, 'diamond.eastwood@httprint.com', null, 729);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (730, to_date('22-08-1988', 'dd-mm-yyyy'), null, 'timothy.o@pharmacia.com', null, 730);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (731, to_date('27-03-1989', 'dd-mm-yyyy'), null, 'mira.s@news.com', null, 731);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (732, to_date('13-11-1972', 'dd-mm-yyyy'), null, 'mmorales@conquestsystems.de', null, 732);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (733, to_date('02-09-1975', 'dd-mm-yyyy'), null, 'chants@nsd.es', null, 733);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (734, to_date('27-10-1989', 'dd-mm-yyyy'), null, 'toshiro.james@idlabel.ca', null, 734);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (735, to_date('16-07-1987', 'dd-mm-yyyy'), null, 'p.richardson@nsd.com', null, 735);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (736, to_date('25-06-1988', 'dd-mm-yyyy'), null, 'liam.fender@hfg.no', null, 736);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (737, to_date('18-10-1991', 'dd-mm-yyyy'), null, 'johnny@deutschetelekom.de', null, 737);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (738, to_date('21-04-1984', 'dd-mm-yyyy'), null, 'joaquin.lapaglia@microtek.no', null, 738);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (739, to_date('17-08-1997', 'dd-mm-yyyy'), null, 'jassante@oneidafinancial.it', null, 739);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (740, to_date('10-12-1979', 'dd-mm-yyyy'), null, 'neve.l@nha.com', null, 740);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (741, to_date('28-02-1985', 'dd-mm-yyyy'), null, 'jeff.chestnut@trm.com', null, 741);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (742, to_date('05-05-1983', 'dd-mm-yyyy'), null, 'heath.moriarty@marsinc.ca', null, 742);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (743, to_date('05-06-1971', 'dd-mm-yyyy'), null, 'r.cale@printingforlesscom.uk', null, 743);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (744, to_date('02-04-1978', 'dd-mm-yyyy'), null, 'val.dale@monarchcasino.ca', null, 744);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (745, to_date('11-06-1985', 'dd-mm-yyyy'), null, 'armandl@novartis.nl', null, 745);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (746, to_date('29-06-1983', 'dd-mm-yyyy'), null, 'roscoe.derringer@glaxosmithkli', null, 746);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (747, to_date('30-12-1990', 'dd-mm-yyyy'), null, 'connie.hatchet@investorstitle.', null, 747);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (748, to_date('23-03-1977', 'dd-mm-yyyy'), null, 'ronny@newhorizons.com', null, 748);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (749, to_date('22-11-1991', 'dd-mm-yyyy'), null, 'rik.bush@visainternational.si', null, 749);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (750, to_date('03-06-1985', 'dd-mm-yyyy'), null, 'ike.reeves@cynergydata.it', null, 750);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (751, to_date('28-03-1987', 'dd-mm-yyyy'), null, 'jaime.kravitz@tilsonhr.it', null, 751);
commit;
prompt 700 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (752, to_date('14-02-1993', 'dd-mm-yyyy'), null, 'alana.shawn@homedepot.za', null, 752);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (753, to_date('01-12-1993', 'dd-mm-yyyy'), null, 'david.evans@vitacostcom.uk', null, 753);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (754, to_date('19-03-1970', 'dd-mm-yyyy'), null, 'david.branch@younginnovations.', null, 754);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (755, to_date('01-07-1982', 'dd-mm-yyyy'), null, 'famke.barkin@investorstitle.co', null, 755);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (756, to_date('24-08-1973', 'dd-mm-yyyy'), null, 'elle.balin@eastmankodak.gr', null, 756);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (757, to_date('16-10-1992', 'dd-mm-yyyy'), null, 'noah.gleeson@webgroup.com', null, 757);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (758, to_date('01-04-1983', 'dd-mm-yyyy'), null, 'julianna.mckean@fsffinancial.c', null, 758);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (759, to_date('06-12-1971', 'dd-mm-yyyy'), null, 'cathy.h@bowman.dk', null, 759);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (760, to_date('20-04-1995', 'dd-mm-yyyy'), null, 'chelyh@tmaresources.com', null, 760);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (761, to_date('27-04-1981', 'dd-mm-yyyy'), null, 'gord.kelly@ass.com', null, 761);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (762, to_date('13-02-1999', 'dd-mm-yyyy'), null, 'thomas.warwick@vms.com', null, 762);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (763, to_date('27-11-1991', 'dd-mm-yyyy'), null, 'ed.randal@componentgraphics.is', null, 763);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (764, to_date('07-01-2000', 'dd-mm-yyyy'), null, 'g.shepherd@knightsbridge.com', null, 764);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (765, to_date('11-12-1994', 'dd-mm-yyyy'), null, 'courtney.dealmeida@nsd.com', null, 765);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (766, to_date('23-12-1987', 'dd-mm-yyyy'), null, 'teena.burrows@swp.com', null, 766);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (767, to_date('04-12-1977', 'dd-mm-yyyy'), null, 'ctate@americanvanguard.pe', null, 767);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (768, to_date('19-10-1994', 'dd-mm-yyyy'), null, 'solomon.almond@tps.it', null, 768);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (769, to_date('26-09-1998', 'dd-mm-yyyy'), null, 'geraldine@magnet.de', null, 769);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (770, to_date('07-06-1975', 'dd-mm-yyyy'), null, 'samuel.hartnett@axis.uk', null, 770);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (771, to_date('21-07-1977', 'dd-mm-yyyy'), null, 'jeffrey.singletary@multimedial', null, 771);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (772, to_date('27-02-1971', 'dd-mm-yyyy'), null, 'brittany.balin@hewlettpackard.', null, 772);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (773, to_date('29-05-1975', 'dd-mm-yyyy'), null, 'richie.isaacs@bayer.com', null, 773);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (774, to_date('30-04-1980', 'dd-mm-yyyy'), null, 'a.leoni@usenergyservices.com', null, 774);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (775, to_date('20-06-1986', 'dd-mm-yyyy'), null, 'christine@linksys.it', null, 775);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (776, to_date('21-11-2000', 'dd-mm-yyyy'), null, 'maureen.brolin@tarragonrealty.', null, 776);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (777, to_date('03-08-2002', 'dd-mm-yyyy'), null, 'delbert.cole@carboceramics.jp', null, 777);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (778, to_date('30-05-1986', 'dd-mm-yyyy'), null, 'holly.farrow@peerlessmanufactu', null, 778);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (779, to_date('22-03-1980', 'dd-mm-yyyy'), null, 'raul.ohara@vesta.com', null, 779);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (780, to_date('26-01-2001', 'dd-mm-yyyy'), null, 'tobey.addy@gci.com', null, 780);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (781, to_date('22-03-1973', 'dd-mm-yyyy'), null, 'beth@interfacesoftware.jp', null, 781);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (782, to_date('16-08-1996', 'dd-mm-yyyy'), null, 'larenz.sayer@sears.fr', null, 782);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (783, to_date('09-03-2002', 'dd-mm-yyyy'), null, 'tea.sewell@gillette.com', null, 783);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (784, to_date('20-04-1987', 'dd-mm-yyyy'), null, 'aidan.crouse@primussoftware.co', null, 784);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (785, to_date('07-11-1988', 'dd-mm-yyyy'), null, 'sharon.crow@nmr.de', null, 785);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (786, to_date('23-09-2001', 'dd-mm-yyyy'), null, 'aimeeh@jlphor.jp', null, 786);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (787, to_date('06-07-1976', 'dd-mm-yyyy'), null, 'stellan.goodman@gsat.com', null, 787);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (788, to_date('17-06-1998', 'dd-mm-yyyy'), null, 'freddy.sylvian@noodles.za', null, 788);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (789, to_date('20-03-1970', 'dd-mm-yyyy'), null, 'bonnie.belles@bestbuy.uk', null, 789);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (790, to_date('19-06-1989', 'dd-mm-yyyy'), null, 'b.oldman@inspirationsoftware.c', null, 790);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (791, to_date('04-12-1980', 'dd-mm-yyyy'), null, 'ccrimson@spectrum.com', null, 791);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (792, to_date('05-04-1970', 'dd-mm-yyyy'), null, 'queen.p@vfs.com', null, 792);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (793, to_date('27-07-1980', 'dd-mm-yyyy'), null, 'cheech.bryson@gltg.at', null, 793);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (794, to_date('04-09-1986', 'dd-mm-yyyy'), null, 'lena.dooley@horizonorganic.com', null, 794);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (795, to_date('07-02-1977', 'dd-mm-yyyy'), null, 'kris.d@appriss.com', null, 795);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (796, to_date('02-04-1977', 'dd-mm-yyyy'), null, 'brent.womack@wyeth.es', null, 796);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (797, to_date('24-04-2001', 'dd-mm-yyyy'), null, 'seann.p@appriss.com', null, 797);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (798, to_date('07-05-1979', 'dd-mm-yyyy'), null, 'luis.vinton@educationaldevelop', null, 798);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (799, to_date('13-03-1970', 'dd-mm-yyyy'), null, 'wallace.steagall@kroger.com', null, 799);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (800, to_date('29-04-1981', 'dd-mm-yyyy'), null, 'whoopis@keymark.be', null, 800);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (801, to_date('01-12-1988', 'dd-mm-yyyy'), null, 'nikka.pollak@paisley.jp', null, 801);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (802, to_date('18-07-1998', 'dd-mm-yyyy'), null, 'elijah.navarro@kingland.de', null, 802);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (803, to_date('18-05-1978', 'dd-mm-yyyy'), null, 'saul.santana@technica.de', null, 803);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (804, to_date('17-04-1997', 'dd-mm-yyyy'), null, 'victor.mazzello@ivorysystems.c', null, 804);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (805, to_date('01-10-1995', 'dd-mm-yyyy'), null, 'rip.l@trafficmanagement.de', null, 805);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (806, to_date('07-11-1970', 'dd-mm-yyyy'), null, 'a.lynne@harrison.uk', null, 806);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (807, to_date('28-02-1991', 'dd-mm-yyyy'), null, 'judy.shand@csi.ch', null, 807);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (808, to_date('25-08-1993', 'dd-mm-yyyy'), null, 'udo.shandling@aquascapedesigns', null, 808);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (809, to_date('15-08-1986', 'dd-mm-yyyy'), null, 'cathy@nsd.ca', null, 809);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (810, to_date('19-09-1992', 'dd-mm-yyyy'), null, 'tori.curry@elmco.au', null, 810);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (811, to_date('12-11-1971', 'dd-mm-yyyy'), null, 'rob.michael@ceo.com', null, 811);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (812, to_date('04-01-1996', 'dd-mm-yyyy'), null, 'angela.s@stonebrewing.ca', null, 812);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (813, to_date('06-01-1977', 'dd-mm-yyyy'), null, 'willie@netnumina.com', null, 813);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (814, to_date('06-04-1971', 'dd-mm-yyyy'), null, 'angelina.l@sourcegear.be', null, 814);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (815, to_date('29-09-1979', 'dd-mm-yyyy'), null, 'lmay@gillette.au', null, 815);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (816, to_date('02-03-2000', 'dd-mm-yyyy'), null, 'jackie.f@safeway.uk', null, 816);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (817, to_date('29-12-1997', 'dd-mm-yyyy'), null, 'jody.daylewis@creditorsinterch', null, 817);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (818, to_date('31-05-1998', 'dd-mm-yyyy'), null, 'alessandro.redgrave@fsffinanci', null, 818);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (819, to_date('16-08-1995', 'dd-mm-yyyy'), null, 'c.cara@ass.com', null, 819);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (820, to_date('26-02-1995', 'dd-mm-yyyy'), null, 'kasey.pride@jcpenney.com', null, 820);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (821, to_date('02-08-1974', 'dd-mm-yyyy'), null, 'tanya.franks@keith.com', null, 821);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (822, to_date('05-11-1988', 'dd-mm-yyyy'), null, 'grant.smith@shufflemaster.it', null, 822);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (823, to_date('21-01-1995', 'dd-mm-yyyy'), null, 'seann.d@ctg.com', null, 823);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (824, to_date('14-06-1976', 'dd-mm-yyyy'), null, 'jonathanc@healthscribe.com', null, 824);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (825, to_date('07-02-1992', 'dd-mm-yyyy'), null, 'ernie@afs.com', null, 825);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (826, to_date('26-08-1984', 'dd-mm-yyyy'), null, 'natalie@atlanticcredit.es', null, 826);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (827, to_date('28-05-1978', 'dd-mm-yyyy'), null, 'fredb@unit.nl', null, 827);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (828, to_date('12-11-1973', 'dd-mm-yyyy'), null, 'cuba@swp.com', null, 828);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (829, to_date('03-09-1989', 'dd-mm-yyyy'), null, 'jimmy.fariq@thinktanksystems.b', null, 829);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (830, to_date('30-08-1986', 'dd-mm-yyyy'), null, 'lonnie@fmt.se', null, 830);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (831, to_date('13-05-1979', 'dd-mm-yyyy'), null, 'betty.davidson@fsffinancial.co', null, 831);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (832, to_date('25-08-1988', 'dd-mm-yyyy'), null, 'neneh.cash@entelligence.it', null, 832);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (833, to_date('06-02-1982', 'dd-mm-yyyy'), null, 'vondie@surmodics.com', null, 833);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (834, to_date('05-08-1988', 'dd-mm-yyyy'), null, 'r.leigh@alohanysystems.no', null, 834);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (836, to_date('19-12-1998', 'dd-mm-yyyy'), null, 'rcoburn@infinity.za', null, 836);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (837, to_date('21-06-1997', 'dd-mm-yyyy'), null, 'spike@reckittbenckiser.si', null, 837);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (838, to_date('28-06-1990', 'dd-mm-yyyy'), null, 'pat.baez@accucode.ca', null, 838);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (839, to_date('03-02-1978', 'dd-mm-yyyy'), null, 'r.mccready@servicelink.com', null, 839);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (840, to_date('13-08-1972', 'dd-mm-yyyy'), null, 'forest.weller@sht.com', null, 840);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (842, to_date('16-05-1978', 'dd-mm-yyyy'), null, 'tcoleman@bayer.it', null, 842);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (843, to_date('13-08-1991', 'dd-mm-yyyy'), null, 'billy@stonebrewing.fi', null, 843);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (844, to_date('24-03-1977', 'dd-mm-yyyy'), null, 'cevin.p@mwh.com', null, 844);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (845, to_date('21-09-1990', 'dd-mm-yyyy'), null, 'dom.wilkinson@newviewgifts.au', null, 845);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (846, to_date('31-08-1990', 'dd-mm-yyyy'), null, 'vienna.harnes@at.uk', null, 846);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (849, to_date('27-03-1982', 'dd-mm-yyyy'), null, 'rich.c@gillette.au', null, 849);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (850, to_date('21-09-2002', 'dd-mm-yyyy'), null, 'davis.devita@ositissoftware.co', null, 850);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (851, to_date('27-05-2002', 'dd-mm-yyyy'), null, 'jerry.choice@lemproducts.it', null, 851);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (852, to_date('16-01-1973', 'dd-mm-yyyy'), null, 'kurtwoode@exinomtechnologies.u', null, 852);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (853, to_date('11-03-1998', 'dd-mm-yyyy'), null, 'celia.busey@shot.it', null, 853);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (854, to_date('02-04-1995', 'dd-mm-yyyy'), null, 'christmas.evanswood@oneidafina', null, 854);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (856, to_date('02-03-1978', 'dd-mm-yyyy'), null, 'edwin.curfman@portageenvironme', null, 856);
commit;
prompt 800 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (857, to_date('05-05-1980', 'dd-mm-yyyy'), null, 'talvin.dealmeida@curagroup.es', null, 857);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (858, to_date('11-10-1986', 'dd-mm-yyyy'), null, 'r.sewell@actechnologies.hu', null, 858);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (859, to_date('25-02-2001', 'dd-mm-yyyy'), null, 'mary@hatworld.com', null, 859);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (860, to_date('26-07-1982', 'dd-mm-yyyy'), null, 'charlie.fogerty@mercantilebank', null, 860);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (863, to_date('12-06-1979', 'dd-mm-yyyy'), null, 'rebecca.mcginley@ibm.com', null, 863);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (864, to_date('19-09-1998', 'dd-mm-yyyy'), null, 'freda.crowe@bioreference.com', null, 864);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (865, to_date('17-06-1978', 'dd-mm-yyyy'), null, 'gwyneth.heatherly@neogen.com', null, 865);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (866, to_date('15-05-1997', 'dd-mm-yyyy'), null, 'p.roth@marsinc.com', null, 866);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (867, to_date('14-02-1992', 'dd-mm-yyyy'), null, 'pam.mac@target.com', null, 867);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (868, to_date('19-08-1971', 'dd-mm-yyyy'), null, 'kenny@nestle.com', null, 868);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (869, to_date('30-09-1991', 'dd-mm-yyyy'), null, 'aimee.houston@capital.fr', null, 869);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (870, to_date('01-11-1987', 'dd-mm-yyyy'), null, 'c.flemyng@hudsonriverbancorp.c', null, 870);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (873, to_date('06-12-1973', 'dd-mm-yyyy'), null, 'bebe.boyle@commworks.com', null, 873);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (874, to_date('19-05-1984', 'dd-mm-yyyy'), null, 'lloyd.h@primussoftware.com', null, 874);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (875, to_date('18-05-2002', 'dd-mm-yyyy'), null, 'lennie.maclachlan@powerlight.p', null, 875);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (876, to_date('21-04-1995', 'dd-mm-yyyy'), null, 'meryl.serbedzija@marketbased.d', null, 876);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (877, to_date('28-08-1976', 'dd-mm-yyyy'), null, 'dionne.trevino@comglobalsystem', null, 877);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (878, to_date('17-08-1992', 'dd-mm-yyyy'), null, 'tanya.phifer@johnkeeler.com', null, 878);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (879, to_date('26-02-1982', 'dd-mm-yyyy'), null, 'leon.weisberg@printcafesoftwar', null, 879);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (880, to_date('26-06-1971', 'dd-mm-yyyy'), null, 'coley@gdatechnologies.com', null, 880);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (881, to_date('08-07-1984', 'dd-mm-yyyy'), null, 'rosco.gleeson@atlanticcredit.j', null, 881);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (884, to_date('04-01-1985', 'dd-mm-yyyy'), null, 'red.ryder@actechnologies.com', null, 884);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (885, to_date('21-01-1979', 'dd-mm-yyyy'), null, 'micky@iss.br', null, 885);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (886, to_date('17-02-1997', 'dd-mm-yyyy'), null, 'chrissie@ads.dk', null, 886);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (887, to_date('24-10-1996', 'dd-mm-yyyy'), null, 'mira.conners@operationaltechno', null, 887);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (888, to_date('09-06-1992', 'dd-mm-yyyy'), null, 'embeth.b@jma.de', null, 888);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (889, to_date('08-07-1972', 'dd-mm-yyyy'), null, 'lindsey.cocker@sis.com', null, 889);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (890, to_date('22-10-1993', 'dd-mm-yyyy'), null, 'al.r@ogi.uk', null, 890);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (893, to_date('25-02-1988', 'dd-mm-yyyy'), null, 'leelee@sci.be', null, 893);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (894, to_date('14-07-1987', 'dd-mm-yyyy'), null, 'caroline.eatworld@max.com', null, 894);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (895, to_date('01-05-2001', 'dd-mm-yyyy'), null, 'lucy.levin@zoneperfectnutritio', null, 895);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (896, to_date('18-01-2000', 'dd-mm-yyyy'), null, 'oro@tripwire.com', null, 896);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (897, to_date('20-11-1972', 'dd-mm-yyyy'), null, 'kfarina@myricom.br', null, 897);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (898, to_date('17-11-1980', 'dd-mm-yyyy'), null, 'j.elizondo@paisley.com', null, 898);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (899, to_date('09-11-1978', 'dd-mm-yyyy'), null, 'gino.waite@atlanticcredit.com', null, 899);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (900, to_date('12-08-1979', 'dd-mm-yyyy'), null, 'danderson@gdatechnologies.com', null, 900);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (901, to_date('23-08-1975', 'dd-mm-yyyy'), null, 'connie.carr@epiqsystems.com', null, 901);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (902, to_date('08-05-2000', 'dd-mm-yyyy'), null, 'kim.matthau@trx.com', null, 902);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (903, to_date('08-06-1992', 'dd-mm-yyyy'), null, 'lena.hiatt@connected.pt', null, 903);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (904, to_date('01-03-1986', 'dd-mm-yyyy'), null, 'g.shorter@pharmafab.jp', null, 904);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (905, to_date('01-04-1984', 'dd-mm-yyyy'), null, 'lennie@horizon.com', null, 905);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (906, to_date('04-12-2001', 'dd-mm-yyyy'), null, 'jamie.stoltz@gltg.de', null, 906);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (907, to_date('05-05-1998', 'dd-mm-yyyy'), null, 'rhys.russell@kmart.com', null, 907);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (908, to_date('30-12-1971', 'dd-mm-yyyy'), null, 'chloe.p@ssi.com', null, 908);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (909, to_date('08-01-1985', 'dd-mm-yyyy'), null, 'suzi.hayes@marketbased.de', null, 909);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (910, to_date('05-12-1999', 'dd-mm-yyyy'), null, 'forest.flanery@ait.jp', null, 910);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (911, to_date('24-08-1979', 'dd-mm-yyyy'), null, 'm.scorsese@ibm.com', null, 911);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (912, to_date('09-11-1994', 'dd-mm-yyyy'), null, 'shannyn.bogguss@sysconmedia.co', null, 912);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (913, to_date('22-09-1994', 'dd-mm-yyyy'), null, 'stellan.maclachlan@bestbuy.ar', null, 913);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (914, to_date('15-03-1975', 'dd-mm-yyyy'), null, 'peabo@mathis.se', null, 914);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (915, to_date('28-07-1997', 'dd-mm-yyyy'), null, 'ivan.l@asapstaffing.com', null, 915);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (916, to_date('23-07-1996', 'dd-mm-yyyy'), null, 'samantha.dale@ipsadvisory.be', null, 916);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (917, to_date('18-10-1994', 'dd-mm-yyyy'), null, 'loreena.cotton@dis.com', null, 917);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (918, to_date('27-05-1973', 'dd-mm-yyyy'), null, 'cheech.f@bps.jp', null, 918);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (919, to_date('20-04-1988', 'dd-mm-yyyy'), null, 'nigel.def@restaurantpartners.z', null, 919);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (920, to_date('21-12-1980', 'dd-mm-yyyy'), null, 'kim.brando@techrx.fr', null, 920);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (921, to_date('27-04-1988', 'dd-mm-yyyy'), null, 'jackie@anworthmortgage.de', null, 921);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (922, to_date('17-10-2000', 'dd-mm-yyyy'), null, 'twalker@aco.uk', null, 922);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (923, to_date('02-10-1983', 'dd-mm-yyyy'), null, 'yolanda.burke@fab.jp', null, 923);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (924, to_date('16-01-1977', 'dd-mm-yyyy'), null, 'rueben.herndon@atlanticnet.com', null, 924);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (925, to_date('06-07-1972', 'dd-mm-yyyy'), null, 'dabney.dourif@prp.de', null, 925);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (926, to_date('04-04-2001', 'dd-mm-yyyy'), null, 'loreena.lloyd@airmethods.uk', null, 926);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (927, to_date('03-12-1983', 'dd-mm-yyyy'), null, 'lesley.oneill@anworthmortgage.', null, 927);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (928, to_date('25-10-1976', 'dd-mm-yyyy'), null, 'lynette.negbaur@marathonheater', null, 928);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (929, to_date('05-04-1995', 'dd-mm-yyyy'), null, 'helen@lms.com', null, 929);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (930, to_date('19-05-1978', 'dd-mm-yyyy'), null, 'jonnyleef@gltg.ar', null, 930);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (931, to_date('23-01-1972', 'dd-mm-yyyy'), null, 'ramsey.burns@americanexpress.c', null, 931);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (932, to_date('19-04-1982', 'dd-mm-yyyy'), null, 'j.cusack@typhoon.au', null, 932);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (933, to_date('14-02-1990', 'dd-mm-yyyy'), null, 'john.tempest@sunstream.de', null, 933);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (934, to_date('26-09-1971', 'dd-mm-yyyy'), null, 'm.sayer@aldensystems.com', null, 934);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (935, to_date('23-08-1987', 'dd-mm-yyyy'), null, 'burton.deltoro@trusecure.nl', null, 935);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (936, to_date('07-10-1998', 'dd-mm-yyyy'), null, 'nicolas.g@adeasolutions.com', null, 936);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (937, to_date('08-01-1977', 'dd-mm-yyyy'), null, 'trini.lang@signalperfection.co', null, 937);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (938, to_date('22-05-1972', 'dd-mm-yyyy'), null, 'rod@morganresearch.com', null, 938);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (939, to_date('01-01-1987', 'dd-mm-yyyy'), null, 'clint.c@microtek.ca', null, 939);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (940, to_date('27-01-1994', 'dd-mm-yyyy'), null, 'bobby.winans@abatix.com', null, 940);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (941, to_date('16-03-1994', 'dd-mm-yyyy'), null, 'neneh.penn@johnson.de', null, 941);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (942, to_date('08-08-1973', 'dd-mm-yyyy'), null, 'bill.ball@cendant.ch', null, 942);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (943, to_date('10-06-1984', 'dd-mm-yyyy'), null, 'kylie@hfg.br', null, 943);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (944, to_date('28-03-1997', 'dd-mm-yyyy'), null, 'jaket@shar.de', null, 944);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (945, to_date('03-01-1999', 'dd-mm-yyyy'), null, 'powers.rosas@team.com', null, 945);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (946, to_date('24-05-1973', 'dd-mm-yyyy'), null, 'lou@amerisourcefunding.com', null, 946);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (947, to_date('30-10-1975', 'dd-mm-yyyy'), null, 'lari.speaks@heartlab.de', null, 947);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (948, to_date('04-02-1980', 'dd-mm-yyyy'), null, 'lou@vspan.com', null, 948);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (949, to_date('07-12-1990', 'dd-mm-yyyy'), null, 'lynn.rea@infovision.de', null, 949);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (950, to_date('11-10-1986', 'dd-mm-yyyy'), null, 'sean.brooke@sfgo.com', null, 950);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (951, to_date('02-03-1978', 'dd-mm-yyyy'), null, 'dustin.archer@americanmegacom.', null, 951);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (952, to_date('17-03-1991', 'dd-mm-yyyy'), null, 'h.aaron@bioreliance.com', null, 952);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (953, to_date('26-10-1978', 'dd-mm-yyyy'), null, 'carrieanne.bell@hardwoodwholes', null, 953);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (954, to_date('09-08-1992', 'dd-mm-yyyy'), null, 'mguest@aoe.com', null, 954);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (955, to_date('27-08-1986', 'dd-mm-yyyy'), null, 'roberta@kingston.ar', null, 955);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (956, to_date('25-02-1978', 'dd-mm-yyyy'), null, 'k.saxon@priorityexpress.jp', null, 956);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (957, to_date('03-10-1998', 'dd-mm-yyyy'), null, 'rawlins.danes@capitolbancorp.c', null, 957);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (958, to_date('03-07-1973', 'dd-mm-yyyy'), null, 'a.davies@volkswagen.com', null, 958);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (959, to_date('22-12-1992', 'dd-mm-yyyy'), null, 'will.hidalgo@naturescure.jp', null, 959);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (960, to_date('26-08-1976', 'dd-mm-yyyy'), null, 'alice.l@gillani.nz', null, 960);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (961, to_date('13-06-1977', 'dd-mm-yyyy'), null, 'jmartinez@usphysicaltherapy.at', null, 961);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (962, to_date('25-05-2000', 'dd-mm-yyyy'), null, 'aimee@boldtechsystems.be', null, 962);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (963, to_date('16-04-1984', 'dd-mm-yyyy'), null, 'carol.downey@dearbornbancorp.j', null, 963);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (964, to_date('16-04-1972', 'dd-mm-yyyy'), null, 'maureen.favreau@bioreference.c', null, 964);
commit;
prompt 900 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (965, to_date('29-08-2001', 'dd-mm-yyyy'), null, 'frank@idas.com', null, 965);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (966, to_date('14-04-1997', 'dd-mm-yyyy'), null, 'neil.cleese@pulaskifinancial.p', null, 966);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (967, to_date('08-10-1990', 'dd-mm-yyyy'), null, 'glofgren@midwestmedia.com', null, 967);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (968, to_date('28-09-2001', 'dd-mm-yyyy'), null, 'larenz@portageenvironmental.ch', null, 968);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (969, to_date('03-08-1977', 'dd-mm-yyyy'), null, 'regina.kline@wrgservices.com', null, 969);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (970, to_date('20-09-1981', 'dd-mm-yyyy'), null, 'amy.wolf@staffforce.com', null, 970);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (971, to_date('12-10-1987', 'dd-mm-yyyy'), null, 'elijah.hanks@ccb.ca', null, 971);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (972, to_date('22-02-1986', 'dd-mm-yyyy'), null, 'debi.h@doctorsassociates.ch', null, 972);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (973, to_date('01-01-1977', 'dd-mm-yyyy'), null, 'will.osbourne@vfs.fr', null, 973);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (974, to_date('27-09-2002', 'dd-mm-yyyy'), null, 'rachael@marathonheater.se', null, 974);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (975, to_date('11-05-1975', 'dd-mm-yyyy'), null, 'jimmie@esteelauder.br', null, 975);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (976, to_date('21-06-1984', 'dd-mm-yyyy'), null, 'grant.aaron@accucode.de', null, 976);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (977, to_date('03-05-1971', 'dd-mm-yyyy'), null, 'betty.winans@conquest.de', null, 977);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (978, to_date('30-07-1989', 'dd-mm-yyyy'), null, 'robby@limitedbrands.com', null, 978);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (979, to_date('18-02-1987', 'dd-mm-yyyy'), null, 'boyd@bis.de', null, 979);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (980, to_date('10-06-1993', 'dd-mm-yyyy'), null, 'donal@y2marketing.com', null, 980);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (981, to_date('06-03-1985', 'dd-mm-yyyy'), null, 'denzel@totalentertainment.it', null, 981);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (982, to_date('01-02-1992', 'dd-mm-yyyy'), null, 'ceili@serentec.com', null, 982);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (983, to_date('07-01-1998', 'dd-mm-yyyy'), null, 'mia.easton@zaiqtechnologies.co', null, 983);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (984, to_date('23-03-1971', 'dd-mm-yyyy'), null, 'laurenm@loreal.com', null, 984);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (985, to_date('24-12-2000', 'dd-mm-yyyy'), null, 'zooey.assante@smartdrawcom.ca', null, 985);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (986, to_date('16-09-1988', 'dd-mm-yyyy'), null, 'quentin.r@nobrainerblindscom.c', null, 986);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (987, to_date('12-06-1990', 'dd-mm-yyyy'), null, 'tia.mulroney@paintedword.com', null, 987);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (988, to_date('08-01-1986', 'dd-mm-yyyy'), null, 'cuba.foxx@smartronix.com', null, 988);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (989, to_date('27-03-1975', 'dd-mm-yyyy'), null, 'juan.pressly@scooterstore.com', null, 989);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (990, to_date('06-10-1977', 'dd-mm-yyyy'), null, 'elisabeth.s@ungertechnologies.', null, 990);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (991, to_date('24-07-1972', 'dd-mm-yyyy'), null, 'carol@kimberlyclark.br', null, 991);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (992, to_date('19-06-1984', 'dd-mm-yyyy'), null, 'lee.m@fiberlink.com', null, 992);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (993, to_date('14-10-2002', 'dd-mm-yyyy'), null, 'karon.gates@baesch.in', null, 993);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (994, to_date('16-04-2001', 'dd-mm-yyyy'), null, 'desmond.fehr@atg.com', null, 994);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (995, to_date('12-05-1996', 'dd-mm-yyyy'), null, 'coconnor@trm.com', null, 995);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (996, to_date('03-01-1993', 'dd-mm-yyyy'), null, 'pelvic@seafoxboat.de', null, 996);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (997, to_date('19-11-2000', 'dd-mm-yyyy'), null, 'armin.thomson@investorstitle.j', null, 997);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (998, to_date('09-05-1972', 'dd-mm-yyyy'), null, 'isabella.ramirez@fiberlink.uk', null, 998);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (999, to_date('16-02-1996', 'dd-mm-yyyy'), null, 'e.marin@bayer.com', null, 999);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (1000, to_date('27-09-1973', 'dd-mm-yyyy'), null, 'kkrumholtz@sfmai.gr', null, 1000);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (118, to_date('07-08-1971', 'dd-mm-yyyy'), null, 'beth.sevenfold@computersource.', null, 118);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (124, to_date('30-09-1998', 'dd-mm-yyyy'), null, 'bswank@printingforlesscom.ca', null, 124);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (130, to_date('13-02-1979', 'dd-mm-yyyy'), null, 'suzy.mirren@ecopy.fr', null, 130);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (131, to_date('23-12-1994', 'dd-mm-yyyy'), null, 'carlos.parm@vitacostcom.com', null, 131);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (141, to_date('18-12-1981', 'dd-mm-yyyy'), null, 'rbrock@tigris.com', null, 141);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (142, to_date('20-08-1995', 'dd-mm-yyyy'), null, 'earl.boyle@usdairyproducers.ca', null, 142);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (151, to_date('22-05-1983', 'dd-mm-yyyy'), null, 'carl.m@ubp.com', null, 151);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (152, to_date('09-11-1971', 'dd-mm-yyyy'), null, 'toshiro.polley@eastmankodak.es', null, 152);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (161, to_date('21-04-1972', 'dd-mm-yyyy'), null, 'alana.woods@exinomtechnologies', null, 161);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (167, to_date('18-12-1988', 'dd-mm-yyyy'), null, 'mark.berry@solutionbuilders.co', null, 167);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (173, to_date('25-03-1997', 'dd-mm-yyyy'), null, 'joshuar@sds.uk', null, 173);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (174, to_date('05-05-1991', 'dd-mm-yyyy'), null, 'rosco.m@hotmail.jp', null, 174);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (182, to_date('07-03-1985', 'dd-mm-yyyy'), null, 'bernard@irissoftware.de', null, 182);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (183, to_date('07-03-1993', 'dd-mm-yyyy'), null, 'trini.r@portageenvironmental.a', null, 183);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (301, to_date('28-07-1989', 'dd-mm-yyyy'), null, 'george.spears@employerservices', null, 301);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (307, to_date('13-07-1992', 'dd-mm-yyyy'), null, 'bobbi.aykroyd@pearllawgroup.co', null, 307);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (313, to_date('12-06-1983', 'dd-mm-yyyy'), null, 'liv.peet@cardinalcartridge.de', null, 313);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (319, to_date('04-01-1976', 'dd-mm-yyyy'), null, 'terrence.crow@cascadebancorp.h', null, 319);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (325, to_date('20-05-2002', 'dd-mm-yyyy'), null, 'suzanne.cruise@elite.es', null, 325);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (326, to_date('10-11-1996', 'dd-mm-yyyy'), null, 'japple@sprint.fi', null, 326);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (335, to_date('06-03-1973', 'dd-mm-yyyy'), null, 'treat.nicholson@clorox.fi', null, 335);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (336, to_date('07-11-1988', 'dd-mm-yyyy'), null, 'w.firth@capital.ca', null, 336);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (345, to_date('09-12-1974', 'dd-mm-yyyy'), null, 'colm.kilmer@dell.fr', null, 345);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (346, to_date('11-10-1979', 'dd-mm-yyyy'), null, 'vondak@nmr.com', null, 346);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (353, to_date('13-06-1988', 'dd-mm-yyyy'), null, 'suzanne.maclachlan@bestever.co', null, 353);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (359, to_date('24-06-1988', 'dd-mm-yyyy'), null, 'louisek@kellogg.jp', null, 359);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (360, to_date('14-03-1982', 'dd-mm-yyyy'), null, 'kirk.copeland@zaiqtechnologies', null, 360);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (480, to_date('14-06-1989', 'dd-mm-yyyy'), null, 'melanie.ifans@wlt.com', null, 480);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (481, to_date('03-07-1987', 'dd-mm-yyyy'), null, 'dougd@base.it', null, 481);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (489, to_date('08-07-1977', 'dd-mm-yyyy'), null, 'mindy@aco.de', null, 489);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (490, to_date('20-05-1989', 'dd-mm-yyyy'), null, 'tzi.loring@capitalautomotive.p', null, 490);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (498, to_date('15-01-1977', 'dd-mm-yyyy'), null, 'val.wincott@exinomtechnologies', null, 498);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (505, to_date('13-11-1988', 'dd-mm-yyyy'), null, 'alannah.shorter@colgatepalmoli', null, 505);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (506, to_date('04-04-2002', 'dd-mm-yyyy'), null, 'ian.midler@berkshirehathaway.c', null, 506);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (517, to_date('16-06-1999', 'dd-mm-yyyy'), null, 'meg@msdw.si', null, 517);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (518, to_date('13-01-1993', 'dd-mm-yyyy'), null, 'ronnie.sedaka@doctorsassociate', null, 518);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (526, to_date('30-12-1975', 'dd-mm-yyyy'), null, 'richiev@wendysinternational.co', null, 526);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (533, to_date('23-11-1989', 'dd-mm-yyyy'), null, 'pete.michael@mag.ch', null, 533);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (534, to_date('25-10-1979', 'dd-mm-yyyy'), null, 'joaquin.yankovic@totalentertai', null, 534);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (656, to_date('17-08-1978', 'dd-mm-yyyy'), null, 'bret.rizzo@mosaic.com', null, 656);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (657, to_date('18-11-1972', 'dd-mm-yyyy'), null, 'n.sellers@cascadebancorp.fr', null, 657);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (666, to_date('09-06-1984', 'dd-mm-yyyy'), null, 'ahmad.lupone@generalmills.nl', null, 666);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (672, to_date('15-05-1970', 'dd-mm-yyyy'), null, 'vendetta@trc.com', null, 672);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (673, to_date('22-05-1971', 'dd-mm-yyyy'), null, 'raul.tanon@paintedword.com', null, 673);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (682, to_date('12-02-1999', 'dd-mm-yyyy'), null, 'hugh.wilkinson@vfs.com', null, 682);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (683, to_date('03-06-1974', 'dd-mm-yyyy'), null, 'sandra.wariner@asapstaffing.jp', null, 683);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (693, to_date('26-03-1991', 'dd-mm-yyyy'), null, 'kylie@contract.ch', null, 693);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (694, to_date('29-10-1999', 'dd-mm-yyyy'), null, 'awakeling@topicsentertainment.', null, 694);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (703, to_date('10-11-1973', 'dd-mm-yyyy'), null, 'campbell.g@trinityhomecare.au', null, 703);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (709, to_date('09-05-1994', 'dd-mm-yyyy'), null, 'rachel@north.au', null, 709);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (710, to_date('15-02-1975', 'dd-mm-yyyy'), null, 'carole@bristolmyers.fi', null, 710);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (718, to_date('02-12-1994', 'dd-mm-yyyy'), null, 'larenz.warwick@circuitcitystor', null, 718);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (835, to_date('05-07-1995', 'dd-mm-yyyy'), null, 'stanley.coltrane@meghasystems.', null, 835);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (841, to_date('05-08-1991', 'dd-mm-yyyy'), null, 'xander.o@signalperfection.uk', null, 841);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (847, to_date('04-06-2000', 'dd-mm-yyyy'), null, 'stellan@max.com', null, 847);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (848, to_date('16-09-1975', 'dd-mm-yyyy'), null, 'natachas@cws.ca', null, 848);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (855, to_date('10-10-1987', 'dd-mm-yyyy'), null, 'loren.playboys@atlanticnet.br', null, 855);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (861, to_date('05-07-1987', 'dd-mm-yyyy'), null, 'pthorton@elite.com', null, 861);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (862, to_date('08-07-2000', 'dd-mm-yyyy'), null, 'elizabeth.monk@telwares.uk', null, 862);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (871, to_date('13-10-2002', 'dd-mm-yyyy'), null, 'h.mcintyre@bowman.de', null, 871);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (872, to_date('24-09-1986', 'dd-mm-yyyy'), null, 'balthazar@solutionbuilders.il', null, 872);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (882, to_date('13-12-1977', 'dd-mm-yyyy'), null, 'gcheadle@gha.com', null, 882);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (883, to_date('26-11-1976', 'dd-mm-yyyy'), null, 'rascal.crosby@gcd.com', null, 883);
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (891, to_date('04-09-1978', 'dd-mm-yyyy'), null, 'adam.vince@fns.uk', null, 891);
commit;
prompt 1000 records committed...
insert into T_EMPLOYEE (emp_id, hire_date, work_phone, work_email, login_id, idperson)
values (892, to_date('14-02-1982', 'dd-mm-yyyy'), null, 'kazem.reeve@wendysinternationa', null, 892);
commit;
prompt 1001 records loaded
prompt Loading T_EMPROLE...
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (5011, 2110, 3011, 35268);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (1, 4295, 5011, 23800);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (2, 9095, 5012, 23930);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (280, 2110, 3011, 37202);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (378, 4295, 4751, 28226);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (525, 9095, 2770, 38687);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (648, 9095, 2770, 35832);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (735, 9095, 2770, 30670);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (418, 9095, 2770, 20159);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (785, 4295, 4751, 25339);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (893, 2110, 3011, 22306);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (930, 2110, 3011, 29521);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (869, 2110, 3011, 37896);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (673, 3601, 4307, 12550);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (298, 3601, 4307, 28026);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (897, 3601, 4307, 10416);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (210, 3601, 4307, 35274);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (873, 3601, 4307, 20613);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (397, 3601, 4307, 23007);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (923, 3601, 4307, 17194);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (548, 3601, 4307, 14319);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (831, 3601, 4307, 29512);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (93, 4295, 4751, 32050);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (499, 4295, 4751, 10527);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (467, 4295, 4751, 39078);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (92, 4295, 4751, 22639);
insert into T_EMPROLE (emp_id, role_id, dept_id, sal_val)
values (918, 4295, 4751, 26664);
commit;
prompt 27 records loaded
prompt Loading T_JOB_REVIEW...
insert into T_JOB_REVIEW (job_id, start_date, end_date, progress, dept_id, role_id, emp_id, proj_name)
values (312, to_date('01-01-2018', 'dd-mm-yyyy'), to_date('02-03-2018', 'dd-mm-yyyy'), 'confirm the covid', 3011, 2110, 5011, 'jojo');
insert into T_JOB_REVIEW (job_id, start_date, end_date, progress, dept_id, role_id, emp_id, proj_name)
values (313, to_date('01-01-2002', 'dd-mm-yyyy'), to_date('02-03-2002', 'dd-mm-yyyy'), 'finish the project', 5012, 9095, 2, 'lala');
commit;
prompt 2 records loaded
prompt Loading T_PURCHASINGWORKER...
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2580, 1, 501);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (59, 2, 502);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3323, 3, 503);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1994, 4, 504);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (396, 5, 505);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2606, 6, 506);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1924, 7, 507);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4900, 8, 508);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9502, 9, 509);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8093, 10, 510);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6955, 11, 511);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1680, 12, 512);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3222, 13, 513);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6471, 14, 514);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7286, 15, 515);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1179, 16, 516);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3700, 17, 517);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2378, 18, 518);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9614, 19, 519);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3726, 20, 520);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9552, 21, 521);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7592, 22, 522);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2324, 23, 523);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8466, 24, 524);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (876, 25, 525);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7824, 26, 526);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6592, 27, 527);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3976, 28, 528);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1811, 29, 529);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1921, 30, 530);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6835, 31, 531);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1590, 32, 532);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2623, 33, 533);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4550, 34, 534);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8002, 35, 535);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2499, 36, 536);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8650, 37, 537);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2477, 38, 538);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1912, 39, 539);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7562, 40, 540);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8184, 41, 541);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3046, 42, 542);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1034, 43, 543);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (496, 44, 544);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7795, 45, 545);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6546, 46, 546);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1108, 47, 547);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3475, 48, 548);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6409, 49, 549);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1474, 50, 550);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1313, 51, 551);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7106, 52, 552);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7111, 53, 553);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2492, 54, 554);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2783, 55, 555);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2513, 56, 556);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7313, 57, 557);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2377, 58, 558);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5253, 59, 559);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6609, 60, 560);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6850, 61, 561);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6263, 62, 562);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1866, 63, 563);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1357, 64, 564);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4329, 65, 565);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9582, 66, 566);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1812, 67, 567);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4836, 68, 568);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1515, 69, 569);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8793, 70, 570);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1612, 71, 571);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6790, 72, 572);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5868, 73, 573);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5309, 74, 574);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4052, 75, 575);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6276, 76, 576);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1512, 77, 577);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2613, 78, 578);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5555, 79, 579);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2905, 80, 580);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7469, 81, 581);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6475, 82, 582);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1494, 83, 583);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1078, 84, 584);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5307, 85, 585);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8456, 86, 586);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9465, 87, 587);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7412, 88, 588);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3561, 89, 589);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2205, 90, 590);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1574, 91, 591);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1562, 92, 592);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1280, 93, 593);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2860, 94, 594);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3205, 95, 595);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9140, 96, 596);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9121, 97, 597);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (230, 98, 598);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1797, 99, 599);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9421, 100, 600);
commit;
prompt 100 records committed...
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9188, 101, 601);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4181, 102, 602);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2289, 103, 603);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4547, 104, 604);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2119, 105, 605);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4004, 106, 606);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1496, 107, 607);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2728, 108, 608);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2811, 109, 609);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (191, 110, 610);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (234, 111, 611);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4527, 112, 612);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4589, 113, 613);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9599, 114, 614);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3689, 115, 615);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2147, 116, 616);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (921, 117, 617);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4394, 118, 618);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (122, 119, 619);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1611, 120, 620);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5276, 121, 621);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2617, 122, 622);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7032, 123, 623);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8434, 124, 624);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9726, 125, 625);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3420, 126, 626);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6548, 127, 627);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6482, 128, 628);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1092, 129, 629);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4601, 130, 630);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7677, 131, 631);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9243, 132, 632);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4933, 133, 633);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3442, 134, 634);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7685, 135, 635);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5270, 136, 636);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8878, 137, 637);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (630, 138, 638);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1130, 139, 639);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5737, 140, 640);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2903, 141, 641);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7279, 142, 642);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6835, 143, 643);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5970, 144, 644);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7855, 145, 645);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5536, 146, 646);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3904, 147, 647);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9490, 148, 648);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3109, 149, 649);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1397, 150, 650);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4485, 151, 651);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5637, 152, 652);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (882, 153, 653);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1401, 154, 654);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5876, 155, 655);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9695, 156, 656);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9787, 157, 657);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2325, 158, 658);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (169, 159, 659);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7102, 160, 660);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6416, 161, 661);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3772, 162, 662);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1847, 163, 663);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9669, 164, 664);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4095, 165, 665);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4054, 166, 666);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4217, 167, 667);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5973, 168, 668);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (958, 169, 669);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9062, 170, 670);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3292, 171, 671);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3961, 172, 672);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5376, 173, 673);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4643, 174, 674);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9914, 175, 675);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7341, 176, 676);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (123, 177, 677);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1355, 178, 678);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (620, 179, 679);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4959, 180, 680);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3700, 181, 681);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3129, 182, 682);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5258, 183, 683);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2888, 184, 684);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1084, 185, 685);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8718, 186, 686);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4634, 187, 687);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (191, 188, 688);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1335, 189, 689);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6335, 190, 690);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4515, 191, 691);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7395, 192, 692);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4237, 193, 693);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1100, 194, 694);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8776, 195, 695);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8639, 196, 696);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4693, 197, 697);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5967, 198, 698);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (575, 199, 699);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6142, 200, 700);
commit;
prompt 200 records committed...
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5152, 201, 701);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6047, 202, 702);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (895, 203, 703);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8338, 204, 704);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6390, 205, 705);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5230, 206, 706);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6408, 207, 707);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1321, 208, 708);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6329, 209, 709);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6599, 210, 710);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4698, 211, 711);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2584, 212, 712);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6902, 213, 713);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5830, 214, 714);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7420, 215, 715);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8941, 216, 716);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9160, 217, 717);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7502, 218, 718);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2404, 219, 719);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6948, 220, 720);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6523, 221, 721);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4881, 222, 722);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2910, 223, 723);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6228, 224, 724);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5879, 225, 725);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2413, 226, 726);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5908, 227, 727);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6570, 228, 728);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7219, 229, 729);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1708, 230, 730);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7928, 231, 731);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7740, 232, 732);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1221, 233, 733);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (508, 234, 734);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9128, 235, 735);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2573, 236, 736);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4582, 237, 737);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4661, 238, 738);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5627, 239, 739);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2868, 240, 740);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4380, 241, 741);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3583, 242, 742);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9667, 243, 743);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8969, 244, 744);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9494, 245, 745);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8213, 246, 746);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8523, 247, 747);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2244, 248, 748);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1159, 249, 749);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2965, 250, 750);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (765, 251, 751);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9961, 252, 752);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (473, 253, 753);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9671, 254, 754);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (949, 255, 755);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4946, 256, 756);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5336, 257, 757);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6118, 258, 758);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2864, 259, 759);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6352, 260, 760);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4740, 261, 761);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6080, 262, 762);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (314, 263, 763);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5305, 264, 764);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1108, 265, 765);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3845, 266, 766);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6054, 267, 767);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2554, 268, 768);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1065, 269, 769);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1031, 270, 770);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9457, 271, 771);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9613, 272, 772);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4360, 273, 773);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6801, 274, 774);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1633, 275, 775);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3490, 276, 776);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (830, 277, 777);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1567, 278, 778);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8599, 279, 779);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3324, 280, 780);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5112, 281, 781);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2794, 282, 782);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3767, 283, 783);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1599, 284, 784);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (385, 285, 785);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5189, 286, 786);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6709, 287, 787);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7368, 288, 788);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8979, 289, 789);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3192, 290, 790);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1838, 291, 791);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3450, 292, 792);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2700, 293, 793);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6658, 294, 794);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3754, 295, 795);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5749, 296, 796);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9327, 297, 797);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (230, 298, 798);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1912, 299, 799);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6839, 300, 800);
commit;
prompt 300 records committed...
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9326, 301, 801);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4811, 302, 802);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2456, 303, 803);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1860, 304, 804);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8929, 305, 805);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3520, 306, 806);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8782, 307, 807);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7601, 308, 808);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2444, 309, 809);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9358, 310, 810);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (248, 311, 811);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5480, 312, 812);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2019, 313, 813);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7249, 314, 814);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8035, 315, 815);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6414, 316, 816);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6135, 317, 817);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8092, 318, 818);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1033, 319, 819);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9887, 320, 820);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5855, 321, 821);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6892, 322, 822);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7501, 323, 823);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5707, 324, 824);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9019, 325, 825);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3395, 326, 826);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7136, 327, 827);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8561, 328, 828);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3167, 329, 829);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6014, 330, 830);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9415, 331, 831);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6563, 332, 832);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5725, 333, 833);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9146, 334, 834);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1361, 335, 835);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1992, 336, 836);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3418, 337, 837);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3283, 338, 838);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2368, 339, 839);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5631, 340, 840);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8641, 341, 841);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8023, 342, 842);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8254, 343, 843);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4487, 344, 844);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5059, 345, 845);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9167, 346, 846);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2769, 347, 847);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1924, 348, 848);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (268, 349, 849);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7813, 350, 850);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6848, 351, 851);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1472, 352, 852);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7286, 353, 853);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3246, 354, 854);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7195, 355, 855);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3636, 356, 856);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4387, 357, 857);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8617, 358, 858);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1827, 359, 859);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5802, 360, 860);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1994, 361, 861);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (418, 362, 862);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4151, 363, 863);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5235, 364, 864);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8700, 365, 865);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9656, 366, 866);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5584, 367, 867);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5167, 368, 868);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5338, 369, 869);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8206, 370, 870);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5625, 371, 871);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4182, 372, 872);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6298, 373, 873);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6177, 374, 874);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (467, 375, 875);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8497, 376, 876);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (183, 377, 877);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3857, 378, 878);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9348, 379, 879);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7729, 380, 880);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7413, 381, 881);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6160, 382, 882);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9949, 383, 883);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3268, 384, 884);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7267, 385, 885);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (560, 386, 886);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (641, 387, 887);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (128, 388, 888);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1673, 389, 889);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7425, 390, 890);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1470, 391, 891);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1910, 392, 892);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7849, 393, 893);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4742, 394, 894);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3783, 395, 895);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8840, 396, 896);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9464, 397, 897);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4436, 398, 898);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7107, 399, 899);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9014, 400, 900);
commit;
prompt 400 records committed...
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4972, 401, 901);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3081, 402, 902);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4659, 403, 903);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2433, 404, 904);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4574, 405, 905);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5009, 406, 906);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6618, 407, 907);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8333, 408, 908);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5521, 409, 909);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8908, 410, 910);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2119, 411, 911);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6299, 412, 912);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5167, 413, 913);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7417, 414, 914);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8509, 415, 915);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9193, 416, 916);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2268, 417, 917);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9614, 418, 918);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9834, 419, 919);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (551, 420, 920);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6322, 421, 921);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7197, 422, 922);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2380, 423, 923);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3798, 424, 924);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5444, 425, 925);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3159, 426, 926);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8652, 427, 927);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6037, 428, 928);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1700, 429, 929);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3958, 430, 930);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (391, 431, 931);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3740, 432, 932);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4979, 433, 933);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4877, 434, 934);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7854, 435, 935);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2037, 436, 936);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5199, 437, 937);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8183, 438, 938);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9411, 439, 939);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7195, 440, 940);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2072, 441, 941);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4778, 442, 942);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7412, 443, 943);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2381, 444, 944);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3304, 445, 945);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8440, 446, 946);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3176, 447, 947);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5740, 448, 948);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1138, 449, 949);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4062, 450, 950);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9743, 451, 951);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2844, 452, 952);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6450, 453, 953);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7884, 454, 954);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3350, 455, 955);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1054, 456, 956);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1770, 457, 957);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2117, 458, 958);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1767, 459, 959);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7760, 460, 960);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1374, 461, 961);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1366, 462, 962);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2172, 463, 963);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1826, 464, 964);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (592, 465, 965);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3334, 466, 966);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6264, 467, 967);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7124, 468, 968);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2478, 469, 969);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2039, 470, 970);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3924, 471, 971);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (859, 472, 972);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3016, 473, 973);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4105, 474, 974);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4524, 475, 975);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3198, 476, 976);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4174, 477, 977);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8563, 478, 978);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6974, 479, 979);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1679, 480, 980);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5297, 481, 981);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9534, 482, 982);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7513, 483, 983);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7424, 484, 984);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2550, 485, 985);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2012, 486, 986);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5645, 487, 987);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (5540, 488, 988);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (6294, 489, 989);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (641, 490, 990);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8221, 491, 991);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7620, 492, 992);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (7122, 493, 993);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (2181, 494, 994);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (1961, 495, 995);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (8329, 496, 996);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (9321, 497, 997);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (572, 498, 998);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (3323, 499, 999);
insert into T_PURCHASINGWORKER (purchasingbudget, purchasingworkerid, emp_id)
values (4493, 500, 1000);
commit;
prompt 500 records loaded
prompt Loading T_PURCHASE...
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (2, to_date('21-03-2018', 'dd-mm-yyyy'), 9005, 2);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (3, to_date('01-02-2021', 'dd-mm-yyyy'), 2289, 3);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (5, to_date('12-06-2020', 'dd-mm-yyyy'), 396, 5);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (7, to_date('23-02-2021', 'dd-mm-yyyy'), 1326, 7);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (8, to_date('28-06-2019', 'dd-mm-yyyy'), 4900, 8);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (11, to_date('01-05-2021', 'dd-mm-yyyy'), 4792, 11);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (12, to_date('21-11-2020', 'dd-mm-yyyy'), 1680, 12);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (13, to_date('29-02-2016', 'dd-mm-yyyy'), 3222, 13);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (14, to_date('24-12-2020', 'dd-mm-yyyy'), 6471, 14);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (15, to_date('24-06-2020', 'dd-mm-yyyy'), 7286, 15);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (16, to_date('14-07-2020', 'dd-mm-yyyy'), 1179, 16);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (17, to_date('21-03-2019', 'dd-mm-yyyy'), 3700, 17);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (19, to_date('25-06-2018', 'dd-mm-yyyy'), 9614, 19);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (20, to_date('10-12-2019', 'dd-mm-yyyy'), 3726, 20);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (21, to_date('15-08-2018', 'dd-mm-yyyy'), 9552, 21);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (22, to_date('11-06-2019', 'dd-mm-yyyy'), 7592, 22);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (23, to_date('17-03-2020', 'dd-mm-yyyy'), 2324, 23);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (24, to_date('18-05-2018', 'dd-mm-yyyy'), 8466, 24);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (25, to_date('24-11-2017', 'dd-mm-yyyy'), 876, 25);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (26, to_date('27-05-2020', 'dd-mm-yyyy'), 7824, 26);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (27, to_date('01-07-2019', 'dd-mm-yyyy'), 6592, 27);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (29, to_date('16-06-2020', 'dd-mm-yyyy'), 1811, 29);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (30, to_date('07-03-2018', 'dd-mm-yyyy'), 1921, 30);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (31, to_date('23-03-2020', 'dd-mm-yyyy'), 6835, 31);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (32, to_date('29-05-2018', 'dd-mm-yyyy'), 1590, 32);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (33, to_date('12-05-2018', 'dd-mm-yyyy'), 2623, 33);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (34, to_date('26-12-2020', 'dd-mm-yyyy'), 4550, 34);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (35, to_date('04-07-2017', 'dd-mm-yyyy'), 8002, 35);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (36, to_date('24-09-2020', 'dd-mm-yyyy'), 2499, 36);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (37, to_date('27-02-2020', 'dd-mm-yyyy'), 8650, 37);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (38, to_date('27-07-2018', 'dd-mm-yyyy'), 2477, 38);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (39, to_date('05-12-2017', 'dd-mm-yyyy'), 1912, 39);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (40, to_date('15-01-2018', 'dd-mm-yyyy'), 7562, 40);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (41, to_date('22-08-2019', 'dd-mm-yyyy'), 8184, 41);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (42, to_date('19-03-2017', 'dd-mm-yyyy'), 3046, 42);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (43, to_date('23-03-2016', 'dd-mm-yyyy'), 1034, 43);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (44, to_date('02-02-2021', 'dd-mm-yyyy'), 284, 44);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (45, to_date('27-02-2019', 'dd-mm-yyyy'), 7795, 45);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (46, to_date('10-04-2018', 'dd-mm-yyyy'), 6546, 46);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (47, to_date('01-03-2016', 'dd-mm-yyyy'), 1108, 47);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (48, to_date('15-09-2016', 'dd-mm-yyyy'), 3475, 48);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (49, to_date('07-09-2019', 'dd-mm-yyyy'), 6409, 49);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (50, to_date('06-09-2017', 'dd-mm-yyyy'), 1474, 50);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (51, to_date('15-03-2018', 'dd-mm-yyyy'), 1313, 51);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (52, to_date('16-05-2020', 'dd-mm-yyyy'), 7106, 52);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (55, to_date('03-05-2020', 'dd-mm-yyyy'), 2783, 55);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (58, to_date('24-01-2019', 'dd-mm-yyyy'), 2377, 58);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (59, to_date('02-10-2016', 'dd-mm-yyyy'), 5253, 59);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (60, to_date('19-03-2017', 'dd-mm-yyyy'), 6609, 60);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (61, to_date('15-02-2018', 'dd-mm-yyyy'), 6850, 61);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (62, to_date('27-10-2016', 'dd-mm-yyyy'), 6263, 62);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (63, to_date('27-12-2019', 'dd-mm-yyyy'), 1866, 63);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (64, to_date('20-01-2017', 'dd-mm-yyyy'), 1357, 64);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (65, to_date('26-02-2021', 'dd-mm-yyyy'), 2475, 65);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (66, to_date('03-02-2016', 'dd-mm-yyyy'), 9582, 66);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (67, to_date('17-11-2018', 'dd-mm-yyyy'), 1812, 67);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (68, to_date('18-08-2016', 'dd-mm-yyyy'), 4836, 68);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (69, to_date('26-11-2019', 'dd-mm-yyyy'), 1515, 69);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (70, to_date('18-07-2020', 'dd-mm-yyyy'), 8793, 70);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (72, to_date('25-08-2019', 'dd-mm-yyyy'), 6790, 72);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (73, to_date('27-11-2017', 'dd-mm-yyyy'), 5868, 73);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (74, to_date('27-09-2016', 'dd-mm-yyyy'), 5309, 74);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (75, to_date('13-07-2016', 'dd-mm-yyyy'), 4052, 75);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (76, to_date('13-05-2019', 'dd-mm-yyyy'), 6276, 76);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (77, to_date('16-10-2018', 'dd-mm-yyyy'), 1512, 77);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (78, to_date('18-03-2017', 'dd-mm-yyyy'), 2613, 78);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (79, to_date('27-12-2016', 'dd-mm-yyyy'), 5555, 79);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (80, to_date('15-04-2017', 'dd-mm-yyyy'), 2905, 80);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (81, to_date('27-11-2018', 'dd-mm-yyyy'), 7469, 81);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (82, to_date('28-01-2016', 'dd-mm-yyyy'), 6475, 82);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (83, to_date('13-11-2019', 'dd-mm-yyyy'), 1494, 83);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (84, to_date('25-05-2016', 'dd-mm-yyyy'), 1078, 84);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (85, to_date('21-05-2018', 'dd-mm-yyyy'), 5307, 85);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (86, to_date('05-04-2017', 'dd-mm-yyyy'), 8456, 86);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (87, to_date('20-02-2017', 'dd-mm-yyyy'), 9465, 87);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (89, to_date('02-08-2019', 'dd-mm-yyyy'), 3561, 89);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (90, to_date('04-08-2016', 'dd-mm-yyyy'), 2205, 90);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (91, to_date('09-03-2018', 'dd-mm-yyyy'), 1574, 91);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (92, to_date('14-08-2019', 'dd-mm-yyyy'), 1562, 92);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (93, to_date('19-02-2018', 'dd-mm-yyyy'), 1280, 93);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (94, to_date('30-04-2020', 'dd-mm-yyyy'), 2860, 94);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (95, to_date('22-09-2017', 'dd-mm-yyyy'), 3205, 95);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (96, to_date('07-08-2016', 'dd-mm-yyyy'), 9140, 96);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (97, to_date('10-07-2017', 'dd-mm-yyyy'), 9121, 97);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (98, to_date('26-07-2017', 'dd-mm-yyyy'), 230, 98);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (99, to_date('06-05-2018', 'dd-mm-yyyy'), 1797, 99);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (100, to_date('08-03-2020', 'dd-mm-yyyy'), 9421, 100);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (101, to_date('08-10-2020', 'dd-mm-yyyy'), 9188, 101);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (102, to_date('01-02-2020', 'dd-mm-yyyy'), 4181, 102);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (103, to_date('25-09-2019', 'dd-mm-yyyy'), 2289, 103);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (104, to_date('17-04-2017', 'dd-mm-yyyy'), 4547, 104);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (106, to_date('22-11-2019', 'dd-mm-yyyy'), 4004, 106);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (108, to_date('06-03-2019', 'dd-mm-yyyy'), 2728, 108);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (109, to_date('18-01-2019', 'dd-mm-yyyy'), 2811, 109);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (110, to_date('26-05-2019', 'dd-mm-yyyy'), 191, 110);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (111, to_date('10-09-2016', 'dd-mm-yyyy'), 234, 111);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (112, to_date('26-09-2020', 'dd-mm-yyyy'), 4527, 112);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (113, to_date('01-10-2019', 'dd-mm-yyyy'), 4589, 113);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (115, to_date('03-09-2018', 'dd-mm-yyyy'), 3689, 115);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (117, to_date('08-09-2018', 'dd-mm-yyyy'), 921, 117);
commit;
prompt 100 records committed...
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (118, to_date('12-09-2019', 'dd-mm-yyyy'), 4394, 118);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (119, to_date('05-08-2017', 'dd-mm-yyyy'), 122, 119);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (121, to_date('03-04-2019', 'dd-mm-yyyy'), 5276, 121);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (122, to_date('30-08-2017', 'dd-mm-yyyy'), 2617, 122);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (126, to_date('19-08-2020', 'dd-mm-yyyy'), 3420, 126);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (127, to_date('26-02-2018', 'dd-mm-yyyy'), 6548, 127);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (128, to_date('25-02-2016', 'dd-mm-yyyy'), 6482, 128);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (130, to_date('31-01-2020', 'dd-mm-yyyy'), 4601, 130);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (131, to_date('25-11-2016', 'dd-mm-yyyy'), 7677, 131);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (132, to_date('30-04-2020', 'dd-mm-yyyy'), 9243, 132);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (133, to_date('21-12-2019', 'dd-mm-yyyy'), 4933, 133);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (134, to_date('08-10-2019', 'dd-mm-yyyy'), 3442, 134);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (135, to_date('29-07-2018', 'dd-mm-yyyy'), 7685, 135);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (136, to_date('22-09-2020', 'dd-mm-yyyy'), 5270, 136);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (137, to_date('03-06-2016', 'dd-mm-yyyy'), 8878, 137);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (138, to_date('01-07-2016', 'dd-mm-yyyy'), 630, 138);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (139, to_date('16-08-2018', 'dd-mm-yyyy'), 1130, 139);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (140, to_date('15-02-2020', 'dd-mm-yyyy'), 5737, 140);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (141, to_date('18-01-2020', 'dd-mm-yyyy'), 2903, 141);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (143, to_date('21-08-2020', 'dd-mm-yyyy'), 6835, 143);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (144, to_date('26-06-2016', 'dd-mm-yyyy'), 5970, 144);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (146, to_date('22-03-2016', 'dd-mm-yyyy'), 5536, 146);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (147, to_date('07-04-2016', 'dd-mm-yyyy'), 3904, 147);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (148, to_date('30-10-2016', 'dd-mm-yyyy'), 9490, 148);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (149, to_date('12-09-2017', 'dd-mm-yyyy'), 3109, 149);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (150, to_date('20-04-2016', 'dd-mm-yyyy'), 1397, 150);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (151, to_date('20-08-2019', 'dd-mm-yyyy'), 4485, 151);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (152, to_date('07-06-2020', 'dd-mm-yyyy'), 5637, 152);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (154, to_date('30-11-2017', 'dd-mm-yyyy'), 1401, 154);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (155, to_date('04-12-2016', 'dd-mm-yyyy'), 5876, 155);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (157, to_date('13-03-2019', 'dd-mm-yyyy'), 9787, 157);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (159, to_date('13-12-2016', 'dd-mm-yyyy'), 169, 159);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (161, to_date('12-08-2016', 'dd-mm-yyyy'), 6416, 161);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (162, to_date('07-08-2019', 'dd-mm-yyyy'), 3772, 162);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (163, to_date('06-11-2016', 'dd-mm-yyyy'), 1847, 163);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (164, to_date('18-08-2017', 'dd-mm-yyyy'), 9669, 164);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (165, to_date('02-01-2016', 'dd-mm-yyyy'), 4095, 165);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (166, to_date('18-04-2018', 'dd-mm-yyyy'), 4054, 166);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (169, to_date('13-06-2020', 'dd-mm-yyyy'), 958, 169);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (170, to_date('03-05-2018', 'dd-mm-yyyy'), 9062, 170);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (171, to_date('09-03-2019', 'dd-mm-yyyy'), 3292, 171);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (172, to_date('02-12-2017', 'dd-mm-yyyy'), 3961, 172);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (173, to_date('11-01-2018', 'dd-mm-yyyy'), 5376, 173);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (174, to_date('08-08-2020', 'dd-mm-yyyy'), 4643, 174);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (175, to_date('26-12-2019', 'dd-mm-yyyy'), 9914, 175);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (176, to_date('23-01-2021', 'dd-mm-yyyy'), 4197, 176);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (177, to_date('11-05-2018', 'dd-mm-yyyy'), 123, 177);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (178, to_date('24-03-2020', 'dd-mm-yyyy'), 1355, 178);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (179, to_date('02-10-2020', 'dd-mm-yyyy'), 620, 179);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (180, to_date('12-03-2017', 'dd-mm-yyyy'), 4959, 180);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (181, to_date('27-09-2019', 'dd-mm-yyyy'), 3700, 181);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (183, to_date('30-04-2017', 'dd-mm-yyyy'), 5258, 183);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (185, to_date('09-07-2020', 'dd-mm-yyyy'), 1084, 185);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (186, to_date('10-06-2019', 'dd-mm-yyyy'), 8718, 186);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (188, to_date('15-08-2020', 'dd-mm-yyyy'), 191, 188);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (189, to_date('23-11-2017', 'dd-mm-yyyy'), 1335, 189);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (190, to_date('07-10-2016', 'dd-mm-yyyy'), 6335, 190);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (191, to_date('01-04-2016', 'dd-mm-yyyy'), 4515, 191);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (192, to_date('23-02-2018', 'dd-mm-yyyy'), 7395, 192);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (194, to_date('13-07-2018', 'dd-mm-yyyy'), 1100, 194);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (195, to_date('09-08-2016', 'dd-mm-yyyy'), 8776, 195);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (196, to_date('06-02-2019', 'dd-mm-yyyy'), 8639, 196);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (197, to_date('29-12-2018', 'dd-mm-yyyy'), 4693, 197);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (198, to_date('29-10-2020', 'dd-mm-yyyy'), 5967, 198);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (199, to_date('18-07-2020', 'dd-mm-yyyy'), 575, 199);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (200, to_date('02-03-2018', 'dd-mm-yyyy'), 6142, 200);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (201, to_date('13-04-2020', 'dd-mm-yyyy'), 5152, 201);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (203, to_date('15-01-2019', 'dd-mm-yyyy'), 895, 203);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (204, to_date('27-11-2019', 'dd-mm-yyyy'), 8338, 204);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (205, to_date('10-11-2020', 'dd-mm-yyyy'), 6390, 205);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (206, to_date('18-12-2018', 'dd-mm-yyyy'), 5230, 206);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (208, to_date('26-02-2016', 'dd-mm-yyyy'), 1321, 208);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (209, to_date('22-12-2017', 'dd-mm-yyyy'), 6329, 209);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (210, to_date('06-03-2020', 'dd-mm-yyyy'), 6599, 210);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (211, to_date('14-11-2020', 'dd-mm-yyyy'), 4698, 211);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (213, to_date('29-01-2020', 'dd-mm-yyyy'), 6902, 213);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (214, to_date('11-07-2016', 'dd-mm-yyyy'), 5830, 214);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (218, to_date('16-06-2020', 'dd-mm-yyyy'), 7502, 218);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (219, to_date('02-01-2016', 'dd-mm-yyyy'), 2404, 219);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (220, to_date('26-10-2018', 'dd-mm-yyyy'), 6948, 220);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (221, to_date('26-05-2019', 'dd-mm-yyyy'), 6523, 221);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (222, to_date('25-05-2018', 'dd-mm-yyyy'), 4881, 222);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (223, to_date('22-06-2019', 'dd-mm-yyyy'), 2910, 223);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (226, to_date('02-08-2020', 'dd-mm-yyyy'), 2413, 226);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (227, to_date('18-01-2021', 'dd-mm-yyyy'), 3378, 227);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (228, to_date('21-07-2017', 'dd-mm-yyyy'), 6570, 228);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (229, to_date('11-09-2019', 'dd-mm-yyyy'), 7219, 229);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (230, to_date('29-04-2018', 'dd-mm-yyyy'), 1708, 230);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (232, to_date('26-06-2017', 'dd-mm-yyyy'), 7740, 232);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (234, to_date('16-12-2018', 'dd-mm-yyyy'), 508, 234);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (235, to_date('22-10-2020', 'dd-mm-yyyy'), 9128, 235);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (236, to_date('19-03-2019', 'dd-mm-yyyy'), 2573, 236);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (237, to_date('12-01-2017', 'dd-mm-yyyy'), 4582, 237);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (238, to_date('06-04-2019', 'dd-mm-yyyy'), 4661, 238);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (241, to_date('26-09-2017', 'dd-mm-yyyy'), 4380, 241);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (242, to_date('04-06-2020', 'dd-mm-yyyy'), 3583, 242);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (243, to_date('24-12-2016', 'dd-mm-yyyy'), 9667, 243);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (245, to_date('11-06-2020', 'dd-mm-yyyy'), 9494, 245);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (247, to_date('12-07-2018', 'dd-mm-yyyy'), 8523, 247);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (251, to_date('10-02-2020', 'dd-mm-yyyy'), 765, 251);
commit;
prompt 200 records committed...
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (252, to_date('22-07-2016', 'dd-mm-yyyy'), 9961, 252);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (253, to_date('06-01-2018', 'dd-mm-yyyy'), 473, 253);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (254, to_date('03-02-2018', 'dd-mm-yyyy'), 9671, 254);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (255, to_date('04-01-2021', 'dd-mm-yyyy'), 543, 255);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (257, to_date('28-02-2019', 'dd-mm-yyyy'), 5336, 257);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (259, to_date('08-11-2020', 'dd-mm-yyyy'), 2864, 259);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (260, to_date('03-06-2017', 'dd-mm-yyyy'), 6352, 260);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (261, to_date('25-06-2020', 'dd-mm-yyyy'), 4740, 261);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (262, to_date('10-07-2018', 'dd-mm-yyyy'), 6080, 262);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (263, to_date('17-08-2016', 'dd-mm-yyyy'), 314, 263);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (265, to_date('21-10-2018', 'dd-mm-yyyy'), 1108, 265);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (268, to_date('07-08-2020', 'dd-mm-yyyy'), 2554, 268);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (269, to_date('29-12-2016', 'dd-mm-yyyy'), 1065, 269);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (270, to_date('29-03-2019', 'dd-mm-yyyy'), 1031, 270);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (272, to_date('25-06-2019', 'dd-mm-yyyy'), 9613, 272);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (273, to_date('17-08-2016', 'dd-mm-yyyy'), 4360, 273);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (274, to_date('13-04-2016', 'dd-mm-yyyy'), 6801, 274);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (275, to_date('21-01-2021', 'dd-mm-yyyy'), 934, 275);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (276, to_date('23-07-2016', 'dd-mm-yyyy'), 3490, 276);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (277, to_date('12-09-2018', 'dd-mm-yyyy'), 830, 277);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (278, to_date('21-11-2017', 'dd-mm-yyyy'), 1567, 278);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (279, to_date('14-08-2016', 'dd-mm-yyyy'), 8599, 279);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (280, to_date('14-04-2016', 'dd-mm-yyyy'), 3324, 280);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (282, to_date('22-04-2020', 'dd-mm-yyyy'), 2794, 282);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (284, to_date('27-03-2019', 'dd-mm-yyyy'), 1599, 284);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (285, to_date('03-09-2019', 'dd-mm-yyyy'), 385, 285);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (287, to_date('16-07-2016', 'dd-mm-yyyy'), 6709, 287);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (288, to_date('14-04-2016', 'dd-mm-yyyy'), 7368, 288);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (289, to_date('15-04-2018', 'dd-mm-yyyy'), 8979, 289);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (290, to_date('14-03-2019', 'dd-mm-yyyy'), 3192, 290);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (292, to_date('07-04-2019', 'dd-mm-yyyy'), 3450, 292);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (294, to_date('17-02-2020', 'dd-mm-yyyy'), 6658, 294);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (296, to_date('21-08-2019', 'dd-mm-yyyy'), 5749, 296);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (297, to_date('10-02-2016', 'dd-mm-yyyy'), 9327, 297);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (298, to_date('05-11-2017', 'dd-mm-yyyy'), 230, 298);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (299, to_date('08-01-2016', 'dd-mm-yyyy'), 1912, 299);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (300, to_date('16-10-2019', 'dd-mm-yyyy'), 6839, 300);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (301, to_date('26-12-2016', 'dd-mm-yyyy'), 9326, 301);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (303, to_date('29-06-2020', 'dd-mm-yyyy'), 2456, 303);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (304, to_date('09-03-2018', 'dd-mm-yyyy'), 1860, 304);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (305, to_date('05-02-2020', 'dd-mm-yyyy'), 8929, 305);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (307, to_date('19-07-2020', 'dd-mm-yyyy'), 8782, 307);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (308, to_date('24-08-2020', 'dd-mm-yyyy'), 7601, 308);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (310, to_date('21-11-2016', 'dd-mm-yyyy'), 9358, 310);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (311, to_date('08-03-2020', 'dd-mm-yyyy'), 248, 311);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (312, to_date('23-12-2020', 'dd-mm-yyyy'), 5480, 312);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (313, to_date('30-06-2020', 'dd-mm-yyyy'), 2019, 313);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (314, to_date('13-11-2016', 'dd-mm-yyyy'), 7249, 314);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (315, to_date('05-12-2018', 'dd-mm-yyyy'), 8035, 315);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (317, to_date('03-02-2016', 'dd-mm-yyyy'), 6135, 317);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (318, to_date('27-10-2016', 'dd-mm-yyyy'), 8092, 318);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (319, to_date('09-07-2018', 'dd-mm-yyyy'), 1033, 319);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (320, to_date('08-10-2017', 'dd-mm-yyyy'), 9887, 320);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (321, to_date('27-02-2016', 'dd-mm-yyyy'), 5855, 321);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (322, to_date('19-04-2019', 'dd-mm-yyyy'), 6892, 322);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (323, to_date('09-01-2017', 'dd-mm-yyyy'), 7501, 323);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (324, to_date('09-10-2019', 'dd-mm-yyyy'), 5707, 324);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (325, to_date('15-08-2017', 'dd-mm-yyyy'), 9019, 325);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (326, to_date('23-12-2017', 'dd-mm-yyyy'), 3395, 326);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (327, to_date('23-02-2016', 'dd-mm-yyyy'), 7136, 327);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (328, to_date('14-01-2020', 'dd-mm-yyyy'), 8561, 328);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (329, to_date('13-10-2016', 'dd-mm-yyyy'), 3167, 329);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (331, to_date('25-02-2021', 'dd-mm-yyyy'), 5383, 331);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (332, to_date('12-12-2018', 'dd-mm-yyyy'), 6563, 332);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (333, to_date('15-09-2019', 'dd-mm-yyyy'), 5725, 333);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (334, to_date('13-10-2020', 'dd-mm-yyyy'), 9146, 334);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (335, to_date('13-11-2017', 'dd-mm-yyyy'), 1361, 335);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (336, to_date('29-04-2019', 'dd-mm-yyyy'), 1992, 336);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (337, to_date('18-05-2019', 'dd-mm-yyyy'), 3418, 337);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (338, to_date('11-09-2018', 'dd-mm-yyyy'), 3283, 338);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (339, to_date('08-09-2019', 'dd-mm-yyyy'), 2368, 339);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (340, to_date('24-08-2019', 'dd-mm-yyyy'), 5631, 340);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (341, to_date('26-01-2017', 'dd-mm-yyyy'), 8641, 341);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (343, to_date('02-06-2019', 'dd-mm-yyyy'), 8254, 343);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (344, to_date('30-11-2017', 'dd-mm-yyyy'), 4487, 344);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (345, to_date('26-10-2020', 'dd-mm-yyyy'), 5059, 345);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (346, to_date('18-09-2018', 'dd-mm-yyyy'), 9167, 346);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (347, to_date('15-04-2016', 'dd-mm-yyyy'), 2769, 347);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (348, to_date('31-12-2020', 'dd-mm-yyyy'), 1924, 348);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (349, to_date('11-12-2020', 'dd-mm-yyyy'), 268, 349);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (350, to_date('29-06-2016', 'dd-mm-yyyy'), 7813, 350);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (351, to_date('19-01-2020', 'dd-mm-yyyy'), 6848, 351);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (352, to_date('05-03-2018', 'dd-mm-yyyy'), 1472, 352);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (353, to_date('23-02-2020', 'dd-mm-yyyy'), 7286, 353);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (355, to_date('06-09-2016', 'dd-mm-yyyy'), 7195, 355);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (357, to_date('05-01-2020', 'dd-mm-yyyy'), 4387, 357);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (358, to_date('06-07-2018', 'dd-mm-yyyy'), 8617, 358);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (359, to_date('15-08-2019', 'dd-mm-yyyy'), 1827, 359);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (360, to_date('28-01-2017', 'dd-mm-yyyy'), 5802, 360);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (361, to_date('12-10-2020', 'dd-mm-yyyy'), 1994, 361);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (362, to_date('01-04-2016', 'dd-mm-yyyy'), 418, 362);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (364, to_date('18-05-2016', 'dd-mm-yyyy'), 5235, 364);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (365, to_date('25-10-2018', 'dd-mm-yyyy'), 8700, 365);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (366, to_date('12-02-2019', 'dd-mm-yyyy'), 9656, 366);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (368, to_date('11-03-2016', 'dd-mm-yyyy'), 5167, 368);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (369, to_date('30-04-2017', 'dd-mm-yyyy'), 5338, 369);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (370, to_date('03-03-2017', 'dd-mm-yyyy'), 8206, 370);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (371, to_date('30-10-2018', 'dd-mm-yyyy'), 5625, 371);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (372, to_date('03-05-2017', 'dd-mm-yyyy'), 4182, 372);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (373, to_date('12-05-2019', 'dd-mm-yyyy'), 6298, 373);
commit;
prompt 300 records committed...
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (374, to_date('23-11-2019', 'dd-mm-yyyy'), 6177, 374);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (375, to_date('17-02-2016', 'dd-mm-yyyy'), 467, 375);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (376, to_date('16-03-2016', 'dd-mm-yyyy'), 8497, 376);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (377, to_date('23-06-2018', 'dd-mm-yyyy'), 183, 377);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (380, to_date('09-09-2016', 'dd-mm-yyyy'), 7729, 380);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (381, to_date('19-03-2018', 'dd-mm-yyyy'), 7413, 381);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (383, to_date('04-09-2020', 'dd-mm-yyyy'), 9949, 383);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (384, to_date('10-08-2016', 'dd-mm-yyyy'), 3268, 384);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (385, to_date('07-04-2018', 'dd-mm-yyyy'), 7267, 385);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (386, to_date('14-12-2018', 'dd-mm-yyyy'), 560, 386);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (387, to_date('20-04-2018', 'dd-mm-yyyy'), 641, 387);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (389, to_date('31-01-2019', 'dd-mm-yyyy'), 1673, 389);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (393, to_date('08-01-2019', 'dd-mm-yyyy'), 7849, 393);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (394, to_date('04-10-2017', 'dd-mm-yyyy'), 4742, 394);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (395, to_date('01-04-2018', 'dd-mm-yyyy'), 3783, 395);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (396, to_date('02-11-2016', 'dd-mm-yyyy'), 8840, 396);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (397, to_date('06-08-2019', 'dd-mm-yyyy'), 9464, 397);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (398, to_date('22-12-2020', 'dd-mm-yyyy'), 4436, 398);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (400, to_date('14-11-2018', 'dd-mm-yyyy'), 9014, 400);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (403, to_date('16-08-2019', 'dd-mm-yyyy'), 4659, 403);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (404, to_date('20-10-2018', 'dd-mm-yyyy'), 2433, 404);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (405, to_date('16-09-2018', 'dd-mm-yyyy'), 4574, 405);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (407, to_date('01-08-2018', 'dd-mm-yyyy'), 6618, 407);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (408, to_date('04-02-2021', 'dd-mm-yyyy'), 4764, 408);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (410, to_date('06-12-2016', 'dd-mm-yyyy'), 8908, 410);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (411, to_date('23-01-2018', 'dd-mm-yyyy'), 2119, 411);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (413, to_date('25-12-2018', 'dd-mm-yyyy'), 5167, 413);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (414, to_date('22-05-2017', 'dd-mm-yyyy'), 7417, 414);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (415, to_date('01-02-2016', 'dd-mm-yyyy'), 8509, 415);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (417, to_date('23-06-2020', 'dd-mm-yyyy'), 2268, 417);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (418, to_date('20-06-2019', 'dd-mm-yyyy'), 9614, 418);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (419, to_date('04-01-2019', 'dd-mm-yyyy'), 9834, 419);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (420, to_date('23-02-2020', 'dd-mm-yyyy'), 551, 420);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (421, to_date('30-06-2018', 'dd-mm-yyyy'), 6322, 421);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (422, to_date('03-08-2018', 'dd-mm-yyyy'), 7197, 422);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (423, to_date('17-06-2020', 'dd-mm-yyyy'), 2380, 423);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (424, to_date('28-09-2020', 'dd-mm-yyyy'), 3798, 424);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (425, to_date('16-03-2019', 'dd-mm-yyyy'), 5444, 425);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (426, to_date('01-08-2020', 'dd-mm-yyyy'), 3159, 426);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (427, to_date('27-04-2019', 'dd-mm-yyyy'), 8652, 427);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (429, to_date('14-04-2018', 'dd-mm-yyyy'), 1700, 429);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (430, to_date('24-03-2020', 'dd-mm-yyyy'), 3958, 430);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (431, to_date('14-12-2019', 'dd-mm-yyyy'), 391, 431);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (432, to_date('28-01-2018', 'dd-mm-yyyy'), 3740, 432);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (433, to_date('27-10-2016', 'dd-mm-yyyy'), 4979, 433);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (434, to_date('22-03-2016', 'dd-mm-yyyy'), 4877, 434);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (435, to_date('06-11-2019', 'dd-mm-yyyy'), 7854, 435);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (436, to_date('31-01-2020', 'dd-mm-yyyy'), 2037, 436);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (438, to_date('12-03-2016', 'dd-mm-yyyy'), 8183, 438);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (439, to_date('03-11-2020', 'dd-mm-yyyy'), 9411, 439);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (440, to_date('17-06-2018', 'dd-mm-yyyy'), 7195, 440);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (441, to_date('19-10-2019', 'dd-mm-yyyy'), 2072, 441);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (442, to_date('12-03-2016', 'dd-mm-yyyy'), 4778, 442);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (444, to_date('09-07-2019', 'dd-mm-yyyy'), 2381, 444);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (445, to_date('22-02-2020', 'dd-mm-yyyy'), 3304, 445);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (446, to_date('31-08-2016', 'dd-mm-yyyy'), 8440, 446);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (447, to_date('24-09-2018', 'dd-mm-yyyy'), 3176, 447);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (448, to_date('07-10-2020', 'dd-mm-yyyy'), 5740, 448);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (449, to_date('18-05-2017', 'dd-mm-yyyy'), 1138, 449);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (450, to_date('24-01-2018', 'dd-mm-yyyy'), 4062, 450);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (451, to_date('24-03-2017', 'dd-mm-yyyy'), 9743, 451);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (452, to_date('26-04-2018', 'dd-mm-yyyy'), 2844, 452);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (453, to_date('18-01-2018', 'dd-mm-yyyy'), 6450, 453);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (454, to_date('30-10-2016', 'dd-mm-yyyy'), 7884, 454);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (455, to_date('13-04-2016', 'dd-mm-yyyy'), 3350, 455);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (456, to_date('11-10-2019', 'dd-mm-yyyy'), 1054, 456);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (457, to_date('29-12-2019', 'dd-mm-yyyy'), 1770, 457);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (459, to_date('19-12-2019', 'dd-mm-yyyy'), 1767, 459);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (460, to_date('03-03-2016', 'dd-mm-yyyy'), 7760, 460);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (461, to_date('02-08-2017', 'dd-mm-yyyy'), 1374, 461);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (462, to_date('11-03-2017', 'dd-mm-yyyy'), 1366, 462);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (463, to_date('26-04-2020', 'dd-mm-yyyy'), 2172, 463);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (464, to_date('23-02-2016', 'dd-mm-yyyy'), 1826, 464);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (465, to_date('16-03-2020', 'dd-mm-yyyy'), 592, 465);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (466, to_date('19-06-2016', 'dd-mm-yyyy'), 3334, 466);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (467, to_date('27-07-2018', 'dd-mm-yyyy'), 6264, 467);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (468, to_date('05-07-2018', 'dd-mm-yyyy'), 7124, 468);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (469, to_date('16-10-2016', 'dd-mm-yyyy'), 2478, 469);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (470, to_date('10-02-2018', 'dd-mm-yyyy'), 2039, 470);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (471, to_date('07-04-2018', 'dd-mm-yyyy'), 3924, 471);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (472, to_date('11-02-2016', 'dd-mm-yyyy'), 859, 472);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (473, to_date('16-10-2020', 'dd-mm-yyyy'), 3016, 473);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (474, to_date('16-03-2016', 'dd-mm-yyyy'), 4105, 474);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (478, to_date('18-06-2019', 'dd-mm-yyyy'), 8563, 478);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (479, to_date('19-07-2016', 'dd-mm-yyyy'), 6974, 479);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (480, to_date('01-11-2020', 'dd-mm-yyyy'), 1679, 480);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (481, to_date('05-05-2016', 'dd-mm-yyyy'), 5297, 481);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (482, to_date('16-06-2018', 'dd-mm-yyyy'), 9534, 482);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (483, to_date('31-10-2017', 'dd-mm-yyyy'), 7513, 483);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (484, to_date('12-12-2017', 'dd-mm-yyyy'), 7424, 484);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (486, to_date('27-04-2020', 'dd-mm-yyyy'), 2012, 486);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (489, to_date('06-03-2016', 'dd-mm-yyyy'), 6294, 489);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (490, to_date('10-08-2016', 'dd-mm-yyyy'), 641, 490);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (491, to_date('23-08-2017', 'dd-mm-yyyy'), 8221, 491);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (492, to_date('06-09-2020', 'dd-mm-yyyy'), 7620, 492);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (493, to_date('28-04-2016', 'dd-mm-yyyy'), 7122, 493);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (494, to_date('21-08-2018', 'dd-mm-yyyy'), 2181, 494);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (496, to_date('12-09-2016', 'dd-mm-yyyy'), 8329, 496);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (497, to_date('15-10-2020', 'dd-mm-yyyy'), 9321, 497);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (498, to_date('01-11-2020', 'dd-mm-yyyy'), 572, 498);
commit;
prompt 400 records committed...
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (499, to_date('23-02-2016', 'dd-mm-yyyy'), 3323, 499);
insert into T_PURCHASE (purnum, purchasingdate, purchasecost, purchasingworkerid)
values (500, to_date('14-11-2017', 'dd-mm-yyyy'), 4493, 500);
commit;
prompt 402 records loaded
prompt Loading T_SALARY...
insert into T_SALARY (val, sal_date, emp_id)
values (20000, to_date('10-02-2021', 'dd-mm-yyyy'), 5011);
insert into T_SALARY (val, sal_date, emp_id)
values (19000, to_date('01-01-2020', 'dd-mm-yyyy'), 2);
insert into T_SALARY (val, sal_date, emp_id)
values (23800, to_date('02-06-2021', 'dd-mm-yyyy'), 1);
insert into T_SALARY (val, sal_date, emp_id)
values (24887, to_date('02-06-2021', 'dd-mm-yyyy'), 2);
insert into T_SALARY (val, sal_date, emp_id)
values (22639, to_date('02-06-2021', 'dd-mm-yyyy'), 92);
insert into T_SALARY (val, sal_date, emp_id)
values (32050, to_date('02-06-2021', 'dd-mm-yyyy'), 93);
insert into T_SALARY (val, sal_date, emp_id)
values (35274, to_date('02-06-2021', 'dd-mm-yyyy'), 210);
insert into T_SALARY (val, sal_date, emp_id)
values (37202, to_date('02-06-2021', 'dd-mm-yyyy'), 280);
insert into T_SALARY (val, sal_date, emp_id)
values (28026, to_date('02-06-2021', 'dd-mm-yyyy'), 298);
insert into T_SALARY (val, sal_date, emp_id)
values (28226, to_date('02-06-2021', 'dd-mm-yyyy'), 378);
insert into T_SALARY (val, sal_date, emp_id)
values (23007, to_date('02-06-2021', 'dd-mm-yyyy'), 397);
insert into T_SALARY (val, sal_date, emp_id)
values (20159, to_date('02-06-2021', 'dd-mm-yyyy'), 418);
insert into T_SALARY (val, sal_date, emp_id)
values (39078, to_date('02-06-2021', 'dd-mm-yyyy'), 467);
insert into T_SALARY (val, sal_date, emp_id)
values (10527, to_date('02-06-2021', 'dd-mm-yyyy'), 499);
insert into T_SALARY (val, sal_date, emp_id)
values (38687, to_date('02-06-2021', 'dd-mm-yyyy'), 525);
insert into T_SALARY (val, sal_date, emp_id)
values (14319, to_date('02-06-2021', 'dd-mm-yyyy'), 548);
insert into T_SALARY (val, sal_date, emp_id)
values (35832, to_date('02-06-2021', 'dd-mm-yyyy'), 648);
insert into T_SALARY (val, sal_date, emp_id)
values (12550, to_date('02-06-2021', 'dd-mm-yyyy'), 673);
insert into T_SALARY (val, sal_date, emp_id)
values (30670, to_date('02-06-2021', 'dd-mm-yyyy'), 735);
insert into T_SALARY (val, sal_date, emp_id)
values (25339, to_date('02-06-2021', 'dd-mm-yyyy'), 785);
insert into T_SALARY (val, sal_date, emp_id)
values (29512, to_date('02-06-2021', 'dd-mm-yyyy'), 831);
insert into T_SALARY (val, sal_date, emp_id)
values (37896, to_date('02-06-2021', 'dd-mm-yyyy'), 869);
insert into T_SALARY (val, sal_date, emp_id)
values (20613, to_date('02-06-2021', 'dd-mm-yyyy'), 873);
insert into T_SALARY (val, sal_date, emp_id)
values (22306, to_date('02-06-2021', 'dd-mm-yyyy'), 893);
insert into T_SALARY (val, sal_date, emp_id)
values (10416, to_date('02-06-2021', 'dd-mm-yyyy'), 897);
insert into T_SALARY (val, sal_date, emp_id)
values (26664, to_date('02-06-2021', 'dd-mm-yyyy'), 918);
insert into T_SALARY (val, sal_date, emp_id)
values (17194, to_date('02-06-2021', 'dd-mm-yyyy'), 923);
insert into T_SALARY (val, sal_date, emp_id)
values (29521, to_date('02-06-2021', 'dd-mm-yyyy'), 930);
insert into T_SALARY (val, sal_date, emp_id)
values (35268, to_date('02-06-2021', 'dd-mm-yyyy'), 5011);
commit;
prompt 29 records loaded
prompt Enabling foreign key constraints for T_EMPLOYEE...
alter table T_EMPLOYEE enable constraint SYS_C007344;
alter table T_EMPLOYEE enable constraint SYS_C007345;
prompt Enabling foreign key constraints for T_EMPROLE...
alter table T_EMPROLE enable constraint SYS_C007373;
alter table T_EMPROLE enable constraint SYS_C007374;
prompt Enabling foreign key constraints for T_JOB_REVIEW...
alter table T_JOB_REVIEW enable constraint SYS_C007383;
alter table T_JOB_REVIEW enable constraint SYS_C007384;
prompt Enabling foreign key constraints for T_PURCHASINGWORKER...
alter table T_PURCHASINGWORKER enable constraint FK_T_EMPLOYEE;
prompt Enabling foreign key constraints for T_PURCHASE...
alter table T_PURCHASE enable constraint SYS_C007395;
prompt Enabling foreign key constraints for T_SALARY...
alter table T_SALARY enable constraint SYS_C008265;
prompt Enabling triggers for T_EMPLOYEE...
alter table T_EMPLOYEE enable all triggers;
prompt Enabling triggers for T_EMPROLE...
alter table T_EMPROLE enable all triggers;
prompt Enabling triggers for T_JOB_REVIEW...
alter table T_JOB_REVIEW enable all triggers;
prompt Enabling triggers for T_PURCHASINGWORKER...
alter table T_PURCHASINGWORKER enable all triggers;
prompt Enabling triggers for T_PURCHASE...
alter table T_PURCHASE enable all triggers;
prompt Enabling triggers for T_SALARY...
alter table T_SALARY enable all triggers;

set feedback on
set define on
prompt Done
