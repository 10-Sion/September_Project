package Member;

public class StudentVO {
    private int stu_no;
    private String pw;

    public int getStu_no() {
        return stu_no;
    }

    public void setStu_no(int stu_no) {
        this.stu_no = stu_no;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    @Override
    public String toString() {
        return "StudentVO [stu_no=" + stu_no + ", pw=" + pw + "]";
    }
}