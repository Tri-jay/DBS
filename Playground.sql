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