-- reading
select *
from users;


-- where statement 
select firstname, middleName, dob
from users
where firstname = 'Lila';

-- added a limit on how many to see
select firstname, middleName, dob
from users
where firstname = 'Lila'
limit 5;

-- order by PS. Limit always go after
select firstname, middleName, dob
from users
where firstname = 'Lila'
order by dob asc 
limit 5;

-- saving space in hard drive, space expensive
-- 32 megabytes is 10,000

select firstname, middleName, dob, occupation.occupation, users.occupationId  
from users
join occupation on users.occupationId = occupation.occupationId
where firstname = 'Lila' 
order by dob asc 
limit 5;

select firstname, middleName, dob, occupation.occupation, users.occupationId, userstatus.userStatus 
from users
join occupation on users.occupationId = occupation.occupationId
join userstatus on users.userStatusId  = userstatus.userStatusId 
where firstname = 'Lila' 
order by dob asc 
limit 5;

-- insert statement inserting into table
insert into users (userid, firstname, lastname, middleName, username, `password`, dob, gender, occupationId, userStatusId, userTypeId, created)
values ('e8d01010-c7ba-44ed-ac58-281a8dfc0bdf', 'Crystal', 'Hunter', 'Tri-jay', 'root', 'root92' , '1992-12-02', 'F', 66, 1, 1, NOW())

select firstname, middleName, dob, occupation.occupation, users.occupationId, userstatus.userStatus 
from users
join occupation on users.occupationId = occupation.occupationId
join userstatus on users.userStatusId  = userstatus.userStatusId 
where firstname = 'Crystal' and middleName = 'Tri-jay'
order by dob asc 
limit 5;

insert into users (userid, firstname, lastname, middleName, username, `password`, dob, gender, occupationId, userStatusId, userTypeId, created)
values ('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', 'Jacob', 'Brown', 'Washington', 'starfire', 'robin96' , '1980-10-22', 'M', 66, 1, 1, NOW())

select firstname, middleName, lastname, dob  
from users;

select *
from users
where userid = '7000bbfa-10e9-4a3d-962a-e1ccfffa1859';

insert into userphone (userId, userPhone, userPhoneTypeId)
values 
('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', '406-124-2022', 1),
('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', '408-204-1280', 2);

insert into useremail (userId, userEmail, userEmailTypeId)
values 
('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', 'Bro1980@yahoo.com', 1),
('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', 'JB1280@gmail.com', 2);

select userId , lastname, firstname, userEmail, useremail.userId
from users 
join useremail on useremail.userId = users.userid  
where firstname  = 'Jacob' 
limit 3;


select *
from users 
join userphone on userphone.userId =  users.userid;

select users.userId, lastname, firstname, userPhone, userPhoneType 
from users 
join userphone on userphone.userId =  users.userid
join userphonetype on userphonetype.userPhoneTypeId  = userphone.userPhoneTypeId;  

select *
from users
where userid  = 'e8d01010-c7ba-44ed-ac58-281a8dfc0bdf';

update users
set username = '9crystal2'
where userid  = 'e8d01010-c7ba-44ed-ac58-281a8dfc0bdf';

delete from users
where userid  = 'e8d01010-c7ba-44ed-ac58-281a8dfc0bdf';

select *
from users
where userid = '7000bbfa-10e9-4a3d-962a-e1ccfffa1859';

update users 
set lastname = 'Hunter'
where userid = '7000bbfa-10e9-4a3d-962a-e1ccfffa1859';

select *
from userphone 
where userId = '7000bbfa-10e9-4a3d-962a-e1ccfffa1859'; 

delete from userphone
where userPhone  = '406-124-2022';

update users 
set occupationId = '187'
where userId =  '7000bbfa-10e9-4a3d-962a-e1ccfffa1859';

insert into usertype (userTypeId, userType, deleted)
values (7, 'Totally Awesome', 0);

update users 
set userTypeId = '7'
where userId = '7000bbfa-10e9-4a3d-962a-e1ccfffa1859';

