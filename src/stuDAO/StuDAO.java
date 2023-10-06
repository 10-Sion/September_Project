package stuDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import stuVO.SubVO;
import dbcp.DBConnectionMgr;
import stuVO.StuVO;

// DB ?���? ?�� ?��?��?��?�� ?��?��?��
public class StuDAO {
	
	// DB ?���? �? DB ?��보�?? ?��?�� 객체
	private Connection con;
	// DB 쿼리 ?��?�� 객체
	private PreparedStatement pstmt;
	// DB 쿼리 ?��?�� ?�� �? 결과 ?��코드?��?�� ?��?�� 객체
	private ResultSet rs;
	// DBCP 커넥?�� ?? 객체?�� 주소�? ???��?�� �??�� ?��?��
	private DBConnectionMgr pool;
	
	// ?��?��?���? ?��?�� 커넥?�� ?? 객체 ?��?��?���?
	public StuDAO() {
		try {
			// DB ?���? 객체 (Connection) ?�� ?���? ?��?��?
			// DBCP ?? 객체 ?���? ?��?��?���? ?��?�� getInstance() 메소?���? ?���? ?�� 반환값으�?
			// 커넥?�� ?? 객체 ?��?��?���?
			pool = DBConnectionMgr.getInstance();
			
		} catch (Exception e) {
			System.out.println("DB ?���? 객체 �??��?���? ?��?�� : " + e);
		}
	}	// ?��?��?�� ?��
	
	// ?��?�� 추�? 메소?��
	public void addSudent(StuVO vo) {
		
		String sql = "insert into student(stu_no, pw, name, addr, phone, tel, email, dep_name, major)"
		
				+ "values(?,?,?,?,?,?,?,?,?)";
		
		try {
			// DB ?���?
			con = pool.getConnection();
			// 쿼리�? ?��?��
			pstmt = con.prepareStatement(sql);
			// ? �? ?��?��
			pstmt.setInt(1, vo.getStu_no());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getAddr());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getDep_name());
			pstmt.setString(9, vo.getMajor());
			
			// 쿼리�? ?��?��
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("addSudent 메소?�� ?���? ?���? : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
			
	}	// addSudent 메소?�� ?��
	
	// �α��� ��ȸ
	public int userCheck(String stu_no, String stu_pw) {
		
		int check = 1;
		
		String sql = "";
		
		try {
			// DB ����
			con = pool.getConnection();
			// �Ű����� stu_no �� �޴� �� ��ȸ ����
			sql = "select * from student where stu_no=?";
			// PreparedStatement sql ���� �ѱ�
			pstmt = con.prepareStatement(sql);
			// ? �� ����
			pstmt.setString(1, stu_no);
			rs = pstmt.executeQuery();
			
			// �Է��� ���̵�� ��ȸ�� ���� ������?
			if( rs.next() ) {
				
				if( stu_pw.equals(rs.getString("pw"))) {
					check = 1;
				} else { // ���̵�� �°�, ��й�ȣ�� Ʋ��
					check = 0;
				}
			} else {
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("userCheck �޼ҵ� ���� ���� : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
		
	}	// userCheck 메소?�� ?��
	
	// 학생 한명의 정보를 조회하는 메소드
	public StuVO studnetInfo(int stu_no) {
		
		String sql = "select * from student where stu_no=?";
		// 학생정보 저장을 위한 VO 객체 생성
		StuVO vo = new StuVO();
		
		try {
			// DB 연결을 위한 커넥션 풀 요청
			con = pool.getConnection();
			// sql 구문 전달을 위한 PrepareStatement
			pstmt = con.prepareStatement(sql);
			// sql 구문 ? 갑 설정
			pstmt.setInt(1, stu_no);
			// DB 에서 조회된 값을 ResultSet 객체에 저장
			rs = pstmt.executeQuery();
			
			// stu_no 컬럼에 데이터 가 존재할 경우 vo 객체에 저장
			if( rs.next() ) {
				vo.setStu_no(rs.getInt("stu_no"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAddr(rs.getString("addr"));
				vo.setPhone(rs.getString("phone"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setDep_name(rs.getString("dep_name"));
				vo.setMajor(rs.getString("major"));
			}
			
		} catch (Exception e) {
			System.out.println("studnetInfo() 메소드 내부 오류 : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vo;
	}
	
	public void changeInfo(StuVO vo) {
		
		// ?��?��?���? ?��?��?�� ?��?�� sql update �? ?��?��
		String sql = "update student set pw=?, name=?, addr=?, phone=?, tel=?, email=?, dep_name=?, major=? where stu_no=?";
		
		try {
			// DB ?���?
			con = pool.getConnection();
			// 쿼리�? ?��?��
			pstmt = con.prepareStatement(sql);
			// ? �? ?��?��
			
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getAddr());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getDep_name());
			pstmt.setString(8, vo.getMajor());
			pstmt.setInt(9, vo.getStu_no());
			
			// 쿼리�? ?��?��
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("changeInfo 메소?�� ?���? ?���? : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}	// changeInfo ?��
	
	// 수강신정 할 수 있는 과목 가져오기
		public ArrayList subList() {
			
			ArrayList slist = new ArrayList();
			String sql = "";
			try {
				con = pool.getConnection();
				sql = "select * from subject";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				
				
				SubVO subVo = new SubVO();
				subVo.setSub_no(rs.getInt("no"));// 강의코드
				subVo.setSub_name(rs.getString("sub_name")); // 과목명
				subVo.setPro_name(rs.getString("pro_name")); // 교수 이름
				subVo.setPro_no(rs.getInt("pro_no")); // 교수 번호 	
				subVo.setPlace(rs.getString("place")); //강의 장소
				subVo.setPoint(rs.getInt("point"));	// 학점
				subVo.setCapacity(rs.getInt("capacity")); //수강 가능 인원
				subVo.setMajor(rs.getString("major")); //전공
				subVo.setDep_name(rs.getString("dep_name")); //전공
	
				slist.add(subVo);
			}
			
			}catch(Exception e) {
				System.out.println("Subject/SubDao클래스에서 getList메소드 오류 " + e);
				e.printStackTrace();
			} finally{
				pool.freeConnection(con, pstmt, rs);
			}
			
			return slist;
		}

}
