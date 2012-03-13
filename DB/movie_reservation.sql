-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema movie_reservation
--

CREATE DATABASE IF NOT EXISTS movie_reservation;
USE movie_reservation;

--
-- Definition of table `movie_reservation`.`bookings`
--

DROP TABLE IF EXISTS `movie_reservation`.`bookings`;
CREATE TABLE  `movie_reservation`.`bookings` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `seat_no` int(11) NOT NULL,
  `canceled` tinyint(1) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `BF1` (`sid`),
  KEY `BF2` (`uid`),
  KEY `BF3` (`seat_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`bookings`
--

/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
LOCK TABLES `bookings` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`fares`
--

DROP TABLE IF EXISTS `movie_reservation`.`fares`;
CREATE TABLE  `movie_reservation`.`fares` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `balcony` int(11) NOT NULL,
  `first_class` int(11) NOT NULL,
  `second_class` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`fares`
--

/*!40000 ALTER TABLE `fares` DISABLE KEYS */;
LOCK TABLES `fares` WRITE;
INSERT INTO `movie_reservation`.`fares` VALUES  (1,100,80,60),
 (2,170,130,100),
 (3,150,80,60),
 (4,200,150,100);
UNLOCK TABLES;
/*!40000 ALTER TABLE `fares` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`seats`
--

DROP TABLE IF EXISTS `movie_reservation`.`seats`;
CREATE TABLE  `movie_reservation`.`seats` (
  `seat_no` int(11) NOT NULL AUTO_INCREMENT,
  `seat_class` char(1) NOT NULL,
  `seat_type` char(1) NOT NULL,
  PRIMARY KEY (`seat_no`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`seats`
--

/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
LOCK TABLES `seats` WRITE;
INSERT INTO `movie_reservation`.`seats` VALUES  (1,'b','i'),
 (2,'b','i'),
 (3,'b','i'),
 (4,'b','i'),
 (5,'b','i'),
 (6,'b','i'),
 (7,'b','i'),
 (8,'b','i'),
 (9,'b','i'),
 (10,'b','i'),
 (11,'b','l'),
 (12,'b','l'),
 (13,'b','l'),
 (14,'b','l'),
 (15,'b','l'),
 (16,'b','f'),
 (17,'b','f'),
 (18,'b','f'),
 (19,'b','f'),
 (20,'b','f'),
 (21,'b','f'),
 (22,'b','f'),
 (23,'b','f'),
 (24,'b','f'),
 (25,'b','f'),
 (26,'f','i'),
 (27,'f','i'),
 (28,'f','i'),
 (29,'f','i'),
 (30,'f','i'),
 (31,'f','i'),
 (32,'f','i'),
 (33,'f','i'),
 (34,'f','i'),
 (35,'f','i'),
 (36,'s','i'),
 (37,'s','i'),
 (38,'s','i'),
 (39,'s','i'),
 (40,'s','i');
UNLOCK TABLES;
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`show_times`
--

DROP TABLE IF EXISTS `movie_reservation`.`show_times`;
CREATE TABLE  `movie_reservation`.`show_times` (
  `tid` int(11) NOT NULL,
  `show` varchar(10) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`show_times`
--

/*!40000 ALTER TABLE `show_times` DISABLE KEYS */;
LOCK TABLES `show_times` WRITE;
INSERT INTO `movie_reservation`.`show_times` VALUES  (1,'mng','10:30:00'),
 (2,'non','13:30:00'),
 (3,'evn','16:00:00'),
 (4,'ngt','19:30:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `show_times` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`shows`
--

DROP TABLE IF EXISTS `movie_reservation`.`shows`;
CREATE TABLE  `movie_reservation`.`shows` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`shows`
--

/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
LOCK TABLES `shows` WRITE;
INSERT INTO `movie_reservation`.`shows` VALUES  (1,'Malayalam film 1','2011-08-24','2011-12-21'),
 (2,'Malayalam film 2','2011-09-21','2012-07-21'),
 (3,'Malayalam film 3','2011-11-12','2012-04-23'),
 (4,'Malayalam film 4','2011-12-23','2013-06-12');
UNLOCK TABLES;
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`theater_details`
--

DROP TABLE IF EXISTS `movie_reservation`.`theater_details`;
CREATE TABLE  `movie_reservation`.`theater_details` (
  `max_tkt` int(11) NOT NULL,
  `theater_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`theater_details`
--

/*!40000 ALTER TABLE `theater_details` DISABLE KEYS */;
LOCK TABLES `theater_details` WRITE;
INSERT INTO `movie_reservation`.`theater_details` VALUES  (5,'MultiPlex Cinema');
UNLOCK TABLES;
/*!40000 ALTER TABLE `theater_details` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`upgrade_list`
--

DROP TABLE IF EXISTS `movie_reservation`.`upgrade_list`;
CREATE TABLE  `movie_reservation`.`upgrade_list` (
  `uwid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `seat_class` char(1) NOT NULL,
  `seat_type` char(1) NOT NULL,
  PRIMARY KEY (`uwid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`upgrade_list`
--

/*!40000 ALTER TABLE `upgrade_list` DISABLE KEYS */;
LOCK TABLES `upgrade_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `upgrade_list` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`users`
--

DROP TABLE IF EXISTS `movie_reservation`.`users`;
CREATE TABLE  `movie_reservation`.`users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` char(1) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_reservation`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `movie_reservation`.`users` VALUES  (0,'admin','asdfgh','m'),
 (1,'shijitht','asdfgh','m'),
 (2,'name','asdfgh','m'),
 (3,'female','asdfgh','f');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `movie_reservation`.`waiting_list`
--

DROP TABLE IF EXISTS `movie_reservation`.`waiting_list`;
CREATE TABLE  `movie_reservation`.`waiting_list` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `seat_type` char(1) NOT NULL,
  PRIMARY KEY (`wid`),
  KEY `WF1` (`sid`),
  KEY `WF2` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `movie_reservation`.`waiting_list`
--

/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
LOCK TABLES `waiting_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
