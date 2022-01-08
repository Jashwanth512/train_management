create database railway_management_system;
use railway_management_system;
create table trainList
(
trainNumber varchar(10) primary key,
trainName char(50),
train_source char(30),
train_destination char(30),
AC_ticket_fair float4,
GEN_ticket_fair float4
);
insert into trainList values(211,'Tirumala Express','Visakhapatnam','Tirupathi',2500,1500),(213,'Hyderabad Express','Visakhapatnam','Hyderabad',2750,1200),(214,'Godavari Express','Visakhapatnam','Godavari',2300,1200);
insert into trainList values(221,'Chennai Express','Visakhapatnam','Tirupathi',2500,1500);
select * from trainList;

create table available_days
(
trainNumber varchar(10),
day_available varchar(20),
date_available date,
foreign key (trainNumber) references trainList(trainNumber) on delete cascade on update cascade
);
insert into available_days values(211,'Monday','2021-11-01'),(211,'wednesday','2021-11-03'),(213,'Tuesday','2021-11-02'),(213,'thursday','2021-11-04'),(214,'Friday','2021-11-05');
insert into available_days values(221,'Sunday','2021-11-06');
select * from available_days;

create table train_status
(
trainNumber varchar(10),
train_date date,
total_AC_seats int,
total_GEN_seats int,
AC_seats_booked int,
GEN_seats_booked int,
AC_seats_available int,
GEN_seats_available int,
primary key(trainNumber,train_date),
foreign key (trainNumber) references TrainList(trainNumber) on delete cascade on update cascade,
check(AC_seats_booked<11),check(GEN_seats_booked<11)
);
insert into train_status values(211,'2021-11-01',10,10,0,0,10,10),(211,'2021-11-03',10,10,0,0,10,10),(213,'2021-11-02',10,10,0,0,10,10),(213,'2021-11-04',10,10,0,0,10,10),(214,'2021-11-05',10,10,0,0,10,10);
insert into train_status values(221,'2021-11-06',10,10,0,0,10,10);
select * from train_status;
create table passenger
(
ticket_id int8 auto_increment primary key ,
trainNumber varchar(10),
Booking_Date date,
passenger_name char(20),
age int,
sex char(10),
address varchar(100),
ticket_status char(20),
category varchar(20),
foreign key (trainNumber,booking_Date) references train_status(trainNumber,train_date)
);
