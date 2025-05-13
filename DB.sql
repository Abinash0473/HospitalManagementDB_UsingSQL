-- Create Database
CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO

-- 1. Departments
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY IDENTITY(1,1),
    DeptName NVARCHAR(100) NOT NULL
);

-- 2. Doctors
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName NVARCHAR(100),
    Specialty NVARCHAR(100),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    Phone VARCHAR(15),
    Email NVARCHAR(100)
);

-- 3. Patients
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName NVARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    ContactNo VARCHAR(15),
    Address NVARCHAR(255)
);

-- 4. Appointments
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATETIME,
    Status NVARCHAR(50) DEFAULT 'Scheduled'
);

-- 5. Medical Records
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    Diagnosis NVARCHAR(255),
    Treatment NVARCHAR(255),
    DateOfEntry DATE DEFAULT GETDATE()
);

-- 6. Bills
CREATE TABLE Bills (
    BillID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    Amount DECIMAL(10,2),
    BillingDate DATE DEFAULT GETDATE(),
    Paid BIT DEFAULT 0
);
