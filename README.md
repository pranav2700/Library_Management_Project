# Library Management System using SQL Project

## Project Overview

**Project Title**: Library Management System  
**Level**: Intermediate  
**Database**: `Library_Project`

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

![Library_project](https://github.com/najirh/Library-System-Management---P2/blob/main/library.jpg)

## Objectives

1. **Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.
3. **CTAS (Create Table As Select)**: Utilize CTAS to create new tables based on query results.

## Project Structure

### 1. Database Setup
![ERD](https://github.com/najirh/Library-System-Management---P2/blob/main/library_erd.png)

- **Database Creation**: Created a database named `library_db`.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

```sql
CREATE DATABASE Library_Project;

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

```

### 2. CRUD Operations

- **Create**: Inserted sample records into the `books` table.
- **Read**: Retrieved and displayed data from various tables.
- **Update**: Updated records in the `employees` table.
- **Delete**: Removed records from the `members` table as needed.

**Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

```sql
insert into books values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books;
```
**Task 2: Update an Existing Member's Address**

```sql
update members
set member_address = '125 Oak St' 
where member_id = 'C103';
select * from members;
```

**Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

```sql
delete from issue_status
where issued_id = 'IS121';
select * from issue_status;
```

**Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
```sql
select issued_book_name from issue_status
where issued_emp_id = 'E101';
```


**Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.

```sql
select count(*), issued_emp_id from issue_status
group by 2
having count(*)>1;
```


## Reports

- **Database Schema**: Detailed table structures and relationships.
- **Data Analysis**: Insights into book categories, employee salaries and issued books.
- **Summary Reports**: Aggregated data on high-demand books and employee performance.

## Conclusion

This project demonstrates the application of SQL skills in creating and managing a library management system. It includes database setup, data manipulation, providing a solid foundation for data management and analysis.

