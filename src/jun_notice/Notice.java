package jun_notice;

import java.util.Date;

public class Notice {
    private int num; // 공지사항 번호
    private String title; // 제목
    private String content; // 내용
    private Date regdate; // 등록일
    private int subNo; // 강의 번호
    private int proNo; // 교수 번호

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public int getSubNo() {
        return subNo;
    }

    public void setSubNo(int subNo) {
        this.subNo = subNo;
    }

    public int getProNo() {
        return proNo;
    }

    public void setProNo(int proNo) {
        this.proNo = proNo;
    }
}
