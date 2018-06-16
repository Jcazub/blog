USE CodeKages_Database;

INSERT INTO users (firstName,lastName,email,userName,`password`,enabled) 
VALUES 
('Jesse','Azu','jesseAzu@gmail','Admin','$2a$10$qAL9f5LyXQoTHqElqjuiXuANUyTW.4IAavEMn9fu3gfrx4YH7nUj2',1),
('Al','Rahman','alRahman@gmail.com','booBlogger','$2a$10$qAL9f5LyXQoTHqElqjuiXuANUyTW.4IAavEMn9fu3gfrx4YH7nUj2',1),
('Rich','Tav','taverasRich@gmail.com','anbuBlogger','$2a$10$qAL9f5LyXQoTHqElqjuiXuANUyTW.4IAavEMn9fu3gfrx4YH7nUj2',1)
;

INSERT INTO roles(roleType)
VALUES
('ROLE_ADMIN'),
('ROLE_USER')
;

INSERT INTO users_roles (userID,roleID)
VALUES
('1','1'),
('1','2'),
('2','2'),
('3','2')
;

INSERT INTO categories (categoryName,description)
VALUES
('Art','Ranging from vintage to modern art'),-- 1
('Business','Regarding the latest in business'),-- 2
('Technology','Up to date info on todays technology'),-- 3
('Nature','Current news on nature'),-- 4
('Politics','Exciting news on politics')-- 5
;

INSERT INTO blogs (userID,categoryID,creationDate,publishDate,approvedDate,isApproved,title,content, expirationDate)
VALUES
('3','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','Gadgets and Robots','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','A','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','B','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','C','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','D','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','0','E','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','F','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','G','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','0','H','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-30 23:59:59','1','I','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-02-20 23:59:59','1','J','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-30 23:59:59','0','K','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-03-30 23:59:59','1','L','Some stuff about gadgets and robots','2999-05-31 23:59:59'),
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-04-30 23:59:59','1','M','Some stuff about gadgets and robots','2999-05-31 23:59:59')
;

INSERT INTO requesttypes (requestType)
VALUES
('edit'),
('delete')
;

/*
INSERT INTO requests (userID,categoryID,creationDate,publishDate,approvedDate,isApproved,title,content, expirationDate, requestTypeID, blogID)
VALUES
('3','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','Gadgets and Robots and Death Metal','Some stuff about gadgets and robots','2999-05-31 23:59:59', '2', '1');
*/

INSERT INTO staticPages (userID, title, content, creationDate)
VALUES
('3','testPage','testPage Content', '2018-05-30 23:59:59');


INSERT INTO tags (tagName)
VALUES
('Gadgetry'),
('modernArt'),
('robots')
;

INSERT INTO Blogs_Tags (blogID,tagID)
VALUES
('1','1'),
('1','3')
;
