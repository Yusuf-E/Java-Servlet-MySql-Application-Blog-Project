package servlets;

import props.Article;
import utils.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "articleDetailServlet",value = "/article-detail")
public class ArticleDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int aid = Integer.parseInt(req.getParameter("id"));

        DBUtil dbUtil = new DBUtil();
        Article article = dbUtil.singleArticle(aid);
        req.setAttribute("article",article);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/article_detail.jsp");
        dispatcher.forward(req,resp);
    }
}