-- took 165ms took this long
select *
from users
where username = '9crystal2';

-- took 1ms
CREATE UNIQUE INDEX users_username_IDX ON users (username);

-- foreign key contraint is stopping you from using an ID the doesn't exist
insert into useremail (userId, userEmail, userEmailTypeId)
values 
('7000bbfa-10e9-4a3d-962a-e1ccfffa1859', 'Bro1980@yahoo.com', 15454654);

-- Adding foreign keys
ALTER TABLE cablelisting
ADD CONSTRAINT cablelisting_FK
FOREIGN KEY (genreId)
REFERENCES c_dbs.cablegenre(genreId)
ON DELETE SET null
ON UPDATE CASCADE;
 
insert into users (userid, firstname, lastname, middleName, username, password, dob, gender)
values ('ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', 'Crystal', 'Hunt', 'Jay', 'Dino92', 'J337134', '1980-10-22', 'F')


select *
from users 
where userId = 'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497';

insert into orders (userId, orderDate, shippingDate)
values ('ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', '2020-06-09 05:22:00', '2020-08-23 19:47:00');

select *
from orders  
where userId = 'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497';


insert into orderitem (orderId, itemId, quantity)
values ('10', '44', '3');

select *
from orderitem
where orderId  = 10;

select * 
from orders
where orderId = 10;

-- the orderitem ID has to match with the orders ID 
--  Ex. orderitem.orderId = orders.orderId 
select *
from orders 
join orderitem on orderitem.orderId = orders.orderId 
where orders.orderId= 10;

-- adding another item into an order
insert into  orderitem (orderId, itemId, quantity)
values (10, 35, 9001);

-- assigning means linking
insert into userdvd (userId, dvdId)
values ('ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', 1457);

insert into userdvd (userId, dvdId)
values ('ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', 1430);

select firstname, lastname, dvd.* 
 from users
 join userdvd on userdvd.userId = users.userId
 join dvd on dvd.dvdId = userdvd.dvdId 
 where users.userid =  'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497';

insert into uservehicle (userId, vehicleId)
values  ( 'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', 1000);

insert into uservehicle (userId, vehicleId)
values  ( 'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497', 84);

select firstname, lastname, vehicle.*  
from users
join uservehicle on uservehicle.userId = users.userId
join vehicle on vehicle.vehicleId = uservehicle.vehicleId  
where users.userId = 'ed5fc4f1-6a28-4ddf-ab36-b56e25f53497';

select users.userid, firstname, lastname, orderId  
from users 
inner join orders on orders.userid = users.userid;  

select *
from users 
left join orders on orders.userId = users.userid
where orderId is null 
limit 200;

select *
from users
inner join orders on orders.userId = users.userid 
inner join orderitem on orderitem.orderId = orders.orderId 
inner join item on item.itemId  = orderitem.orderId  
limit 200;

alter table orders 
add destinationState varchar (2);

update orders 
set destinationState = 'VA'; 

select lastname
from users 
where lastname = 'Steady';

create INDEX IDX_LASTNAME
on users (lastname);

-- % means anything goes here even nothing
select *
from occupation
where occupation like '%Art%';

-- count() is a function helps count
-- min just means find some value in this instance 
select count(*), min(occupation)
from occupation
where occupation like '%Art%';

select count(*) 
from users 
where lastname like '%ing';

select count(*) 
from users
where occupationId is not null
AND firstname like 'j%';

select *
from users
where lastname like '%son';

select from_unixtime(avg(dob))
from users
where dob is not null;

select *
from users 
where dob is not null 
order by dob asc;

select 'CRYSTAL IS THE BEST' as 'facts';

select avg(mpgHighway)
from vehicle;

select *
from vehicle 
where mpgCity != 0
order by mpgCity asc
limit 10;

select count(*) as 'items', itemCategory 
from item
group by itemCategory
order by items DESC;

select count(*) as 'sex', gender 
from users 
group by gender 
order by sex desc;

select count(*) as 'vehicle', make  
from vehicle 
where year = 1997
group by make  
order by vehicle desc;

