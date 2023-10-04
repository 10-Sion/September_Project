CREATE TABLE Department (
    dep_name VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Major (
    maj_name VARCHAR(30) PRIMARY KEY,
    dep_name VARCHAR(30),
    FOREIGN KEY (dep_name) REFERENCES Department(dep_name)
);

CREATE TABLE Employee (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    pw VARCHAR(30),
    name VARCHAR(20),
    addr VARCHAR(50),
    phone VARCHAR(20),
    tel VARCHAR(20),
    email VARCHAR(50),
    status TINYINT(1)
);

CREATE TABLE Professor (
    pro_no INT AUTO_INCREMENT PRIMARY KEY,
    pw VARCHAR(30),
    name VARCHAR(20),
    addr VARCHAR(50),
    phone VARCHAR(20),
    tel VARCHAR(20),
    email VARCHAR(50),
    dep_name VARCHAR(30),
    major VARCHAR(30),
    labNum INT(5),
    status TINYINT(1),
    FOREIGN KEY (dep_name, major) REFERENCES Major(dep_name, maj_name)
) AUTO_INCREMENT=1000;

CREATE TABLE Student (
    stu_no INT AUTO_INCREMENT PRIMARY KEY,
    pw VARCHAR(30),
    name VARCHAR(20),
    addr VARCHAR(50),
    phone VARCHAR(20),
    tel VARCHAR(20),
    email VARCHAR(50),
    dep_name VARCHAR(30),
    major VARCHAR(30),
    grade TINYINT(1),
    status TINYINT(1),
    FOREIGN KEY (dep_name, major) REFERENCES Major(dep_name, maj_name)
) AUTO_INCREMENT=2000;

CREATE TABLE Subject_Info (
    sub_no INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(10),
    pro_no INT,
    pro_name VARCHAR(20),
    pro_email VARCHAR(50),
    major VARCHAR(30),
    credit INT,
    comp_sort VARCHAR(10),
    grade INT,
    period VARCHAR(20),
    edu_goal VARCHAR(100),
    place VARCHAR(20),
    textbook VARCHAR(20),
    FOREIGN KEY (pro_no) REFERENCES Professor(pro_no)
);
    ALTER TABLE subject_info AUTO_INCREMENT = 10001;
    
create table evaluation_plan( -- 수업 평가 계획
		sub_no	int primary key,
		mid_exam int, -- 중간고사
		final_exam int, -- 기말고사
		quiz int, -- 퀴즈
		task int, -- 과제
		attendance int, -- 출석
		jilmun int,
		toron int, -- 토론
        FOREIGN KEY (sub_no) REFERENCES subject_info(sub_no)
);

CREATE TABLE WeekInfo (	-- 과목 주차 정보
    sub_no INT,	-- PK,FK
    stu_no INT,		-- PK,FK
    week INT,		-- PK
    class_type VARCHAR(10), -- '대면', '비대면'
    class_hour INT,	-- 차시
    week_name VARCHAR(50),	-- 주차 수업명
    assignment BOOLEAN,	-- 과제 유무
    lecture_link VARCHAR(255),	-- 강의 링크
    PRIMARY KEY (sub_no, stu_no, week),
    FOREIGN KEY (sub_no) REFERENCES Subject_Info(sub_no),
    FOREIGN KEY (stu_no) REFERENCES Student(stu_no)
);

-- ++ 과제 제출 테이블
-- ++ Q&A 테이블
-- ++ 공지사항 테이블

-- 더미 데이터

-- Department 테이블 더미 데이터
INSERT INTO Department (dep_name) VALUES
    ('정보통신학부'),
    ('컴퓨터공학부'),
    ('전기전자공학부'),
    ('화학생물공학부');

select * from department;

-- Major 테이블 더미 데이터
INSERT INTO Major (maj_name, dep_name) VALUES
    ('정보통신학과', '정보통신학부'),
    ('컴퓨터공학과', '컴퓨터공학부'),
    ('전기전자공학과', '전기전자공학부'),
    ('화학생물공학과', '화학생물공학부');
    
select * from major;

-- Employee 테이블 더미 데이터
INSERT INTO Employee (pw, name, addr, phone, tel, email, status) VALUES
    ('1234', '김철수', '서울시 강남구', '010-1234-5678', '02-123-4567', 'kim@example.com', 1),
    ('5678', '이영희', '서울시 강북구', '010-9876-5432', '02-987-6543', 'lee@example.com', 1),
    ('9876', '박민지', '서울시 중구', '010-5678-1234', '02-567-8123', 'park@example.com', 1),
    ('4321', '정대현', '서울시 관악구', '010-3456-7890', '02-345-6789', 'jung@example.com', 1),
    ('6789', '이승우', '서울시 송파구', '010-2345-6789', '02-234-5678', 'lee@example.com', 1);

select * from employee;


-- Professor 테이블 더미 데이터
INSERT INTO Professor (pw, name, addr, phone, tel, email, dep_name, major, labNum, status) VALUES
    ('2345', '김민수', '서울시 강남구', '010-2345-6789', '02-234-5678', 'kim@example.com', '정보통신학부', '정보통신학과', 101, 1),
    ('3456', '박지원', '서울시 종로구', '010-3456-7890', '02-345-6789', 'park@example.com', '컴퓨터공학부', '컴퓨터공학과', 102, 1),
    ('4567', '이수현', '서울시 강동구', '010-4567-8901', '02-456-7890', 'lee@example.com', '전기전자공학부', '전기전자공학과', 103, 1),
    ('7890', '정미영', '서울시 관악구', '010-7890-1234', '02-789-0123', 'jung@example.com', '화학생물공학부', '화학생물공학과', 104, 1),
    ('8901', '박재원', '서울시 강서구', '010-8901-2345', '02-890-1234', 'park@example.com', '전기전자공학부', '전기전자공학과', 105, 1);

select * from professor;

INSERT INTO Student (pw, name, addr, phone, tel, email, grade, status) VALUES
    ('1111', '김영희', '서울시 강남구', '010-1111-2222', '02-111-2222', 'kim@example.com', 1, 1),
    ('2222', '이민수', '서울시 강북구', '010-2222-3333', '02-222-3333', 'lee@example.com', 2, 1),
    ('3333', '박영진', '서울시 중구', '010-3333-4444', '02-333-4444', 'park@example.com', 3, 1),
    ('4444', '정재원', '서울시 관악구', '010-4444-5555', '02-444-5555', 'jung@example.com', 4, 1),
    ('5555', '이지수', '서울시 송파구', '010-5555-6666', '02-555-6666', 'lee@example.com', 1, 1),
    ('6666', '박민지', '서울시 중랑구', '010-6666-7777', '02-666-7777', 'park@example.com', 2, 1),
    ('7777', '최영수', '서울시 동작구', '010-7777-8888', '02-777-8888', 'choi@example.com', 3, 1),
    ('8888', '강미정', '서울시 강동구', '010-8888-9999', '02-888-9999', 'kang@example.com', 4, 1),
    ('9999', '송진호', '서울시 강서구', '010-9999-0000', '02-999-0000', 'song@example.com', 1, 1),
    ('1234', '이유진', '서울시 양천구', '010-1234-5678', '02-123-4567', 'lee@example.com', 2, 1);
    
    select * from student;

INSERT INTO Subject_Info (sub_name, credit, pro_no, grade, comp_sort,  period, edu_goal, place, textbook) VALUES
    ('수학', 3,  1002 , 1, '필수', '1학기', '수학 기초', '강의실 A', '수학 교재'),
    ('프로그래밍', 3, 1000, 1, '필수', '1학기', '프로그래밍 기초', '강의실 B', '프로그래밍 교재'),
    ('데이터베이스', 3, 1000, 2,'필수', '2학기', '데이터베이스 기초', '강의실 C', '데이터베이스 교재'),
    ('알고리즘',	 3, 1000 , 2, '선택', '2학기', '알고리즘 기초', '강의실 D', '알고리즘 교재'),
    ('네트워크', 3,  1009, 3, '선택', '1학기', '네트워크 기초', '강의실 E', '네트워크 교재'),
    ('웹개발', 3,  1008 , 3, '선택', '1학기', '웹개발 기초', '강의실 F', '웹개발 교재'),
    ('로봇공학', 3,  1005,3, '선택', '1학기', '로봇공학 기초', '강의실 G', '로봇공학 교재'),
    ('인공지능', 3,  1002, 3, '선택', '1학기', '인공지능 기초', '강의실 H', '인공지능 교재'),
    ('빅데이터', 3,  1003,3, '선택','1학기', '빅데이터 기초', '강의실 I', '빅데이터 교재'),
    ('사이버보안', 3,  1005, 3, '선택','1학기', '사이버보안 기초', '강의실 J', '사이버보안 교재');

UPDATE subject_info 
SET 
  pro_name = (SELECT name FROM professor WHERE pro_no = subject_info.pro_no),
pro_email = (SELECT email FROM professor WHERE pro_no = subject_info.pro_no),
    major = (SELECT major FROM professor WHERE pro_no = subject_info.pro_no);
    
select * from Subject_Info;

INSERT INTO WeekInfo (sub_no, stu_no, week, class_type, class_hour, week_name, assignment, lecture_link) VALUES
    (10051, 2000, 1, '대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10051, 2001, 1, '비대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10051, 2002, 1, '대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10051, 2003, 1, '비대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10051, 2004, 1, '대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10051, 2005, 1, '비대면', 2, '주차 1: 소개', true, '강의 링크 1'),
    (10052, 2006, 2, '대면', 2, '주차 2: 기초', true, '강의 링크 2'),
    (10052, 2007, 2, '비대면', 2, '주차 2: 기초', true, '강의 링크 2'),
    (10052, 2008, 2, '대면', 2, '주차 2: 기초', true, '강의 링크 2'),
    (10052, 2009, 2, '비대면', 2, '주차 2: 기초', true, '강의 링크 2');

select * from WeekInfo;

