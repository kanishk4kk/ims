SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `author_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) COLLATE utf8_bin NOT NULL,
  `description` TEXT COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `U_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` INT(10) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `description` TEXT COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `U_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `course_subject`;
CREATE TABLE `course_subject` (
  `course_subject_id` INT(10) NOT NULL AUTO_INCREMENT,
  `course_id` INT(10) NOT NULL,
  `subject_id` INT(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_subject_id`),
  UNIQUE KEY `U_title` (`course_id`,`subject_id`),
  CONSTRAINT `FK_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `FK_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `course_subject_student`;
CREATE TABLE `course_subject_student` (
  `course_subject_student_id` INT(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` INT(10) NOT NULL,
  `student_id` INT(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_subject_student_id`),
  CONSTRAINT `FK_course_subject_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FK_course_subject` FOREIGN KEY (`course_subject_id`) REFERENCES `course_subject` (`course_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

drop table if exists `note`;
CREATE TABLE `note` (
  `note_id` INT(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` INT(10) NOT NULL,
  `title` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `file_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `file_path` VARCHAR(1024) COLLATE utf8_bin DEFAULT NULL,
  `author_id` INT(10) NOT NULL,
  `updated_by` INT(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `U_title_course_subject_id` (`title`, `course_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` INT(10) NOT NULL AUTO_INCREMENT,
  `course_subject_id` INT(10) NOT NULL,
  `severity_id` INT(10) NOT NULL,
  `title` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `file_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `file_path` VARCHAR(1024) COLLATE utf8_bin DEFAULT NULL,
  `author_id` INT(10) NOT NULL,
  `updated_by` INT(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `U_title_course_subject_id` (`title`, `course_subject_id`),
  KEY `FK_user` (`updated_by`),
  KEY `FK_author` (`author_id`),
  CONSTRAINT `FK_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `severity`;
CREATE TABLE `severity` (
  `severity_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) COLLATE utf8_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`severity_id`),
  UNIQUE KEY `U_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

drop table if exists `role`;
CREATE TABLE `role` (
  `role_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `display_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `U_name` (`name`),
  UNIQUE KEY `U_display_name` (`display_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NOT NULL,
  `first_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `middle_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `last_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `father_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `father_occupation` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `occupation_type` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `address` VARCHAR(512) COLLATE utf8_bin DEFAULT NULL,
  `phone` VARCHAR(20) COLLATE utf8_bin DEFAULT NULL,
  `mobile` VARCHAR(20) COLLATE utf8_bin DEFAULT NULL,
  `email` VARCHAR(128) COLLATE utf8_bin DEFAULT NULL,
  `join_date` DATE NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `U_student_user_id` (`student_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `student_sms_log`;
CREATE TABLE `student_sms_log` (
  `student_sms_log_id` INT(10) NOT NULL AUTO_INCREMENT,
  `student_id` INT(10) NOT NULL,
  `sent_date_time` DATETIME NOT NULL,
  `status` VARCHAR(32) NOT NULL,
  `error_msg` TEXT DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_sms_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` INT(10) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `U_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `testimonial_id` INT(10) NOT NULL AUTO_INCREMENT,
  `description` TEXT COLLATE utf8_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`severity_id`),
  UNIQUE KEY `U_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

drop table if exists `user`;
CREATE TABLE `user` (
  `user_id` INT(10) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `last_name` VARCHAR(64) COLLATE utf8_bin DEFAULT NULL,
  `email` VARCHAR(255) COLLATE utf8_bin NOT NULL,
  `password` VARCHAR(32) COLLATE utf8_bin NOT NULL,
  `role_id` INT(10) NOT NULL ,
  `updated_by` INT(10) NOT NULL,
  `last_login_date` DATE NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `U_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

