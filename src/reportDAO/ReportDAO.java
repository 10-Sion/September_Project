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

			String title = rVo.getTitle();
			stu_no = rVo.getStu_no();
			String secret = rVo.getSecret();
			String content = rVo.getContent();
			String fileName = rVo.getFilename();

			sql = "insert into report (sub_no, stu_no, stu_name, week, title, content, secret, filename) "
					+ "values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			// 더미 (다른 테이블 select 값 얻어와야 조회가능)
			pstmt.setInt(1, 10001);

			pstmt.setInt(2, stu_no);
			// 더미
			pstmt.setString(3, "이학생");
			// 더미
			pstmt.setInt(4, 1);
			pstmt.setString(5, title);
			pstmt.setString(6, content);
			pstmt.setString(7, secret);
			pstmt.setString(8, fileName);

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("insertReport() 메소드 내부 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return stu_no;

	}	// insertReport 끝

	// 개설 과제 전부 가져오는 메소드
	public ArrayList selectreport() {
		
		ArrayList reportlist = new ArrayList();
		String sql = "";
		
		try {
			con = pool.getConnection();
			
			sql = "select * from reportboard order by week asc";
			
			pstmt = con.prepareStatement(sql);
			
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
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getStu_no());
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getTitle());
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getContent());
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getFilename());
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getSecret());
		System.out.println("selectInfo 메소드 내부 vo 객체 : " + rVo.getReport_name());
		
		// 여기서 부터 작업
		
		
		return rVo;
	}
	
	
	
	
}	// ReportDAO 끝

