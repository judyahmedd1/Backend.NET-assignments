CREATE DATABASE OnlineCoursePlatform;

CREATE TABLE Students(
	StudentID INT IDENTITY(1,1) PRIMARY KEY,
	StudentName NVARCHAR(50) NOT NULL,
	StudentEmail NVARCHAR(50) NOT NULL UNIQUE,
	StudentAge INT CHECK (StudentAge >= 16),
	StudentCountry NVARCHAR(50) DEFAULT 'Egypt',
);

CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0)
);

CREATE TABLE Enrollments (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollDate DATE DEFAULT (CONVERT(DATE, GETDATE())),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Students (StudentName, StudentEmail, StudentAge, StudentCountry)
VALUES
('Judy Ahmed', 'judy.ahmed@example.com', 26, 'Egypt'),
('Hala Ahmed', 'hala.ahmed@example.com', 30, 'Egypt'),
('Farah Ahmed', 'farah.ahmed@example.com', 18, 'USA');

INSERT INTO Courses (CourseID, CourseName, Category, Price)
VALUES
('BackEnd', 'Programming', 50.00),
('SQL', 'Programming', 80.00),
('Finance', 'Business', 30.00);

INSERT INTO Enrollments (StudentID, CourseID)
VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 1),
(4, 3);


SELECT * FROM Students
WHERE StudentCountry = 'USA'
ORDER BY StudentAge;

SELECT * FROM Students
WHERE StudentAge BETWEEN 20 AND 30;

ALTER TABLE Students
ADD CreatedDate DATE
    CONSTRAINT DF_Students_CreatedDate
    DEFAULT (CONVERT(DATE, GETDATE())) WITH VALUES;

EXEC sp_rename 'Courses.Price', 'Course_Price', 'COLUMN';

SELECT TOP 3 * FROM Enrollments
ORDER BY EnrollmentID;