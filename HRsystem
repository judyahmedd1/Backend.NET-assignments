CREATE DATABASE HRsystem;

CREATE TABLE Department (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees(
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeName NVARCHAR(50) NOT NULL,
    EmployeeEmail NVARCHAR(50) NOT NULL UNIQUE,
	DepartmentID INT NOT NULL,
	EmployeeTitle NVARCHAR(50) NOT NULL,
	EmployeeAge INT CHECK (EmployeeAge >= 18),
	EmployeeAddress NVARCHAR(255) NOT NULL,
	EmployeePhone NVARCHAR(50),
	EmployeeSalary DECIMAL(10, 2) NOT NULL,
	EmployeeNationalID NVARCHAR(50) NOT NULL,
	EmployeePhoto VARBINARY(MAX) NOT NULL,
	EmployeeFingerprint VARBINARY(MAX) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectTtitle NVARCHAR(255) NOT NULL,
    ProjectDescription NVARCHAR(MAX) NOT NULL,
	DepartmentID INT NOT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Employees_Projects (
    ProjectID INT,
    EmployeeID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
	);

	CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    TaskTitle NVARCHAR(100) NOT NULL,
    ProjectID INT NOT NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


SELECT EmployeeName, EmployeeTitle
FROM Employees
WHERE EmployeeAge > 30;

SELECT *
FROM Employees
-- replace 3 with the department you need
WHERE DepartmentID = 3; 

SELECT MIN(EmployeeSalary) AS MinSalary
FROM Employees;

SELECT *
FROM Employees
WHERE EmployeeName LIKE 'A%';

SELECT *
FROM Employees
WHERE EmployeeEmail LIKE '%gmail%';

SELECT *
FROM Employees
WHERE EmployeePhone IS NULL;

SELECT *
FROM Employees
ORDER BY EmployeeAge;

SELECT EmployeeName, EmployeeAge,
    CASE
        WHEN EmployeeAge < 30 THEN 'Junior'
        WHEN EmployeeAge BETWEEN 30 AND 40 THEN 'Mid Level'
        ELSE 'Senior'
    END AS AgeGroup
FROM Employees;
