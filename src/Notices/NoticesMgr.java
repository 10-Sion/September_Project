package Notices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import Notices.DBConnectionMgr;

public class NoticesMgr {
    private DBConnectionMgr pool;

    public NoticesMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 공지사항 리스트 가져오기
    public Vector<NoticesBean> getNoticesList(int start, int end) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        Vector<NoticesBean> vlist = new Vector<NoticesBean>();
        try {
            con = pool.getConnection();
            sql = "SELECT * FROM notice ORDER BY regdate DESC LIMIT ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                NoticesBean bean = new NoticesBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setRegdate(rs.getString("regdate"));
                bean.setSub_no(rs.getInt("sub_no"));
                bean.setPro_no(rs.getInt("pro_no"));
                vlist.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vlist;
    }

    // 총 공지사항 수 가져오기
    public int getTotalNoticeCount() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        int totalCount = 0;
        try {
            con = pool.getConnection();
            sql = "SELECT COUNT(num) FROM notice";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return totalCount;
    }

 // 공지사항 추가
    public void insertNotice(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
            String sql = "INSERT INTO notice (title, content, regdate, sub_no, pro_no) VALUES (?, ?, NOW(), ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, req.getParameter("title"));
            pstmt.setString(2, req.getParameter("content"));
            pstmt.setInt(3, Integer.parseInt(req.getParameter("sub_no")));
            pstmt.setInt(4, Integer.parseInt(req.getParameter("pro_no")));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            pool.freeConnection(con, pstmt);
        }
    }

    // 공지사항 상세 정보 가져오기
    public NoticesBean getNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticesBean bean = new NoticesBean();
        try {
            con = pool.getConnection();
            String sql = "SELECT * FROM notice WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setRegdate(rs.getString("regdate"));
                bean.setSub_no(rs.getInt("sub_no"));
                bean.setPro_no(rs.getInt("pro_no"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return bean;
    }

 // 공지사항 수정
    public void updateNotice(NoticesBean bean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
            String sql = "UPDATE notice SET title=?, content=?, regdate=NOW(), WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bean.getTitle());
            pstmt.setString(2, bean.getContent());
       
            pstmt.setInt(3, bean.getNum());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }

    // 공지사항 삭제
    public void deleteNotice(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
            String sql = "DELETE FROM notice WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            pool.freeConnection(con, pstmt);
        }
    }
    
    // 공지사항 번호와 제목 가져오기
    public Vector<NoticesBean> getsimple(int start, int end) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        Vector<NoticesBean> vlist = new Vector<NoticesBean>();
        try {
            con = pool.getConnection();
            sql = "SELECT num, title FROM notice ORDER BY regdate DESC LIMIT ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                NoticesBean bean = new NoticesBean();
                bean.setNum(rs.getInt("num"));
                bean.setTitle(rs.getString("title"));
                vlist.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vlist;
    }

}