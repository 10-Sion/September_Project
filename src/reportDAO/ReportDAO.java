package reportDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;
import reportVO.ReportVO;

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
	
	// Report 업로드 기능의 메소드
	public int upload(String fileName, String fileRealName) {
		
		String sql = "insert into Report (sub_no, stu_no, stu_name, week, filename, filerealname) values(?,?,?,?,?,?)";
		
		
		try {
			con = pool.getConnection();
			// PreparedStatmenet 실행 객체 얻어 저장
			pstmt = con.prepareStatement(sql);
			// ? 값 설정
			pstmt.setInt(1, 1111);
			pstmt.setInt(2, 3333);
			pstmt.setString(3, "김테스트");
			pstmt.setInt(4, 1);
			pstmt.setString(5, fileName);		// 서버에 업로드 요청 시 선택한 원본 파일명
			pstmt.setString(6, fileRealName);	// 서버 하드웨어의 upload 폴더 경로에 실제 업로드된 파일명
			
			System.out.println("fileName : " + fileName);
			System.out.println("fileRealName : " + fileRealName);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("upload() 메소드 내부 오류 : " + e );
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1; // insert에 실패하면 -1을 반환
	}
	
	// DB에 insert 하기 전에 DB에 과제가 존재하는지 check 하는 메소드
	private String checkReport() {
		String check = "";
		String sql = "";
		
		try {
			con = pool.getConnection();
			
			sql = "select * from report where sub_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, 10001);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				check = "제출";
			} else {
				check = "미제출";
			}
			
		} catch (Exception e) {
			System.out.println("checkReport() 메소드 내부 오류 : " + e );
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}
	
	
	public void insertReport(ReportVO rVo) {
		
		String sql = "";
		
		String check = checkReport();
		
		if( check.equals("제출") ) {
			System.out.println("이미 제출함");
		} else {
			try {
				con = pool.getConnection();
				
				String title = rVo.getTitle();
				int stu_no = rVo.getStu_no();
				String secret = rVo.getSecret();
				String content = rVo.getContent();
				String fileName = rVo.getFileName();
				
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
				System.out.println("insertReport() 메소드 내부 오류 : " + e );
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}	// if 문 끝
		
	}	// insertReport 끝
	
}	// ReportDAO 끝

