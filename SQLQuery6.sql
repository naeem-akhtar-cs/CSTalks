create table common_user(
ID int primary key
,email varchar (40)
,fName varchar(40)
,lName varchar(40)
,date_joined varchar(40)
,user_status int  --1 if active and 0 otherwise 
,user_password varchar(200)
,useraddress varchar(60)
,city varchar(40)
,province varchar(40)
)

insert common_user values (31,'l174262@lhr.nu.edu.pk', 'Naeem', 'Akhtar','2021/07/03', 1, '123', 'Johar Town Block E', 'Lahore', 'Punjab')


--delete from common_user where ID=24

create table categories(
ID int primary key
, title varchar (50)
)

insert into categories values (1,'Data Structures')
insert into categories values (2,'Data Base Systems')
insert into categories values (3,'OOP')
insert into categories values (4,'General')
insert into categories values (5,'Java Programming (OOP)')
insert into categories values (6,'C++ Programming')
insert into categories values (7,'Operating Systems')
insert into categories values (8,'Algorithms')
insert into categories values (9,'Computer Networks')
insert into categories values (10,'Cloud Computing')

select* from categories


create table questions(
ID int primary key
,question_statement varchar(500)
,category int foreign key references categories(ID)
,date_added date
)

insert into questions values (1, 'What is LinkedList?', 1, '2021/07/03')
insert into questions values (2, 'Explain ACID Properties.', 2, '2021/07/03')
insert into questions values (3, 'Why do we use Transactions in Database?', 2, '2021/07/03')
insert into questions values (4, 'What is Difference Between Dynamic and Static Ploymorphism?', 3, '2021/07/03')
insert into questions values (5, 'What are Draw Backs of Inheritance?',5 , '2021/07/03')
insert into questions values (6, 'What is Static in Java Programming?', 5, '2021/07/03')
insert into questions values (7, 'Why main() function is static in Java and NOT in C++ Programming Language?',6 , '2021/07/03')
insert into questions values (8, 'Why we dont Need Object Reference to call a Static Function?',5 , '2021/07/03')
insert into questions values (9, 'Why do we need Trees eventhough we have LinkedLists?', 1, '2021/07/03')
insert into questions values (10, 'Why we have to make Constructor and Destructor Virtual in C++ while implementing Ploymorphism?',6 , '2021/07/03')
insert into questions values (11, 'Introduce Your Self', 4, '2021/07/03')
insert into questions values (12, 'What is Dirty Read', 7, '2021/07/03')
insert into questions values (13, 'What is Backing Store', 7, '2021/07/03')
insert into questions values (14, 'Explain a Senario where we have to use Count Sort?', 8, '2021/07/03')


update common_user
set useraddress='Model Town', city='Lahore', province='Punjab'
where ID=29



delete from common_user where ID=33


create table notes (
owner_id int foreign key references common_user(ID)
,note varchar(500)
,date_added varchar(40)
)



drop table notes

insert into notes values(25,'PIT Presentation in Next Class','2021/07/02')
insert into notes values(28,'Data Science Assign 2','2021/07/03')
insert into notes values(29,'Advanced Programming Deliverable','2021/07/04')
insert into notes values(30,'FYP Report','2021/07/05')
insert into notes values(32,'FYP Meeting','2021/07/06')
insert into notes values(30,'Data Science Quiz','2021/07/07')
insert into notes values(35,'Advanced Programming Quiz and Assignment','2021/07/08')


create table requestedTopics(
title varchar(100)
,dateRequested varchar(40)
,requestedBy int foreign key references common_user(ID)
)



insert into requestedTopics values('Data Science', '2021/07/06', 25)
insert into requestedTopics values('Computer Architecture', '2021/07/06', 28)
insert into requestedTopics values('Assembly Language', '2021/07/06', 29)
insert into requestedTopics values('Network Security', '2021/07/06', 30)


create table bookMarks(
ID int primary key
,question_id int foreign key references questions(ID)
,owner_id int foreign key references common_user(ID)
)

drop table bookmarks

insert into bookMarks values (1,6,30)
insert into bookMarks values (2,4,30)
insert into bookMarks values (3,3,35)
insert into bookMarks values (4,8,35)
insert into bookMarks values (5,2,25)
insert into bookMarks values (6,1,29)


select* from requestedTopics
select* from notes
select* from common_user
select* from questions
select* from categories
select* from requestedTopics
select* from bookmarks