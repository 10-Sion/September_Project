package Leture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Subject.SubBean;

public class LectureDAO {
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
	}//자원해제 끝
	
	public List getSublist() {
		
		ArrayList list = new ArrayList();
		String sql = "";
		try {
		con = getConnection();
		sql = "select * from subject_info";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			LectureVO lv = new LectureVO();
			lv.setSub_no(rs.getInt("sub_no"));
			lv.setSub_name(rs.getString("sub_name"));
			lv.setPro_no(rs.getInt("pro_no"));
			lv.setPro_name(rs.getString("pro_name"));
			lv.setPro_email(rs.getString("pro_email"));
			lv.setMajor(rs.getString("major"));
			lv.setCredit(rs.getInt("credit"));
			lv.setComp_sort(rs.getString("comp_sort"));
			lv.setGrade(rs.getInt("grade"));
			lv.setPeriod(rs.getString("period"));
			lv.setEdu_goal(rs.getString("edu_goal"));
			lv.setPlace(rs.getString("place"));
			lv.setTextbook(rs.getString("textbook"));	
			
			list.add(lv);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs_Close();
		}
		return list;
	}
	public LectureVO getSubject(int sub_no ) {
			
			LectureVO lv = new LectureVO();
		try {
			
			con = getConnection();
			String sql = "select * from subject_info sub_no=" + sub_no;
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				lv.setSub_no(rs.getInt("sub_no"));
				lv.setSub_name(rs.getString("sub_name"));
				lv.setPro_no(rs.getInt("pro_no"));
				lv.setPro_name(rs.getString("pro_name"));
				lv.setPro_email(rs.getString("pro_email"));
				lv.setMajor(rs.getString("major"));
				lv.setCredit(rs.getInt("credit"));
				lv.setComp_sort(rs.getString("comp_sort"));
				lv.setGrade(rs.getInt("grade"));
				lv.setPeriod(rs.getString("period"));
				lv.setEdu_goal(rs.getString("edu_goal"));
				lv.setPlace(rs.getString("place"));
				lv.setTextbook(rs.getString("textbook"));
	
			}
			
		}catch(Exception e) {
			
			
		}finally {
			
			rs_Close();
		}
		
			
		return lv;
	}
}
