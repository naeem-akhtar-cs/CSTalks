create table common_user(
suserSatus int
,ID int primary key
,email varchar (40)
,fName varchar(40)
,lName varchar(40)
,date_joined varchar(40)
,user_status int  -- 1 if active and 0 otherwise 
,user_password varchar(200)
,useraddress varchar(60)
,city varchar(40)
,province varchar(40)
);

insert common_user values (31,'l174262@lhr.nu.edu.pk', 'Naeem', 'Akhtar','2021/07/03', 1, '123', 'Johar Town Block E', 'Lahore', 'Punjab');


-- delete from common_user where ID=24

create table categories(
ID int primary key
, title varchar (50)
);

insert into categories values (1,'Data Structures');
insert into categories values (2,'Data Base Systems');
insert into categories values (3,'OOP');
insert into categories values (4,'General');
insert into categories values (5,'Java Programming (OOP)');
insert into categories values (6,'C++ Programming');
insert into categories values (7,'Operating Systems');
insert into categories values (8,'Algorithms');
insert into categories values (9,'Computer Networks');
insert into categories values (10,'Cloud Computing');

select* from categories;

-- drop table questions;

create table questions(
ID int primary key
,question_statement varchar(500)
,category int
,date_added date
,askedBy int
,foreign key questions(category) references categories(ID)
,foreign key questions(askedBy) references common_user(ID)
);

ALTER TABLE common_user
ADD userStatus int;

ALTER TABLE questions
ADD foreign key (askedBy) references common_user(ID);

select* from questions;

-- Need to Update Insert Queries, another attribute askedBy is added using Alter Table

insert into questions values (1, 'What is LinkedList?', 1, '2021/07/03');
insert into questions values (2, 'Explain ACID Properties.', 2, '2021/07/03');
insert into questions values (3, 'Why do we use Transactions in Database?', 2, '2021/07/03');
insert into questions values (4, 'What is Difference Between Dynamic and Static Ploymorphism?', 3, '2021/07/03');
insert into questions values (5, 'What are Draw Backs of Inheritance?',5 , '2021/07/03');
insert into questions values (6, 'What is Static in Java Programming?', 5, '2021/07/03');
insert into questions values (7, 'Why main() function is static in Java and NOT in C++ Programming Language?',6 , '2021/07/03');
insert into questions values (8, 'Why we dont Need Object Reference to call a Static Function?',5 , '2021/07/03');
insert into questions values (9, 'Why do we need Trees eventhough we have LinkedLists?', 1, '2021/07/03');
insert into questions values (10, 'Why we have to make Constructor and Destructor Virtual in C++ while implementing Ploymorphism?',6 , '2021/07/03');
insert into questions values (11, 'Introduce Your Self', 4, '2021/07/03');
insert into questions values (12, 'What is Dirty Read', 7, '2021/07/03');
insert into questions values (13, 'What is Backing Store', 7, '2021/07/03');
insert into questions values (14, 'Explain a Senario where we have to use Count Sort?', 8, '2021/07/03');


update common_user
set useraddress='Model Town', city='Lahore', province='Punjab'
where ID=29;

delete from common_user where ID=33;


create table notes (
owner_id int
,note varchar(500)
,date_added varchar(40)
,foreign key notes(owner_id) references common_user(ID)
);

drop table notes;

insert into notes values(25,'PIT Presentation in Next Class','2021/07/02');
insert into notes values(28,'Data Science Assign 2','2021/07/03');
insert into notes values(29,'Advanced Programming Deliverable','2021/07/04');
insert into notes values(30,'FYP Report','2021/07/05');
insert into notes values(32,'FYP Meeting','2021/07/06');
insert into notes values(30,'Data Science Quiz','2021/07/07');
insert into notes values(35,'Advanced Programming Quiz and Assignment','2021/07/08');


create table requestedTopics(
title varchar(100)
,dateRequested varchar(40)
,requestedBy int
,foreign key requestedTopics(requestedBy) references common_user(ID)
);



insert into requestedTopics values('Data Science', '2021/07/06', 25);
insert into requestedTopics values('Computer Architecture', '2021/07/06', 28);
insert into requestedTopics values('Assembly Language', '2021/07/06', 29);
insert into requestedTopics values('Network Security', '2021/07/06', 30);


