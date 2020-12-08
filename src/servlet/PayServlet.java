package servlet;

import dao.Dao;
import dao.Daolmpl;
import data.AddShopCar;
import data.Show;
import data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PayServlet",urlPatterns = "/PayServlet")
public class PayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accountid = request.getParameter("accountId");
        String password = request.getParameter("password");
        String smoney = request.getParameter("money");
        String user = request.getParameter("userid");
        String address = request.getParameter("address");
        String receiver = request.getParameter("receiver");
        int account = Integer.parseInt(accountid);
        int money = Integer.parseInt(smoney);
        int userid = Integer.parseInt(user);
        Dao dao = new Daolmpl();
        int payflag = dao.gopay(account,password,money,userid);
        if (payflag==1){
            List<AddShopCar> addShopCars = dao.getshopcar(userid);
            dao.addorder(addShopCars,address,receiver);
            dao.clearshopcar(userid);
            request.setAttribute("info","支付成功！");
            request.getRequestDispatcher("show.jsp").forward(request,response);
        }else if (payflag==-1){
            request.setAttribute("erron","余额不足，支付失败");
            request.getRequestDispatcher("pay.jsp").forward(request,response);
        }else if (payflag==0){
            request.setAttribute("erron","银行卡账号或密码错误！");
            request.getRequestDispatcher("pay.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
