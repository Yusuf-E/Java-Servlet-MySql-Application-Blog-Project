package servlets;

import props.Admin;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "adminServlet",value = "/admin-insert")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Admin admin = new Admin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setPassword(password);
        DBUtil dbUtil = new DBUtil();
        int status = dbUtil.insertAdmin(admin);
        if ( status > 0 ){
            resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");
        }else{
            String errorMessage = "Admin Ekleme Sırasında Bir Hata Oluştu!";
            req.setAttribute("insertError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_dashboard.jsp");
            dispatcher.forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
