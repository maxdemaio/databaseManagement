-- CREATE DATABASE IntercollegiateAthletic;
USE IntercollegiateAthletic;

DROP TABLE Customer;
DROP TABLE Facility;
DROP TABLE Location;
DROP TABLE EventRequest;

-------------------- Customer --------------------------------
CREATE TABLE Customer (
	custno varchar(8) not null,
    custname varchar(30) not null,
    address varchar(50) not null,
    internal char(1) not null,
    contact varchar(35) not null,
    phone varchar(11) not null,
    city varchar(30) not null,
    state char(2) not null,
    zip varchar(10) not null,
    CONSTRAINT CustomerPK PRIMARY KEY (custno)
);

-------------------- Facility --------------------------------
CREATE TABLE Facility (
	facno varchar(8) not null,
    facname varchar(30) not null,
    CONSTRAINT FacilityPK PRIMARY KEY (facno),
    CONSTRAINT FacilityNameUC UNIQUE (facname)
);

-------------------- Location --------------------------------
CREATE TABLE Location (
	locno varchar(8) not null,
    facno varchar(8) not null,
    locname varchar(60) not null,
    FOREIGN KEY (facno) REFERENCES Facility(facno) ON DELETE CASCADE,
    CONSTRAINT LocationPK PRIMARY KEY (locno)
);

-------------------- Event Request --------------------------------
CREATE TABLE EventRequest (
	eventno varchar(8) not null,
    dateheld DATE not null,
    datereq DATE not null,
    facno varchar(8) not null,
	custno varchar(8) not null,
    dateauth DATE,
    status varchar(8) not null check (status IN ('Pending','Approved','Denied')),
    estcost DECIMAL(12, 2) not null,
    estaudience INTEGER not null,
    budno varchar(8),
    FOREIGN KEY (custno) REFERENCES Customer(custno) ON DELETE CASCADE,
    FOREIGN KEY (facno) REFERENCES Facility(facno) ON DELETE CASCADE,
	CONSTRAINT EventPK PRIMARY KEY (eventno)
);

-------------------- Resources --------------------------------
CREATE TABLE ResourceTable (
	resno varchar(8) not null,
    resname varchar(30) not null,
    rate DECIMAL(12, 2) not null,
    CONSTRAINT ResPK PRIMARY KEY (resno)
);

-------------------- Employee --------------------------------
CREATE TABLE Employee (
	empno varchar(8) not null,
    empname varchar(60) not null,
    department varchar(60) not null,
    email varchar(60) not null,
    phone varchar(30) not null,
    CONSTRAINT EmpPK PRIMARY KEY (empno)
);

-------------------- Event Plans --------------------------------
CREATE TABLE EventPlans (
    planno varchar(8) not null,
	eventno varchar(8) not null,
    workdate DATE not null,
    notes varchar(60),
    activity varchar(30),
    empno varchar(8),
    FOREIGN KEY (empno) REFERENCES Employee(empno) ON DELETE CASCADE,
    CONSTRAINT EventPlanPK PRIMARY KEY (planno)
);

-------------------- Event Plan Lines --------------------------------
-- Note: use datetime for this table
-- Check if timestart is less than time end
CREATE TABLE EventPlanLines (
    planLinesId INTEGER not null AUTO_INCREMENT,
	planno varchar(8) not null,
    lineno INTEGER not null,
    timestart DATETIME not null,
    timeend DATETIME not null,
    numberfld INTEGER not null,
    locno varchar(8) not null,
    resno varchar(8) not null,
    FOREIGN KEY (locno) REFERENCES Location(locno) ON DELETE CASCADE,
    FOREIGN KEY (resno) REFERENCES ResourceTable(resno) ON DELETE CASCADE,
    FOREIGN KEY (planno) REFERENCES EventPlans(planno) ON DELETE CASCADE,
    CONSTRAINT EventPlanLinesPK PRIMARY KEY (planLinesId)
);

