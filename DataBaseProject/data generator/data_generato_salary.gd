
[General]
Version=1

[Preferences]
Username=
Password=2654
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=T_SALARY
Count=1000

[Record]
Name=SAL_ID
Type=NUMBER
Size=
Data=[9999]
Master=

[Record]
Name=VAL
Type=NUMBER
Size=
Data=[99999]
Master=

[Record]
Name=SAL_DATE
Type=DATE
Size=
Data=
Master=

[Record]
Name=EMP_ID
Type=NUMBER
Size=
Data=List(select emp_id from T_employee)
Master=

