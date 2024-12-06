
CREATE TABLE donor (
    Donor_ID INT PRIMARY KEY,
    Donor_Name VARCHAR(100),
    DOB DATE,
    Contact_Number VARCHAR(15)
);


CREATE TABLE receptionist (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Contact_Number VARCHAR(15),
    Blood_Bank_ID INT
);


CREATE TABLE blood_bank (
    Blood_Bank_ID INT PRIMARY KEY,
    Blood_Type VARCHAR(10)
);


CREATE TABLE blood (
    Blood_ID_Number INT PRIMARY KEY,
    Blood_Type VARCHAR(10),
    Cost DECIMAL(10, 2),
    Blood_Bank_ID INT,
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID)
);


CREATE TABLE blood_bank_manager (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact_Number VARCHAR(15),
    Blood_Bank_ID INT,
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID)
);


CREATE TABLE hospital (
    Hospital_Name VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(255),
    Contact_Number VARCHAR(15)
);


CREATE TABLE patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Contact_Number VARCHAR(15)
);

CREATE TABLE registers (
    Donor_ID INT,
    Employee_ID INT,
    PRIMARY KEY (Donor_ID, Employee_ID),
    FOREIGN KEY (Donor_ID) REFERENCES donor(Donor_ID),
    FOREIGN KEY (Employee_ID) REFERENCES receptionist(Employee_ID)
);

CREATE TABLE donates (
    Donor_ID INT,
    Blood_ID_Number INT,
    PRIMARY KEY (Donor_ID, Blood_ID_Number),
    FOREIGN KEY (Donor_ID) REFERENCES donor(Donor_ID),
    FOREIGN KEY (Blood_ID_Number) REFERENCES blood(Blood_ID_Number)
);


CREATE TABLE stored (
    Blood_ID_Number INT,
    Blood_Bank_ID INT,
    PRIMARY KEY (Blood_ID_Number, Blood_Bank_ID),
    FOREIGN KEY (Blood_ID_Number) REFERENCES blood(Blood_ID_Number),
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID)
);

CREATE TABLE orders (
    Hospital_Name VARCHAR(100),
    Blood_Bank_ID INT,
    PRIMARY KEY (Hospital_Name, Blood_Bank_ID),
    FOREIGN KEY (Hospital_Name) REFERENCES hospital(Hospital_Name),
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID)
);

CREATE TABLE issues (
    Blood_Bank_ID INT,
    Patient_ID INT,
    PRIMARY KEY (Blood_Bank_ID, Patient_ID),
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID),
    FOREIGN KEY (Patient_ID) REFERENCES patient(Patient_ID)
);

CREATE TABLE delivers (
    Hospital_Name VARCHAR(100),
    Patient_ID INT,
    PRIMARY KEY (Hospital_Name, Patient_ID),
    FOREIGN KEY (Hospital_Name) REFERENCES hospital(Hospital_Name),
    FOREIGN KEY (Patient_ID) REFERENCES patient(Patient_ID)
);

CREATE TABLE manages (
    Blood_Bank_ID INT,
    Employee_ID INT,
    PRIMARY KEY (Blood_Bank_ID, Employee_ID),
    FOREIGN KEY (Blood_Bank_ID) REFERENCES blood_bank(Blood_Bank_ID),
    FOREIGN KEY (Employee_ID) REFERENCES blood_bank_manager(Employee_ID)
);
