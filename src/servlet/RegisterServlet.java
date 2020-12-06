package servlet;

import dao.Dao;
import dao.Daolmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet",urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accoun = request.getParameter("u");
        int account = Integer.parseInt(accoun);
        String password = request.getParameter("p");
        Dao dao = new Daolmpl();
        int i = dao.register(account,password);
        String flag = "注册成功";
        if (i>0){
            request.setAttribute("info", flag);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            request.setAttribute("info", "注册失败");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
