
[General]
Version=1

[Preferences]
Username=
Password=2137
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=T_PERSON
Count=1000

[Record]
Name=IDPERSON
Type=NUMBER
Size=9
Data=[000000000]
Master=

[Record]
Name=BIRTHDATE
Type=DATE
Size=
Data=Random(01/01/1950,01/01/2000)
Master=

[Record]
Name=KODGENDER
Type=CHAR
Size=1
Data=Random(0,1)
Master=

[Record]
Name=CITIZENSHIP
Type=VARCHAR2
Size=50
Data=Country
Master=

[Record]
Name=FNAME
Type=VARCHAR2
Size=50
Data=FirstName
Master=

[Record]
Name=LNAME
Type=VARCHAR2
Size=50
Data=LastName
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=50
Data=Email
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=
Data=[0000000000]
Master=

[Record]
Name=STATUS
Type=CHAR
Size=1
Data=Random(0,1)
Master=

[Record]
Name=ADDR_ID
Type=NUMBER
Size=
Data=List(select addr_id from T_address)
Master=

