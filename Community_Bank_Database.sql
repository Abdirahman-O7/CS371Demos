-- CREATE DATABASE CS371Spring2021;
USE CS371Spring2021;

DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Branches;
DROP TABLE IF EXISTS States;
DROP TABLE IF EXISTS  Account_Types;
DROP TABLE IF EXISTS emp_tmp;


/* begin table creation */

CREATE TABLE IF NOT EXISTS States
 (State_ID varchar(2) not null,
  StateName varchar(20) not null,
  constraint pk_states primary key (State_ID)
 );

create table IF NOT EXISTS Departments
 (Department_ID smallint unsigned not null auto_increment,
  DeptName varchar(20) not null,
  constraint pk_department primary key (Department_ID)
 );

create table IF NOT EXISTS Branches
 (Branch_ID smallint unsigned not null auto_increment,
  BranchName varchar(20) not null,
  BranchStreet varchar(30),
  BranchCity varchar(20),
  State_ID varchar(2),
  BranchZip_Code varchar(12),
constraint fk_branches_states foreign key (State_ID) references States(State_ID) ON DELETE RESTRICT,
  constraint pk_branches primary key (Branch_ID)

 );

create table IF NOT EXISTS Employees
 (Employee_id smallint unsigned not null auto_increment,
  EmpFirst_Name varchar(20) not null,
  EmpLast_Name varchar(20) not null,
  EmpStart_date date not null,
  EmpEnd_date date,
  EmpSupervisor_ID smallint unsigned,
  Department_ID smallint unsigned,
  Branch_ID smallint unsigned,
  constraint fk_employee_supervisor 
    foreign key (EmpSupervisor_ID) references Employees (Employee_ID),
  constraint fk_employees_departments
    foreign key (Department_ID) references Departments (Department_ID)
ON DELETE RESTRICT
,
  constraint fk_employees_branches
    foreign key (Branch_ID) references Branches (Branch_ID)
ON DELETE RESTRICT
,
  constraint pk_employees primary key (Employee_ID)
 );


create table IF NOT EXISTS Customers
 (Customer_ID integer unsigned not null auto_increment,
  CustStreet varchar(30),
  CustCity varchar(20),
  State_ID varchar(2),
  CustZip_code varchar(10),
  CustFirst_Name varchar(20) not null,
  CustLast_Name varchar(20) not null,
  CustBirth_Date Date not null,
  constraint pk_customers primary key (Customer_id),
  constraint fk_customers_states foreign key(State_id) references States(State_ID)
  ON DELETE RESTRICT
 );

create table IF NOT EXISTS Account_Types
 (Account_Type_ID varchar(3) not null ,
   Account_Type_Name varchar(60) not null,
  constraint pk_account_types primary key (Account_Type_ID)
 );


create table IF NOT EXISTS Accounts
 (Account_ID integer unsigned not null auto_increment,
  Customer_ID integer unsigned,
  AcctOpen_Date date not null,
  AcctClose_Date date,
  AcctStatus enum('ACTIVE','CLOSED','FROZEN'),
  Branch_ID smallint unsigned,
  Employee_ID smallint unsigned,
  Account_Type_ID varchar(3),
  AvailableBalance integer unsigned,
  LastActivityDate date,
  constraint fk_accounts_customers foreign key (Customer_ID)
    references Customers (Customer_ID) ON DELETE RESTRICT,
  constraint fk_accounts_branches foreign key (Branch_ID)
    references Branches (Branch_ID) ON DELETE RESTRICT,
  constraint fk_accounts_employees foreign key (Employee_ID)
    references Employees (Employee_ID) ON DELETE RESTRICT,
  constraint fk_accounts_account_types foreign key (Account_Type_ID)
    references Account_Types (Account_Type_ID) ON DELETE RESTRICT,
  constraint pk_accounts primary key (Account_ID)
 );

