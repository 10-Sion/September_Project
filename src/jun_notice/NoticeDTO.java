package jun_notice;
 
public class NoticeDTO {
    private int noticeNum;
    private String title;
    private String content;
    private String writer;
    private String createDate;

    public NoticeDTO(int noticeNum, String title, String content, String writer, String createDate) {
        super();
        this.noticeNum = noticeNum;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.createDate = createDate;
    }

    public int getNoticeNum() {
        return noticeNum;
    }

    public void setNoticeNum(int noticeNum) {
        this.noticeNum = noticeNum;
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

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
