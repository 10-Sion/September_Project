<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>
 
<% 
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
   String name = request.getParameter("name");
   String address= request.getParameter("address");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
   


   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   try{
	   String url = "jdbc:mysql://localhost:3306/GwanLee";
	   String id = "pid";
	   String pw = "1234";
 	 
 	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 conn=DriverManager.getConnection(url,id ,pw );
 	
 	 String sql= "insert into users values (?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	pstmt.setString(1,user_id);
	 pstmt.setString(2,user_pw);
 	 pstmt.setString(3,name);
     pstmt.setString(4,address);
 	 pstmt.setString(5,phone);
 	 pstmt.setString(6,email);
 	

 	 pstmt.executeUpdate();
 	 
 	 out.println("users 테이블에 새로운 레코드를 추가했습니다.");

 	}catch(Exception e){ 
 		e.printStackTrace();
 		out.println("users 테이블에 새로운 레코드를 추가에 실패했습니다");
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>