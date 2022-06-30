create schema ass2;

/* Project 3 */


-- Task 1 (5 marks):
/*Create these tables based on the list provided above: TruckMake, TruckModel, Truck, Service, and Allocation.
Insert at least 5 records into each of the tables. No extra marks will be provided for adding more records, 
but more records may be needed depending on the query results for different questions.
*/

create table TruckMake(
TruckMakeID varchar(3),
TruckMakeName char(10),
primary key(TruckMakeID)
);

create table TruckModel(
TruckMakeID varchar(4),
TruckModelID varchar(4),
TruckModelName varchar(5),
primary key(TruckModelID,TruckMakeID),
foreign key(TruckMakeID) references TruckMake(TruckMakeID)
);

create table Truck(
TruckVINNum varchar(5),
TruckMakeID varchar(4),
TruckModelID varchar(4),
TruckColour char(10),
TruckPurchaseDate date,
TruckCost decimal(10,2),
primary key(TruckVINNum),
foreign key(TruckMakeID) references TruckMake(TruckMakeID),
foreign key(TruckModelID) references TruckModel(TruckMakeID,TruckModelID)
);

create table Service(
TransportID varchar(3),
TransportName char(24),
TransportCost decimal(10,2),
TransportMaxDist decimal(10,2),
primary key(TransportID)
);

create table Allocation(
TruckVINNum varchar(5),
TransportID varchar(3),
FromDate date,
ToDate date,
primary key(TruckVINNum, TransportID),
foreign key(TruckVINNum) references Truck(TruckVINNum),
foreign key(TransportID) references Service(TransportID)
);

create table Customer(
CustomerID char(5),
CustomerName char(24),
CustomerPhNum varchar(10),
primary key(CustomerID)
);


create table BookingReq(
RequestID varchar(5),
CustomerID char(5),
RequestDate date,
RequestText char(50),
primary key(RequestID),
foreign key(CustomerID) references Customer(CustomerID)
);


create table Invoice(
InvoiceNum char(4),
RequestID char(5),
InvoiceDate date,
InvoiceAmount decimal(10,0),
primary key(InvoiceNum),
foreign key(RequestID) references BookingReq(RequestID)
);


create table Payment(
PaymentID varchar(4),
InvoiceID char(4),
PaymentDate date,
PaymentAmount decimal(20,0),
primary key(PaymentID),
foreign key(InvoiceID) references Invoice(InvoiceNum)
);



create table Location(
LocationID varchar(4),
LocationName char(24),
LocationState char(4),
LocationPostCode varchar(4),
primary key(LocationID)
);

create table Staff(
StaffID varchar(3),
StaffName char(48),
ManagerID varchar(3),
primary key(StaffID),
foreign key(ManagerID) references Staff(StaffID)
);

create table TripSchedule(
ScheduleID varchar(3),
StartLoc varchar(3),
EndLoc varchar(3),
RequestID varchar(4),
TruckVINNum varchar(5),
TransportID varchar(3),
StaffID varchar(3),
TripStart datetime,
TripEnd datetime,
primary key(ScheduleID),
foreign key(StartLoc) references Location(LocationID),
foreign key(EndLoc) references Location(LocationID),
foreign key(RequestID) references BookingReq(RequestID),
foreign key(TruckVINNum) references Truck(TruckVINNum),
foreign key(TransportID) references Service(TransportID),
foreign key(StaffID) references Staff(StaffID)
);

create table SupportStaff(
ScheduleID varchar(4),
StaffID varchar(3),
HoursNeeded varchar(3),
primary key(ScheduleID,StaffID),
foreign key(ScheduleID) references TripSchedule(ScheduleID),
foreign key(StaffID) references Staff(StaffID)
);



Insert into TruckMake values ('TM1','Volvo');
Insert into TruckMake values ('TM2','Subaru');
Insert into TruckMake values ('TM3','Toyota');
Insert into TruckMake values ('TM4','Audi');
Insert into TruckMake values ('TM5','Volvo');
Insert into TruckMake values ('TM6','Telsa');


