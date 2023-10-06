package JaeWooVO;

public class WeekVO {
	private int sub_no ; //과목 번호
    private int week ; // 주차
    private String class_type; // '대면', '비대면'
    private int class_hour; // 차시
    private String week_name; // 주차 수업명
    private boolean assignment; // 과제 유무
    private String lecture_link;
    
    
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public int getClass_hour() {
		return class_hour;
	}
	public void setClass_hour(int class_hour) {
		this.class_hour = class_hour;
	}
	public String getWeek_name() {
		return week_name;
	}
	public void setWeek_name(String week_name) {
		this.week_name = week_name;
	}
	public boolean isAssignment() {
		return assignment;
	}
	public void setAssignment(boolean assignment) {
		this.assignment = assignment;
	}
	public String getLecture_link() {
		return lecture_link;
	}
	public void setLecture_link(String lecture_link) {
		this.lecture_link = lecture_link;
	}
    
    
}
