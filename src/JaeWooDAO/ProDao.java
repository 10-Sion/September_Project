package JaeWooDAO;

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

import JaeWooVO.DepBean;
import JaeWooVO.ProBean;
import JaeWooVO.SubBean;



public class ProDao {

		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private DataSource ds;
		
		private Connection getConnection() throws Exception {
			
			Context initCtx = new InitialContext();
			
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/gwanlee");		 
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
		}//?��?��?��?�� ?��
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
				System.out.print("Professor/ProDAO 내부 교수 회원가입 오류 " + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			
			
		}
		public ProBean getProInfo(int pro_no) {
			
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
					pb.setName(rs.getString("name")); //교수 ?���?
					pb.setMajor(rs.getString("major")); //교수 ?���?
					pb.setPw(rs.getString("pw")); //교수 비�?번호
					pb.setAddr(rs.getString("addr")); //교수 주소�?
					pb.setPhone(rs.getString("phone")); // 교수 ?�� 번호
					pb.setTel(rs.getString("tel"));// ?��구실 ?��?��번호 
					pb.setEmail(rs.getString("email")); //교수 ?��메일
					pb.setLabNum(rs.getInt("labNum"));// ?��구실 ?���?
					pb.setDep_name(rs.getString("dep_name"));
					}
				
			} catch(Exception e) {
				System.out.println("ProDao/Professor 내부 교수 정보 받아오기 오류" + e);
				e.printStackTrace(); 
			} finally {
				rs_Close();
			}
			
			return pb;
			
		}
		
		public void InsertSubject(SubBean sub) {
			// 과목 등록
			String sql = "";			
			
			try {
				
				con = getConnection();
				
				sql = "insert into Subject(sub_name, pro_name, pro_no, place, point, capacity, major, dep_name)"+
				"values(?,?,?,?,?,?,?,?)"; 
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, sub.getSub_name());
				pstmt.setString(2, sub.getPro_name());
				pstmt.setInt(3, sub.getPro_no());
				pstmt.setString(4, sub.getPlace());
				pstmt.setInt(5, sub.getPoint());
				pstmt.setInt(6, sub.getCapacity());
				pstmt.setString(7, sub.getMajor());
				pstmt.setString(8, sub.getDep_name());
				
				// SQL�? ?��?��
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				System.out.println("Professor/ProDao내부 InsertSubject 메소드 오류" + e);
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
				
				if(rs.next()) {
				sb.setPro_name(rs.getString("pro_name"));
				sb.setSub_name(rs.getString("sub_name"));
				sb.setSub_no(rs.getInt("no"));
				sb.setPro_no(rs.getInt("pro_no"));
				sb.setCapacity(rs.getInt("capacity"));
				sb.setPlace(rs.getString("place"));
				sb.setPoint(rs.getInt("point"));
				sb.setMajor(rs.getString("major"));
				sb.setDep_name(rs.getString("dep_name"));
				}
				
			}catch(Exception e) {
				System.out.println("Professor/ProDao 내부 getSubject내부에 오류" + e);
				e.printStackTrace();
				
			}finally {
				rs_Close();
			}
			return sb;
		}
		
		public int ModProfessor(ProBean pb) {
			
			String sql = "";
			int result = -1;
			
			try {
				
				con = getConnection();
				
				sql = "update professor set name=?, pw=?, addr=?, tel=?, phone=?, major=?, email=?, labNum=?, dep_name=? where pro_no =" + pb.getNo();
				
				pstmt = con.prepareStatement(sql);
				
				
				pstmt.setString(1, pb.getName() );
				pstmt.setString(2, pb.getPw());
				pstmt.setString(3, pb.getAddr());
				pstmt.setString(4, pb.getTel());
				pstmt.setString(5, pb.getPhone());
				pstmt.setString(6, pb.getMajor());
				pstmt.setString(7, pb.getEmail());
				pstmt.setInt(8, pb.getLabNum());
				pstmt.setString(9, pb.getDep_name());
				System.out.print(pb.getPw());
				System.out.print(pb.getAddr());
				
				
				int check = pstmt.executeUpdate();
				
				if(check > 0) {
					result = 1;
				}
				
				
				
			}catch(Exception e) {
				System.out.print("Professor/ProDao ?���??�� 교수?���? ?��?��?��?�� ?��류�? 발생 ?��?��?��?��." + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}		
			return result ;
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
				System.out.println("Professor/ProDao 내부 GetDep메소드 오류" + e);
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
				System.out.println("Professor/ProDao ?���??�� getMajor메소?�� ?���?" + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			
			return array;
		}
		
		public int deleteProfessor(int pro_no) {
			String sql = "";
			int result = -1;
			try {
				
				con = getConnection();
				
				sql = "delete * from professor no =" + pro_no;
				
				pstmt = con.prepareStatement(sql);
				
				int check = pstmt.executeUpdate();
				
				if( check !=- 1) {
					result = 1;
				}
				
			}catch(Exception e) {
				System.out.println("ProDao/Proffesor ?���??�� DeleteProfessor() ?��?�� ?���? " + e);
				e.printStackTrace();
			}finally {
				rs_Close();
			}
			return result;
		}
		
}//ProDao ?��
