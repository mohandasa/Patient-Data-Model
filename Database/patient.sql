


-- Create tables section -------------------------------------------------

-- Table Patient_info

CREATE TABLE Patient_info
(
 Patient_ID Int NOT NULL,
 Symptom_ID Int NULL,
 Emergency_ID Int NULL,
 First_name Char(20) NOT NULL,
 Last_name Char(20) NOT NULL,
 DoB Date NOT NULL,
 Gender Char(1) NOT NULL,
 Smoke Char(1) NULL,
 Alcohol Char(1) NULL,
 Marital_Status Char(1) NULL,
 Occupation Varchar(30) NULL,
 Special_service_flag Char(1) NULL,
 Allergy_flag Char(1) NULL,
 Emergency_status Char(1) NULL,
 Patient_type Char(1) NULL,
 Insurance_yn Char(1) NOT NULL
)
;

-- Create indexes for table Patient_info

CREATE INDEX IX_Relationship8 ON Patient_info (Symptom_ID)
;

CREATE INDEX IX_Relationship20 ON Patient_info (Emergency_ID)
;

-- Add keys for table Patient_info

ALTER TABLE Patient_info ADD CONSTRAINT Key1 PRIMARY KEY (Patient_ID)
;

-- Table Medical_history

CREATE TABLE Medical_history
(
 Medical_ID Char(1) NOT NULL,
 Condition_ID Int NULL,
 Allergy_ID Int NULL,
 Immunization_id Int NULL,
 Service_ID Int NULL,
 Treatment_ID Char(1) NULL
)
;

-- Create indexes for table Medical_history

CREATE INDEX IX_Relationship1 ON Medical_history (Condition_ID)
;

CREATE INDEX IX_Relationship2 ON Medical_history (Allergy_ID)
;

CREATE INDEX IX_Relationship3 ON Medical_history (Immunization_id)
;

CREATE INDEX IX_Relationship18 ON Medical_history (Service_ID)
;

CREATE INDEX IX_Relationship4 ON Medical_history (Treatment_ID)
;

-- Add keys for table Medical_history

ALTER TABLE Medical_history ADD CONSTRAINT Key2 PRIMARY KEY (Medical_ID)
;

-- Table Medical_conditions

CREATE TABLE Medical_conditions
(
 Condition_ID Int NOT NULL,
 Condition_name Varchar(50) NOT NULL
)
;

-- Add keys for table Medical_conditions

ALTER TABLE Medical_conditions ADD CONSTRAINT Key3 PRIMARY KEY (Condition_ID)
;

-- Table Allergies

CREATE TABLE Allergies
(
 Allergy_ID Int NOT NULL,
 Allergy_name Char(30) NULL
)
;

-- Add keys for table Allergies

ALTER TABLE Allergies ADD CONSTRAINT Key4 PRIMARY KEY (Allergy_ID)
;

-- Table Immunization

CREATE TABLE Immunization
(
 Immunization_ID Int NOT NULL,
 Name Varchar(50) NOT NULL
)
;

-- Add keys for table Immunization

ALTER TABLE Immunization ADD CONSTRAINT Key5 PRIMARY KEY (Immunization_ID)
;

-- Table Symptoms_info

CREATE TABLE Symptoms_info
(
 Symptom_ID Int NOT NULL,
 Category_name Char(50) NOT NULL,
 Symtom_name Char(50) NOT NULL,
 Category_ID Int NOT NULL
)
;

-- Add keys for table Symptoms_info

ALTER TABLE Symptoms_info ADD CONSTRAINT Key6 PRIMARY KEY (Symptom_ID)
;

-- Table Location

CREATE TABLE Location
(
 Location_ID Int NOT NULL,
 Patient_ID Int NOT NULL,
 Zipcode Int NOT NULL,
 Address_line1 Varchar(100) NOT NULL,
 Address_line2 Varchar(50) NULL,
 City Varchar(40) NOT NULL,
 State Char(2) NOT NULL,
 Email_address Varchar(100) NOT NULL,
 Contact Varchar(11) NOT NULL,
 Emergency_Contact Char(1) NOT NULL
)
;

-- Add keys for table Location

ALTER TABLE Location ADD CONSTRAINT Key7 PRIMARY KEY (Location_ID,Patient_ID)
;

-- Table Provider

CREATE TABLE Provider
(
 Doctor_ID_NPI Int NOT NULL,
 Doctor_First_name Varchar(20) NOT NULL,
 Doctor_Last_Name Varchar(40) NOT NULL,
 NurseID Varchar(10) NULL,
 Nurse_Name Varchar(40) NULL
)
;

-- Add keys for table Provider

ALTER TABLE Provider ADD CONSTRAINT Key8 PRIMARY KEY (Doctor_ID_NPI)
;

-- Table Patient_provider_vs

CREATE TABLE Patient_provider_vs
(
 Doctor_ID Int NOT NULL,
 Patient_ID Int NOT NULL,
 Blood_Pressure Float NULL,
 Pulse_Rate Float NULL,
 Body_Temperature Float NULL,
 Respiration_Rate Float NULL,
 Last_Modified_Date Datetime NULL
)
;

-- Add keys for table Patient_provider_vs

ALTER TABLE Patient_provider_vs ADD CONSTRAINT Key9 PRIMARY KEY (Doctor_ID,Patient_ID)
;

