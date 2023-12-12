-- 2023-12-08
CREATE TABLE member (
id VARCHAR(100), 
pwd VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
team INT DEFAULT 0,
regdate datetime DEFAULT now(),
lastlogin datetime DEFAULT now(),
PRIMARY KEY(id));

-- 2023-12-10
CREATE TABLE board (
bno INT NOT NULL auto_increment,
title VARCHAR(200) NOT NULL,
writer VARCHAR(100) NOT NULL,
content text,
regdate datetime DEFAULT current_timestamp,
moddate datetime DEFAULT current_timestamp,
readcount INT DEFAULT 0,
PRIMARY KEY (bno));

# 게시판에 300개 채우기
INSERT INTO board (title, writer, content)
VALUES("titleTest","tester","contentTest");

# 게시물 검색할 때 쓰려고 5개 생성
INSERT INTO board (title, writer, content, readcount)
VALUES("안녕","1234","내용" , 0);

-- 2023-12-11
ALTER TABLE board ADD boardFile VARCHAR(100);

-- 2023-12-12
CREATE TABLE comment (
cno INT AUTO_INCREMENT,
bno INT NOT NULL,
-- 회원만 쓰게 하려면 default 쓰지 말고 not null
writer VARCHAR(100) NOT NULL,
content VARCHAR(1000) NOT NULL,
regdate DATETIME DEFAULT NOW(),
PRIMARY KEY(cno)
);
