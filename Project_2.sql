/* Create the output file and be sure to include the full path. This will start logging to the specified file.
   This is the file you'll print and submit */
spool 'C:\Users\rifat\Downloads\project2_mmi.txt'

-- Send all input and output is logged to the txt file.
set echo on

--Md Mahiul Islam
--INSY 3304-001
--Project 2

--DROP all tables (to start with a blank/empty database each time we run the file to avoid errors caused when trying to recreate tables that already exist)
-- ** IMPORTANT: DROP the tables in the opposite order you create them. **
DROP TABLE PATIENT_mmi ;
DROP TABLE BILLINGTYPE_mmi ;
DROP TABLE INSURANCECO_mmi ;
DROP TABLE PMTSTATUS_mmi ;
DROP TABLE APPTSTATUS_mmi ;
DROP TABLE PROVIDER_mmi ;
DROP TABLE BLOCKCODE_mmi ;
DROP TABLE TREATMENT_mmi ;
DROP TABLE APPOINTMENT_mmi ;
DROP TABLE APPTDETAIL_mmi

/* Part IA
CREATE the tables using the best data types, and create them in the proper order to avoid referential integrity constraint violations (i.e., you cannot create
a table containing a FK until its PK table has already been created). */
CREATE TABLE PATIENT_mmi (
PatientID	NUMBER(4),
PatientFName	VARCHAR(12)	NOT NULL,
PatientFName    VARCHAR(12)     NOT NULL,
PatientPhone    VARCHAR(15)     NOT NULL,
PRIMARY KEY (PatientID)
) ;

CREATE TABLE BILLINGTYPE_mmi (
BillingType	CHAR(2),
BillingTypeDesc	VARCHAR(15)	NOT NULL,
PRIMARY KEY (BillingType)
) ;

CREATE TABLE INSURANCECO_mmi (
InsCoID	NUMBER(4),
InsCoName  VARCHAR(15)	NOT NULL,
PRIMARY KEY (InsCoID)
) ;

CREATE TABLE PMTSTATUS_mmi (
PmtStatus  CHAR(2),      
PmtDesc    VARCHAR(15)	NOT NULL,
PRIMARY KEY (PmtStatus)
) ;

CREATE TABLE APPTSTATUS_mmi (
ApptStatusCode	CHAR(2), 
ApptStatusDesc  VARCHAR(15)	NOT NULL,
PRIMARY KEY (ApptStatusCode)
) ;

CREATE TABLE PROVIDER_mmi (
ProviderID	NUMBER(2),  
ProviderFName   VARCHAR(12)	NOT NULL,
ProviderLName   VARCHAR(10)     NOT NULL,
PRIMARY KEY (ProviderID)
) ;

CREATE TABLE BLOCKCODE_mmi (
BlockCode	CHAR(2),         
BlockDesc       VARCHAR(10)	NOT NULL,
BlockMinutes    NUMBER(3)       NOT NULL,
PRIMARY KEY (BlockCode)
) ;

CREATE TABLE TREATMENT_mmi (
TreatmentCode	VARCHAR(10),         
TreatmentDesc    VARCHAR(25)	NOT NULL,
TreatmentRate    NUMBER(3,0)    NOT NULL,
BlockCode        CHAR(2)        NOT NULL,
PRIMARY KEY (TreatmentCode),
FOREIGN KEY (BlockCode) REFERENCES BLOCKCODE_mmi
) ;

CREATE TABLE APPOINTMENT_mmi (
ApptID	         NUMBER(4),         
ApptDateTime     DATE	        NOT NULL,
PatientID        NUMBER(3)      NOT NULL,
BillingType        CHAR(2)      NOT NULL,
InsCoID          NUMBER(4)      NOT NULL,
ProvID           NUMBER(2)      NOT NULL,
ApptStatusCode	 CHAR(2)        NOT NULL,
PmtStatus        CHAR(2)        NOT NULL,
PRIMARY KEY (ApptID),
FOREIGN KEY (PatientID) REFERENCES PATIENT_mmi
FOREIGN KEY (BillingType) REFERENCES BILLINGTYPE_mmi
FOREIGN KEY (InsCoID) REFERENCES INSURANCE_mmi
FOREIGN KEY (ProvID) REFERENCES PROVIDER_mmi
FOREIGN KEY (ApptStatusCode) REFERENCES APPTSTATUS_mmi
FOREIGN KEY (PmtStatus) REFERENCES PMTSTATUS_mmi
) ;

CREATE TABLE APPTDETAIL_mmi (
ApptID	         NUMBER(4),         
TreatmentCode    VARCHAR(10),
PRIMARY KEY (ApptID, TreatmentCode),
FOREIGN KEY (ApptID) REFERENCES APPOINTMENT_mmi
FOREIGN KEY (TreatmentCode) REFERENCES TREATMENT_mmi
) ;

