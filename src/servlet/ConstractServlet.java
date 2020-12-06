package servlet;

import dao.Dao;
import dao.Daolmpl;
import data.Parameter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "ConstractServlet",urlPatterns = "/ConstractServlet")
public class ConstractServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    protected void para1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String temp = request.getParameter("Pshopid");
        int shopid = Integer.parseInt(temp);
        String temp2 = request.getParameter("typeid");
        int typeid = Integer.parseInt(temp2);
        String temp3 = request.getParameter("yztypeid2");
        int yztype = Integer.parseInt(temp3);
        if (yztype==0){
            yztype=typeid;
        }
        Dao dao = new Daolmpl();
        Parameter parameter = dao.getParameter(shopid,typeid);
        HttpSession session = request.getSession();
        if (yztype==parameter.getTypeid()){
            session.setAttribute("parameter", parameter);
            session.setAttribute("type1", parameter.getTypeid());
            String stryztype = Integer.toString(yztype);
            session.setAttribute("typeid", stryztype);
            response.sendRedirect("parameterComparison.jsp");
        }else {
            request.setAttribute("typeerro","ddd");
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }

    }
    protected void para2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String temp = request.getParameter("Pshopid");
        int shopid = Integer.parseInt(temp);
        String temp2 = request.getParameter("typeid");
        int typeid = Integer.parseInt(temp2);
        String temp3 = request.getParameter("yztypeid2");
        int yztype = Integer.parseInt(temp3);
        if (yztype==0){
            yztype=typeid;
        }
        Dao dao = new Daolmpl();
        Parameter parameter2 = dao.getParameter(shopid,typeid);
        HttpSession session = request.getSession();
        if (yztype==parameter2.getTypeid()){
            session.setAttribute("parameter2", parameter2);
            session.setAttribute("type2", parameter2.getTypeid());
            String stryztype = Integer.toString(yztype);
            session.setAttribute("typeid", stryztype);
            response.sendRedirect("parameterComparison.jsp");
        }else {
            request.setAttribute("typeerro","ddd");
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
