package servlets;

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

@WebServlet(name = "contactServlet",value = "/contact-servlet")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");
        System.out.println(name+email+message);

        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setMessage(message);

        DBUtil dbUtil = new DBUtil();
        int status = dbUtil.insertMessage(contact);
        if (status > 0){
            resp.sendRedirect(Util.base_url+"index.jsp");
        }else {
            String errorMessage = "Ekleme sırasında bir hata oluştu!";
            req.setAttribute("insertError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact.jsp");
            dispatcher.forward(req, resp);
        }

    }
}
