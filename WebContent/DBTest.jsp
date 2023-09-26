<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	try{
		// 1. WAS(톰캣서버) 와 연결된 웹프로젝트의 모든 정보를 가지고 있는 객체 생성.
		Context init = new InitialContext();
		
		// 2. 연결된 was서버가 읽어들인 context.xml파일에 적힌 Datasource를 찾아 얻어옵니다.
		// 요약 : 커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:/comp/env/jdbc/gwanlee");
		
		// 3. DB의 테이블과 연결
		Connection con = ds.getConnection();
		
		if(con!=null){
			out.print("DB연결 성공");
		}
		
		
		
	}catch(Exception exception){
		exception.printStackTrace();
		System.out.print("커넥션풀 얻기 실패 (DB연결 실패!)");
	}


%>