/*Part IB
Note: DESCRIBE is a utility statement, not an SQL statement, so there is no semi-colon at the end */
DESCRIBE PATIENT_mmi 
DESCRIBE BILLINGTYPE_mmi
DESCRIBE INSURANCECO_mmi
DESCRIBE PMTSTATUS_mmi
DESCRIBE APPTSTATUS_mmi
DESCRIBE PROVIDER_mmi
DESCRIBE BLOCKCODE_mmi
DESCRIBE TREATMENT_mmi
DESCRIBE APPOINTMENT_mmi
DESCRIBE APPTDETAIL_mmi

/*Part IIA
-- Insert rows into PATIENT table
INSERT INTO PATIENT_mmi
VALUES (101, 'Wesley', 'Tanner', '8175551193') ;
VALUES (100, 'Brenda', 'Rhodes', '2145559191') ;
VALUES (15, 'Jeff', 'Miner', '4695552301') ;
VALUES (77, 'Kim', 'Jackson', '8175554911') ;
VALUES (119, 'Mary', 'Vaughn', '8175552334') ;
VALUES (97, 'Chris', 'Mancha', '4695553440') ;
VALUES (28, 'Renee', Walker', '2145559285') ;
VALUES (105, 'Johnny', 'Redmond', '2145551084') ;
VALUES (84, 'James', 'Clayton', '2145559285') ;
VALUES (23, 'Shelby', 'Davis', '8175551198') ;

--Insert rows into BILLINGTYPE table
INSERT INTO BILLINGTYPE_mmi
VALUES ('I', 'Insurance') ;
VALUES ('SP', 'Self-Pay) ;
VALUES ('WC', 'Worker's Comp') ;

--Insert rows into INSURANCECO table
INSERT INTO INSURANCECO_mmi
VALUES (323, 'Humana') ;
VALUES (129, 'Blue Cross') ;
VALUES (210, 'State Farm') ;
VALUES (135, 'TriCare') ;

-- Insert rows into PMTSTATUS table
INSERT INTO PMTSTATUS_mmi
VALUES ('PD', 'Paid in Full') ;
VALUES ('PP', 'Partial Pmt') ;
VALUES ('NP', 'Not Paid') ;

-- Insert rows into APPTSTATUS table
INSERT INTO APPTSTATUS_mmi
VALUES ('CM', 'Completed') ;
VALUES ('CN', 'Confirmed') ;
VALUES ('NC', 'Not Confirmed') ;

-- Insert rows into PROVIDER table
INSERT INTO PROVIDER_mmi
VALUES (2, 'Michael', 'Smith') ;
VALUES (5, 'Janice', 'May') ;
VALUES (1, 'Kay', 'Jones') ;
VALUES (3, 'Ray', 'Schultz') ;

-- Insert rows into BLOCKCODE
INSERT INTO BLOCKCODE_mmi
VALUES ('L1', 'Level 1', 15) ;
VALUES ('L2', 'Level 2', 20) ;
VALUES ('L3', 'Level 3', 30) ;
VALUES ('L4', 'Level 4', 60) ;

-- Insert rows into TREATMENT
INSERT INTO TREATMENT_mmi
VALUES ('NP', 'New Patient', '45', 'L1') ;
VALUES ('GBP', 'General Back Pain', '60', 'L2') ;
VALUES ('XR', 'X-Ray', '250', 'L2') ;
VALUES ('PSF', 'Post-Surgery Follow Up', '30', 'L1')
VALUES ('SR', 'Suture Removal', '50', 'L2') ;
VALUES ('PT30', 'Physical Therapy 30', '60', 'L3') ;
VALUES ('BI', 'Back Injury', '60', 'L2') ;
VALUES ('PT60', 'Physical Therapy 60', '110', 'L4') ;
VALUES ('HP', 'Hip Pain', '60', 'L2') ;

-- Insert rows into APPOINTMENT
INSERT INTO APPOINTMENT_mmi
VALUES (101, TO_DATE('2/19/24 9:00AM', 'MM/DD/YY HH:MI'), 101, 'I', 323, 2, 'CM', 'PD') ;
VALUES (102, TO_DATE('2/19/24 9:00AM', 'MM/DD/YY HH:MI'), 100, 'I', 129, 5, 'CM', 'PP') ;
VALUES (103, TO_DATE('2/19/24 10:00AM', 'MM/DD/YY HH:MI'), 15, 'SP', Null, 2, 'CM', 'PD') ;
VALUES (104, TO_DATE('2/19/24 10:30AM', 'MM/DD/YY HH:MI'), 77, 'WC', 210, 1, 'CM', 'PD') ;
VALUES (105, TO_DATE('2/19/24 10:30AM', 'MM/DD/YY HH:MI'), 119, 'I', 129, 2, 'CM', 'PP') ;
VALUES (106, TO_DATE('2/19/24 10:30AM', 'MM/DD/YY HH:MI'), 97, 'SP', Null, 3, 'CM', 'NP') ;
VALUES (107, TO_DATE('2/19/24 11:30AM', 'MM/DD/YY HH:MI'), 28, 'I', 129, 3, 'CN', 'PP') ;
VALUES (108, TO_DATE('2/19/24 11:30AM', 'MM/DD/YY HH:MI'), 105, 'I', 323, 2, 'CN', 'NP') ;
VALUES (109, TO_DATE('2/19/24 2:00PM', 'MM/DD/YY HH:MI'), 84, 'I', 135, 5, 'NC', 'NP') ;
VALUES (110, TO_DATE('2/20/24 8:30AM', 'MM/DD/YY HH:MI'), 84, 'I', 135, 3, 'NC', 'NP') ;
VALUES (111, TO_DATE('2/20/24 8:30AM', 'MM/DD/YY HH:MI'), 23, 'WC', 323, 5, 'CN', 'NP') ;

-- INSERT rows into APPTDETAIL 
INSERT INTO APPTDETAIL_mmi
VALUES (101, 'NP') ;
VALUES (101, 'GBP') ;
VALUES (101, 'XR') ;
VALUES (102, 'PSF') ;
VALUES (102, 'SR') ;
VALUES (103, 'PSF') ;
VALUES (103, 'SR') ;
VALUES (104, 'PT30') ;
VALUES (105, 'NP') ;
VALUES (105, 'BI') ;
VALUES (106, 'PT60') ;
VALUES (107, 'PT30') ;
VALUES (108, 'GBP') ;
VALUES (109, 'PSF') ;
VALUES (109, 'SR') ;
VALUES (110, 'PT60') ;
VALUES (111, 'NP') ;
VALUES (111, 'HP') ;
VALUES (111, 'XR') ;

-- Save all rows to disk
COMMIT ;

--Part IIB
SELECT * FROM PATIENT_mmi ;
SELECT * FROM BILLINGTYPE_mmi ;
SELECT * FROM INSURANCECO_mmi ;
SELECT * FROM PMTSTATUS_mmi ;
SELECT * FROM APPTSTATUS_mmi ;
SELECT * FROM PROVIDER_mmi ;
SELECT * FROM BLOCKCODE_mmi ;
SELECT * FROM TREATMENT_mmi ;
SELECT * FROM APPOINTMENT_mmi ;
SELECT * FROM APPTDETAIL_mmi ;

--Part III
--Changing a patient's phone number
UPDATE PATIENT_mmi
   SET PatientPhone = '2145551234',
 WHERE PatientID = 100 ;

--Adding Patient 120
INSERT INTO PATIENT_mmi
VALUES (120, 'Amanda', 'Green', Null) ;

--Adding a treatment
INSERT INTO TREATMENT_mmi
VALUES ('CI1', 'Cortizone Injection 1', 50, 'L1') ;
VALUES ('CI2', 'Cortizone Injection 2', 100, 'L1') ;

--Changing the appointment date/time
UPDATE APPOINTMENT_mmi
   SET ApptDateTime = (TO_DATE'2/21/2024'),
  Where Appt = 108 ;

--Changing the billing type
UPDATE APPOINTMENT_mmi
   SET BillingType = 'WC',
  Where Appt = 107 ;

--Adding a new appointment 
INSERT INTO APPOINTMENT_mmi
VALUES (112, (TO_DATE'2/21/24 9:00AM', 'MM/DD/YY HH:MI'), 120, 'SP', Null, 2, 'NC', 'NP') ;

--Adding treatment code
INSERT INTO APPTDETAIL_mmi
VALUES (112, 'NP') ;
VALUES (112, 'HP') ;
VALUES (112, 'CI2') ;

--Deleting treatment code
DELETE FROM APPTDETAIL_mmi
WHERE ApptID = 105 AND TreatmentCode = 'BI' ;

--Adding treatment code
INSERT INTO APPTDETAIL_mmi
VALUES (105, 'GBP') ;

--COMMIT to save changes to disk
COMMIT ;

/* Part IV
Retrieve all data from each table and sort by the PK */
SELECT * FROM PATIENT_mmi 
 ORDER BY PatientID ;
SELECT * FROM BILLINGTYPE_mmi 
 ORDER BY BillingType ;
SELECT * FROM INSURANCECO_mmi 
 ORDER BY InsCoID ;
SELECT * FROM PMTSTATUS_mmi
 ORDER BY PmtStatus ;
SELECT * FROM APPTSTATUS_mmi
 ORDER BY ApptStatusCode ;
SELECT * FROM PROVIDER_mmi
 ORDER BY ProviderID ;
SELECT * FROM BLOCKCODE_mmi 
 ORDER BY BlockCode ;
SELECT * FROM TREATMENT_mmi 
 ORDER BY TreatmentCode ;
SELECT * FROM APPOINTMENT_mmi 
 ORDER BY ApptID ;
SELECT * FROM APPTDETAIL_mmi
 ORDER BY ApptID, TreatmentCode ;


set echo off
-- This will turn off logging.

spool off
-- This will close the file. 