-- Table Stay

CREATE TABLE Stay
(
 Patient_ID Int NULL,
 Bed_ID Int NOT NULL,
 From_date Datetime NOT NULL,
 To_date Datetime NULL
)
;

-- Create indexes for table Stay

CREATE INDEX IX_Relationship15 ON Stay (Patient_ID)
;

-- Table Insurance_Info

CREATE TABLE Insurance_Info
(
 Insurance_company_name Varchar(30) NOT NULL,
 Insurance_ID Int NOT NULL
)
;

-- Add keys for table Insurance_Info

ALTER TABLE Insurance_Info ADD CONSTRAINT Key13 PRIMARY KEY (Insurance_company_name)
;

-- Table Patient_insurance

CREATE TABLE Patient_insurance
(
 Patient_ID Int NULL,
 Insurance_company_name Varchar(30) NOT NULL
)
;

-- Create indexes for table Patient_insurance

CREATE INDEX IX_Relationship19 ON Patient_insurance (Patient_ID)
;

-- Add keys for table Patient_insurance

ALTER TABLE Patient_insurance ADD CONSTRAINT Key14 PRIMARY KEY (Insurance_company_name)
;

-- Table Surrogate_info

CREATE TABLE Surrogate_info
(
 Patient_ID Int NULL,
 SSN Bigint NULL,
 First_name_surrogate Varchar(20) NOT NULL,
 Last_name_surrogate Varchar(40) NOT NULL,
 Relationship Varchar(20) NOT NULL,
 DOB Date NOT NULL,
 Contact_Info Char(10) NOT NULL,
 Email Varchar(12) NULL
)
;

-- Create indexes for table Surrogate_info


;

CREATE INDEX IX_Relationship17 ON Surrogate_info (Patient_ID)
;

-- Table Special_services

CREATE TABLE Special_services
(
 Service_ID Int NOT NULL,
 Sevice_type Varchar(50) NULL
)
;

-- Add keys for table Special_services

ALTER TABLE Special_services ADD CONSTRAINT Key15 PRIMARY KEY (Service_ID)
;

-- Table Emergency_status

CREATE TABLE Emergency_status
(
 Emergency_ID Int NOT NULL,
 Emergency_type Char(40) NULL
)
;

-- Add keys for table Emergency_status

ALTER TABLE Emergency_status ADD CONSTRAINT Key16 PRIMARY KEY (Emergency_ID)
;

-- Table Patient_details

CREATE TABLE Patient_details
(
 Patient_ID Int NOT NULL,
 Medical_ID Char(1) NOT NULL
)
;

-- Add keys for table Patient_details

ALTER TABLE Patient_details ADD CONSTRAINT Key18 PRIMARY KEY (Patient_ID,Medical_ID)
;

-- Table Treatment

CREATE TABLE Treatment
(
 Treatment_ID Char(1) NOT NULL,
 Treatment_name Char(30) NULL
)
;

-- Add keys for table Treatment

ALTER TABLE Treatment ADD CONSTRAINT Key19 PRIMARY KEY (Treatment_ID)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE Medical_history ADD CONSTRAINT FK_Medical_history_Condition_ID FOREIGN KEY (Condition_ID) REFERENCES Medical_conditions (Condition_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Medical_history ADD CONSTRAINT FK_Medical_history_Allergy_ID FOREIGN KEY (Allergy_ID) REFERENCES Allergies (Allergy_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Medical_history ADD CONSTRAINT FK_Medical_history_Immunization_id FOREIGN KEY (Immunization_id) REFERENCES Immunization (Immunization_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_info ADD CONSTRAINT FK_Patient_info_Symptom_ID FOREIGN KEY (Symptom_ID) REFERENCES Symptoms_info (Symptom_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Location ADD CONSTRAINT FK_Location_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Patient_info (Patient_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_provider_vs ADD CONSTRAINT FK_PAtient_provider_vs_Doctor_ID FOREIGN KEY (Doctor_ID) REFERENCES Provider (Doctor_ID_NPI) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_provider_vs ADD CONSTRAINT FK_Patient_provider_vs_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Patient_info (Patient_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_insurance ADD CONSTRAINT FK_Patient_insurance_Insurance_company_name FOREIGN KEY (Insurance_company_name) REFERENCES Insurance_Info (Insurance_company_name) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Stay ADD CONSTRAINT FK_Stay_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Patient_info (Patient_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Surrogate_info ADD CONSTRAINT FK_Surrogate_info_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Patient_info (Patient_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Medical_history ADD CONSTRAINT FK_Medical_history_Service_ID FOREIGN KEY (Service_ID) REFERENCES Special_services (Service_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;


ALTER TABLE Patient_info ADD CONSTRAINT FK_Patient_info_Emergency_ID FOREIGN KEY (Emergency_ID) REFERENCES Emergency_status (Emergency_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_details ADD CONSTRAINT FK_Patient_details_Patient_ID FOREIGN KEY (Patient_ID) REFERENCES Patient_info (Patient_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Patient_details ADD CONSTRAINT FK_Patient_details_Medical_ID FOREIGN KEY (Medical_ID) REFERENCES Medical_history (Medical_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE Medical_history ADD CONSTRAINT Relationship4 FOREIGN KEY (Treatment_ID) REFERENCES Treatment (Treatment_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
;



