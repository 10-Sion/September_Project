package Leture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Subject.SubBean;

public class LectureDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private Connection getConnection() throws Exception {
		
		//1. InitialContext媛앹껜 �깮�꽦
		//�깮�꽦�븯�뒗 �씠�쑀�뒗  �옄諛붿쓽 �꽕�씠諛� �꽌鍮꾩뒪(JNDI)�뿉�꽌 �씠由꾧낵 �떎�젣 媛앹껜瑜� �뿰寃고빐二쇰뒗 媛쒕뀗�씠 Context�씠硫�,
		//InitialContext媛앹껜�뒗 �꽕�씠諛� �꽌鍮꾩뒪瑜� �씠�슜�븯湲곗쐞�븳 �떆�옉�젏�엯�땲�떎.
		Context initCtx = new InitialContext();
		//2. "java:comp/env"�씪�뒗 二쇱냼瑜� �쟾�떖�븯�뿬  Context媛앹껜瑜� �뼸�뿀�뒿�땲�떎.
		//"java:comp/env" 二쇱냼�뒗 �쁽�옱 �쎒 �븷�뵆由ъ��씠�뀡�쓽 猷⑦듃 �뵒�젆�꽣由� �씪怨� �깮媛� �븯硫대맗�땲�떎.
		//利�! �쁽�옱 �쎒�븷�뵆由ъ��씠�뀡�씠 �궗�슜�븷�닔 �엳�뒗 紐⑤뱺 �옄�썝�� "java:comp/env"�븘�옒�뿉 �쐞移섑빀�땲�떎.(<Context></Context/>�씠�쐞移섎�� 留먰빀�땲�떎.)
		Context ctx = (Context)initCtx.lookup("java:comp/env");
		//3. "java:comp/env 寃쎈줈 �븘�옒�뿉 �쐞移섑븳  "jdbc/jspbeginner" Recource�깭洹몄쓽  DataSource而ㅻ꽖�뀡���쓣 �뼸�뒗�떎
		ds = (DataSource)ctx.lookup("jdbc/gwanlee");		 
		//4. 留덉�留됱쑝濡� 而ㅻ꽖�뀡��(DataSouce)媛앹껜 硫붾え由� �뿉 ���옣�맂 Connection媛앹껜瑜� 諛섑솚諛쏆븘 �궗�슜
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
	
	public List getSublist() {
		ArrayList list = new ArrayList();
		String sql = "";
		try {
		con = getConnection();
		sql = "select * from subject_info";
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
}
