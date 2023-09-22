package jun_stu;

public class Student {
    private int stuNo;
    private int grade;
    private int status;
    
    private String pw;
    private String name;
    private String addr;
    private String phone;
    private String tel;
    private String email;
    private String dep_name;
    private String major;

    public int getStuNo() {
		return stuNo;
	}


	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getDep_name() {
		return dep_name;
	}


	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}


	public Student(int stuNo, String name, String phone, String email ) {
        this.stuNo = stuNo;
        this.name = name;
        this.phone = phone;
        this.email = email;
        
    }


	public Student(int stuNo, String name, String phone, String email, String pw, String addr, String tel,
            String dep_name, String major, int grade, int status) {
		

}



	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}

    
}

