package JaeWooDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import JaeWooVO.LectureVO;
import JaeWooVO.PlanVO;
import JaeWooVO.WeekVO;



public class LectureDAO {
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
	}//�옄�썝�빐�젣 �걹
	
	public ArrayList getSublist(String keyField,String keyWord) {
		ArrayList list = new ArrayList();
		String sql = "";
		try {
		con = getConnection();
		
		if(keyWord == null || keyWord.isEmpty()) {
			sql = "select * from subject_info order by sub_no desc";
			
		}else {
			sql = "select * from subject_info where " + keyField + 
					" like '%" + keyWord + "%' order by sub_no desc";
		}
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			LectureVO lv = new LectureVO();
			lv.setSub_no(rs.getInt("sub_no"));
			lv.setSub_name(rs.getString("sub_name"));
			lv.setPro_no(rs.getInt("pro_no"));
			lv.setPro_name(rs.getString("pro_name"));
			lv.setPro_email(rs.getString("pro_email"));
			lv.setMajor(rs.getString("major"));
			lv.setCredit(rs.getInt("credit"));
			lv.setComp_sort(rs.getString("comp_sort"));
			lv.setGrade(rs.getInt("grade"));
			lv.setPeriod(rs.getString("period"));
			lv.setEdu_goal(rs.getString("edu_goal"));
			lv.setPlace(rs.getString("place"));
			lv.setTextbook(rs.getString("textbook"));	
			
			list.add(lv);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs_Close();
		}
		return list;
	}
	
	public ArrayList getSublist(String keyField,String keyWord, int pro_no) {
		ArrayList list = new ArrayList();
		String sql = "";
		try {
		con = getConnection();
		
		if(keyWord == null || keyWord.isEmpty()) {
			sql = "select * from subject_info where pro_no = " + pro_no + " order by sub_no desc";
			
		}else {
			sql = "select * from subject_info where " + keyField + 
					" like '%" + keyWord + "%' and pro_no = " + pro_no + " order by sub_no desc";
		}
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			LectureVO lv = new LectureVO();
			lv.setSub_no(rs.getInt("sub_no"));
			lv.setSub_name(rs.getString("sub_name"));
			lv.setPro_no(rs.getInt("pro_no"));
			lv.setPro_name(rs.getString("pro_name"));
			lv.setPro_email(rs.getString("pro_email"));
			lv.setMajor(rs.getString("major"));
			lv.setCredit(rs.getInt("credit"));
			lv.setComp_sort(rs.getString("comp_sort"));
			lv.setGrade(rs.getInt("grade"));
			lv.setPeriod(rs.getString("period"));
			lv.setEdu_goal(rs.getString("edu_goal"));
			lv.setPlace(rs.getString("place"));
			lv.setTextbook(rs.getString("textbook"));	
			
			list.add(lv);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs_Close();
		}
		return list;
	}
	
	public LectureVO getSubject(int sub_no ) {
			
			LectureVO lv = new LectureVO();
		try {
			
			con = getConnection();
			String sql = "select * from subject_info where sub_no = " + sub_no;
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				lv.setSub_no(rs.getInt("sub_no"));
				lv.setSub_name(rs.getString("sub_name"));
				lv.setPro_no(rs.getInt("pro_no"));
				lv.setPro_name(rs.getString("pro_name"));
				lv.setPro_email(rs.getString("pro_email"));
				lv.setMajor(rs.getString("major"));
				lv.setCredit(rs.getInt("credit"));
				lv.setComp_sort(rs.getString("comp_sort"));
				lv.setGrade(rs.getInt("grade"));
				lv.setPeriod(rs.getString("period"));
				lv.setEdu_goal(rs.getString("edu_goal"));
				lv.setPlace(rs.getString("place"));
				lv.setTextbook(rs.getString("textbook"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			
			rs_Close();
		}
		
			
		return lv;
	}

	public PlanVO getPlan(int sub_no) {
		PlanVO Pv = new PlanVO();
		
		try {
			
			con = getConnection();
			
			String sql = "select * from evaluation_plan where sub_no =" + sub_no;
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Pv.setSub_no(rs.getInt("sub_no"));
				Pv.setMid_exam(rs.getInt("mid_exam"));
				Pv.setFinal_exam(rs.getInt("final_exam"));
				Pv.setQuiz(rs.getInt("quiz"));
				Pv.setAttendance(rs.getInt("attendance"));
				Pv.setJilmun(rs.getInt("jilmun"));
				Pv.setToron(rs.getInt("toron"));
			}		
			
		}catch(Exception e) {
			System.out.println("LectureDAO 내부에서 getPlan 메소드 내부에서 오류 " + e);
			e.printStackTrace();
			
		}finally {
			rs_Close();
		}
		return Pv;
	}

	public void InsertWeek(WeekVO kw) {
		
		String sql = "";
		try {
			con = getConnection();
			
			sql = "insert into weekInfo (sub_no, week, class_type, class_hour, week_name, assignment, lecture_link)" +
					"values(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, kw.getSub_no());
			pstmt.setInt(2, kw.getWeek());
			pstmt.setString(3, kw.getClass_type());
			pstmt.setInt(4, kw.getClass_hour());
			pstmt.setString(5, kw.getWeek_name());
			pstmt.setBoolean(6, kw.isAssignment());
			pstmt.setString(7, kw.getLecture_link());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("LectureDAO 내부 InsertWeek 메소드 내부에서 오류 " + e);
			e.printStackTrace();
			
		}finally {
			rs_Close();
		}
	}

	public List getWeekList(int sub_no) {
		ArrayList list = new ArrayList();
		String sql = "";
		try {
			
			con = getConnection();
			sql = "select * from weekInfo where sub_no = " + sub_no;
		
			while(rs.next()) {
				WeekVO kw = new WeekVO();				
				
				kw.setWeek(rs.getInt("week"));
				kw.setSub_no(rs.getInt("week"));
				kw.setClass_hour(rs.getInt("class_hour"));
				kw.setWeek_name(rs.getString("week_name"));
				kw.setClass_type(rs.getString("class_type"));
				kw.setAssignment(rs.getBoolean("assignment"));
				kw.setLecture_link(rs.getString("lecture_link"));
				
				list.add(kw);
			}
		}catch(Exception e) {
			System.out.println("LectureDAO 내부 getWeekList 메소드 내부에서 오류 " + e);
			e.printStackTrace();
		}finally {
			rs_Close();
		}
		return null;
	}
	
	
	
}//DAO끝
