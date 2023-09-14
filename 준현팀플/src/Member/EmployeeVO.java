package Member;

public class EmployeeVO {
    private int emp_no;
    private String pw;

    public int getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(int emp_no) {
        this.emp_no = emp_no;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    @Override
    public String toString() {
        return "EmployeeVO [emp_no=" + emp_no + ", pw=" + pw + "]";
    }
}