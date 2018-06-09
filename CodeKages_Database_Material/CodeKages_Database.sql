DROP DATABASE IF EXISTS CodeKages_Database;

CREATE DATABASE IF NOT EXISTS CodeKages_Database;

USE CodeKages_Database;

CREATE TABLE IF NOT EXISTS users (
	userID INT(11) NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL, 
    lastName VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL, 
    userName VARCHAR(50) NOT NULL, 
    `password` VARCHAR(50) NOT NULL,
    enabled boolean NOT NULL,
    PRIMARY KEY (UserID));
    
CREATE TABLE IF NOT EXISTS roles (
	roleID INT(11) NOT NULL AUTO_INCREMENT, 
    roleType VARCHAR(30) NOT NULL, 
    PRIMARY KEY (roleID));
    
CREATE TABLE IF NOT EXISTS users_roles (
	userID INT(11), 
    roleID INT(11),
    PRIMARY KEY (userID, roleID),
    FOREIGN KEY (userID)
		REFERENCES users(userID) ON DELETE CASCADE,
	FOREIGN KEY (roleID)
		REFERENCES roles(roleID)  ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS staticPages (
	staticPageID INT(11) NOT NULL AUTO_INCREMENT,
    userID INT(11) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content LONGTEXT NOT NULL,
    creationDate DATETIME NOT NULL,
    PRIMARY KEY (staticPageID),
    FOREIGN KEY (userID) 
		REFERENCES users(userID)  ON DELETE CASCADE);
	
CREATE TABLE IF NOT EXISTS categories (
	categoryID INT(11) NOT NULL AUTO_INCREMENT,
    categoryName VARCHAR(50) NOT NULL, 
    description VARCHAR(100) NULL,
    PRIMARY KEY (categoryID));

CREATE TABLE IF NOT EXISTS blogs (
	blogID INT(11) NOT NULL AUTO_INCREMENT, 
    userID INT(11) NOT NULL,
    categoryID INT (11) NOT NULL, 
    creationDate DATETIME NOT NULL, 
    publishDate DATETIME NOT NULL, 
    approvedDate DATETIME NOT NULL, 
    isApproved BOOL NOT NULL, 
    title VARCHAR(50) NOT NULL, 
    content LONGTEXT NOT NULL,
    PRIMARY KEY (blogID), 
    FOREIGN KEY (userID)
		REFERENCES users(userID) ON DELETE CASCADE,
	FOREIGN KEY (categoryID) 
		REFERENCES categories(categoryID) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS tags (
	tagID INT(11) NOT NULL AUTO_INCREMENT, 
    tagName VARCHAR(50) NOT NULL, 
    PRIMARY KEY (tagID));

CREATE TABLE IF NOT EXISTS blogs_tags (
	blogID INT(11) NOT NULL, 
    tagID INT(11) NOT NULL,
    PRIMARY KEY (blogID, tagID),
    FOREIGN KEY (blogID)
		REFERENCES blogs(blogID) ON DELETE CASCADE,
	FOREIGN KEY (tagID) 
		REFERENCES tags(tagID) ON DELETE CASCADE);
        
CREATE TABLE IF NOT EXISTS requestTypes (
	requestTypeID int(11) NOT NULL auto_increment,
    requestType varchar(50) NOT NULL,
    PRIMARY KEY (requestTypeID));
        
CREATE TABLE IF NOT EXISTS requests (
	blogID INT(11) NOT NULL,
    requestTypeID int(11) NOT NULL,
    userID INT(11) NOT NULL,
    categoryID INT (11) NOT NULL, 
    creationDate DATETIME NOT NULL, 
    publishDate DATETIME NOT NULL, 
    approvedDate DATETIME NOT NULL, 
    isApproved BOOL NOT NULL, 
    title VARCHAR(50) NOT NULL, 
    content LONGTEXT NOT NULL,
    PRIMARY KEY (blogID), 
    FOREIGN KEY (userID)
		REFERENCES users(userID) ON DELETE CASCADE,
	FOREIGN KEY (categoryID) 
		REFERENCES categories(categoryID) ON DELETE CASCADE,
	FOREIGN KEY (requestTypeID)
        REFERENCES requesttypes(requestTypeID) ON DELETE CASCADE
	);
        
CREATE TABLE IF NOT EXISTS requests_tags (
	blogID INT(11) NOT NULL, 
    tagID INT(11) NOT NULL,
    PRIMARY KEY (blogID, tagID),
    FOREIGN KEY (blogID)
		REFERENCES requests(blogID) ON DELETE CASCADE,
	FOREIGN KEY (tagID) 
		REFERENCES tags(tagID) ON DELETE CASCADE);
