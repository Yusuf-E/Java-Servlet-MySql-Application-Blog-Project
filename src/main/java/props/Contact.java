package props;

public class Contact {
    private int cid ;
    private String name;
    private String email;
    private String message;

    public Contact(){

    }
    public Contact(int cid , String name,String email , String message){
        this.cid = cid;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