create table IF NOT EXISTS Transactions
 (Transaction_id integer unsigned not null auto_increment,
  TrnsDate datetime not null default now(),
  Account_ID integer unsigned not null,
  TrnsType enum('DBT','CDT'),
  TrnsAmount double(10,2) not null,
  Employee_ID smallint unsigned,
  constraint fk_transactions_accounts foreign key (Account_ID)
    references Accounts (Account_ID) ON DELETE CASCADE,
  constraint fk_transactions_employees foreign key (Employee_ID)
    references Employees (Employee_ID) ON DELETE RESTRICT,
  constraint pk_transactions primary key (Transaction_ID)
 );

/* end table creation */

/* begin data population */

/* state data */
insert into States (State_ID,StateName)
values ('MA','Massachusetts'),('MO','Missouri'),('NH','New Hampshire');

/* department data */
insert into Departments (DeptName)
values ('Operations'),('Loans'),('Administration'), ('Customer Service');

/* branch data */
insert into Branches (BranchName, BranchStreet, BranchCity, State_ID, BranchZip_Code)
values ('Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451'),
('Woburn Branch', '422 Maple St.', 'Woburn', 'MA', '01801'),
('Quincy Branch', '125 Presidential Way', 'Quincy', 'MA', '02169'),
('So. NH Branch', '378 Maynard Ln.', 'Salem', 'NH', '03079');

/* employee data */
insert into Employees (EmpFirst_Name, EmpLast_Name, EmpStart_Date, 
  Department_ID, Branch_ID)
