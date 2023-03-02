
[General]
Version=1

[Preferences]
Username=
Password=2843
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=T_ROLE
Count=1000

[Record]
Name=ROLE_ID
Type=NUMBER
Size=4
Data=[0000]
Master=

[Record]
Name=ROLE_NAME
Type=VARCHAR2
Size=50
Data=[a(3..10)]
Master=

[Record]
Name=ROLE_DESC
Type=VARCHAR2
Size=500
Data=[a(3..7) ' ' a(3..7) ' ' a(3..7) ' ' a(3..7)]
Master=

[Record]
Name=DEPT_ID
Type=NUMBER
Size=0
Data=List(select DEPT_ID from T_Department)
Master=

