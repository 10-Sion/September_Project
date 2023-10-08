package reportDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbcp.DBConnectionMgr;
import reportVO.ReportVO;
import reportVO.ReportlistVO;

// DB 와 연동해서 작업을 하는 DAO 클래스
public class ReportDAO {
	
	// DB 연동을 위한 커넥션, 프리페어, 리졀트셋, DB 커넥터 변수선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	// DAO 클래스 호출 시 생성되는 생성자 선언
	public ReportDAO() {
		// DB 연결 Connection 객체 생성
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Connection 객체 생성 실패 : " + e );
		}
	}	// 생성자 끝
	
	// 과제 제출 시 DB insert메소드
	public int insertReport(ReportVO rVo) {

		String sql = "";
		int stu_no = 0;

		try {
			con = pool.getConnection();
			
			int week = rVo.getWeek();
			int sub_no = rVo.getSub_no();
			String sub_name = rVo.getSub_name();
			String report_name = rVo.getReport_name();
			stu_no = rVo.getStu_no();
			String stu_name = rVo.getStu_name();
			String title = rVo.getTitle();
			String content = rVo.getContent();
			String fileName = rVo.getFilename();

			sql = "insert into report (week, sub_no, sub_name, report_name,"
					+ "stu_no, stu_name,  title, content, filename, submit) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, week);
			pstmt.setInt(2, sub_no);
			pstmt.setString(3, sub_name);
			pstmt.setString(4, report_name);
			pstmt.setInt(5, stu_no);
			pstmt.setString(6, stu_name);
			pstmt.setString(7, title);
			pstmt.setString(8, content);
			pstmt.setString(9, fileName);
			pstmt.setString(10, "제출");
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertReport() 메소드 내부 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return stu_no;

	}	// insertReport 끝

	// 개설 과제 전부 가져오는 메소드
	public ArrayList selectreport(int no) {
		
		ArrayList reportlist = new ArrayList();
		String sql = "";
		int stu_no = no;
		
		try {
			con = pool.getConnection();
			
			sql = "SELECT rb.* " + 
					"FROM reportboard rb " + 
					"LEFT JOIN report r ON rb.report_name = r.report_name AND r.submit = '제출' AND r.stu_no=? " + 
					"WHERE r.sub_no IS NULL " + 
					"order by week asc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stu_no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReportlistVO rLiVo = new ReportlistVO();			
				rLiVo.setWeek(rs.getInt("week"));
				rLiVo.setSub_no(rs.getInt("sub_no"));
				rLiVo.setSub_name(rs.getString("sub_name"));				
				rLiVo.setReposrt_name(rs.getString("report_name"));
				rLiVo.setMethod(rs.getString("method"));
				rLiVo.setPeriod(rs.getString("period"));
				rLiVo.setDisclosure(rs.getString("disclosure"));
				rLiVo.setPersonnel(rs.getInt("personnel"));
				rLiVo.setPro_name(rs.getString("pro_name"));
				
				reportlist.add(rLiVo);
			}
			
		} catch (Exception e) {
			System.out.println("selectreport() 메소드 내부 오류 : " + e );
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return reportlist;
	}
	
	// 과제 제출 시 Form 에서 입력한 정보 외 다른 정보를 조회해서 가져오는 메소드
	public ReportVO selectInfo(ReportVO rVo) {

		// reportboard 테이블에서 week, sub_no, sub_name, report_name 값 조회해서 rVo 에 저장
		String sql = "";
		
		try {
			con = pool.getConnection();
			sql = "select week, sub_no, sub_name, report_name from reportboard where report_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rVo.getReport_name());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rVo.setWeek(rs.getInt("week"));
				rVo.setSub_no(rs.getInt("sub_no"));
				rVo.setSub_name(rs.getString("sub_name"));
				rVo.setReport_name(rs.getString("report_name"));
			}
			
			sql = "select name from student where stu_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rVo.getStu_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rVo.setStu_name(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("selectInfo() 메소드 내부 오류 : " + e );
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rVo;
	}
	
	
	
	
}	// ReportDAO 끝

