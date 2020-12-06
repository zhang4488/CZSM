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

@WebServlet(name = "ShopCarServlet",urlPatterns = "/ShopCarServlet")
public class ShopCarServlet extends HttpServlet {
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
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        boolean login = Boolean.parseBoolean(request.getParameter("login"));
        if (login){
            String temp = request.getParameter("userid");
            String temp2 = request.getParameter("shopid");
            String temp3 = request.getParameter("shopprice");
            String url = request.getParameter("shopurl");
            String name = request.getParameter("shopname");
            int userid = Integer.parseInt(temp);
            int shopid = Integer.parseInt(temp2);
            int price = Integer.parseInt(temp3);
            Dao dao = new Daolmpl();
            dao.addshopcar(userid,shopid,price,url,name);
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }else {
            request.setAttribute("loginflag","ddd");
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }
    }
    protected void clearshopcar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String temp = request.getParameter("userid");
        int userid = Integer.parseInt(temp);
        Dao dao = new Daolmpl();
        dao.clearshopcar(userid);
        request.setAttribute("userid",userid);
        request.getRequestDispatcher("shopcar.jsp").forward(request,response);
    }
    protected void deleteshop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String temp = request.getParameter("userid");
        String temp2 = request.getParameter("shopid");
        int userid = Integer.parseInt(temp);
        int shopid = Integer.parseInt(temp2);
        Dao dao = new Daolmpl();
        dao.deleteshop(userid,shopid);
        request.setAttribute("userid",userid);
        request.getRequestDispatcher("shopcar.jsp").forward(request,response);
    }






        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
