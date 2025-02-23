select * from books;
select * from branch;
select * from employees;
select * from issue_status;
select * from members;
select * from return_status;


-- Project Task --

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books;


-- Task 2. Update an Existing Member's Address, Address = 125 Oak St, member = C103

update members
set member_address = '125 Oak St' 
where member_id = 'C103';
select * from members;


-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

delete from issue_status
where issued_id = 'IS121';
select * from issue_status;


-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issue_status;

select issued_book_name from issue_status
where issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

select * from issue_status;

select count(*), issued_emp_id from issue_status
group by 2
having count(*)>1;