Insert into TruckModel values ('TM1','MO1','FH 16');
Insert into TruckModel values ('TM2','MO2','FH 17');
Insert into TruckModel values ('TM3','MO3','FH 18');
Insert into TruckModel values ('TM4','MO4','FH 06');
Insert into TruckModel values ('TM5','MO5','FH 10');
Insert into TruckModel values ('TM2','MO6','FH 17');
Insert into TruckModel values ('TM2','MO7','FH 17');
Insert into TruckModel values ('TM5','MO8','FH 10');
Insert into TruckModel values ('TM5','MO9','FH 10');

Insert into Truck values ('V001','TM1','MO1','Red','2015-10-03','350000.78');
Insert into Truck values ('V002','TM2','MO2','Blue','2014-01-10','250000.00');
Insert into Truck values ('V003','TM3','MO3','Red', '2015-10-04','200000.43');
Insert into Truck values ('V004','TM4','MO4','Black','2012-03-10','254995.94');
Insert into Truck values ('V005','TM5','MO5','White','2013-04-04','299999.99');
Insert into Truck values ('V006','TM6','MO6','Blue','2014-01-10','250000.00');


Insert into Service values ('T1','Removalist','5000.50','1063.56');
Insert into Service values ('T2','Bobcat','1652.87','1254.85');
Insert into Service values ('T3','Carpenter','2342.97','2960.45');
Insert into Service values ('T4','Plumber','1876.45','8452.13');
Insert into Service values ('T5','Electrician','1816.86','5841.90');
Insert into Service values ('T6','Plumber','5500.00','1153.56');

Insert into Allocation values ('V001','T1','2020-12-23','2020-12-25'); 
Insert into Allocation values ('V002','T2','2020-12-21','2020-12-24');
Insert into Allocation values ('V002','T3',null,null);
Insert into Allocation values ('V003','T3','2020-01-26','2020-01-29');
Insert into Allocation values ('V004','T4','2020-01-15','2020-01-20');
Insert into Allocation values ('V004','T1',null,null);
Insert into Allocation values ('V005','T5','2021-10-11','2021-10-20');
Insert into Allocation values ('V006','T2','2021-12-15','2021-12-15');
Insert into Allocation values ('V006','T6','2021-10-15','2021-10-20');


Insert into Customer values ('C345','Hugh Jackman','0415871256');
Insert into Customer values ('C025','Michael Jordan','048826582');
Insert into Customer values ('C834','Nathan Cleary','041629539');
Insert into Customer values ('C145','Kobe Bryant','0497634256');
Insert into Customer values ('C387','Alan Turing','0458790186');

Insert into BookingReq values ('R101','C345','2020-12-15','Request for Removalist Service');
Insert into BookingReq values ('R102','C025','2020-07-25','Michael requires a license to use Bobcat');
Insert into BookingReq values ('R103','C834','2020-12-30','Make sure Nathan Cleary gets the dally medal');
Insert into BookingReq values ('R104','C145','2020-11-10','All love for Kobe Bryant RIP');
Insert into BookingReq values ('R105','C387','2021-07-11','Bravo to thr God-father of machine learning');


Insert into Invoice values ('I35','R101','2020-12-10','7500');
Insert into Invoice values ('I36','R102','2020-07-20','7100');
Insert into Invoice values ('I37','R103','2020-12-15','500');
Insert into Invoice values ('I38','R104','2020-09-05','1200');
Insert into Invoice values ('I39','R105','2020-07-05','2000');

Insert into Payment values ('P35', 'I35', '2020-06-27', '3000');
Insert into Payment values ('P36', 'I36', '2020-11-27', '7100');
Insert into Payment values ('P38', 'I38', '2020-09-27', '1200');
Insert into Payment values ('P37', 'I37', '2020-10-27', '500');


Insert into Location values ('L10','Strathfield','NSW','2135');
Insert into Location values ('L11','Ryde','NSW','2112');
Insert into Location values ('L12','Homebush','NSW','2140');
Insert into Location values ('L13','Croydon Park','NSW','2133');
Insert into Location values ('L14','Mount Druitt','NSW','2770');

Insert into Staff values ('S1','John Wick',null);
Insert into Staff values ('S2','Nathan Smith','S1');
Insert into Staff values ('S3','Bruce Wayne',null);
Insert into Staff values ('S4','Tina Trinity',null);
Insert into Staff values ('S5','Adonious Creed',null);
Insert into Staff values ('S6','Apollo Creed','S1');
Insert into Staff values ('S7','Rocky Balboa ','S3');
Insert into Staff values ('S8','Steve Rogers ','S3');
Insert into Staff values ('S9','Tony Stank ','S1');
Insert into Staff values ('S10','Roger Federer','S4');

