package last;

public class Employee {
    private int empNo;
    private String pw;
    private String name;
    private String addr;
    private String phone;
    private String tel;
    private String email;

    // 생성자
    public Employee(int empNo, String pw, String name, String addr, String phone, String tel, String email) {
        this.empNo = empNo;
        this.pw = pw;
        this.name = name;
        this.addr = addr;
        this.phone = phone;
        this.tel = tel;
        this.email = email;
    }

    // Getter 및 Setter 메서드
    public int getEmpNo() {
        return empNo;
    }

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
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
}