select * 
from vehicle
where year = 1997;

select count(*) as 'vehicle', make  
from vehicle 
where year = 2002
group by make  
having vehicle > 5
order by make desc;

CREATE TABLE `crystals` (
  `userid` varchar(50) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `occupationId` int(11) DEFAULT NULL,
  `userStatusId` int(11) DEFAULT NULL,
  `userTypeId` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
);

insert into crystals
(select * from users where firstname = 'Crystal');

select fact from facts;

select distinct make 
from vehicle;

create table `vehicleMake` (
`makeId` int(20) not null auto_increment,
`makeName` varchar(50) default null,
primary key (`makeId`)
);

create table `vehicleModel` (
`modelId` int(20) not null auto_increment,
`modelName` varchar(50) default null,
primary key (`modelId`) 
);

select *
from vehicleMake; 


create table `vehicleDrive` (
`driveId` int(20) not null auto_increment,
`driveName` varchar(50) default null,
primary key (`driveId`) 
);

create table `vehiclefuelType` (
`fuelTypeId` int(20) not null auto_increment,
`fuelTypeName` varchar(50) default null,
primary key (`fuelTypeId`) 
);

select *
 from vehiclefuelType; 


insert into vehicleMake (makeName)
select distinct make from vehicle;

insert into vehicleModel (modelName)
select distinct model from vehicle;

insert into vehicledrive (driveName)
select distinct drive from vehicle;

insert into vehiclefueltype (fuelTypeName)
select distinct fuelType from vehicle;

create table `vehicleNormal`(
`vehicleId` int(20)  not null auto_increment,
`makeId` int(20) default null,
`modelId` int(20) default null,
`Year` int(11) default null,
`cylinders` int(11) default null,
`driveId` int(20) default null,
`mpgHighway` decimal(4,4) default null,
`mpgCity` decimal(4,4) default null,
`fuelTypeId` int(20) default null,
primary key (`vehicleId`)
);  

select *
from vehicleNormal;

insert into vehicleNormal (makeId, modelId, `Year`, cylinders, driveId, mpgHighway, mpgCity, fuelTypeId)
select makeId, modelId, `Year`, cylinders, driveId, cast(mpgHighway AS DECIMAL(12,4)), cast(mpgCity AS DECIMAL(12,4)), fuelTypeId
from vehicle
join vehiclemake on vehicle.make = vehiclemake.makeName
join vehiclemodel on vehicle.model = vehiclemodel.modelName
join vehicledrive on vehicle.drive = vehicledrive.driveName
join vehiclefueltype on vehicle.fuelType = vehiclefueltype.fuelTypeName;

select vehicleId, makeName, modelName, driveName, fuelTypeName, vehicleNormal.*
from vehiclenormal
join vehiclemake on vehiclenormal.makeId = vehiclemake.makeId 
join vehiclemodel on vehiclenormal.modelId = vehiclemodel.modelId 
join vehicledrive on vehiclenormal.driveId = vehicledrive.driveId 
join vehiclefueltype on vehiclenormal.fuelTypeId = vehiclefueltype.fuelTypeId;

create view vehicle as (
	select vehicleId, makeName, modelName, driveName, fuelTypeName, `Year`, cylinders, mpgHighway, mpgCity
	from vehiclenormal
	join vehiclemake on vehiclenormal.makeId = vehiclemake.makeId 
	join vehiclemodel on vehiclenormal.modelId = vehiclemodel.modelId 
	join vehicledrive on vehiclenormal.driveId = vehicledrive.driveId 
	join vehiclefueltype on vehiclenormal.fuelTypeId = vehiclefueltype.fuelTypeId
);


select count(*) as 'users', state  
from useraddress 
group by state
order by state asc;

select *
from dvd;  

select *
from users; 

select publicRating
from dvd 
order by `Year` desc  
limit 10;

select avg(publicRating) as 'rating', Genre 
from dvd
where `Year` = 2002
group by Genre
having rating >= 2.2; 

