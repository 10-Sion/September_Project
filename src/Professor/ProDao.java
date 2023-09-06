package Professor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import Subject.SubBean;

public class ProDao {

		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private DataSource ds;
		
		private Connection getConnection() throws Exception {
			
			//1. InitialContext객체 생성
			//생성하는 이유는  자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 개념이 Context이며,
			//InitialContext객체는 네이밍 서비스를 이용하기위한 시작점입니다.
			Context initCtx = new InitialContext();
			//2. "java:comp/env"라는 주소를 전달하여  Context객체를 얻었습니다.
			//"java:comp/env" 주소는 현재 웹 애플리케이션의 루트 디렉터리 라고 생각 하면됩니다.
			//즉! 현재 웹애플리케이션이 사용할수 있는 모든 자원은 "java:comp/env"아래에 위치합니다.(<Context></Context/>이위치를 말합니다.)
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			//3. "java:comp/env 경로 아래에 위치한  "jdbc/jspbeginner" Recource태그의  DataSource커넥션풀을 얻는다
			ds = (DataSource)ctx.lookup("jdbc/gwanlee");		 
			//4. 마지막으로 커넥션풀(DataSouce)객체 메모리 에 저장된 Connection객체를 반환받아 사용
			con = ds.getConnection();
			return con;
		}
		
		public void rs_Close() {
			try {	
				if(pstmt != null) {	pstmt.close(); }
				if(rs != null) { rs.close(); }
				if(con != null) { con.close(); }
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public void ProInfo(ProBean pb) {
			
			String sql = "";
			
			try{	
				con = getConnection();
			
			}catch(Exception e){
					System.out.println( "Professr/ProDao내부의 교수정보 입력에서 오류가 발생했습니다." + e);				
			}
				
		}
		public void InsertSubject(SubBean sub) {
			// 과목 등록하기
			String sql = "";			
			
			try {
				//DB연결
				con = getConnection();
				// 과목 등록 SQL문 작성
				sql = "insert into Subject(sub_name, Pro_no, place, Point)"+
				"values(?,?,?,?)"; 
				// 미리 sql문 전송
				pstmt = con.prepareStatement(sql);
				// ?에 대입할 값 입력
				pstmt.setString(1, sub.getSub_name());
				pstmt.setInt(2, sub.getPro_no());
				pstmt.setString(3, sub.getPlace());
				pstmt.setInt(4, sub.getPoint());
				// SQL문 실행
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				System.out.println("Professor/ProDao내부의 수강등록처리에서 오류가 발생 했습니다. " + e);
			}finally {
				rs_Close();		
		}
		
}
		public List getSublist() {
			
			ArrayList list = new ArrayList();
			String sql = "";
			try {
			con = ds.getConnection();
			sql = "SELECT * FROM gwanlee.subject";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			
			SubBean subbean = new SubBean();
			subbean.setSub_no(rs.getInt("sub_no"));
			subbean.setPro_no(rs.getInt("pro_no"));
			subbean.setSub_name(rs.getString("sub_name"));
			subbean.setPlace(rs.getString("place"));
			subbean.setPoint(rs.getInt("point"));	
			list.add(subbean);
			}
			
			}catch(Exception e) {
				System.out.println("Subject/SubDao클래스에서 getList메소드 오류 " + e);
				e.printStackTrace();
			} finally{
				rs_Close();
			}
			return list;
		}
}
