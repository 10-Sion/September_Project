package jun_chamgo;

public class WeekInfo {
    private String weekName;
    private String lectureLink;

    public WeekInfo(String weekName, String lectureLink) {
        this.weekName = weekName;
        this.lectureLink = lectureLink;
    }

    public String getWeekName() {
        return weekName;
    }

    public void setWeekName(String weekName) {
        this.weekName = weekName;
    }

    public String getLectureLink() {
        return lectureLink;
    }

    public void setLectureLink(String lectureLink) {
        this.lectureLink = lectureLink;
    }
}
