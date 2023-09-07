-- 계정명 pid
-- 비밀번호 1234

create database GwanLee;
use gwanlee;

-- 교직원 테이블	
drop table if exists employee;
CREATE TABLE Employee (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,	-- 교직원 고유번호
    pw VARCHAR(30) not null,	-- 비밀번호
    name VARCHAR(20) not null,	-- 이름
    addr VARCHAR(50) not null,	-- 주소
    phone VARCHAR(20) not null,	-- 전화번호(휴대폰)
    tel VARCHAR(20),			-- 전화번호(사무실)
    email VARCHAR(50) not null	-- 이메일
) AUTO_INCREMENT=1001; -- ~ 1000 고유번호

-- 교수 테이블		1001 ~ 2000 고유번호 
drop table if exists Professor; 
create table Professor(
pro_no int auto_increment, 	-- 교수 고유번호
pw varchar(30) not null, 	-- 교수 비밀번호
name varchar(20) not null, 	-- 교수 이름
addr varchar(50) not null, 	-- 교수 거주지
tel varchar(20), 			-- 연구실 전화번호
phone varchar(20) not null, -- 교수 휴대전화 번호
major varchar(30) not null, -- 학부(전공)
email varchar(50) not null, -- 교수 이메일 주소
labNum varchar(30), -- 연구실 호수 " 202
primary key(pro_no)
) AUTO_INCREMENT=2001;

alter table professor auto_increment = 1001;	-- 1001 ~2000 고유번호

-- 학생 테이블 생성		2001 ~ 고유번호
drop table if exists student;
create table Student (
	stu_no int auto_increment primary key,		-- 학생 순서
    pw varchar(30) not null,					-- 로그인 비밀번호
    name varchar(30) not null,					-- 학생 이름
    addr varchar(50) not null,					-- 학생 거주지
	phone varchar(20) not null,					-- 학생 전화번호
    tel varchar(20),							-- 학생 집 전화번호
    email varchar(50) not null,					-- 학생 이메일
    grade int(10),								-- 학년
	major varchar(30),							-- 전공
    status varchar(10), 				-- 재학여부
    Pro_name varchar(20),		-- 지도교수
    Pro_no int,
    foreign key (Pro_no) references Professor(pro_no)	-- 외래키 설정			
);

ALTER TABLE Student AUTO_INCREMENT = 2001;	-- 2001 ~ 고유번호

/*
 성적 테이블	=> 성적 입력, 성적 조회
	
    학생 번호(PK) : 학생 테이블
	성적 번호(FK)
	강의 번호(FK) : 강의 테이블
	성적(등급)
*/
drop table if exists study;
create table study(-- 수강을 신청한 학생과 과목번호가 보여질 내용
Stu_no int not null, -- 학생번호
Sub_no int not null,  -- 과목번호
Point float,	-- 학점
foreign key(Stu_no) references student(stu_no),
foreign key(Sub_no) references subject(no)
);

drop table if exists subject;
create table subject( -- 수강 등록 과목
	no int primary key auto_increment, -- 강의코드
	name varchar(20), 	-- 과목명
	Pro_name varchar(20),	-- 교수 이름,
	Pro_no int not null, -- 교수 번호
	place varchar(20) not null, -- 강의 장소
	-- time varchar(20) not null, -- 강의 시간
	count int not null, -- 수강 가능 인원
	major varchar(20), -- 전공
 foreign key (Pro_no) references Professor(pro_no)
) AUTO_INCREMENT = 10001, AUTO_INCREMENT = 15000;

drop table if exists major;
CREATE TABLE Major (
    no INT AUTO_INCREMENT PRIMARY KEY,  -- 전공 코드
    major VARCHAR(20) NOT NULL,         -- 전공명
    dep_head VARCHAR(30),				-- 학과장
    dep_location VARCHAR(50)			-- 학과 위치
) AUTO_INCREMENT=15001, AUTO_INCREMENT=20000;



/*강의 테이블	=> 강의 개설, 수강 신청, 강의 평가
	과목(PK)
	강의명
	교수 번호(FK) : 교수 테이블
	강의 시간
	강의 장소
	수강 인원
	학점
	강의 상태(개설 중, 종료)*/

select * from Professor;


-- 더미 데이터용
-- Employee 테이블에 10개의 레코드 삽입
INSERT INTO Employee (pw, name, addr, phone, tel, email)
VALUES
  ('employee1pw', 'Employee 1', 'Address 1', '010-0000-0001', 'Tel 1', 'employee1@example.com'),
  ('employee2pw', 'Employee 2', 'Address 2', '010-0000-0002', 'Tel 2', 'employee2@example.com'),
  ('employee3pw', 'Employee 3', 'Address 3', '010-0000-0003', 'Tel 3', 'employee3@example.com'),
  ('employee4pw', 'Employee 4', 'Address 4', '010-0000-0004', 'Tel 4', 'employee4@example.com'),
  ('employee5pw', 'Employee 5', 'Address 5', '010-0000-0005', 'Tel 5', 'employee5@example.com'),
  ('employee6pw', 'Employee 6', 'Address 6', '010-0000-0006', 'Tel 6', 'employee6@example.com'),
  ('employee7pw', 'Employee 7', 'Address 7', '010-0000-0007', 'Tel 7', 'employee7@example.com'),
  ('employee8pw', 'Employee 8', 'Address 8', '010-0000-0008', 'Tel 8', 'employee8@example.com'),
  ('employee9pw', 'Employee 9', 'Address 9', '010-0000-0009', 'Tel 9', 'employee9@example.com'),
  ('employee10pw', 'Employee 10', 'Address 10', '010-0000-0010', 'Tel 10', 'employee10@example.com');

