------------------------------------------------------------------------------

CREATE Index i_person_fname_lname
on T_person (fname, lname);


CREATE INDEX i_employee_hire_date
on T_employee (hire_date);


CREATE INDEX i_department_DEPT_NAME
on T_Department (DEPT_NAME);