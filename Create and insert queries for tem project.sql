USE Hospital;

CREATE TABLE Facility(
service_id varchar(20) primary key,
cost_per_service decimal(20,2))

INSERT INTO Facility values('S1',10000)
INSERT INTO Facility values('S2',20000)
INSERT INTO Facility values('S3',30000)
INSERT INTO Facility values('S4',40000) 
INSERT INTO Facility values('S5',50000)

CREATE TABLE Physician(
physician_id varchar(20) primary key,
physician_first_name varchar(50),
physician_last_name varchar(50),
speciality_id varchar(20),
service_id varchar(20),
max_capacity_patients int,
foreign key (service_id) references facility)



INSERT INTO Physician values('D1','Prabhav','Gupta','SP1','S1','10')
INSERT INTO Physician values('D2','Vidit','Malhotra','SP2','S2','10')
INSERT INTO Physician values('D3','Ashma','Bhola','SP3','S3','10')
INSERT INTO Physician values('D4','Nikita','Bansal','SP4','S4','10')
INSERT INTO Physician values('D5','Sarthak','Garg','SP5','S5','10')


CREATE TABLE Buildings(
Building_id VARCHAR(20) primary key,
building_name varchar(50) NOT NULL,
physician_id varchar(20)NOT NULL,
foreign key(physician_id) references Physician);

INSERT INTO Buildings values('B1','Palladius','D1')
INSERT INTO Buildings values('B2','Prudential','D2')
INSERT INTO Buildings values('B3','Milange','D3')
INSERT INTO Buildings values('B4','Agnes','D4')
INSERT INTO Buildings values('B5','Ambience','D5')

select * from Facility
select * from Physician
select * from Buildings

CREATE TABLE Speciality(
speciality_id varchar(20) primary key,
speciality_name varchar(50),
physician_id varchar(20) NOT NULL,
foreign key (physician_id) references Physician) 

INSERT INTO Speciality values('S1','Internal Medicine','D1')
INSERT INTO Speciality values('S2','Neonatology','D2')
INSERT INTO Speciality values('S3','Neurology','D3')
INSERT INTO Speciality values('S4','Cardiology','D4')
INSERT INTO Speciality values('S5','Nuclear Medicine','D5')

CREATE TABLE Insurance_Plan(
insurance_id varchar(20) primary key,
Insurance_name varchar(50),
service_id varchar(20) NOT NULL,
physician_copayment_amt decimal(10,2),
foreign key (service_id) references Facility)

--drop table Insurance_Plan
INSERT INTO Insurance_Plan values('I1','Berkshire Hathaway','S1',10)
INSERT INTO Insurance_Plan values('I2','China Life Insurance','S2',20)
INSERT INTO Insurance_Plan values('I3','Allianz','S3',30)
INSERT INTO Insurance_Plan values('I4','American International Group','S4',40)
INSERT INTO Insurance_Plan values('I5','MetLife','S5',50)

CREATE TABLE Patient(
patient_id varchar(20) primary key,
patient_first_name varchar(50),
patient_last_name varchar(50),
insurance_id varchar(20))

Insert into Patient values('P1','Somesh','Gupta','I1')
Insert into Patient values('P2','Rahul','Joshi','I2')
Insert into Patient values('P3','Sumit','Singhal','I1')
Insert into Patient values('P4','Atul','Bansal','I1')
Insert into Patient values('P5','Sunita','Dudi','I2')
Insert into Patient values('P6','kanika','Bansal','I3')
Insert into Patient values('P7','kaushal','Chawla','I4')
Insert into Patient values('P8','Shivani','Garg','I5')
Insert into Patient values('P9','Neha','Bansal','I5')
Insert into Patient values('P10','Aayushi','Dhingra',NULL)

CREATE TABLE Appointment(
appointment_id varchar(20) primary key,
physician_id varchar(20),
Appointment_date date,
foreign key (physician_id) references physician)
select * from Appointment
Insert into Appointment values ('A11','D1',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A12','D5',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A13','D4',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A21','D1',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A22','D2',CAST('14-APR-2016' AS date))
Insert into Appointment values ('A23','D3',CAST('15-APR-2016' AS date))
Insert into Appointment values ('A24','D4',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A25','D5',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A31','D1',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A32','D2',CAST('13-APR-2016' AS date))
Insert into Appointment values ('A33','D3',CAST('16-APR-2016' AS date))
Insert into Appointment values ('A34','D4',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A35','D5',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A41','D1',CAST('11-APR-2016' AS date))
Insert into Appointment values ('A51','D1',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A61','D1',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A71','D1',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A82','D1',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A92','D5',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A73','D5',CAST('12-APR-2016' AS date))
Insert into Appointment values ('A101','D5',CAST('12-APR-2016' AS date))

CREATE TABLE Waiting_List(
waiting_id int identity(100,1),
appointment_id varchar(20),
patient_id varchar(20),
waiting_number int,
Appointment_status varchar(20),
foreign key(appointment_id) references Appointment,
foreign key(patient_id) references patient)

CREATE TABLE Patient_visits(
Appointment_id varchar(20),
patient_id varchar(20),
foreign key(Appointment_id) references Appointment,
foreign key(patient_id) references Patient)

select * from Physician
select * from Patient
select * from Appointment

select * from Waiting_List
insert into Patient_visits values('A11','P1')
insert into Patient_visits values('A12','P1')
insert into Patient_visits values('A13','P1')
insert into Patient_visits values('A21','P2')
insert into Patient_visits values('A22','P2')
insert into Patient_visits values('A23','P2')
insert into Patient_visits values('A24','P2')
insert into Patient_visits values('A25','P2')
insert into Patient_visits values('A31','P3')
insert into Patient_visits values('A32','P3')
insert into Patient_visits values('A33','P3')
insert into Patient_visits values('A34','P3')
insert into Patient_visits values('A35','P3')
insert into Patient_visits values('A41','P4')
insert into Patient_visits values('A51','P5')
insert into Patient_visits values('A61','P6')
insert into Patient_visits values('A71','P7')
insert into Patient_visits values('A82','P8')
insert into Patient_visits values('A92','P9')
insert into Patient_visits values('A73','P7')
insert into Patient_visits values('A101','P10')


select * from Insurance_Plan

CREATE TABLE Patient_Ins(
patient_id varchar(20),
Insurance_id varchar(20),
patient_contact char(10),
Patient_balance_due int,
foreign key(Insurance_id ) references Insurance_Plan,
foreign key(patient_id) references patient)

insert into Patient_Ins values('P1','I1','6171234567',0)
insert into Patient_Ins values('P2','I2','6171234569',0)
insert into Patient_Ins values('P3','I1','6171234568',0)
insert into Patient_Ins values('P4','I1','6171234569',0)
insert into Patient_Ins values('P5','I2','6171234560',0)
insert into Patient_Ins values('P6','I3','6171234561',0)
insert into Patient_Ins values('P7','I4','6171234562',0)
insert into Patient_Ins values('P8','I5','6171234563',0)
insert into Patient_Ins values('P9','I5','6171234564',0)

