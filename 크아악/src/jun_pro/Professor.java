// Professor.java
package jun_pro;

public class Professor {
    private int proNo;
    private String pw;
    private String name;
    private String addr;
    private String phone;
    private String tel;
    private String email;
    private String depName;
    private String major;
    private int labNum;
    private int status;

    // 생성자
    public Professor(int proNo, String pw, String name, String addr, String phone,
            String tel, String email, String depName, String major, int labNum, int status) {
        this.proNo = proNo;
        this.pw = pw;
        this.name = name;
        this.addr = addr;
        this.phone = phone;
        this.tel = tel;
        this.email = email;
        this.depName = depName;
        this.major = major;
        this.labNum = labNum;
        this.status = status;
    }

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
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

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getLabNum() {
		return labNum;
	}

	public void setLabNum(int labNum) {
		this.labNum = labNum;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

    
}
