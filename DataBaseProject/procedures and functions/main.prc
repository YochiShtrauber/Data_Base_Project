create or replace procedure main is

maam integer;
year_saving integer;

job_review_id integer;
p_role_name varchar2;
num_of_emps integer;
proj_name varchar2;
p_hire_date date;

in_sal_date date;


begin
	maam := 17;
	year_saving:= check_maam_and_savings(maam => maam);

	job_review_id:=330	
	p_role_name:='researcher'
	num_of_emps:=3;
	proj_name:='injections';
	p_hire_date:= '01-JAN-1990';
	create_job_revs_for_proj(p_job_id => job_review_id,
					   p_role_name => p_role_name,
					   num_of_emps => num_of_emps,
					   proj_name => proj_name,
					   p_hire_date => p_hire_date);
	
	proj_name:='injections';
	in_sal_date:= '01-MAY-2021';
	add_salary_reports_monthly(in_sal_date => in_sal_date,
                                   proj_name_for_bonus => project_name);
						   
end main;
/
