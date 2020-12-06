package servlet;

import dao.Dao;
import dao.Daolmpl;
import data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns= "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idd = request.getParameter("u");
        int id = Integer.parseInt(idd);
        String password = request.getParameter("p");
        Dao dao = new Daolmpl();
        User user = dao.getuser(id,password);
        if (user!=null){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("show.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
