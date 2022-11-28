/*Database of Tourism and travel management system MLB_02.01_12*/

/* create tourist table*/

CREATE TABLE Tourist
(
Tourist_ID varchar(7) CHECK (Tourist_ID LIKE '[C][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
Tourist_FirstName char(15) NOT NULL,
Tourist_SurName char(15),
DOB date,
Address char(200) NOT NULL,
Reg_Details char(15),
constraint Tourist_PK PRIMARY KEY(Tourist_ID),
);

/* create tourist contact number table*/

CREATE TABLE Tourist_contact_no
(
Tourist_ID varchar(7) CHECK (Tourist_ID LIKE '[C][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
Contact_number varchar(10) CHECK (Contact_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Tourist_contact_no_PK PRIMARY KEY(Contact_number),
CONSTRAINT Tourist_contact_no_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
);

/* create tourist E-mail table*/

CREATE TABLE Tourist_Email
(
Tourist_ID varchar(7) CHECK (Tourist_ID LIKE '[C][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
Email char(100) NOT NULL,
CONSTRAINT Tourist_Email_PK PRIMARY KEY(Email),
CONSTRAINT Tourist_Email_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
CONSTRAINT Tourist_Email_chk CHECK(Email LIKE '%@%.%')
);

/* create tour table*/

CREATE TABLE Tour
(
Tour_ID varchar(5) CHECK (Tour_ID LIKE '[T][0-9][0-9][0-9][0-9]') NOT NULL,
Price int NOT NULL,
Description char(300),
constraint Tour_PK PRIMARY KEY(Tour_ID),
);

/* create tour type table*/

CREATE TABLE Tour_type
(
Tour_ID varchar(5) CHECK (Tour_ID LIKE '[T][0-9][0-9][0-9][0-9]') NOT NULL,
Tour_type char(15),
CONSTRAINT Tour_type_PK PRIMARY KEY(Tour_type),
CONSTRAINT Tour_type_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
);

/* create tour category table*/

CREATE TABLE Tour_category
(
Tour_ID varchar(5) CHECK (Tour_ID LIKE '[T][0-9][0-9][0-9][0-9]') NOT NULL,
Tour_category char(15) NOT NULL,
CONSTRAINT Tour_category_PK PRIMARY KEY(Tour_category),
CONSTRAINT Tour_category_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
);

/* create Payment table*/

CREATE TABLE Payment
(
Payment_ID varchar(5) CHECK (Payment_ID LIKE '[P][0-9][0-9][0-9][0-9]') NOT NULL,
Amount int NOT NULL,
Tourist_ID varchar(7),
CONSTRAINT Payment_PK PRIMARY KEY(Payment_ID),
CONSTRAINT Payment_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist (Tourist_ID),
);

/* create Payment type table*/

CREATE TABLE Payment_type
(
Payment_ID varchar(5) CHECK (Payment_ID LIKE '[P][0-9][0-9][0-9][0-9]') NOT NULL,
Payment_type int NOT NULL,
CONSTRAINT Payment_type_PK PRIMARY KEY(Payment_type),
CONSTRAINT Payment_type_FK FOREIGN KEY (Payment_ID) REFERENCES Payment (Payment_ID),
);

/* create Feedback table*/

CREATE TABLE Feedback
(
Feedback_reference_no varchar(5) CHECK (Feedback_reference_no LIKE '[F][0-9][0-9][0-9][0-9]') NOT NULL,
Customer_name char(30),
Description char(150),
Feedback_Date Date,
Tourist_ID varchar(7),
CONSTRAINT Feedback_PK PRIMARY KEY(Feedback_reference_no),
CONSTRAINT Feedback_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist (Tourist_ID),
);

/* create Registered tour order table*/

CREATE TABLE Registered_tour_order
(
Reg_tour_ID varchar(5) CHECK (Reg_tour_ID LIKE '[R][0-9][0-9][0-9][0-9]') NOT NULL,
Reg_Date Date,
Reg_tour_type char(15),
Tourist_ID varchar(7),
CONSTRAINT Registered_tour_order_PK PRIMARY KEY(Reg_tour_ID),
CONSTRAINT Registered_tour_order_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist (Tourist_ID),
);

/* create Accountant table*/

CREATE TABLE Accountant
(
Acc_ID varchar(5) CHECK (Acc_ID LIKE '[A][0-9][0-9][0-9][0-9]') NOT NULL,
First_name char(15) NOT NULL,
Surname char(15),
CONSTRAINT Accountant_PK PRIMARY KEY(Acc_ID),
);

/* create Suppervisor table*/

CREATE TABLE Suppervisor
(
Suppervisor_ID varchar(5) CHECK (Suppervisor_ID LIKE '[S][0-9][0-9][0-9][0-9]') NOT NULL,
First_name char(15) NOT NULL,
Surname char(15),
Acc_ID varchar(5),
CONSTRAINT Suppervisor_PK PRIMARY KEY(Suppervisor_ID),
CONSTRAINT Suppervisor_FK FOREIGN KEY (Acc_ID) REFERENCES Accountant (Acc_ID),
);

/* create Invoice table*/

CREATE TABLE Invoice
(
Invoice_NO varchar(5) CHECK (Invoice_NO LIKE '[I][0-9][0-9][0-9][0-9]') NOT NULL,
Amount int NOT NULL,
Issued_Date Date,
Issued_time Time,
Acc_ID varchar(5),
CONSTRAINT Invoice_PK PRIMARY KEY(Invoice_NO),
CONSTRAINT Invoice_FK FOREIGN KEY (Acc_ID) REFERENCES Accountant (Acc_ID),
);

/* create Tour consultant table*/

CREATE TABLE Tour_consultant
(
consultant_ID varchar(6) CHECK (consultant_ID LIKE '[C][N][0-9][0-9][0-9][0-9]') NOT NULL,
First_name char(15) NOT NULL,
Surname char(15),
DOB date,
Address char(200) NOT NULL,
Reg_Date date,
CONSTRAINT Tour_consultant_PK PRIMARY KEY(consultant_ID),
);

/* create Consultant contact number table*/

CREATE TABLE Consultant_contact_no
(
consultant_ID varchar(6) CHECK (consultant_ID LIKE '[C][N][0-9][0-9][0-9][0-9]') NOT NULL,
CN_Contact_number varchar(10) CHECK (CN_Contact_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Consultant_contact_no_PK PRIMARY KEY(CN_Contact_number),
CONSTRAINT Consultant_contact_no_FK FOREIGN KEY (consultant_ID) REFERENCES Tour_consultant(consultant_ID),
);

/* create Consultant E-mail table*/

CREATE TABLE consultant_Email
(
consultant_ID varchar(6) CHECK (consultant_ID LIKE '[C][N][0-9][0-9][0-9][0-9]') NOT NULL,
CN_Email char(100) NOT NULL,
CONSTRAINT consultant_Email_PK PRIMARY KEY(CN_Email),
CONSTRAINT consultant_Email_FK FOREIGN KEY (consultant_ID) REFERENCES Tour_consultant(consultant_ID),
CONSTRAINT consultant_Email_chk CHECK(CN_Email LIKE '%@%.%')
);

/* create Guider table*/

CREATE TABLE Guider
(
Guider_ID varchar(5) CHECK (Guider_ID LIKE '[G][0-9][0-9][0-9][0-9]') NOT NULL,
Age int,
First_name char(15) NOT NULL,
Surname char(15),
Basic_salary int,
OT int,
OT_hour int,
consultant_ID varchar(6),
CONSTRAINT Guider_PK PRIMARY KEY(Guider_ID ),
CONSTRAINT Guider_FK FOREIGN KEY (consultant_ID) REFERENCES Tour_consultant(consultant_ID),
);

/* create Guider E-mail table*/

CREATE TABLE Guider_Email
(
Guider_ID varchar(5) CHECK (Guider_ID LIKE '[G][0-9][0-9][0-9][0-9]') NOT NULL,
Guider_Email char(100) NOT NULL,
CONSTRAINT Guider_Email_PK PRIMARY KEY(Guider_Email),
CONSTRAINT Guider_Email_FK FOREIGN KEY (Guider_ID) REFERENCES Guider(Guider_ID),
CONSTRAINT Guider_Email_chk CHECK(Guider_Email LIKE '%@%.%')
);

/* create Registered touriest table*/

CREATE TABLE Registered_touriest
(
Reg_NO varchar(6) CHECK (Reg_NO LIKE '[R][T][0-9][0-9][0-9][0-9]') NOT NULL,
Reg_Date date,
Tourist_name char(20) NOT NULL,
Tour_plan char(200),
CONSTRAINT Registered_touriest_PK PRIMARY KEY (Reg_NO),
);

/* create Manage table*/

CREATE TABLE Manage
(
Reg_tour_ID varchar(5) CHECK (Reg_tour_ID LIKE '[R][0-9][0-9][0-9][0-9]') NOT NULL,
Suppervisor_ID varchar(5) CHECK (Suppervisor_ID LIKE '[S][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Manage_FK1 FOREIGN KEY (Reg_tour_ID) REFERENCES Registered_tour_order (Reg_tour_ID),
CONSTRAINT Manage_FK2 FOREIGN KEY (Suppervisor_ID) REFERENCES Suppervisor (Suppervisor_ID),
);

/* create Guides table*/

CREATE TABLE Guides
(
Reg_NO varchar(6) CHECK (Reg_NO LIKE '[R][T][0-9][0-9][0-9][0-9]') NOT NULL,
Guider_ID varchar(5) CHECK (Guider_ID LIKE '[G][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Guides_FK1 FOREIGN KEY (Reg_NO) REFERENCES Registered_touriest (Reg_NO),
CONSTRAINT Guides_FK2 FOREIGN KEY (Guider_ID) REFERENCES Guider (Guider_ID),
);

/* create Report table*/

CREATE TABLE Report
(
Suppervisor_ID varchar(5) CHECK (Suppervisor_ID LIKE '[S][0-9][0-9][0-9][0-9]') NOT NULL,
consultant_ID varchar(6) CHECK (consultant_ID LIKE '[C][N][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Report_FK1 FOREIGN KEY (Suppervisor_ID) REFERENCES Suppervisor (Suppervisor_ID),
CONSTRAINT Report_FK2 FOREIGN KEY (consultant_ID) REFERENCES Tour_consultant (consultant_ID),
);

/* create Register table*/

CREATE TABLE Register
(
Tourist_ID varchar(7) CHECK (Tourist_ID LIKE '[C][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
Tour_ID varchar(5) CHECK (Tour_ID LIKE '[T][0-9][0-9][0-9][0-9]') NOT NULL,
CONSTRAINT Register_FK1 FOREIGN KEY (Tourist_ID) REFERENCES Tourist (Tourist_ID),
CONSTRAINT Register_FK2 FOREIGN KEY (Tour_ID) REFERENCES Tour (Tour_ID),
);