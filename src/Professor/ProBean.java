package Professor;

public class ProBean {

	// 교수 테이블의 정보를 저장할 인스턴스 변수 선언
	private int no; // 교수 식별 번호
	private String name;	//교수 이름
	private String pw;	// 교수 비밀번호
	private String addr; // 교수 거주지
	private String tel; // 연구실 전화번호
	private String phone; // 교수 휴대전화 번호
	private String major; // 학부(전공)
	private String email; //교수 이메일 주소
	private int labNum; // 연구실 번호
	private String dep_name; //소속 학부
	
	
	//getter, setter 메소드들
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLabNum() {
		return labNum;
	}
	public void setLabNum(int labNum) {
		this.labNum = labNum;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	
	

	
	


	
	
}
