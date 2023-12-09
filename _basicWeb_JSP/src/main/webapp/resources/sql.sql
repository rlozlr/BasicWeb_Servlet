-- 2023-12-08
CREATE TABLE member (
id VARCHAR(100), 
pwd VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
team INT DEFAULT 0,
regdate datetime DEFAULT now(),
lastlogin datetime DEFAULT now(),
PRIMARY KEY(id));