/*
SQLyog Community Edition- MySQL GUI v8.05 
MySQL - 5.1.63-0ubuntu0.10.04.1 : Database - ims
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ims` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `ims`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `author_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `U_name` (`name`),
  KEY `FK_author_updated_by` (`updated_by`),
  CONSTRAINT `FK_author_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `author` */

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `FK_batch_updated_by` (`updated_by`),
  CONSTRAINT `FK_batch_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `U_title` (`title`),
  KEY `FK_course_updated_by` (`updated_by`),
  CONSTRAINT `FK_course_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course` */

/*Table structure for table `course_subject` */

DROP TABLE IF EXISTS `course_subject`;

CREATE TABLE `course_subject` (
  `course_subject_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`course_subject_id`),
  UNIQUE KEY `U_title` (`course_id`,`subject_id`),
  KEY `FK_subject` (`subject_id`),
  KEY `FK_course_subject_updated_by` (`updated_by`),
  CONSTRAINT `FK_course_subject_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FK_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course_subject` */

/*Table structure for table `course_subject_batch` */

DROP TABLE IF EXISTS `course_subject_batch`;

CREATE TABLE `course_subject_batch` (
  `course_subject_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_subject_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`course_subject_batch_id`),
  KEY `FK_course_subject_batch_CS_id` (`course_subject_id`),
  KEY `FK_course_subject_batch_batch_id` (`batch_id`),
  KEY `FK_course_subject_batch_faculty_id` (`faculty_id`),
  KEY `FK_course_subject_batch_updated_by` (`updated_by`),
  CONSTRAINT `FK_course_subject_batch_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_course_subject_batch_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `FK_course_subject_batch_CS_id` FOREIGN KEY (`course_subject_id`) REFERENCES `course_subject` (`course_subject_id`),
  CONSTRAINT `FK_course_subject_batch_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `course_subject_batch` */

/*Table structure for table `course_subject_student` */

DROP TABLE IF EXISTS `course_subject_student`;

CREATE TABLE `course_subject_student` (
  `course_subject_student_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`course_subject_student_id`),
  KEY `FK_course_subject` (`course_subject_id`),
  KEY `FK_course_subject_student` (`student_id`),
  KEY `FK_course_subject_student_updated_by` (`updated_by`),
  CONSTRAINT `FK_course_subject_student_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_course_subject` FOREIGN KEY (`course_subject_id`) REFERENCES `course_subject` (`course_subject_id`),
  CONSTRAINT `FK_course_subject_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course_subject_student` */

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL,
  `experience` tinyint(2) NOT NULL DEFAULT '0',
  `join_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `FK_faculty_updated_by` (`updated_by`),
  CONSTRAINT `FK_faculty_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `faculty` */

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `note_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` int(10) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `author_id` int(10) NOT NULL,
  `updated_by` int(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `U_title_course_subject_id` (`title`,`course_subject_id`),
  KEY `FK_user` (`updated_by`),
  KEY `FK_author` (`author_id`),
  KEY `FK_note_course_subject_id` (`course_subject_id`),
  CONSTRAINT `FK_note_course_subject_id` FOREIGN KEY (`course_subject_id`) REFERENCES `course_subject` (`course_subject_id`),
  CONSTRAINT `FK_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `note` */

/*Table structure for table `paper` */

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `paper_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` int(10) NOT NULL,
  `severity_id` int(10) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `author_id` int(10) NOT NULL,
  `updated_by` int(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paper_id`),
  KEY `FK_paper_course_subject` (`course_subject_id`),
  KEY `FK_paper_author` (`author_id`),
  KEY `FK_paper_user` (`updated_by`),
  KEY `FK_paper_severity` (`severity_id`),
  CONSTRAINT `FK_paper_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `FK_paper_course_subject` FOREIGN KEY (`course_subject_id`) REFERENCES `course_subject` (`course_subject_id`),
  CONSTRAINT `FK_paper_severity` FOREIGN KEY (`severity_id`) REFERENCES `severity` (`severity_id`),
  CONSTRAINT `FK_paper_user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `paper` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `display_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `U_name` (`name`),
  UNIQUE KEY `U_display_name` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role` */

insert  into `role`(`role_id`,`name`,`display_name`,`is_active`,`updated_by`) values (1,'a','a',1,0);

/*Table structure for table `severity` */

DROP TABLE IF EXISTS `severity`;

CREATE TABLE `severity` (
  `severity_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`severity_id`),
  UNIQUE KEY `U_name` (`name`),
  KEY `FK_severity_updated_by` (`updated_by`),
  CONSTRAINT `FK_severity_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `severity` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `first_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dob` date NOT NULL,
  `father_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `father_occupation` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `occupation_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `occupation_desc` text COLLATE utf8_bin,
  `address` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `join_date` date NOT NULL,
  `updated_by` int(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `U_student_user_id` (`student_id`,`user_id`),
  KEY `FK_student_update_user` (`user_id`),
  KEY `FK_student_update_by` (`updated_by`),
  CONSTRAINT `FK_student_update_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_student_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

/*Table structure for table `student_sms_log` */

DROP TABLE IF EXISTS `student_sms_log`;

CREATE TABLE `student_sms_log` (
  `student_sms_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `sent_date_time` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_bin NOT NULL,
  `error_msg` text COLLATE utf8_bin,
  `sent_by` int(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_sms_log_id`),
  KEY `FK_student_sms_log_student` (`student_id`),
  KEY `FK_student_sms_log_user` (`sent_by`),
  CONSTRAINT `FK_student_sms_log_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FK_student_sms_log_user` FOREIGN KEY (`sent_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student_sms_log` */

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `U_title` (`title`),
  KEY `FK_updated_by` (`updated_by`),
  CONSTRAINT `FK_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `subject` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `role_id` int(10) NOT NULL,
  `updated_by` int(10) NOT NULL,
  `last_login_date` date NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `U_email` (`email`),
  UNIQUE KEY `u_username` (`username`),
  KEY `FK_user_user` (`updated_by`),
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_user_user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`user_id`,`first_name`,`last_name`,`email`,`username`,`password`,`role_id`,`updated_by`,`last_login_date`,`create_date`,`last_modified_date`,`is_active`) values (1,'a','a','a','a','a',1,1,'2012-09-09',NULL,'2012-09-25 21:59:00',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