values ('Michael', 'Smith', '2020-06-22', 
  (select Department_ID from Departments where DeptName = 'Administration'),  
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Susan', 'Barker', '2002-09-12', 
  (select Department_ID from Departments where DeptName= 'Administration'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Robert', 'Tyler', '2015-02-09',
  (select Department_ID from Departments where DeptName= 'Administration'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Susan', 'Hawthorne', '2002-04-24', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('John', 'Gooding', '2020-11-14', 
  (select Department_ID from Departments where DeptName = 'Loans'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Helen', 'Fleming', '2004-03-17', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Chris', 'Tucker', '2017-09-15', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Sarah', 'Parker', '2002-12-02', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Jane', 'Grossman', '2002-05-03', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Headquarters')),
('Paula', 'Roberts', '2002-07-27', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Woburn Branch')),
('Thomas', 'Ziegler', '2020-10-23', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Woburn Branch')),
('Samantha', 'Jameson', '2003-01-08', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Woburn Branch')),
('John', 'Blake', '2000-05-11', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Quincy Branch')),
('Cindy', 'Mason', '2013-08-09', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Quincy Branch')),
('Frank', 'Portman', '2003-04-01', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'Quincy Branch')),
('Theresa', 'Markham', '2001-03-15', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'So. NH Branch')),
('Beth', 'Fowler', '2010-06-29', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'So. NH Branch')),
('Rick', 'Tulman', '2002-12-12', 
  (select Department_ID from Departments where DeptName = 'Operations'), 
  (select Branch_ID from Branches where BranchName = 'So. NH Branch'));

/* create data for self-referencing foreign key 'superior_emp_id' */
create temporary table emp_tmp as
select Employee_ID, EmpFirst_Name, EmpLast_Name from Employees;

update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Smith' and EmpFirst_Name = 'Michael')
where ((EmpLast_Name = 'Barker' and EmpFirst_Name = 'Susan')
  or (EmpLast_Name = 'Tyler' and EmpFirst_Name = 'Robert'));
update employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Tyler' and EmpFirst_Name = 'Robert')
where EmpLast_Name = 'Hawthorne' and EmpFirst_Name = 'Susan';
update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Hawthorne' and EmpFirst_Name = 'Susan')
where ((EmpLast_Name = 'Gooding' and EmpFirst_Name = 'John')
  or (EmpLast_Name = 'Fleming' and EmpFirst_Name = 'Helen')
  or (EmpLast_Name = 'Roberts' and EmpFirst_Name = 'Paula') 
  or (EmpLast_Name = 'Blake' and EmpFirst_Name = 'John') 
  or (EmpLast_Name = 'Markham' and EmpFirst_Name = 'Theresa')); 
update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Fleming' and EmpFirst_Name = 'Helen')
where ((EmpLast_Name = 'Tucker' and EmpFirst_Name = 'Chris') 
  or (EmpLast_Name = 'Parker' and EmpFirst_Name= 'Sarah') 
  or (EmpLast_Name = 'Grossman' and EmpFirst_Name = 'Jane'));  
update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Roberts' and EmpFirst_Name = 'Paula')
where ((EmpLast_Name = 'Ziegler' and EmpFirst_Name = 'Thomas')  
  or (EmpLast_Name = 'Jameson' and EmpFirst_Name = 'Samantha'));   
update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Blake' and EmpFirst_Name = 'John')
where ((EmpLast_Name = 'Mason' and EmpFirst_Name = 'Cindy')   
  or (EmpLast_Name= 'Portman' and EmpFirst_Name = 'Frank'));    
update Employees set EmpSupervisor_ID =
 (select Employee_ID from emp_tmp where EmpLast_Name = 'Markham' and EmpFirst_Name = 'Theresa')
where ((EmpLast_Name = 'Fowler' and EmpFirst_Name = 'Beth')   
  or (EmpLast_Name= 'Tulman' and EmpFirst_Name = 'Rick'));    

drop table emp_tmp;


/* product data */
insert into Account_Types (Account_Type_ID, Account_Type_Name)
values ('CHK','checking account'),
('SAV','savings account'),
('MM','money market account'),
('CD','certificate of deposit'),
('MRT','home mortgage'),
('AUT','auto loan'),
('BUS','business line of credit'),
('SBL','small business loan');

/* customer data */
insert into Customers (CustStreet, CustCity, State_ID, CustZip_Code, CustFirst_Name,CustLast_Name, CustBirth_Date)
values ('47 Mockingbird Ln', 'Lynnfield', 'MA', '01940', 'James', 'Hadley', '1972-04-22'),
('372 Clearwater Blvd', 'Woburn', 'MA', '01801', 'Susan', 'Tingley', '1968-08-15'),
('18 Jessup Rd', 'Quincy', 'MA', '02169', 'Frank', 'Tucker', '1958-02-06'),
('12 Buchanan Ln', 'Waltham', 'MA', '02451','John', 'Hayward', '1966-12-22'),
('2341 Main St', 'Salem', 'NH', '03079','Charles', 'Frasier', '1971-08-25'),
('12 Blaylock Ln', 'Waltham', 'MA', '02451','John', 'Spencer', '1962-09-14'),
('29 Admiral Ln', 'Wilmington', 'MA', '01887','Margaret', 'Young', '1947-03-19'),
('472 Freedom Rd', 'Salem', 'NH', '03079','Louis', 'Blake', '1977-07-01'),
('29 Maple St', 'Newton', 'MA', '02458','Richard', 'Farley', '1968-06-16'),
('11 Rise St', 'Kansas City', 'MO', '64123','Michael', 'Smith', '1970-06-22');



/* account data */
insert into Accounts (Customer_ID,AcctOpen_Date,AcctStatus,Branch_ID,Employee_ID,Account_Type_ID, AvailableBalance, LastActivityDate)
VALUES ('1','2015-12-05','ACTIVE',1,1,'CHK', 100, '2021-1-05'),
('1','2015-12-05','ACTIVE',2,2,'SAV', 200, '2011-3-01'),
('3','2016-03-04','ACTIVE',3,1,'CHK', 100, '2014-1-02'),
('4','2010-11-18','ACTIVE',4,2,'SAV', 50, '2015-2-12'),
('5','2005-03-12','ACTIVE',3,3,'CD', 1092, '2017-4-15'),
('6','2002-10-08','ACTIVE',2,1,'CHK', 23123, '2016-1-20'),
('7','2013-08-12','ACTIVE',2,4,'CHK', 100, '2011-3-01'),
('8','2015-07-12','ACTIVE',2,1,'CHK', 231, '2021-1-05'),
('8','2006-05-02','ACTIVE',1,5,'AUT',983, '2016-1-20');


/* transaction data */
insert into Transactions (TrnsType,Account_ID,TrnsAmount,Employee_ID)
VALUES ('CDT',1,50.02,null),
('DBT','1',12.02,1),
('CDT','2',20.5,1),
('DBT','2',12.02,1),
('CDT','1',5.05,2),
('DBT','1',12.02,1)
;



/* end data population */
