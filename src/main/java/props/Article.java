package props;

import java.util.Date;

public class Article {

    public  Article(){

    }
    public Article(int id , String title, String detail , Date date){
        this.id = id;
        this.title = title;
        this.detail =detail;
        this.date = date;

    }

    private int id;
    private String title;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private String detail;
    private Date date;
}