select *
from occupation
where occupation.occupationId = 164;

select dob
from users;

select datediff() 
from users
where users.occupationId = 164;

select avg(dob) as 'sex', Gender 
from users  
group by Gender;

select avg(dob) as 'sex', Gender 
from users 
where gender = 'M'
group by Gender;




select AVG(DATEDIFF(NOW(), dob) / 365) as 'age', min(firstname), min(dob)
from users
where users.occupationId = 164
and users.gender = 'M'
group by users.occupationId;

create table `DVDNormal`(
`dvdId` int(20)  NOT NULL,
`dvdTitle` int(20) NOT NULL,
`year` int(11) NOT NULL,
`publicRating` varchar(100) NOT NULL,
`dvdStudioId` int(20) NOT NULL,
`dvdStatusId` int(20) NOT NULL,
`dvdGenreId` int(20) NOT NULL,
primary key (`dvdId`)
);  

create table `dvdStudio` (
`studioId` int(20) not null auto_increment,
`studioName` varchar(50) default null,
primary key (`studioId`) 
);

create table `dvdStatus` (
`statusId` int(20) not null auto_increment,
`statusName` varchar(50) default null,
primary key (`statusId`)
);
create table `dvdGenre` (
`genreId` int(20) not null auto_increment,
`genreName` varchar(50) default null,
primary key (`genreId`)
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

ALTER TABLE dvdnormal ADD CONSTRAINT dvdnormal_FK_studio FOREIGN KEY (dvdStudioId) REFERENCES dvdstudio(studioId);
ALTER TABLE dvdnormal ADD CONSTRAINT dvdnormal_FK_status FOREIGN KEY (dvdStatusId) REFERENCES dvdstatus(statusId);
ALTER TABLE dvdnormal ADD CONSTRAINT dvdnormal_FK_genre FOREIGN KEY (dvdGenreId) REFERENCES dvdgenre(genreId);

CREATE UNIQUE INDEX dvdstudio_studioName_IDX USING BTREE ON c_dbs.dvdstudio (studioName);
CREATE UNIQUE INDEX dvdstatus_statusName_IDX USING BTREE ON c_dbs.dvdstatus (statusName);
CREATE UNIQUE INDEX dvdgenre_genreName_IDX USING BTREE ON c_dbs.dvdgenre (genreName);

CREATE INDEX dvd_Studio_IDX USING BTREE ON c_dbs.dvd (Studio);
CREATE INDEX dvd_Status_IDX USING BTREE ON c_dbs.dvd (Status);
CREATE INDEX dvd_Genre_IDX USING BTREE ON c_dbs.dvd (Genre);

insert into dvdstudio (studioName)
select distinct Studio 
from dvd;

insert into dvdstatus (statusName) 
select distinct status
from dvd;

insert into dvdgenre (genreName) 
select distinct genre
from dvd;

select *
from dvd;

select *
from dvdnormal;

insert into dvdnormal (dvdId, dvdTitle, `year`, publicRating, dvdStudioId, dvdStatusId, dvdGenreId)
select dvdId, DVD_Title, `year`, publicRating, StudioId, StatusId, GenreId   
from dvd 
join dvdstudio on dvd.Studio = dvdStudio.studioName 
join dvdstatus on dvd.Status = dvdStatus.statusName 
join dvdgenre on dvd.Genre = dvdGenre.genreName; 

create view DVD as (
select *
from dvdnormal
join dvdstudio on dvdnormal.dvdStudioId = dvdStudio.studioId 
join dvdstatus on dvdnormal.dvdStatusId = dvdStatus.statusId 
join dvdgenre on dvdnormal.dvdGenreId = dvdGenre.genreId
)


select *
from DVD
join userdvd on dvd.dvdId = userDvdId
join users on users.userid = userdvd.userId;

select count(*) as `DVDCount`, userdvd.userid, firstname, lastname, gender
from userdvd
join users on userdvd.userid = users.userid
group by userdvd.userid
order by DVDCount desc 
limit 1;

