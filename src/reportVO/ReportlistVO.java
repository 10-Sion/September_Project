package reportVO;

// 과제 리스트
public class ReportlistVO {
	
	private int week;			// 주차
	private int sub_no; 		// 과제번호
    private String sub_name;	// 과제 제목
    private String method;		// 제출 방법
    private String period;		// 제출기한
    private String disclosure;	// 공개여부
    private int personnel;		// 제출인원
    private int evaluation;		// 평가인원
    private String submit;		// 제출여부
    private String pro_name;	// 교수이름
    
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
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
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getDisclosure() {
		return disclosure;
	}
	public void setDisclosure(String disclosure) {
		this.disclosure = disclosure;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
	
    
    
}
