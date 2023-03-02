CREATE TABLE T_Department
(
  -- האם אפשר להשמיט את NOT NULL במפתח ראשי
  dept_id INT NOT NULL,
  dept_desc VARCHAR(500) NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  dept_phone INT NOT NULL,
  dept_email VARCHAR(50) NOT NULL,
  PRIMARY KEY (dept_id)
);

CREATE TABLE T_Address
(
  addr_id INT NOT NULL,
  city VARCHAR(50) NOT NULL,
  street VARCHAR(100) NOT NULL,
  house_num INT NOT NULL,
  apt_num INT,
  postal_code INT,
  po_box INT,
  PRIMARY KEY (addr_id)
);

CREATE TABLE T_Role
(
  role_id INT NOT NULL,
  role_name VARCHAR(50) NOT NULL,
  role_desc VARCHAR(500) NOT NULL,
  dept_id INT NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES T_Department(dept_id),
  PRIMARY KEY (role_id, dept_id)
);

CREATE TABLE T_Login
(
  login_id INT NOT NULL,
--אם זה בסדר שהמילה שמורה
  myPassword VARCHAR(8) NOT NULL,
  username  VARCHAR(50) NOT NULL,
  PRIMARY KEY (login_id)
);

CREATE TABLE T_Person
(
  IDperson INT NOT NULL,
  BirthDate DATE NOT NULL,
 -- CHECK(KodGender=‘F’ or KodGender=‘M’),
  KodGender CHAR(1) NOT NULL, 
  citizenship VARCHAR(50) NOT NULL,
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone INT NOT NULL,
  status CHAR(1),
  addr_id INT NOT NULL,
  PRIMARY KEY (IDperson),
  FOREIGN KEY (addr_id) REFERENCES T_Address(addr_id)
);

CREATE TABLE T_Employee
(
  emp_id INT NOT NULL,
  hire_date DATE NOT NULL, 
  work_phone INT NOT NULL,
  work_email VARCHAR(50) NOT NULL,
  login_id INT NOT NULL,
  IDperson INT NOT NULL,
  PRIMARY KEY (emp_id),
  FOREIGN KEY (login_id) REFERENCES T_Login(login_id),
  FOREIGN KEY (IDperson) REFERENCES T_Person(IDperson)
);

CREATE TABLE T_Job_review
(
  job_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  progress  VARCHAR(500) NOT NULL,
  dept_id INT NOT NULL,
  role_id INT NOT NULL,
  emp_id INT NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES T_Employee(emp_id),
  FOREIGN KEY (role_id, dept_id) REFERENCES T_Role(role_id, dept_id),
  PRIMARY KEY (job_id, emp_id, role_id, dept_id)
);

CREATE TABLE T_AddrDept
(
  dept_id INT NOT NULL,
  addr_id INT NOT NULL,
  PRIMARY KEY (dept_id, addr_id),
  FOREIGN KEY (dept_id) REFERENCES T_Department(dept_id),
  FOREIGN KEY (addr_id) REFERENCES T_Address(addr_id)
);

CREATE TABLE T_Salary
(
 sal_id INT NOT NULL,
  val INT NOT NULL,
  sal_date DATE NOT NULL,
  emp_id INT NOT NULL,
  PRIMARY KEY (sal_id),
  FOREIGN KEY (emp_id) REFERENCES T_Employee(emp_id)
);

CREATE TABLE T_EmpRole
(
  emp_id INT NOT NULL,
  role_id INT NOT NULL,
  dept_id INT NOT NULL,
  PRIMARY KEY (emp_id, role_id, dept_id),
  FOREIGN KEY (emp_id) REFERENCES T_Employee(emp_id),
  FOREIGN KEY (role_id, dept_id) REFERENCES T_Role(role_id, dept_id)
);