Insert into TripSchedule values ('S23','L11','L10','R101','V001','T1','S1','2020-12-20 12:40:00','2020-12-20 10:25:00');
Insert into TripSchedule values ('S24','L12','L11','R102','V002','T2','S2','2020-10-27 14:00:30','2020-10-27 06:50:00');
Insert into TripSchedule values ('S25','L13','L12','R103','V003','T3','S2','2021-01-05 14:30:30','2021-01-05 06:40:00');
Insert into TripSchedule values ('S26','L14','L13','R104','V004','T4','S10','2020-09-15 19:01:35','2020-09-15 21:00:00');
Insert into TripSchedule values ('S27','L10','L14','R105','V005','T5','S6','2020-10-10 18:01:35','2020-10-15 20:00:00');

Insert into SupportStaff values ('S23','S1','15');
Insert into SupportStaff values ('S24','S2','16');
Insert into SupportStaff values ('S25','S3','20');
Insert into SupportStaff values ('S26','S4','25');
Insert into SupportStaff values ('S27','S5','30');

-- task 2 write a query to print the details (VIN Number, Colour , Cost) of truck 
-- note that the cost must be prefixed with a '$' sign. 
-- Sort the records in the order of the most expensive truck at the top of the list.

select TruckVINNum, TruckColour, CONCAT("$", TruckCost) "TruckCost"
from Truck
order by TruckCost desc; 
-- good

-- task 3 write a query to print the truck details (VIN Number, 
-- TransportID, from and to date, 
-- along with the number of days) each of the truck is allocated/reserved for

select TruckVINNum, TransportID, FromDate, ToDate, DATEDIFF(ToDate,FromDate) AS days
from Allocation
where FromDate is not null 
and ToDate is not null
;
-- good

/*Task 4 (5 marks):
Write a query to print the truck details (VIN Number, name of the model), 
if the make of the truck is “Volvo”. Use equi-join to answer this question. */

select t.TruckVINNum, m.TruckMakeName
from Truck t join TruckMake m
where t.TruckMakeID = m.TruckMakeID
and m.TruckMakeName = 'Volvo';
-- good


-- Task 5 (5 marks):
-- Write a query to print the VIN Numbers of the trucks if they have been allocated for 3 days 
-- or above for a transport 
-- that costs between $1500 and $2500. Please ensure no duplicate results are included. 
-- Use “join using” to answer this question. 

select a.TruckVINNum, b.TransportCost
from allocation a join service b
using (TransportID)
where TransportCost between 1500 and 2500 
and datediff(Todate, FromDate) >=3 
;

-- good 

/*
Task 6 (5 marks):
Using a subquery, print name, cost and the maximum distance of the transport 
if the transport has been allocated 
(use the start date of the allocation here) 
within the last 6 months calculated from today
(Today here implies the date the query is run. Must not hardcode the date)
*/

select TransportName, CONCAT("$", TransportCost) "TransportCost", TransportMaxDist 
from Service 
where TransportID in
(select TransportID
from Allocation
 where period_diff(date_format(now(), '%Y%m'), date_format(FromDate, '%Y%m')) < 6);
 -- good

-- Task 7 (5 marks):
-- Rewrite Task 6 using a Join on.

select a.TransportName, CONCAT("$", a.TransportCost) "TransportCost",a.TransportMaxDist
from Service a join Allocation b on a.TransportID=b.TransportID
where  period_diff(date_format(now(), '%Y%m'), date_format(FromDate, '%Y%m')) < 6;
-- good

/*
Task 8 (5 marks):
Write a query to print the names of transport, 
the maximum distance in kilometres, 
the maximum distance in miles that have used a red truck. 
Please ensure no duplicate results are included in the result. 
Please rename the column names and ensure the numerical columns have 2 decimal places only. 
You must use join on to write your answer
*/

select distinct a.TransportName, a.TransportMaxDist "Kilometers", 
ROUND(a.TransportMaxDist*0.621371, 2) "Miles", 
b.TruckColour
from Service a
join Allocation c on a.TransportID=c.TransportID
join Truck b on c.TruckVINNum=b.TruckVINNum 
where b.TruckColour = 'Red'
;

-- good 

