CREATE TABLE AdvertisingOffice
(
  OfficeName varchar2(30) NOT NULL,
  Address varchar2(30) NOT NULL,
  Phone varchar2(20) NOT NULL,
  Email varchar2(30) NOT NULL,
  AdvertisingOfficeId INT NOT NULL,
  PRIMARY KEY (AdvertisingOfficeId)
);

CREATE TABLE Advertisement
(
  AdvertisementId INT NOT NULL,
  PublicationDate DATE NOT NULL,
  PublicationType varchar2(30) NOT NULL,
  AdvertisemenCost FLOAT NOT NULL,
  PRIMARY KEY (AdvertisementId)
);

CREATE TABLE person
(
  IDPerson INT NOT NULL,
  BirthDate DATE NOT NULL,
  KodGender CHAR NOT NULL,
  citizenship varchar2(30) NOT NULL,
  Status varchar2(30) NOT NULL,
  FName varchar2(30) NOT NULL,
  LName varchar2(30) NOT NULL,
  PRIMARY KEY (IDPerson)
);

CREATE TABLE worker
(
  WorkerId INT NOT NULL,
  Email varchar2(30) NOT NULL,
  Salary FLOAT NOT NULL,
  IDPerson INT NOT NULL,
  PRIMARY KEY (WorkerId),
  FOREIGN KEY (IDPerson) REFERENCES person(IDPerson)
);

CREATE TABLE AdvertisingWorker
(
  AdvertisingWorkerId INT NOT NULL,
  AdvertisingOfficeId INT NOT NULL,
  WorkerId INT NOT NULL,
  PRIMARY KEY (AdvertisingWorkerId),
  FOREIGN KEY (AdvertisingOfficeId) REFERENCES AdvertisingOffice(AdvertisingOfficeId),
  FOREIGN KEY (WorkerId) REFERENCES worker(WorkerId)
);

CREATE TABLE PurchasingWorker
(
  PurchasingBudget FLOAT NOT NULL,
  PurchasingWorkerId INT NOT NULL,
  WorkerId INT NOT NULL,
  PRIMARY KEY (PurchasingWorkerId),
  FOREIGN KEY (WorkerId) REFERENCES worker(WorkerId)
);

CREATE TABLE Purchase
(
  PurNum INT NOT NULL,
  PurchasingDate DATE NOT NULL,
  Purchasecost FLOAT NOT NULL,
  PurchasingWorkerId INT NOT NULL,
  PRIMARY KEY (PurNum, PurchasingWorkerId),
  FOREIGN KEY (PurchasingWorkerId) REFERENCES PurchasingWorker(PurchasingWorkerId)
);

CREATE TABLE AdvertisementsOfAdvertisingWorker
(
  AdvertisingWorkerId INT NOT NULL,
  AdvertisementId INT NOT NULL,
  PRIMARY KEY (AdvertisingWorkerId, AdvertisementId),
  FOREIGN KEY (AdvertisingWorkerId) REFERENCES AdvertisingWorker(AdvertisingWorkerId),
  FOREIGN KEY (AdvertisementId) REFERENCES Advertisement(AdvertisementId)
);

CREATE TABLE worker_PhoneNumber
(
  PhoneNumber varchar2(20) NOT NULL,
  WorkerId INT NOT NULL,
  PRIMARY KEY (PhoneNumber, WorkerId),
  FOREIGN KEY (WorkerId) REFERENCES worker(WorkerId)
);

CREATE TABLE Purchase_Items
(
  Items varchar2(30) NOT NULL,
  PurNum INT NOT NULL,
  PurchasingWorkerId INT NOT NULL,
  PRIMARY KEY (Items, PurNum, PurchasingWorkerId),
  FOREIGN KEY (PurNum, PurchasingWorkerId) REFERENCES Purchase(PurNum, PurchasingWorkerId)
);
