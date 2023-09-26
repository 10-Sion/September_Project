package Member;

public class ProfessorVO {
    private int pro_no;
    private String pw;

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    @Override
    public String toString() {
        return "ProfessorVO [pro_no=" + pro_no + ", pw=" + pw + "]";
    }
}