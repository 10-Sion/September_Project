<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("utf-8");

    // 사용자로부터 제출된 데이터 가져오기
    String occupation = request.getParameter("occupation");

    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String addr = request.getParameter("addr");
    String grade = request.getParameter("grade");
    String major = request.getParameter("major");

    
    
    
    // 데이터베이스 연결 설정
    String url = "jdbc:mysql://localhost:3306/GwanLee";
    String i_id = "pid";
    String i_pw = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, i_id, i_pw);

        if (occupation.equals("학생")) {
        	
        	System.out.println("학생 ");
            // 학생 테이블에 데이터 삽입
            String insertStudentSQL = "INSERT INTO Student (name, pw, addr, phone, email, grade, major) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertStudentSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, pw);
            pstmt.setString(3, addr);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, grade);
            pstmt.setString(7, major);

            
            pstmt.executeUpdate();
        } else if (occupation.equals("교직원")) {
        	
        	System.out.println("교직원 ");
            // 교직원 테이블에 데이터 삽입
            String insertEmployeeSQL = "INSERT INTO Employee (name, pw, addr, phone,email) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertEmployeeSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, pw);
            pstmt.setString(3, addr);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.executeUpdate();
        } else if (occupation.equals("교수")) {
        	
        	System.out.println("교수 ");
            // 교수 테이블에 데이터 삽입
            String insertProfessorSQL = "INSERT INTO Professor (name, pw, addr, phone, major, email) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertProfessorSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, pw);
            pstmt.setString(3, addr);
            pstmt.setString(4, phone);
            pstmt.setString(5, major);
            pstmt.setString(6, email);
            pstmt.executeUpdate();
        }

        out.println("데이터를 성공적으로 삽입했습니다.");

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("데이터 삽입에 실패했습니다.");
    } finally {
        // PreparedStatement와 Connection 닫기
        if (pstmt != null) try { pstmt.close(); } catch (SQLException sqle) {}
        if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
    }
    
	

%>