-- Professor 테이블에 10개의 레코드 삽입
INSERT INTO Professor (PW, name, addr, Phone, tel, major, email, labNum)
VALUES
  ('professor1pw', 'Professor 1', 'Address 1', '010-0001-0000', 'Tel 1', 'Major 1', 'professor1@example.com', 'Lab 101'),
  ('professor2pw', 'Professor 2', 'Address 2', '010-0002-0000', 'Tel 2', 'Major 2', 'professor2@example.com', 'Lab 102'),
  ('professor3pw', 'Professor 3', 'Address 3', '010-0003-0000', 'Tel 3', 'Major 3', 'professor3@example.com', 'Lab 103'),
  ('professor4pw', 'Professor 4', 'Address 4', '010-0004-0000', 'Tel 4', 'Major 4', 'professor4@example.com', 'Lab 104'),
  ('professor5pw', 'Professor 5', 'Address 5', '010-0005-0000', 'Tel 5', 'Major 5', 'professor5@example.com', 'Lab 105'),
  ('professor6pw', 'Professor 6', 'Address 6', '010-0006-0000', 'Tel 6', 'Major 6', 'professor6@example.com', 'Lab 106'),
  ('professor7pw', 'Professor 7', 'Address 7', '010-0007-0000', 'Tel 7', 'Major 7', 'professor7@example.com', 'Lab 107'),
  ('professor8pw', 'Professor 8', 'Address 8', '010-0008-0000', 'Tel 8', 'Major 8', 'professor8@example.com', 'Lab 108'),
  ('professor9pw', 'Professor 9', 'Address 9', '010-0009-0000', 'Tel 9', 'Major 9', 'professor9@example.com', 'Lab 109'),
  ('professor10pw', 'Professor 10', 'Address 10', '010-0010-0000', 'Tel 10', 'Major 10', 'professor10@example.com', 'Lab 110');

-- Student 테이블에 10개의 레코드 삽입
INSERT INTO Student (pw, name, addr, phone, tel, email, grade, major, status, Pro_name, Pro_no)
VALUES
    ('password1', 'Student 1', 'Address 1', '123-456-7890', '987-654-3210', 'student1@example.com', 1, 'Major 1', 'Active', 'Professor 1', 1001),
    ('password2', 'Student 2', 'Address 2', '234-567-8901', '876-543-2109', 'student2@example.com', 2, 'Major 2', 'Active', 'Professor 2', 1002),
    ('password3', 'Student 3', 'Address 3', '345-678-9012', '765-432-1098', 'student3@example.com', 3, 'Major 3', 'Active', 'Professor 3', 1003),
    ('password4', 'Student 4', 'Address 4', '456-789-0123', '654-321-0987', 'student4@example.com', 4, 'Major 4', 'Inactive', 'Professor 4', 1004),
    ('password5', 'Student 5', 'Address 5', '567-890-1234', '543-210-9876', 'student5@example.com', 1, 'Major 1', 'Active', 'Professor 1', 1001),
    ('password6', 'Student 6', 'Address 6', '678-901-2345', '432-109-8765', 'student6@example.com', 2, 'Major 2', 'Inactive', 'Professor 2', 1002),
    ('password7', 'Student 7', 'Address 7', '789-012-3456', '321-098-7654', 'student7@example.com', 3, 'Major 3', 'Active', 'Professor 3', 1003),
    ('password8', 'Student 8', 'Address 8', '890-123-4567', '210-987-6543', 'student8@example.com', 4, 'Major 4', 'Active', 'Professor 4', 1004),
    ('password9', 'Student 9', 'Address 9', '901-234-5678', '098-765-4321', 'student9@example.com', 1, 'Major 1', 'Inactive', 'Professor 1', 1001),
    ('password10', 'Student 10', 'Address 10', '012-345-6789', '987-654-3210', 'student10@example.com', 2, 'Major 2', 'Active', 'Professor 2', 1002);


-- Study 테이블에 5개의 레코드 삽입
-- Study 테이블에 5개의 레코드 삽입
INSERT INTO study (Stu_no, Sub_no, Point)
VALUES
  (2001, 15000, 4.0),
  (2002, 15001, 3.5),
  (2003, 15002, 3.0),
  (2004, 15003, 4.0),
  (2005, 15004, 3.7);

  
-- Subject 테이블에 5개의 레코드 삽입
INSERT INTO subject (name, Pro_name, Pro_no, place, count, major)
VALUES
  ('과목1', '교수1', 1001, '강의장A', 30, '전공A'),
  ('과목2', '교수2', 1002, '강의장B', 25, '전공B'),
  ('과목3', '교수3', 1003, '강의장C', 40, '전공C'),
  ('과목4', '교수4', 1004, '강의장D', 20, '전공A'),
  ('과목5', '교수5', 1005, '강의장E', 35, '전공B');

INSERT INTO Major (major, dep_head, dep_location)
VALUES
  ('전공1', '학과장1', '학과 위치1'),
  ('전공2', '학과장2', '학과 위치2'),
  ('전공3', '학과장3', '학과 위치3'),
  ('전공4', '학과장4', '학과 위치4'),
  ('전공5', '학과장5', '학과 위치5');

