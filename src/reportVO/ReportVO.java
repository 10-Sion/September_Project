package reportVO;

public class ReportVO {
	
	private int Sub_no;
	private int Stu_no;
	private int Week;
	private String title;
	private String content;
	private String secret;
	private String fileName;
	private String fileRealName;
	
	public int getSub_no() {
		return Sub_no;
	}
	public void setSub_no(int sub_no) {
		Sub_no = sub_no;
	}
	public int getStu_no() {
		return Stu_no;
	}
	public void setStu_no(int stu_no) {
		Stu_no = stu_no;
	}
	public int getWeek() {
		return Week;
	}
	public void setWeek(int week) {
		Week = week;
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
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

}
