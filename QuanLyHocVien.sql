create database QuanLyHocVien;
use QuanLyHocVien;

create table Address(
id int primary key,
address varchar(50)
);

create table Classes(
id int primary key,
name varchar(100),
language varchar (20),
description text
);

create table Students(
id int primary key,
name varchar(100),
address_id int,
age int,
phone varchar(11) unique,
classes_id int,
foreign key (address_id) references Address(id),
foreign key (classes_id) references Classes(id)
);

create table Course(
id int primary key,
name varchar(50),
description text
);

create table Point(
id int primary key,
course_id int,
student_id int,
point float,
foreign key (course_id) references Course(id),
foreign key (student_id) references Students(id)
);

insert into Address 
values (1, "Ha Noi"),
(2, "Da Nang"),
(3, "Hue"),
(4, "Sai Gon"),
(5, "Thai Nguyen");

insert into Classes 
values (1, "C623H1", "Java", "C623H"),
(2, "C723H1", "Javascript", "C723H"),
(3, "C823H1", "Java", "C823H"),
(4, "C923H1", "PHP", "C923H"),
(5, "C1023H1", "Java", "C623H");

insert into Students
values (1, "Nguyen Dinh Thong", 1, 30,"0353107446", 5),
(2, "Phan Quyen Thang", 5, 23,"0395211820", 5),
(3, "Nguyen Van Anh", 3, 24,"0965075904", 3),
(4, "Nguyen Quoc Phu", 3, 23,"0931966586", 3),
(5, "Nguyen Van Hai Nhat", 2, 21,"0945962203", 1),
(6, "Huynh Tran Thanh Dung", 2, 24,"0356230012", 1),
(7, "Nguyen Minh Phuong", 4, 24,"0366553995", 2),
(8, "Luong Vat Dat", 2, 24,"0981900587", 2),
(9, "Tran Thanh Hai", 4, 28,"0967548599", 1),
(10, "Tran Tuan Anh", 4, 30,"0375959161", 1);

insert into course 
values (1, "module 1", "JS"),
(2, "module 2", "Java"),
(3, "module 3", "Database"),
(4, "module 4", "Server"),
(5, "module 5", "Team"),
(6, "module 6", "CV");

insert into Point
values (1, 5, 1, 10),
(2, 3, 1, 7.5),
(3, 5, 2, 8),
(4, 5, 2, 6.75),
(5, 3, 3, 8),
(6, 1, 3, 7),
(7, 3, 4, 9.75),
(8, 3, 5, 10),
(9, 5, 6, 6.5),
(10, 5, 7, 8),
(11, 5, 8, 5),
(12, 5, 9, 9.25),
(13, 5, 9, 5),
(14, 2, 10, 10),
(15, 5, 10, 8.5);

select * 
from Students
where name like 'Nguyen%';

select * 
from Students
where name like '%Anh';

select * 
from Students
where age between 15 and 18;

select * 
from Students
where id = 12 or id = 13;

select cl.id, cl.name, count(S.name) as num
from classes cl join Students S on cl.id = S.classes_id group by cl.id order by id;

select ad.id, ad.address, count(S.name) as num
from address ad join Students S on ad.id = S.classes_id group by ad.id order by id;

select co.id, co.name, round(avg(point.point), 2) as average 
from course co left join point on co.id = point.course_id group by co.id order by id;




