package servlets;

import props.Article;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "articleServlet", value = "/article-insert")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String detail = req.getParameter("detail");

        Article article = new Article();
        article.setTitle(title);
        article.setDetail(detail);
        int aid = (int) req.getSession().getAttribute("aid");
        DBUtil dbUtil = new DBUtil();
        int status = dbUtil.insertArticle(article,aid);
        if(status > 0){
            resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");

        }else{
            String errorMessage = "Makale Ekleme Sırasında Bir Hata Oluştu!";
            req.setAttribute("insertError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_dashboard.jsp");
            dispatcher.forward(req,resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        try {
            int cid = Integer.parseInt(id);
            int aid = (int) req.getSession().getAttribute("aid");
            DBUtil util = new DBUtil();
            if (util.isArticleValid(cid,aid)){
                int status = util.articleDelete(cid);
                if ( status > 0 ){

                }
            }
        }catch (Exception e){
            System.err.println("Delete item Error : " +e);
        }
        resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");
    }
}
