package jun_chamgo;

public class WeekInfo {
    private String weekName;
    private String lectureLink;
    private String videoId;

    public WeekInfo(String weekName, String lectureLink, String videoId) {
        this.weekName = weekName;
        this.lectureLink = lectureLink;
        this.videoId = videoId;
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
    
    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }
}
