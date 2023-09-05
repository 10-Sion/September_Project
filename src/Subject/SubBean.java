package Subject;

public class SubBean { // 과목테이블의 정보를 저장할 DTO
	private int sub_no; // 과목번호
	private String sub_name;// 과목명
	private int pro_no; // 교수 번호 
	private String place; //강의 장소
	private int Point;//  학점
	
	
	
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getPoint() {
		return Point;
	}
	public void setPoint(int point) {
		Point = point;
	}
	
	
}