create table bookMarks(
ID int primary key
,question_id int
,owner_id int
,foreign key (question_id) references questions(ID)
,foreign key bookMarks(owner_id) references common_user(ID)
);

drop table bookmarks;

insert into bookMarks values (1,6,30);
insert into bookMarks values (2,4,30);
insert into bookMarks values (3,3,35);
insert into bookMarks values (4,8,35);
insert into bookMarks values (5,2,25);
insert into bookMarks values (6,1,29);

delete from notes where notes.owner_id=25;

select question_statement, title as categoryTitle from questions left join categories on questions.category=categories.ID;

update questions
set askedBy=32
where questions.ID>10 and questions.ID<16;

create table answers(
ID int primary key
,statement varchar(500)
,ownerID int
,dateAnswered varchar(30)
,questionID int
,foreign key answers(ownerID) references common_user(ID)
,foreign key answers(questionID) references questions(ID));

insert into answers values(1, 'Inherited functions work slower than normal function as there is indirection.', 28, '2021/07/11', 5);
insert into answers values(2, 'Often, data members in the base class are left unused which may lead to memory wastage.', 30, '2021/07/11', 5);
insert into answers values(3, 'Inheritance increases the coupling between base class and derived class. A change in base class will affect all the child classes.', 31, '2021/07/11', 5);

ALTER TABLE categories
ADD dateAdded varchar(30);

ALTER TABLE answers
ADD foreign key (questionID) references questions(ID);

update answers
set questionID=5
where ID<4;

create table admin_user(
ID int primary key
,email varchar (40)
,fName varchar(40)
,lName varchar(40)
,user_password varchar(200)
,useraddress varchar(60)
,city varchar(40)
,province varchar(40)
);

insert admin_user values (1,'admin@cstalks.com', 'Amjad', 'Sabri', 'amjad78sabri', 'Gulshan Iqbal', 'Karachi', 'Sindh');

update admin_user
set user_password='123'
where ID=1;

create table reportedQuestions(
questionID int
,dateReported varchar(20)
,reportedBy int 
,foreign key reportedQuestions1(questionID) references questions(ID)
,foreign key reportedQuestions2(reportedBy) references common_user(ID)
);

insert into reportedQuestions values(1,'2021/07/11',28);

create table userLogins(
userID int
,loginDate varchar(30)
,foreign key userLogins(userID) references common_user(ID)
);

-- drop table  userLogins

select count(*) as count, title from questions as ques join categories on ques.category=categories.ID group by ques.category, categories.title order by count desc limit 5;

select count(*) as eachCount, title from questions as ques join categories on ques.category=categories.ID group by ques.category, categories.title order by eachCount desc limit 5;

ALTER Table notes
add ID int;

ALTER Table common_user
add university varchar(50);

update common_user
set age=21
where ID=25;

update categories
set dateAdded='2021/14/07'
where ID<11;


SHOW CREATE table bookMarks;

ALTER TABLE bookMarks
DROP CONSTRAINT question_id;

ALTER TABLE userLogins
ADD foreign key userLogins(userID) references common_user(ID) on delete set null;

update common_user
set userStatus=1
where ID>=25 and ID<=33;

update common_user
set userStatus=1
where ID=25;


update notes
set ID=3
where note='My Note';

delete from notes where owner_id=25;

ALTER table notes add primary key (ID);

delete from common_user where ID>=33;

ALTER TABLE common_user ADD CONSTRAINT email UNIQUE(email);

delete from common_user where ID=38;

delete from notes where ID>4;

delete from common_user where ID=33;

update admin_user
set fName='Amir', lName='Wali'
where ID=1;

ALter table bookMarks
add unique(question_id);

delete from reportedQuestions where questionID=11;	

update common_user set user_status=1 where ID=31;

show create table reportedQuestions;

alter table reportedQuestions
drop constraint reportedQuestions_ibfk_2;

delete from reportedQuestions where questionID=15;

ALTER TABLE reportedQuestions
ADD foreign key reportedQuestions(questionID) references questions(ID) on delete cascade;


select* from requestedTopics;
select* from notes;
select* from common_user;
	
select* from categories;
select* from categories;
select* from bookMarks;
select* from answers;
select* from admin_user;
select* from userLogins;
select* from reportedQuestions;
select* from questions;