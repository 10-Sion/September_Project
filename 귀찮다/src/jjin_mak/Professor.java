package jjin_mak;

public class Professor {
    private int proNo;
    private String pw;
    private String name;
    private String addr;
    private String tel;
    private String phone;
    private String major;
    private String email;
    private int labNum;

    // 기본 생성자
    public Professor() {
    }
    
    public Professor(int proNo, String name, String tel, String major) {
        this.proNo = proNo;
        this.name = name;
        this.tel = tel;
        this.major = major;
    }

    public Professor(int proNo, String pw, String name, String addr, String tel, String phone, String major, String email, int labNum) {
        this.proNo = proNo;
        this.pw = pw;
        this.name = name;
        this.addr = addr;
        this.tel = tel;
        this.phone = phone;
        this.major = major;
        this.email = email;
        this.labNum = labNum;
    }

    // Getter and Setter
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
}
