USE CodeKages_Database;

INSERT INTO users (firstName,lastName,email,userName,`password`,enabled) 
VALUES 
('Jesse','Azu','jesseAzu@gmail','Admin','blog123',1),
('Al','Rahman','alRahman@gmail.com','rahmanNoodles','ramen123',1),
('Rich','Tav','taverasRich@gmail.com','anbuBlogger','anbu123',1)
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
('2','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','Gadgets and not robots','Some stuff about gadgets and robots','2999-05-31 23:59:59')
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
