DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS  Student;
DROP TABLE IF EXISTS Course;

/* Creating the student table */
CREATE TABLE Student (
ID INT NOT NULL AUTO_INCREMENT,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255) NOT NULL,
DateOfBirth DATE,
Gender ENUM('M','F', 'O'),
PRIMARY KEY(ID)
);

/* Creating the course table */
CREATE TABLE Course (
ID varchar(10),
Title varchar(255) NOT NULL,
Description Text,
PRIMARY KEY(ID)
);

/* Creating the enrollment table */
CREATE TABLE Enrollment (
Course_ID varchar(10),
Student_ID INT,
Enrollment_Date Date,
PRIMARY KEY (Course_ID, Student_ID),
FOREIGN KEY (Course_ID) REFERENCES Course(ID),
FOREIGN KEY (Student_ID) REFERENCES Student(ID)
);


/* Populating the student table */
INSERT INTO Student(ID,LastName,FirstName,DateOfBirth,Gender)
VALUES ('1','James','Josh',NULL,1), ('2','Ram','Amal','1983-10-05',2), 
('3','Jackson','Ann','1985-1-1',2), ('4','Smith','John','1989-11-28',1),
('5','Brian','Sam','1990-11-28',1), ('6','James','David','1983-02-02',3),
('7','Adam','Jane','1984-02-02',2), ('8','Davis','Kate','1980-11-02',2);

/* Populating the course table */
INSERT INTO Course(ID,Title,Description)
VALUES ('SCI5510','Information Theory','Representation, transmission and transformation of information, information compression and protection, generation, storage, processing and transmission of information. Prerequisite: BS in Computer Science, Engineering, or Mathematics'),
('SCI5511','Networks II','Efficient source coding and channel coding techniques, principles of switching, digital transmission over microwave, copper and optical media, T-carrier and SONET systems, traffic consideration in telecommunications networks, network synchronization, control and management, ATM concepts'),
('SCI5520','Advanced Telecommunications Networks','Principles, protocols, and architectures of data networks, internetworking, routing, layering, and addressing, with specific investigation of the Internet Protocol (IP), Mobile IP, Multiprotocol Label Switching (MPLS), IP over Asynchronous Transfer Mode (ATM) networks, and virtual private networks.'),
('SCI5552',' Advanced Data Structures','Formal modeling including specification and deviation of abstract data types, completeness issues in the design of data types and data structures, implementation of data structures from a formal data type specification, verification of abstract to concrete data mapping.');

/* Populating the enrollment table */
INSERT INTO Enrollment(Course_ID, Student_ID, Enrollment_Date)
VALUES ('SCI5510', '1', '2012-02-20'), ('SCI5511', '1', '2013-05-01'),
('SCI5520', '2', '2013-06-29'), ('SCI5552', '2', '2014-01-10'),
('SCI5510', '3', '2014-04-05'), ('SCI5511', '3', '2014-07-08'),
('SCI5520', '4', '2014-06-29'), ('SCI5552', '4', '2014-06-29');