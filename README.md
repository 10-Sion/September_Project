# 대학 학사정보시스템 University Management Project
|<img width="1000" alt="스크린샷 2023-11-23 오전 12 01 50" src="https://github.com/10-Sion/September_Project/assets/140682709/5f7b109f-2e75-4b05-a86b-984ec8829f8b">|
|:---:|
|메인 페이지|


## 🖥️ 프로젝트 소개
대학교에서 사용하는 학사 정보 페이지 구현으로 수강신청 및 과제제출, 게시판 기능을 구현하였습니다.

## 프로젝트 개요
- 프로젝트 이름: September_Project
- 프로젝트 지속기간: 2023.09.15 ~ 2023.10.10
- 개발 엔진 및 언어: HTML, CSS, Java, JavaScript(JQuery,Ajax), JSP, MySQL / Eclipse, tomcat, MySQL, Git 
- 멤버: 김재우, 김소이, 박준현, 김민성성
- [프로젝트 구현]
     - [김재우](#김재우)
     - [김소이](#김소이)
     - [박준현](#박준현)
     - [김민성](#김민성)
       

## 📌 주요 기능
#### 👩🏻‍🎓 학생
1. 학생 로그인 시 개설된 강좌 조회 후 강의 등록 가능
2. 본인 수강과목 리스트 조회
3. 과제 게시판 - 과제 제출 (파일 업로드)

#### 👨🏻‍🏫 교수
1. 교수 정보 페이지 본인 정보 수정 가능
2. 전체 강의 리스트 구현 및 과목별 주차 정보
3. 과목별로 상세 정보와 수업정보 계획 표시
4. 교수 개인 강의실 페이지 구현으로 강의 추가 기능 구현

#### 👨🏻‍💼 교직원
1. 교직원 개인 정보 조회 수정 가능
2. 교직원 목록 리스트 구현 - 리스트 내 본인정보는 수정 및 삭제 불가
3. 직원 세부정보 조회 및 수정 가능
4. 학생 추가 가능

## 📖 기능 (공통)
#### 로그인 및 회원추가
1. 세션 처리
2. 아이디 저장 (쿠키 활용)
3. 교직원 로그인 시 회원추가 가능
   
#### 개인 정보
1. 개인 정보 조회
2. 개인 정보 변경
3. 비밀번호 변경

#### 공지사항 및 QnA 게시판
1. 교직원, 교수 로그인 시 공지사항 작성 가능
2. 학생 로그인 시 QnA 게시판 글 쓰기 가능 및 교수 로그인 시 답글달기 가능

## 📖 기능 구현

## 김재우
- 교수 기능 전반
- 공통 강의 페이지
- 교수 개인 강의실 페이지
- 주차별 수업 페이지
- 과목별 상세정보, 수업계획 정보
- 주차별 강의 페이지
- 강의실 세션간 페이지 연결 처리
- 강의실 DB 전반

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/b2ea9f5d-257d-4983-ad39-1ff7fcb4ef01" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/8c6258c3-9de7-4f61-8130-285d6bc5b066" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/34888ecb-9224-4cb0-9681-872a4a4acc11" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/8bbc4908-6fc1-487a-aa2b-f1dbde975f5c" width="500">
|:---:|:---:|


## 김소이
- 로그인 / 세션 처리
- 특정 세션 회원추가 가능
- 메인 페이지
- Q&A 게시판 
  (페이징 기능 구현)
- 공지사항 게시판
- PPT 공통
- Q&A 게시판 DB 전반

|<img width="1000" alt="스크린샷 2023-11-23 오전 12 01 50" src="https://github.com/10-Sion/September_Project/assets/140682709/ec1fef47-5f76-4621-ad4c-551241af1f08">|
|:---:|
|메인 페이지|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/16eacad4-db38-4004-9019-8652f04055aa" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/f3536c31-6b41-4048-904a-a96f43d215e4" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/effe6640-1419-491d-8013-3a5f17f42c34" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/80c32de6-c269-4e91-ace4-3e8eb79421a9" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/bbde803a-aa49-4231-b773-b20e21b21632" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/e391c526-4aaf-4a5e-8ced-a371aa65dc4d" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/ebddf1df-e932-487f-bbb9-5a22be60cd52" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/05824368-152b-42bc-ba58-3f252338ccc9" width="500">
|:---:|:---:|


## 박준현
- 교직원 기능 전반
- 페이지상/ 페이지간 동적 처리
- 페이지 레이아웃 / CSS 전반
-  메인 페이지 - 강의실 메인 페이지
-  마이 페이지
-  강의실 영상 페이지

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/be56696f-f0f8-4874-b096-54bcd4f68c24" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/f690ccf3-3adc-4394-b6c2-fe4efcb13465" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/a3a0fdee-048f-4aa2-86db-6f9be5757c6e" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/fbdfdf04-e7d1-432f-90b2-4dda45864f33" width="500">
|:---:|:---:|

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/524a39fb-28ac-489d-8f72-674c456f5caf" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/720a50ee-6dcb-4991-8bad-9e94795e7a31" width="500">
|:---:|:---:|


## 김민성
- 학생 과제 제출 페이지 (파일 업로드 및 다운로드 기능)

|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/3ca1b4ca-660c-4a19-a733-6475d5fd2f31" width="500">|<img src = "https://github.com/10-Sion/September_Project/assets/140682709/d6545d79-ff3e-4607-9d9f-fb99d60ca884" width="500">
|:---:|:---:|




