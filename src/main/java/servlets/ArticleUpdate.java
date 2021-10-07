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

@WebServlet(name = "articleUpdate",value = "/article-update")
public class ArticleUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try{
            req.getSession().setAttribute("updateId",id);
            int aid = (int)req.getSession().getAttribute("aid");
            DBUtil dbUtil = new DBUtil();

            if (dbUtil.isArticleValid(id,aid)){
                Article article = dbUtil.singleArticle(id);
                req.setAttribute("article",article);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/article_update.jsp");
                dispatcher.forward(req,resp);
            }
        }catch (Exception e){
            System.err.println("update Article Error : "+e);
        }
        resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean idStatus = req.getSession().getAttribute("updateId") != null;
        if (idStatus){
            String title = req.getParameter("title");
            String detail = req.getParameter("detail");
            int aid = (int) req.getSession().getAttribute("updateId");

            DBUtil dbUtil = new DBUtil();
            int status = dbUtil.updateArticle(title,detail,aid);
            req.getSession().removeAttribute("updateId");
        }
        resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");
    }
}