/*Task 9 (5 marks):
Write a query to print the number of trucks at Meraki in every colour. 
Sort the records in order of the number of trucks with the highest number at the top of the list.
*/

select TruckColour , count(TruckColour) "TruckColourCount"
from Truck
group by TruckColour
order by count(TruckVINNum) desc
;
-- good 

/*Task 10 (5 marks):
Show the make of the truck along with the number of models, 
if the number of models is more than one. */

create table truck_model as
select a.TruckMakeName, b.TruckModelName
from TruckMake a
join TruckModel b on a.TruckMakeID = b.TruckMakeID
;

create table model_count as 
select TruckMakeName, count(TruckModelName) "ModelCount"
from truck_model
group by TruckMakeName, TruckModelName
;

select TruckMakeName, ModelCount
from model_count 
where ModelCount > 1
;


-- needs work 


/* Task 11 (5 marks):
Write a query to print the details of all trucks which have never been booked.
*/

select a.TruckVINNum, a.TruckMakeID, a.TruckModelID, a.TruckColour, a.TruckPurchaseDate,  CONCAT("$", a.TruckCost) "TruckCost"
from Truck a
join Allocation b on a.TruckVINNum=b.TruckVINNum 
where b.FromDate is null
and b.ToDate is null;
;



-- good 


/*Task 12 (5 marks):
Write a query to print the details of any transport that is more than $5000.
Only include the allocation (both to and from dates) 
that have been made in either January of any year or any month in the years - 2020 or 2021.
Sort the results by the cost of transport in descending order.
*/

select TransportID, TransportName, concat('$',TransportCost) as TransportCost , TransportMaxDist
from Service 
join Allocation using (TransportID)
where TransportCost > 5000 and ((month(FromDate) = 01 
or month(ToDate) =01) 
or ((year(FromDate) = 2021 
or year(FromDate) = 2020) 
and (year(ToDate) = 2021 
or year(ToDate) = 2020)))
;

-- good


/*Task 13 (5 marks):
Write a query to print the names of make & model of all red trucks that have had at least one allocation.
*/

select b.TruckMakeName, a.TruckModelName
from TruckModel a
join TruckMake b on (a.TruckMakeID=b.TruckMakeID)
join Truck c on (a.TruckModelID=c.TruckModelID and a.TruckModelID=c.TruckModelID and b.TruckMakeID=c.TruckMakeID)
join Allocation d on (c.TruckVINNum=d.TruckVINNum and c.TruckVINNum=d.TruckVINNum)
and c.TruckColour = "Red"
group by d.TruckVINNum
having count(d.TruckVINNum) >= 1 
;


-- good 







-- section two 
/*Task 14 (5 marks):
Write a query to print all the details of the booking request and the total amount that it has been invoiced for. 
The data saved in the table are exclusive of taxes. 
Your query should include the 10% tax. 
Only include reservations that exceed the total amount of $7,000. */

select a.RequestID, a.CustomerID, a.RequestDate, a.RequestText, CONCAT("$",  b.InvoiceAmount) "InvoiceAmount", CONCAT("$",b.InvoiceAmount*0.10) "10% Tax"
from BookingReq a, Invoice b
where a.RequestID=b.RequestID
and b.InvoiceAmount >7000
;


-- good 

/*Task 15 (5 marks):
Write a query to print the names of the customers who have made payments in the fourth quarter of 2020 
that is lesser than the average cost of payments made in the fourth quarter of 2020.*/
create table customer_Q4 as 
select c.CustomerID, c.CustomerName, p.PaymentDate, p.PaymentAmount
from Customer c
join BookingReq b on c.CustomerID = b.CustomerID
join Invoice i on b.RequestID = i.RequestID
join Payment p on p.invoiceID = i.InvoiceNum
where p.PaymentDate > '2020-10-01';


select c.CustomerName
from customer_Q4 c
where c.PaymentAmount < (select avg(PaymentAmount) from customer_Q4);

-- good 


-- section 3 
/*This section has 2 questions. Each of the questions is worth 5 marks. 
You may be eligible for partial marks if there are errors in your answers. 
To be able to answer the questions, you will have to create and populate 
the tables- Location, Staff, and TripSchedule based on the list provided above.*/


/*
Task 16 (5 marks):
Write a query to print the names of Staff and their managers, 
only if the managers manage 2 staff or more.
*/

