DROP DATABASE IF EXISTS CodeKages_Database;

CREATE DATABASE IF NOT EXISTS CodeKages_Database;

USE CodeKages_Database;

CREATE TABLE IF NOT EXISTS `user` (
	userID INT(11) NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL, 
    lastName VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL, 
    userName VARCHAR(50) NOT NULL, 
    `password` VARCHAR(50) NOT NULL,  			-- Not sure how to add hash for password --
    PRIMARY KEY (UserID));
    
CREATE TABLE IF NOT EXISTS role (
	roleID INT(11) NOT NULL AUTO_INCREMENT, 
    roleType VARCHAR(30) NOT NULL, 
    PRIMARY KEY (roleID));
    
CREATE TABLE IF NOT EXISTS user_role (
	userID INT(11), 
    roleID INT(11),
    PRIMARY KEY (userID, roleID),
    FOREIGN KEY (userID)
		REFERENCES `user`(userID),
	FOREIGN KEY (roleID)
		REFERENCES role(roleID));

CREATE TABLE IF NOT EXISTS staticPage (
	staticPageID INT(11) NOT NULL AUTO_INCREMENT,
    userID INT(11) NOT NULL,
    content LONGTEXT NOT NULL,
    PRIMARY KEY (staticPageID),
    FOREIGN KEY (userID) 
		REFERENCES `user`(userID));
	
CREATE TABLE IF NOT EXISTS category (
	categoryID INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL, 
    description VARCHAR(100) NULL,
    PRIMARY KEY (categoryID));

CREATE TABLE IF NOT EXISTS post (
	postID INT(11) NOT NULL AUTO_INCREMENT, 
    userID INT(11) NOT NULL,
    categoryID INT (11) NOT NULL, 
    creationDate DATETIME NOT NULL, 
    publishDate DATETIME NOT NULL, 
    approvedDate DATETIME NOT NULL, 
    isApproved BOOL NOT NULL, 
    title VARCHAR(50) NOT NULL, 
    content LONGTEXT NOT NULL, 			-- Wouldn't let me use VARCHAR(MAX) or VARCHAR(65535), gave me row too large error --
    PRIMARY KEY (postID), 
    FOREIGN KEY (userID)
		REFERENCES `user`(userID),
	FOREIGN KEY (categoryID) 
		REFERENCES category(categoryID));

CREATE TABLE IF NOT EXISTS tag (
	tagID INT(11) NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(50) NOT NULL, 
    PRIMARY KEY (tagID));

CREATE TABLE IF NOT EXISTS post_tag (
	postID INT(11) NOT NULL, 
    tagID INT(11) NOT NULL,
    PRIMARY KEY (postID, tagID),
    FOREIGN KEY (postID)
		REFERENCES post(postID),
	FOREIGN KEY (tagID) 
		REFERENCES tag(tagID));
