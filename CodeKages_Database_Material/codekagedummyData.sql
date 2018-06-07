USE CodeKages_Database;

INSERT INTO users (firstName,lastName,email,userName,`password`) 
VALUES 
('Jesse','Azu','jesseAzu@gmail','Admin','blog123'),
('Al','Rahman','alRahman@gmail.com','rahmanNoodles','ramen123'),
('Rich','Tav','taverasRich@gmail.com','anbuBlogger','anbu123')
;

INSERT INTO roles(roleType)
VALUES
('ROLE_ADMIN'),
('ROLE_USER')
;

INSERT INTO users_roles (userId,roleId)
VALUES
('1','1'),
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

INSERT INTO blogs (userId,categoryId,creationDate,publishDate,approvedDate,isApproved,title,content)
VALUES
('3','3','2018-05-30 23:59:59','2018-05-31 23:59:59','2018-05-31 23:59:59','1','Gadgets and Robots','Some stuff about gadgets and robots')
;


INSERT INTO tags (tagName)
VALUES
('Gadgetry'),
('modernArt'),
('robots')
;

INSERT INTO Blogs_Tags (blogId,tagId)
VALUES
('1','1'),
('1','3')
;
