package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO implements IBoardDAO {

	private DataSource ds;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDAO() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) ctx.lookup("jdbc/gwanlee");
		} catch (Exception e) {
			System.out.println("BoardDAO의 생성자 내부에서 커넥션풀얻기 실패 : " + e.toString());
		}
	}

	public void freeResource() {
		try {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Vector getBoardList(String keyField, String keyWord) {
		Vector vector = new Vector();
		String sql = "";
		BoardBean bean = null;
		try {
			con = ds.getConnection();
			if (keyWord == null || keyWord.isEmpty()) {
				sql = "select * from board order by pos asc";
			} else {
				sql = "select * from board where " + keyField + " like '%" + keyWord + "%' order by pos asc";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setDepth(rs.getInt("depth"));
				bean.setCount(rs.getInt(8));
				bean.setIp(rs.getString(9));
				bean.setRegdate(rs.getTimestamp("regdate"));
				bean.setId(rs.getString(11));
				vector.add(bean);
			}
		} catch (Exception e) {
			System.out.println("BoardDAO클래스 내부의 getBoardList메소드내부에서 SQL문 실행 오류 : " + e);
		} finally {
			freeResource();
		}
		return vector;
	}

	@Override
	public BoardBean getBoard(int num) {
		BoardBean boardBean = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			int searchNum = rs.getInt("num");
			int searchCount = rs.getInt("count");
			String searchName = rs.getString("name");
			Timestamp searchRegdate = rs.getTimestamp("regdate");
			String searchSubject = rs.getString("subject");
			String searchContent = rs.getString("content");
			int searchPos = rs.getInt("pos");
			int searchDepth = rs.getInt("depth");
			boardBean = new BoardBean();
			boardBean.setNum(searchNum);
			boardBean.setCount(searchCount);
			boardBean.setName(searchName);
			boardBean.setRegdate(searchRegdate);
			boardBean.setSubject(searchSubject);
			boardBean.setContent(searchContent);
			boardBean.setPos(searchPos);
			boardBean.setDepth(searchDepth);
		} catch (Exception e) {
			System.out.println("BoardDAO내부의 getBoard메소드 내부에서 SQL문 실행 오류 : " + e);
		} finally {
			freeResource();
		}
		return boardBean;
	}

	@Override
	public void insertBoard(BoardBean boardBean) {
	    String sql = "";
	    try {
	        con = ds.getConnection();
	        // pos와 depth는 설정하지 않으므로 디폴트 값으로 들어갑니다.
	        sql = "insert into board (name, id, passwd, subject, content, count, ip) "
	                + "values (?, ?, ?, ?, ?, 0, ?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, boardBean.getName());
	        pstmt.setString(2, boardBean.getId());
	        pstmt.setString(3, boardBean.getPasswd());
	        pstmt.setString(4, boardBean.getSubject());
	        pstmt.setString(5, boardBean.getContent());
	        pstmt.setString(6, boardBean.getIp());
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        System.out.println("BoardDAO의 insertBoard 메소드 내부에서 SQL문 실행 오류: " + e.toString());
	    } finally {
	        freeResource();
	    }
	}


	public void updateReadCount(int num) {
		String sql = "";
		try {
			con = ds.getConnection();
			sql = "update board set count=count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO클래스 내부에 만들어 놓은 updateReadCount메소드내부에서 SQL문 실행 오류: " + e);
		} finally {
			freeResource();
		}
	}

	@Override
	public void updateBoard(BoardBean boardBean) {
		try {
			con = ds.getConnection();
			String sql = "UPDATE BOARD SET SUBJECT=?, CONTENT=? WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getSubject());
			pstmt.setString(2, boardBean.getContent());
			pstmt.setInt(3, boardBean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO의 updateBoard메소드 내부에서  SQL문 실행 오류 :" + e);
		} finally {
			freeResource();
		}
	}

	@Override
	public void deleteBoard(int num, String passwd, String id) {
		String sql = "";
		try {
			con = ds.getConnection();
			sql = "DELETE FROM board WHERE num = ? AND passwd = ? AND id = (SELECT id FROM member where id=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO의 deleteBoard메소드 내부에서  SQL문 실행 오류 : " + e);
		} finally {
			freeResource();
		}
	}

	public void replyUpPos(int ParentPos) {
		try {
			con = ds.getConnection();
			String sql = "update board set pos=pos+1 where pos  >  ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ParentPos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO의 replyUpPos메소드내부에서 SQL문 실행 오류 :" + e);
		} finally {
			freeResource();
		}
	}

	@Override
	public void replyBoard(BoardBean boardBean) {
		int ParentPos = 0;
		int ParentDepth = 0;
		String sql = "";
		try {
			con = ds.getConnection();
			sql = "select pos, depth from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getNum());
			rs = pstmt.executeQuery();
			rs.next();
			ParentPos = rs.getInt("pos");
			ParentDepth = rs.getInt("depth");
			sql = "update board set pos=pos+1 where pos  >  ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ParentPos);
			pstmt.executeUpdate();
			sql = "insert into board (name, id, passwd, subject, content, pos, depth, count, ip)"
					+ "values((select name from member where id=?),?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getId());
			pstmt.setString(2, boardBean.getId());
			pstmt.setString(3, boardBean.getPasswd());
			pstmt.setString(4, boardBean.getSubject());
			pstmt.setString(5, boardBean.getContent());
			pstmt.setInt(6, ParentPos);
			pstmt.setInt(7, ParentDepth + 1);
			pstmt.setInt(8, 0);
			pstmt.setString(9, boardBean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO의 replyBoard메소드 내부에서  SQL문 실행 오류 : " + e);
		} finally {
			freeResource();
		}
	}
	
	
	// 소이 추가
	public Vector getAllBoards() {
	    Vector vector = new Vector();
	    String sql = "";
	    BoardBean bean = null;
	    try {
	        con = ds.getConnection();
	        sql = "select * from board order by pos asc";
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            bean = new BoardBean();
	            bean.setNum(rs.getInt("num"));
	            bean.setName(rs.getString("name"));
	            bean.setPasswd(rs.getString("passwd"));
	            bean.setSubject(rs.getString("subject"));
	            bean.setContent(rs.getString("content"));
	            bean.setPos(rs.getInt("pos"));
	            bean.setDepth(rs.getInt("depth"));
	            bean.setCount(rs.getInt("count"));
	            bean.setIp(rs.getString("ip"));
	            bean.setRegdate(rs.getTimestamp("regdate"));
	            bean.setId(rs.getString("id"));
	            vector.add(bean);
	        }
	    } catch (Exception e) {
	        System.out.println("BoardDAO 클래스 내부의 getAllBoards 메소드 내부에서 SQL문 실행 오류: " + e);
	    } finally {
	        freeResource();
	    }
	    return vector;
	}

	public BoardBean getBoardByNum(int num) {
	    BoardBean boardBean = null;
	    try {
	        con = ds.getConnection();
	        pstmt = con.prepareStatement("select * from board where num=?");
	        pstmt.setInt(1, num);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            boardBean = new BoardBean();
	            boardBean.setNum(rs.getInt("num"));
	            boardBean.setName(rs.getString("name"));
	            boardBean.setPasswd(rs.getString("passwd"));
	            boardBean.setSubject(rs.getString("subject"));
	            boardBean.setContent(rs.getString("content"));
	            boardBean.setPos(rs.getInt("pos"));
	            boardBean.setDepth(rs.getInt("depth"));
	            boardBean.setCount(rs.getInt("count"));
	            boardBean.setIp(rs.getString("ip"));
	            boardBean.setRegdate(rs.getTimestamp("regdate"));
	            boardBean.setId(rs.getString("id"));
	        }
	    } catch (Exception e) {
	        System.out.println("BoardDAO 클래스 내부의 getBoardByNum 메소드 내부에서 SQL문 실행 오류: " + e);
	    } finally {
	        freeResource();
	    }
	    return boardBean;
	}
	
	public void deleteBoard(int num) {
	    String sql = "";
	    try {
	        con = ds.getConnection();
	        sql = "DELETE FROM board WHERE num = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, num);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        System.out.println("BoardDAO의 deleteBoard 메소드 내부에서 SQL문 실행 오류 : " + e);
	    } finally {
	        freeResource();
	    }
	}
}