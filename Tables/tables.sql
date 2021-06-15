Create table event (eid varchar(20) primary key,
edate varchar(20),
ename varchar(20),
evenue varchar(20),
edesc varchar(20));


Create table ufeedback (fname varchar(20),
fcont varchar(20),
fdesc varchar(20));


Create table organiser (oid varchar(20) primary key,
oname varchar(20),
ophone varchar(20),
eid varchar(20),
foreign key(eid) references event(eid) on delete cascade);


Create table participant (pid int primary key auto_increment,
eid varchar(20),
usn varchar(20),
foreign key(eid)references event(eid) on delete cascade,
foreign key(usn)references students(usn) on delete cascade);


Create table students (usn varchar(20) primary key,
name varchar(20),
phone varchar(20),
password varchar(20));


TRIGGER
--------

DELIMITER $$
CREATE TRIGGER after_delete
AFTER DELETE ON event
FOR EACH ROW
BEGIN
Insert INTO remevent
(eid,ename,edate,evenue,edesc)
VALUES(OLD.eid,OLD.edate,OLD.ename,OLD.evenue,OLD.edesc);
END$$



STORED PROCEDURE
-----------------
DELIMITER $$
CREATE PROCEDURE pevent()
BEGIN
Select * from event;
END$$