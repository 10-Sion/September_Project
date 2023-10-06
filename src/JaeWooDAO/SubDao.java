package JaeWooDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import JaeWooVO.SubBean;

public class SubDao {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	private Connection getConnection() throws Exception {

		Context initCtx = new InitialContext();

		Context ctx = (Context) initCtx.lookup("java:comp/env");
		ds = (DataSource) ctx.lookup("jdbc/gwanlee");
		con = ds.getConnection();
		return con;
	}

	public void rs_Close() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List getSublist(int pro_no) {

		ArrayList list = new ArrayList();
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from subject where pro_no=" + pro_no;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				SubBean subbean = new SubBean();
				subbean.setSub_no(rs.getInt("no"));// 강의코드
				subbean.setSub_name(rs.getString("sub_name")); // 과목�?
				subbean.setPro_name(rs.getString("pro_name")); // 교수 ?���?
				subbean.setPro_no(rs.getInt("pro_no")); // 교수 번호
				subbean.setDep_name(rs.getString("dep_name"));
				subbean.setPlace(rs.getString("place")); // 강의 ?��?��
				subbean.setPoint(rs.getInt("point")); // ?��?��
				subbean.setCapacity(rs.getInt("capacity")); // ?���? �??�� ?��?��
				subbean.setMajor(rs.getString("major")); // ?���?

				list.add(subbean);
			}

		} catch (Exception e) {
			System.out.println("Subject/SubDao?��?��?��?��?�� getSublist메소?�� ?���? " + e);
			e.printStackTrace();
		} finally {
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

		} catch (Exception e) {
			System.out.println("Subject/SubDao ?��?��?��?�� delSubject 메소?�� ?���? " + e);
			e.printStackTrace();
		} finally {
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

			if (check != -1) {
				result = 1;
			}

		} catch (Exception e) {
			System.out.println("Subject/SubDao ?���??��?�� ModSubject 메소?�� ?���?" + e);
			e.printStackTrace();
		} finally {
			rs_Close();
		}
		return result;

	}

	public List getSublist() {

		ArrayList list = new ArrayList();
		String sql = "";
		try {
			con = getConnection();
			sql = "select * from subject";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				SubBean subbean = new SubBean();
				subbean.setSub_no(rs.getInt("no"));// 강의코드
				subbean.setSub_name(rs.getString("sub_name")); // 과목�?
				subbean.setPro_name(rs.getString("pro_name")); // 교수 ?���?
				subbean.setPro_no(rs.getInt("pro_no")); // 교수 번호
				subbean.setDep_name(rs.getString("dep_name"));
				subbean.setPlace(rs.getString("place")); // 강의 ?��?��
				subbean.setPoint(rs.getInt("point")); // ?��?��
				subbean.setCapacity(rs.getInt("capacity")); // ?���? �??�� ?��?��
				subbean.setMajor(rs.getString("major")); // ?���?

				list.add(subbean);
			}

		} catch (Exception e) {
			System.out.println("Subject/SubDao?��?��?��?��?�� getSublist메소?�� ?���? " + e);
			e.printStackTrace();
		} finally {
			rs_Close();
		}
		return list;
	}
}
