package utils;

import props.Admin;
import props.Article;
import props.Contact;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.time.LocalDate.now;

public class DBUtil {

    public boolean login(String email, String password, String remember, HttpServletRequest request , HttpServletResponse response){
        boolean status = false;
        Database database = new Database();
        try {
            String sql = "SELECT * FROM admin WHERE email = ? and password = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2,Util.MD5(password));
            ResultSet resultSet = pre.executeQuery();
            status = resultSet.next();

            if (status){
                // session create
                int aid = resultSet.getInt("aid");
                String name = resultSet.getString("name");

                request.getSession().setAttribute("aid",aid);
                request.getSession().setAttribute("name",name);
                request.getSession().setAttribute("email",email);

                // cookie create

                if(remember != null && remember.equals("on")){
                    name = name.replaceAll(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("user", val);
                    cookie.setMaxAge( 60*60 );
                    response.addCookie(cookie);
                }
            }

        }catch (Exception e){
            System.err.println("Login Error : "+e);
        }finally {
            database.close();
        }
        return status;
    }
    public int insertAdmin(Admin admin){
    int status = 0;
    Database database = new Database();

    try {
        String sql = "insert into admin values(null,?,?,?)";
        PreparedStatement pre = database.connection.prepareStatement(sql);
        pre.setString(1,admin.getName());
        pre.setString(2,admin.getEmail());
        pre.setString(3,Util.MD5(admin.getPassword()));
        status = pre.executeUpdate();
    }catch (Exception e){
        System.err.println("Admin Insert Error :" + e);
    }finally {
        database.close();
    }
    return status;
    }
    public int insertArticle(Article article , int aid){
    int status = 0;
        Database database = new Database();
        try {
            String sql = "insert into article values(null,?,?,now(),?)";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setString(1,article.getTitle());
            pre.setString(2,article.getDetail());
            pre.setInt(3,aid);
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("article Insert Error : "+ e);
        }
        finally {
            database.close();
        }
    return  status;
    }
    public List<Admin> allAdmin(){
        List<Admin> adminLs = new ArrayList<>();

        Database database = new Database();

        try{
            String sql = "SELECT * FROM admin";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ){
                int aid = rs.getInt("aid");
                String name = rs.getString("name");
                String email = rs.getString("email");

                Admin admin = new Admin(aid,name,email);
                adminLs.add(admin);
            }
        }catch (Exception e){
            System.err.println("allAdmin Error " +e);
        }finally {
            database.close();
        }
        return adminLs;
    }
    public List<Article> allArticles(int aid){
        List<Article> articleList = new ArrayList<>();

        Database database = new Database();

        try {
            String sql = "SELECT * FROM article where aid = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id") ;
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                System.out.println("Title :"+ title);
                Article article = new Article(id,title,detail,date);
                articleList.add(article);
            }

        }catch (Exception e){
            System.err.println("allArticle Error "+e);

        }finally {
            database.close();
        }
        return articleList;
    }
    public int articleDelete( int id ){
        int status = 0;
        Database database = new Database();
        try{
            String sql = "delete from article where id = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,id);
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("article Delete Error "+e);
        }finally {
            database.close();
        }

        return status;
    }
    public boolean isArticleValid(int cid , int aid){
        boolean status = false;
        Database database = new Database();

        try {
            String sql = "select * from article where id =? and aid =?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,cid);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();

        }catch (Exception e){
            System.err.println("is Article Valid Error : " +e);
        }finally {
            database.close();
        }

        return status;
    }
    public Article singleArticle(int id){
        Article article = new Article();
        Database database = new Database();
        try{
            String sql = "select * from article where id = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()){
                int aid = rs.getInt("id");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                article = new Article(aid,title,detail,date);
                return article;
            }
        }catch (Exception e){

        }finally {
            database.close();
        }

        return article;
    }
    public int updateArticle(String title, String detail , int aid){
        int status = 0;
        Database database = new Database();
        try{
            String sql = "update article set title = ?, detail = ? where id = ? ";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,detail);
            pre.setInt(3,aid);
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("update Article Error : " +e);
        }finally {
            database.close();
        }
        return status;
    }
    public int updateAdmin(int aid, String newPassword,String oldPassword){
        int status=0;
        Admin admin = new Admin();
        Database database = new Database();
        try {
            String sql ="select * from admin where aid = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()){
                String password = rs.getString("password");
                if (oldPassword.equals(password)){
                     String nsql ="update admin set password = ?  where aid = ?";
                    PreparedStatement prep = database.connection.prepareStatement(nsql);
                    prep.setString(1,newPassword);
                    prep.setInt(2,aid);
                    status = prep.executeUpdate();
                }
            }

        }catch (Exception e){
            System.err.println("find Admin Error "+ e);
        }finally {
            database.close();
        }

        return status;
    }
    public List<Article> allIndexArticles(){
        List<Article> articleList = new ArrayList<>();

        Database database = new Database();

        try {
            String sql = "SELECT * FROM article";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id") ;
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");
                System.out.println("Title :"+ title);
                Article article = new Article(id,title,detail,date);
                articleList.add(article);
            }

        }catch (Exception e){
            System.err.println("allArticle Error "+e);

        }finally {
            database.close();
        }
        return articleList;
    }
    public int insertMessage(Contact contact){
        int status = 0;
        Database database = new Database();
        try {
            String sql = "insert into contact values( null , ?,?,?)";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setString(1,contact.getName());
            pre.setString(2,contact.getEmail());
            pre.setString(3,contact.getMessage());
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("insert Message Error : "+ e);
        }finally {
            database.close();
        }
        return status;
    }
    public List<Contact> allMessages(){
        List<Contact> contactLs = new ArrayList<>();

        Database database = new Database();

        try{
            String sql = "SELECT * FROM contact order by cid desc ";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ){
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");

                Contact contact = new Contact(cid,name,email,message);
                contactLs.add(contact);
            }
        }catch (Exception e){
            System.err.println("allAdmin Error " +e);
        }finally {
            database.close();
        }
        return contactLs;
    }
    public Contact singleMessage(int id){
        Contact contact = new Contact();
        Database database = new Database();
        try{
            String sql = "select * from contact where cid = ?";
            PreparedStatement pre = database.connection.prepareStatement(sql);
            pre.setInt(1,id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()){
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");
                contact = new Contact(cid,name,email,message);
                return contact;
            }
        }catch (Exception e){

        }finally {
            database.close();
        }

        return contact;
    }
}
