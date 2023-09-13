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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import Department.DepBean;
import Major.MajorBean;
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
		}//자원해제 끝
		public void JoinProfessor(ProBean pb) {
			
			String sql = "";
			
			try {
				con = getConnection();
				
				sql = "insert into professor(name, pw, addr, tel, phone, major, email, labNum, dep_name)"
						+ "values(?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, pb.getName());
				pstmt.setString(2, pb.getPw());
				pstmt.setString(3, pb.getAddr());
				pstmt.setString(4, pb.getTel());
				pstmt.setString(5, pb.getPhone());
				pstmt.setString(6, pb.getMajor());
				pstmt.setString(7, pb.getEmail());
				pstmt.setInt(8, pb.getLabNum()); 
				pstmt.setString(9, pb.getDep_name());
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.print("Professor/ProDAO 내부 교수 회원 가입 sql 오류 " + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			
			
		}
		public ProBean getProInfo(int pro_no) {
			//과교수 데이터 가져오기
			String sql = "";
			ProBean pb = new ProBean();
			try {
				con = getConnection();
				
				// sql = "select name, major from professor where no=" + pro_no ;
				sql = "select * from professor where pro_no =" + pro_no;
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				
				
				if(rs.next()) {
					pb.setNo(pro_no);
					pb.setName(rs.getString("name")); //교수 이름
					pb.setMajor(rs.getString("major")); //교수 전공
					pb.setPw(rs.getString("pw")); //교수 비밀번호
					pb.setAddr(rs.getString("addr")); //교수 주소지
					pb.setPhone(rs.getString("phone")); // 교수 폰 번호
					pb.setTel(rs.getString("tel"));// 연구실 전화번호 
					pb.setEmail(rs.getString("email")); //교수 이메일
					pb.setLabNum(rs.getInt("labNum"));// 연구실 위치
					}
				
			} catch(Exception e) {
				System.out.println("ProDao/Professor내부의 getProInfo메소드 구문 오류" + e);
				e.printStackTrace(); 
			} finally {
				rs_Close();
			}
			
			return pb;
			
		}
		
		public void InsertSubject(SubBean sub) {
			// 과목 등록하기
			String sql = "";			
			
			try {
				//DB연결
				con = getConnection();
				// 과목 등록 SQL문 작성
				sql = "insert into Subject(sub_name, pro_name, pro_no, place, point, capacity, major)"+
				"values(?,?,?,?,?,?,?)"; 
				// 미리 sql문 전송
				pstmt = con.prepareStatement(sql);
				// ?에 대입할 값 입력
				pstmt.setString(1, sub.getSub_name());
				pstmt.setString(2, sub.getPro_name());
				pstmt.setInt(3, sub.getPro_no());
				pstmt.setString(4, sub.getPlace());
				pstmt.setInt(5, sub.getPoint());
				pstmt.setInt(6, sub.getCapacity());
				pstmt.setString(7, sub.getMajor());
				
				// SQL문 실행
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				System.out.println("Professor/ProDao내부의 InsertSubject에서 오류가 발생 했습니다. " + e);
				e.printStackTrace();
			}finally {
				rs_Close();		
			}
		
		}//InsertSubject() 끝
		
		public SubBean getSubject(int sub_no) {
			String sql = "";
			SubBean sb= new SubBean();
			try {
				
				con = getConnection();
				sql = "select * from subject where no=" + sub_no;
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
			}catch(Exception e) {
				System.out.println("Professor/ProDao 내부의 교수정보 수정을 위한 정보를 가져오는데 오류가 발생했습니다." + e);
				e.printStackTrace();
				
			}finally {
				rs_Close();
			}
			return sb;
		}
		
		public void ModProfessor(ProBean pb) {
			
			String sql = "";
			try {
				
				con = getConnection();
				
				sql = "update professor set name=?, pw=?, addr=?, tel=?, phone=?, major=?, email=?, labAddr=? no=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, pb.getName() );
				pstmt.setString(2, pb.getPw());
				pstmt.setString(3, pb.getAddr());
				pstmt.setString(4, pb.getTel());
				pstmt.setString(5, pb.getPhone());
				pstmt.setString(6, pb.getMajor());
				pstmt.setString(7, pb.getEmail());
				pstmt.setInt(8, pb.getLabNum());
				pstmt.setInt(9, pb.getNo());
				
				pstmt.executeQuery();
				
				
				
			}catch(Exception e) {
				System.out.print("Professor/ProDao 내부의 교수정보 수정에서 오류가 발생 했습니다." + e);
				
			}finally {
				rs_Close();
			}			
		}
		
		public ArrayList getDep() {
			ArrayList list = new ArrayList();
			
			try {
			con = getConnection();
			
			String sql = "select dep_name from department order by dep_name asc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			 while(rs.next() ) {
				DepBean dBean = new DepBean();
				dBean.setDep_name(rs.getString("dep_name"));
				list.add(dBean); 
			 }
			}catch(Exception e) {
				System.out.println("Professor/ProDao 내부의 GetDep메소드 오류" + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			
			return list;
		}

		public JSONArray getMajor(String dep_name) {
			
			
			JSONArray array = new JSONArray();
			try {
			con = getConnection();
			
			String sql = "select maj_name from major where dep_name ='" + dep_name +"'" ;
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JSONObject Jojb = new JSONObject();
				Jojb.put("major", rs.getString("maj_name"));
				array.add(Jojb);
			}
			
			}catch(Exception e) {
				System.out.println("Professor/ProDao 내부의 getMajor메소드 오류" + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			
			return array;
			
		}
		
}//ProDao 끝
