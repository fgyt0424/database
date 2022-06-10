CREATE DATABASE `dog`;
show databases;
USE `dog`;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE `user`(
	`user_id` INT PRIMARY KEY,
    `email` VARCHAR(30),
    `password` VARCHAR(20),
    `user_name` VARCHAR(20),
    `doggy_id` INT,
    `friend_id` INT,
    `gamegrade` INT,
    `picture_id` INT
);

SELECT * FROM `user`;


INSERT INTO `user` VALUES (12345678,'iiiiiii@gmail.com','a123456','fgyt',123456,12345679,0,123456); 
DROP TABLE `user`;


CREATE TABLE `project`(
	`project_id` INT PRIMARY KEY,
    `user_id` INT, 
    `projectname` VARCHAR(20),
    `type` VARCHAR(20),
    `time` VARCHAR(20),
    `done` VARCHAR(20)
);

SELECT * FROM `project`;


INSERT INTO `project` VALUES (123456,12345678,'打掃家裡','家事','2hr','yes'); 
DROP TABLE `project`;


CREATE TABLE `picture`(
	`picture_id` INT PRIMARY KEY,
    `doggy_id` INT,
    `picturegrade` INT,
    `class` BLOB -- 圖片檔
);

SELECT * FROM `picture`;


INSERT INTO `picture` VALUES (123456,123456,2,NULL); 
DROP TABLE `picture`;


CREATE TABLE `time`(
	`time_id` INT PRIMARY KEY,
    `user_id` INT,
    `everytime_long` DATE,
    `everymouth_long` DATE
);

SELECT * FROM `time`;


INSERT INTO `time` VALUES (123456,12345678,'2022-06-10','2022-06-10'); 
DROP TABLE `time`;



CREATE TABLE `friend`(
	`friend_id` INT,
    `user_id` INT,
    `friend name` VARCHAR(20),
    PRIMARY KEY (`friend_id`,`user_id`)
);

SELECT * FROM `friend`;

INSERT INTO `friend` VALUES (12345679,12345678,'sam'); 
DROP TABLE `friend`;

CREATE TABLE `doggy`(
	`doggy_id` INT PRIMARY KEY,
    `variety` VARCHAR(20),
    `doggy name` VARCHAR(20)
);

SELECT * FROM `doggy`;

INSERT INTO `doggy` VALUES (123456,'馬爾濟斯','happy'); 
DROP TABLE `doggy`;

-- 設立FK

ALTER TABLE `user` ADD FOREIGN KEY(`doggy_id`) REFERENCES `doggy`(`doggy_id`) ON DELETE SET NULL;

ALTER TABLE `user` ADD FOREIGN KEY(`friend_id`) REFERENCES `friend`(`friend_id`) ON DELETE SET NULL;

ALTER TABLE `user` ADD FOREIGN KEY(`picture_id`) REFERENCES `picture`(`picture_id`) ON DELETE SET NULL;

ALTER TABLE `user` ADD FOREIGN KEY(`doggy_id`) REFERENCES `doggy`(`doggy_id`) ON DELETE SET NULL;

ALTER TABLE `project` ADD FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`) ON DELETE SET NULL;

ALTER TABLE `picture` ADD FOREIGN KEY(`doggy_id`) REFERENCES `doggy`(`doggy_id`) ON DELETE SET NULL;

ALTER TABLE `friend` ADD  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE;
