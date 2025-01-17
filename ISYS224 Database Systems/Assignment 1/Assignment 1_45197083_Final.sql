/*
*********************************************************************
Title: ISYS224 Assignment 1
Name: Justin Lam
SID: 45197083
*********************************************************************
*/


DROP TABLE IF EXISTS `supervisor`,`staff`,`client`, `campaign`, `studio`, `advert`, `invoice`, `salary`, `staff_works_campaign`;

CREATE TABLE `supervisor`(
 `supervisorid` varchar(8),
 `ismanager` boolean,
PRIMARY KEY (`supervisorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `supervisor`(`supervisorid`, `ismanager`)value
('S0000001', 1),
('S0000002', 1),
('S0000003', 1),
('S0000004', 1),
('S0000005', 0);



CREATE TABLE `staff` (
  `staffid` varchar(10) NOT NULL,
  `staff_firstname` varchar(30) NOT NULL,
  `staff_lastname` varchar(30) NOT NULL,
  `staff_gender` varchar(8) NOT NULL,
  `staff_dob` date NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_phonenumber` int NOT NULL,
  `staff_position` varchar(30) NOT NULL,
  `staff_status` varchar(30) NOT NULL,
  `supervisor_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  CONSTRAINT fk_supervisorstaff FOREIGN KEY (`supervisor_id`) REFERENCES supervisor(`supervisorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Data for the table `staff` */

insert  into `staff`(`staffid`,`staff_firstname`,`staff_lastname`,`staff_gender`,`staff_dob`,`staff_email`,`staff_phonenumber`, `staff_position`, `staff_status`,`supervisor_id`) values 
(10000001,'John','Smith', 'Male', '1960-02-28', 'johnsmith@shine.com.au', 0424932112, 'Director', 'Full Time', NULL),
(10000002,'Glen','Johnson', 'Male', '1984-05-26', 'glenjohnson@shine.com.au', 0458194589, 'Manager', 'Full Time', 'S0000001'),
(10000003,'Lilly','Chambers', 'Female', '1994-11-09', 'lillychambers@shine.com.au', 0412932585, 'Model', 'Casual', NULL),
(10000004, 'Georgie', 'Le', 'Female', '1974-04-15', 'george.le@shine.com.au', 0436984621,  'Manager', 'Full Time', 'S0000002'), 
(10000005, 'Jamie', 'Ramsey', 'Male', '1998-08-04', 'jamie.ramsey@shine.com.au', 0432597864, 'Account Manager', 'Full Time', NULL),
(10000006, 'Renee', 'Chan', 'Female', '1989-09-09', 'renee.chan@shine.com.au', 0469626683, 'Manager', 'Full Time', 'S0000003'),
(10000007, 'Charlie', 'Moss', 'Male', '1981-01-16', 'charlie.moss@shine.com.au', 0469123988, 'Accountant', 'Full Time', NULL),	
(10000008, 'Sabine', 'Wells', 'Female', '1996-12-01', 'sabine.wells@shine.com.au', 0478523416, 'Model', 'Casual', NULL),	
(10000009, 'Bob', 'Peters', 'Male', '1984-04-25', 'bob.peters@shine.com.au', 0498634189, 'Graphical Designer', 'Casual', NULL),	
(10000010, 'Juliet', 'Wang', 'Female', '1990-11-07', 'juilet.wang@shine.com.au', 0483763155, 'Actor', 'Casual', NULL),	
(10000011, 'Max', 'Townsend', 'Male', '1978-09-21','max.townsend@shine.com.au', 0489328669, 'Accountant','Full Time', NULL),	
(10000012, 'Nancy', 'Ali', 'Female', '1968-03-03', 'nancy.ali@shine.com.au', 0456327954, 'Account Manager', 'Full Time', NULL),
(10000013, 'Oliver', 'Lookman', 'Male', '1974-09-28', 'oliver.lookman@shine.com.au', 0437895632, 'Technical Personnel', 'Casual', NULL),	
(10000014, 'Amy', 'Yee', 'Female', '1996-12-05', 'amy.yee@shine.com.au', 0489732876, 'Model', 'Casual', NULL),	
(10000015, 'Wayne', 'King', 'Male', '1978-06-16', 'wayne.king@shine.com.au', 0478763684, 'Admin Personnel', 'Full Time', NULL),	
(10000016, 'Julia', 'Osborn', 'Female', '1987-12-25', 'julia.osborn@shine.com.au', 0425963418, 'Admin Personnel', 'Full Time', NULL),
(10000017, 'Mary', 'Wilson', 'Female', '1977-12-25', 'mary.wilson@shine.com.au', 0491570157, 'Manager', 'Full Time', 'S0000004'),
(10000018, 'John', 'Richite', 'Male', '1967-12-25', 'john.richite@shine.com.au', 0483370814, 'Account Manager', 'Full Time', 'S0000005'),
(10000019, 'Taylor', 'Gomez', 'Female', '1997-12-25', 'taylor.gomez@shine.com.au', 0453767820, 'Model', 'Casual', NULL);

CREATE TABLE `client` (
  `clientid` varchar(8) NOT NULL,
  `clientname` varchar(30) NOT NULL,
  `client_phonenumber` varchar(10) NOT NULL,
  `client_emailaddress` varchar(100) NOT NULL,
  `client_address` varchar(200) NOT NULL,
  `staff_responsible` varchar(10) NOT NULL,
  PRIMARY KEY (`clientid`),
  CONSTRAINT fk_clientcustomer FOREIGN KEY (staff_responsible) REFERENCES staff(staffid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client` */


insert  into `client`(`clientid`,`clientname`,`client_phonenumber`,`client_emailaddress`,`client_address`,`staff_responsible`)values
('C01', 'Pixel Arts Inc.', '0251561802', 'admin@pixelarts.com.au', '91 Moores Drive Sydney 2000', 10000007),
('C02', 'Romeo Chemist', '0259803838', 'exec@romeochemist.com.au', '72 Edmundson Road Parramatta 2150', 10000015),
('C03', 'ABC Driving School', '0282582766', 'contact@abcdriving.com.au', '69 Decca Road Lindfield 2070', 10000007),
('C04', 'Rando’s Chicken', '0233349318', 'admin@randochicken.com.au', '45 Cunningham Street Cronulla 2230', 10000009),
('C05', 'Ho’s Chinese Kitchen', '0241693760', 'contact@hochinesekitche.com.au', '96 Manning Road Lane Cove 2066', 10000004),
('C06', 'G&W Newsagents', '0267033545', 'admin@gwnewsagent.com.au', '1 Passage Avenue Castle Hill 2154', 10000005),
('C07', 'Australian Post', '0263981701', 'help@australianpost.com.au', '8 Rupara Street Chatswood 2067', 10000011);

CREATE TABLE `campaign` (
  `campaignid` varchar(8) NOT NULL,
  `campaignname` varchar(50) NOT NULL,
  `campaigntheme` varchar(30) NOT NULL,
  `campaigne_estimatedcost` int NOT NULL,
  `campaigne_actualcost` int NOT NULL,
  `campaign_startdate` date NOT NULL,
  `campaign_estimate_end_date` date NOT NULL,
  `campaign_actual_end_date` date NOT NULL,
  `campaign_client` varchar(8) NOT NULL,
  PRIMARY KEY (`campaignid`),
 CONSTRAINT fk_campaign2 FOREIGN KEY (campaign_client) REFERENCES client(clientid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert  into `campaign`(`campaignid`,`campaignname`,`campaigntheme`,`campaigne_estimatedcost`,`campaigne_actualcost`,`campaign_startdate`, `campaign_estimate_end_date`,`campaign_actual_end_date`, `campaign_client`) values 
('CP1', 'New Product', 'Look at this', 550, 750, '2019-09-20', '2019-10-12', '2019-10-09', 'C01'),
('CP2', 'Panadol', 'I am speed', 300, 300, '2019-09-30', '2019-10-05', '2019-10-03', 'C02'),
('CP3', 'Drive 2 Free', 'Safety First', 1000, 1500, '2019-10-07', '2019-10-19', '2019-10-22', 'C03'),
('CP4', 'New Recipe – Rando Fried Chicken', 'Celebrity Endorsed', 750, 1250, '2019-10-18', '2019-10-31', '2019-10-26','C04'),
('CP5', 'Grand Opening', 'Biggest Project of the Year', 2000, 3000, '2019-11-19', '2019-12-21', '2020-01-05', 'C05'),
('CP6', 'New Issue - Time Magazine Out Now', 'Standard Advertisement', 350, 500, '2019-11-26', '2019-12-01', '2019-12-03','C06'),
('CP7', 'New Campaign But Old Product', 'Renewal', 1000, 1250, '2019-12-07', '2019-12-22', '2019-12-21', 'C01'),
('CP8', 'Relocation of our Chatswood Post Office', 'Community Notice', 1230, 1450, '2019-12-06', '2019-12-16', '2019-12-18','C07'),
('CP9', 'Free 1 Hour Lesson', 'Freebies', 600, 750, '2019-12-06', '2019-12-09', '2019-12-14', 'C03'),
('CP10', 'New Recipe - BBQ Park Rice', 'New Recipe', 700, 700, '2019-12-13', '2019-12-19', '2019-12-18', 'C05'),
('CP11', 'Match Attax - Trading Card Game', 'Sports', 200, 250, '2019-12-06', '2019-12-09', '2019-12-08', 'C06'),
('CP12', 'Increase of postage fee from this Sunday', 'PSA', 250, 300, '2019-12-06', '2019-12-16', '2019-12-23', 'C07');


CREATE TABLE `studio` (
  `studioid` varchar(8) NOT NULL,
  `studioname` varchar(30) NOT NULL,
  `studiolocation` varchar(100) NOT NULL,
  PRIMARY KEY (`studioid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `studio` (`studioid`, `studioname`, `studiolocation`) values
('S01', 'Mario Studio', 'SH Building Level 9'),
('S02', 'Davis Studio', 'SH Building Level 10'),
('S03', 'Ford Studio', 'SH Building Level 7'),
('S04', 'Awesome Studio', 'SH Building Level 6'),
('S05', 'Woody Studio', 'SH Building Level 3');

CREATE TABLE `advert` (
  `advertid` varchar(8) NOT NULL,
  `advert_type` varchar(30) NOT NULL,
  `advert_campaign` varchar(10) NOT NULL,
  PRIMARY KEY (`advertid`),
  CONSTRAINT fk_advertstudio FOREIGN KEY (advert_campaign) REFERENCES campaign(campaignid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `advert` (`advertid`, `advert_type`, `advert_campaign`)values
('A01', 'Newspaper', 'CP1'),
('A02', 'Magazines', 'CP2'),
('A03', 'Television', 'CP3'),
('A04', 'Internet', 'CP4'),
('A05', 'Internet', 'CP5'),
('A06', 'Newspaper', 'CP6'),
('A07', 'Magazine', 'CP7'),
('A08', 'Internet', 'CP8'),
('A09', 'Magazine', 'CP9'),
('A010', 'Television', 'CP10'),
('A011', 'Magazine', 'CP11'),
('A012', 'Television', 'CP12');

 
CREATE TABLE `invoice` (
  `invoiceid` varchar(8) NOT NULL,
  `issuedate` date NOT NULL,
  `payment_status` boolean NOT NULL,
  `totalcost` varchar(10) NOT NULL,
  `campaign_invoice` varchar(8) NOT NULL,
  `client_invoice` varchar(8) NOT NULL,
  PRIMARY KEY (`invoiceid`),
  CONSTRAINT fk_invoice1 FOREIGN KEY (campaign_invoice) REFERENCES campaign(campaignid),
 CONSTRAINT fk_invoice2 FOREIGN KEY (client_invoice) REFERENCES client(clientid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `invoice` (`invoiceid`, `issuedate`, `payment_status`, `totalcost`, `campaign_invoice`, `client_invoice`)values
('IN1', '2019-10-09', 0, 750, 'CP1', 'C01'),
('IN2', '2019-10-03', 1, 300, 'CP2', 'C02'),
('IN3', '2019-10-22', 0, 1500, 'CP3', 'C03'),
('IN4', '2019-10-26', 0, 1250, 'CP4', 'C04'),
('IN5', '2020-01-21', 0, 3000, 'CP5', 'C05'),
('IN6', '2019-10-03', 1, 500, 'CP6', 'C06'),
('IN7', '2019-12-21', 0, 1250, 'CP7', 'C01'),
('IN8', '2019-12-18', 0, 1450, 'CP8', 'C07'),
('IN9', '2019-12-14', 1, 750, 'CP9', 'C03'),
('IN10', '2019-12-18', 0, 700, 'CP10', 'C05'),
('IN11', '2019-12-08', 1, 250, 'CP11', 'C06'),
('IN12', '2019-12-23', 1, 300, 'CP12', 'C07');


CREATE TABLE `staff_works_campaign` (
  `StaffID` varchar(10) NOT NULL,
  `Campaign_ID` varchar(8) NOT NULL,
  `SalaryGrade` int NOT NULL,
  `IsFullTime?` varchar(3) NOT NULL,
  CONSTRAINT fk_staffcamp1 FOREIGN KEY (StaffID) REFERENCES staff(staffid),
 CONSTRAINT fk_staffcamp2 FOREIGN KEY (Campaign_ID) REFERENCES campaign(campaignid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `staff_works_campaign` (`StaffID`, `Campaign_ID`, `SalaryGrade`, `IsFullTime?`)values
(10000002, 'CP1', 5, 'Yes'),
(10000003, 'CP1', 1, 'No'),
(10000005, 'CP2', 4, 'Yes'),
(10000002, 'CP3', 5, 'Yes'),
(10000019, 'CP3', 1, 'No'),
(10000012, 'CP3', 4, 'Yes'),
(10000015, 'CP4', 2, 'Yes'),
(10000008, 'CP4', 1, 'No'),
(10000006, 'CP4', 5, 'Yes'),
(10000007, 'CP4', 5, 'Yes'),
(10000002, 'CP5', 5, 'Yes'),
(10000019, 'CP5', 1, 'No'),
(10000011, 'CP5', 3, 'Yes'),
(10000014, 'CP5', 1, 'No'),
(10000004, 'CP6', 4, 'No'),
(10000013, 'CP7', 1, 'No'),
(10000008, 'CP7', 1, 'No'),
(10000004, 'CP7', 4, 'Yes'),





select * from campaign;





