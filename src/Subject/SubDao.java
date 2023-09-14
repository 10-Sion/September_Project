package Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class SubDao {
		
	
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
	
	// 수강등록 과목 가져오기
	public List getSublist(int pro_no) {
		
		ArrayList list = new ArrayList();
		String sql = "";
		try {
		con = getConnection();
		sql = "select * from subject where pro_no=" + pro_no;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			
		
		SubBean subbean = new SubBean();
		subbean.setSub_no(rs.getInt("no"));// 강의코드
		subbean.setSub_name(rs.getString("sub_name")); // 과목명
		subbean.setPro_name(rs.getString("pro_name")); // 교수 이름
		subbean.setPro_no(rs.getInt("pro_no")); // 교수 번호
		subbean.setDep_name(rs.getString("dep_name"));
		subbean.setPlace(rs.getString("place")); //강의 장소
		subbean.setPoint(rs.getInt("point"));	// 학점
		subbean.setCapacity(rs.getInt("capacity")); //수강 가능 인원
		subbean.setMajor(rs.getString("major")); //전공

		list.add(subbean);
		}
		
		}catch(Exception e) {
			System.out.println("Subject/SubDao클래스에서 getSublist메소드 오류 " + e);
			e.printStackTrace();
		} finally{
			rs_Close();
		}
		return list;
	}
	public void delSubject(int sub_no) {
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = " delete from subject where no=" + sub_no;
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();	
			
		}catch(Exception e){
			System.out.println("Subject/SubDao 클래스의 delSubject 메소드 오류 " + e);
			e.printStackTrace();		
		}finally{
			rs_Close();
		}

	}
	
	public int ModSubject(SubBean sb) {
		
		int result = -1;
		try {
			con = getConnection();
			
			String sql = "update subject set sub_name=?,"
					+ " pro_name =?, pro_no=?,place =?,capacity =?,dep_name=?,major=?,point=? where no=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sb.getSub_name());
			pstmt.setString(2, sb.getPro_name());
			pstmt.setInt(3, sb.getPro_no());
			pstmt.setString(4, sb.getPlace());
			pstmt.setInt(5, sb.getCapacity());
			pstmt.setString(6, sb.getDep_name());
			pstmt.setString(7, sb.getMajor());
			pstmt.setInt(8, sb.getPoint());
			pstmt.setInt(9, sb.getSub_no());
			
			
			int check = pstmt.executeUpdate();
			
			if(check != -1) {
				result = 1;
			}
			
		}catch(Exception e) {
			System.out.println("Subject/SubDao 내부에서 ModSubject 메소드 오류" + e);
			e.printStackTrace();
		}finally {
			rs_Close();
		}
		return result;
		
	}
}
