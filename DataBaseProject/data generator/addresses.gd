
[General]
Version=1

[Preferences]
Username=
Password=2994
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=T_ADDRESS
Count=1000

[Record]
Name=ADDR_ID
Type=NUMBER
Size=4
Data=Random(1000, 7000)
Master=

[Record]
Name=CITY
Type=VARCHAR2
Size=50
Data=City
Master=

[Record]
Name=STREET
Type=VARCHAR2
Size=100
Data=[aaaaaaa ' ' aaaaaa]
Master=

[Record]
Name=HOUSE_NUM
Type=NUMBER
Size=3
Data=Random(1, 200)
Master=

[Record]
Name=APT_NUM
Type=NUMBER
Size=2
Data=Random(1, 20)
Master=

[Record]
Name=POSTAL_CODE
Type=NUMBER
Size=4
Data=[0000]
Master=

[Record]
Name=PO_BOX
Type=NUMBER
Size=
Data=[00000]
Master=

