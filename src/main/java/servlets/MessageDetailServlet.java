package servlets;

import props.Article;
import props.Contact;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "messageDetailServlet",value = "/message-detail")
public class MessageDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid"));
        req.getSession().setAttribute("messageCid",cid);
        DBUtil dbUtil = new DBUtil();
        Contact message = dbUtil.singleMessage(cid);
            req.setAttribute("message",message);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/message_detail.jsp");
            dispatcher.forward(req,resp);

    }

}
