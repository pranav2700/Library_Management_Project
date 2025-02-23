-- Library Management System --

-- Creating branch tables --

create table branch
(
 branch_id varchar(20),
 manager_id varchar(20),	
 branch_address varchar(50),	
 contact_no varchar(10)
);

alter table branch
alter column contact_no type varchar(30);

-- Creating employee table --

create table employees
(
 emp_id varchar(20),
 emp_name varchar(20),
 position varchar(20),
 salary int,
 branch_id varchar(20) --fk
);

Alter table employees
add primary key (emp_id);

-- Creating Books table --

create table books
(
 isbn varchar(20) primary key,
 book_title varchar(80),
 category varchar(10),
 rental_price float,
 status varchar(20),
 author varchar(50),
 publisher varchar(50)
);

alter table books
alter column category type varchar(30);

-- Creating Members table --

create table members
(
 member_id varchar(10) primary key,
 member_name varchar(30),
 member_address varchar(80),
 reg_date DATE
);

alter table members
alter column member_id type varchar(30);

-- Creating issue_status table --

create table issue_status
(
 issued_id varchar(20) primary key,
 issued_member_id varchar(20), --fk
 issued_book_name varchar (80),
 issued_date date,
 issued_book_isbn varchar(30), --fk
 issued_emp_id varchar(20) --fk
);

-- Creating return_status table --

create table return_status
(
 return_id varchar(20) primary key,
 issued_id varchar(20),
 return_book_name varchar(80),
 return_date date,
 return_book_isbn varchar(30)
);


-- Adding foreign key

alter table employees
add foreign key (branch_id)
references branch(branch_id);


alter table issue_status
add foreign key (issued_member_id)
references members(member_id);

alter table issue_status
add foreign key (issued_book_isbn)
references books(isbn);


alter table issue_status
add foreign key (issued_emp_id)
references employees(emp_id);


alter table return_status
add foreign key (issued_id)
references issue_status(issued_id);



