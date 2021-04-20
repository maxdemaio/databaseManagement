CREATE DATABASE OrdersTutorial;
USE Orders;

CREATE TABLE Customer ( 
	CustNo 	CHAR(8),
	CustFirstName	VARCHAR(20) NOT NULL,
	CustLastName	VARCHAR(30) NOT NULL,
	CustCity		VARCHAR(30),
	CustState	CHAR(2),
	CustZip	CHAR(10),
	CustBal		DECIMAL(12,2),
	CONSTRAINT PKCustomer PRIMARY KEY (CustNo)  
 );

CREATE TABLE Employee( 
	EmpNo 	 CHAR(8),
	EmpFirstName VARCHAR(20) NOT NULL,
	EmpLastName VARCHAR(30) NOT NULL,
	EmpPhone		 CHAR(15),
	EmpEMail		 VARCHAR(50) NOT NULL,
	CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
	CONSTRAINT UniqueEMail UNIQUE (EmpEMail) 
);

CREATE TABLE OrderTbl ( 
	OrdNo 	CHAR(8),
    OrdDate	DATE NOT NULL,
    CustNo		CHAR(8) NOT NULL,
    EmpNo	CHAR(8),
	CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo) ,
	CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
	CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);