select e.StaffName as "ManagerName" , m.StaffName as "StaffName"
from Staff e, Staff m 
where m.StaffID = e.ManagerID 
group by e.ManagerID , e.StaffID
order by count(m.ManagerID) >= 2
;
-- lol 

/*
Task 17 (5 marks):
Write a query to print the names of the customers who have a schedule booked 
by a manager with the trips 
that start in the afternoon (between 12 pm -3 pm) and end before midday (between 6 am – 12 pm) 
along with the names of the staff who created the schedule.

*/

create table staff_trip as 
select s.StaffID, s.ManagerID, t.TripStart, t.TripEnd, t.RequestID
from Staff s
join TripSchedule t on s.StaffID = t.StaffID
where s.ManagerID is not NULL
;

create table customer_booking as 
select b.RequestID, c.CustomerName
from BookingReq b
join Customer c on b.CustomerID = c.CustomerID
;

create table arvo_staff as
select *
from staff_trip
where (cast(TripStart as time) between '12:00:00' and '15:00:00') 
and (cast(TripEnd as time) between '06:00:00' and '12:00:00')
;

select c.CustomerName
from customer_booking c
join arvo_staff s on c.RequestID = s.RequestID
;

-- good i think, just test more values



/*
Section-Four
This section has 2 questions. Each of the questions is worth 5 marks. 
You may be eligible for partial marks if there are errors in your answers. 
To be able to answer the questions, you will have to create the ‘SupportStaff table based on the list provided above
Task 18 (5 marks):


Write a query to print the details of the schedule 
(Start Location Name
, 
Name of the Service/Transport) 
and the 
staff involved in the activities.
This should involve the staff who created the schedule and all the support staff involved.
Please note you will have to display the data in multiple rows.
*/

select  l.LocationName,s.StaffName,se.TransportName
from TripSchedule ts, Staff s, Location l, BookingReq br, Allocation a, Service se

where ts.StaffID=s.StaffID

and ts.StartLoc = l.LocationID

and ts.TruckVINNum = a.TruckVINNum

and ts.TransportID = a.TransportID

and ts.RequestID = br.RequestID

and se.TransportID = a.TransportID

union

select  l.LocationName,s.StaffName,se.TransportName

from TripSchedule ts, Staff s, Location l, BookingReq br, Allocation a, Service se, SupportStaff ss

where ts.ScheduleID = ss.ScheduleID

and ts.StartLoc = l.LocationID

and ts.TruckVINNum = a.TruckVINNum

and ts.TransportID = a.TransportID

and ts.RequestID = br.RequestID

and se.TransportID = a.TransportID

and ss.StaffID = s.StaffID;


/*Task 19 (5 marks):
List the name of the start and end location, 
for every schedule 
along with the name of the 
customer the schedule is for. 
Only include Customers whose surnames start with J. 
Also, this schedule must have at least 2 invoices generated for it.
*/

select ts.ScheduleID, l1.LocationName, l2.LocationName,c.CustomerName
from TripSchedule ts, Location l1, Location l2, BookingReq br, Customer c

where ts. StartLoc = l1.LocationID

and ts. EndLoc = l2.LocationID

and ts.RequestID = br.RequestID

and br.CustomerID = c.CustomerID

and c.CustomerName like '% J%'

and (select count(InvoiceNum)

	 from Invoice

	 where RequestID=br.RequestID) >= 2;


/*
Task 20 (5 marks):
Write a query to list the details of the schedule (id) 
along with the total cost (in currency format) of both invoice amount 
and payment amount for every schedule. 
If the schedule doesn't involve invoice/payment,
 0 must be displayed as the cost.
*/

Select s.ScheduleID, concat('$',IFNULL(Cost1,0)) "Invoice Amount", concat('$',IFNULL(Cost2,0)) "Paid Amount"

from TripSchedule s left join

(select q.RequestID as ReqID1, sum(InvoiceAmount) as Cost1

from BookingReq q left join Invoice i

on q.RequestID = i.RequestID

group by q.RequestID) table1

on ReqID1 = s.RequestID

left join

(select q.RequestID as ReqID2, sum(p.PaymentAmount) as Cost2

from BookingReq q, Invoice i, Payment p

where q.RequestID = i.RequestID

and p.InvoiceID = i.InvoiceNum

group by q.RequestID) table2

on ReqID2 = s.RequestID;
