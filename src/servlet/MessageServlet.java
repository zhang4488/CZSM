package servlet;

import dao.Dao;
import dao.Daolmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "MessageServlet",urlPatterns = "/MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String methodName = request.getParameter("method");

        try {
            // 利用反射获取方法
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            // 执行相应的方法
            method.setAccessible(true);
            method.invoke(this, request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
    protected void just(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        boolean login = Boolean.parseBoolean(request.getParameter("login"));
        if (login){
            String user = request.getParameter("toboxuserid");
            request.setAttribute("user",user);
            request.getRequestDispatcher("messagebox.jsp").forward(request,response);
        }else {
            request.setAttribute("loginflag","ddd");
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }
    }
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           request.setCharacterEncoding("UTF-8");
           String user = request.getParameter("user");
           String text = request.getParameter("textfield");
           int userid = Integer.parseInt(user);
           Dao dao = new Daolmpl();
           int boxflag = dao.addmessage(userid,text);
           if (boxflag==1){
               request.setAttribute("addflag","感谢您的意见！");
               request.getRequestDispatcher("messagebox.jsp").forward(request,response);
           }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
