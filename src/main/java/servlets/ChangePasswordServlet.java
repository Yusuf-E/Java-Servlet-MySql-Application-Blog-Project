package servlets;

import props.Admin;
import utils.DBUtil;
import utils.Database;
import utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changePasswordServlet",value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String repeatPassword = req.getParameter("repeatPassword");
        int aid = (int) req.getSession().getAttribute("aid");
        if (repeatPassword.equals(newPassword)){
            DBUtil dbUtil = new DBUtil();
            int status = dbUtil.updateAdmin(aid, Util.MD5(newPassword),Util.MD5(oldPassword));
            if (status > 0){
                resp.sendRedirect(Util.base_url+"admin_dashboard.jsp");
            }
            else {
                resp.sendRedirect(Util.base_url+"change_password.jsp");
            }
        }
        else {
            resp.sendRedirect(Util.base_url+"change_password.jsp");
        }

    }
}
