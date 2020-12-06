package dao;

import data.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Daolmpl implements Dao {
    private Connection conn = null;

    public Daolmpl() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); //注册驱动类

            conn = DriverManager.getConnection("jdbc:mysql://localhost/shop?useSSL=false&serverTimezone=Asia/Shanghai&&"
                    + "user=root&password=691011");  //创建连接
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Show> getShopInfo() {
        List<Show> shows = new ArrayList<Show>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from shopping");

            while (rs.next()) {
                Show show = new Show();

                show.setSid(rs.getInt("shoppingid"));
                show.setSname(rs.getString("shoppingname"));
                show.setNprice(rs.getInt("newprice"));
                show.setOprice(rs.getInt("oldprice"));
                show.setUrl(rs.getString("url"));
                show.setIntroduce(rs.getString("introduce"));
                show.setStid(rs.getInt("t_id"));
                shows.add(show);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shows;
    }

    @Override
    public List<Show> findshop(String name) {
        List<Show> shows2 = new ArrayList<Show>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from shopping where shoppingname='"+name+"'");

            while (rs.next()) {
                Show show = new Show();
                show.setSid(rs.getInt("shoppingid"));
                show.setSname(rs.getString("shoppingname"));
                show.setNprice(rs.getInt("newprice"));
                show.setOprice(rs.getInt("oldprice"));
                show.setUrl(rs.getString("url"));
                show.setIntroduce(rs.getString("introduce"));
                show.setStid(rs.getInt("t_id"));
                shows2.add(show);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shows2;
    }

    @Override
    public User getuser(int id, String password) {
        User user = new User();
        try {
            PreparedStatement pst = conn.prepareStatement("select * from userinfo where account=? && password=?");
            pst.setInt(1, id);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()){
                user.setUsername(rs.getString("username"));
                user.setId(rs.getInt("account"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int register(int account, String password) {
        try {
            PreparedStatement pst = conn.prepareStatement("insert into userinfo( account, password) values(?,?)");

            pst.setInt(1,account);
            pst.setString(2, password);
            pst.executeUpdate();
            pst.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public Detail getdetail(int id) {
        PreparedStatement pst = null;
        Detail detail = new Detail();
        try {
            pst = conn.prepareStatement("select * from detail where shoppingid=?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                detail.setShoppingid(rs.getInt("shoppingid"));
                detail.setShopname(rs.getString("name"));
                detail.setPrice(rs.getInt("price"));
                detail.setBrand(rs.getString("brand"));
                detail.setPublictime(rs.getString("publicdate"));
                detail.setTips(rs.getString("px"));
                detail.setUrl(rs.getString("save"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detail;
    }

    @Override
    public AddShopCar addshopcar(int userid, int shopid, int price, String url, String name) {
        try {


            PreparedStatement pst2 = conn.prepareStatement("select  num FROM car WHERE shoppingid =? and accountid=?");
            pst2.setInt(1,shopid);
            pst2.setInt(2,userid);

            ResultSet rs = pst2.executeQuery();
            if (rs.next()){
                PreparedStatement pst3 = conn.prepareStatement("update car set num =  num+1 ");
                pst3.executeUpdate();
                pst3.close();
//                if (rs.getString("num")!=null){
//                    PreparedStatement pst3 = conn.prepareStatement("update car set num =  num+1 ");
//                    pst3.executeUpdate();
//                    pst3.close();
//                }else {
//                    PreparedStatement pst4 = conn.prepareStatement("insert into car (num) values(?)");
//                    pst4.setInt(1,1);
//                    pst4.executeUpdate();
//                    pst4.close();
//                }
            }else {
                PreparedStatement pst = conn.prepareStatement("insert into car( shoppingid, accountid,shopprice,shopurl,shopname,num) values(?,?,?,?,?,?)");
                pst.setInt(1,shopid);
                pst.setInt(2, userid);
                pst.setInt(3, price);
                pst.setString(4, url);
                pst.setString(5, name);
                int i = 1;
                pst.setInt(6, i);
                pst.executeUpdate();
                pst.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<AddShopCar> getshopcar(int userid) {
        List<AddShopCar> addShopCars = new ArrayList<AddShopCar>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from car where accountid='"+userid+"'");

            while (rs.next()) {
                AddShopCar addShopCar = new AddShopCar();
                addShopCar.setShopid(rs.getInt("shoppingid"));
                addShopCar.setUserid(rs.getInt("accountid"));
                addShopCar.setNumber(rs.getInt("num"));
                addShopCar.setPrice(rs.getInt("shopprice"));
                addShopCar.setUrl(rs.getString("shopurl"));
                addShopCar.setName(rs.getString("shopname"));
                addShopCars.add(addShopCar);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addShopCars;
    }

    @Override
    public void clearshopcar(int userid) {
        try {
            PreparedStatement pst = conn.prepareStatement("delete from car where accountid='"+userid+"'");
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteshop(int userid, int shopid) {
        try {
            PreparedStatement pst = conn.prepareStatement("delete from car where accountid='"+userid+"' and shoppingid='"+shopid+"'");
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Parameter getParameter(int shopid, int typeid) {
        Parameter parameter = new Parameter();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from detail where shoppingid='"+shopid+"'");

            if (rs.next()) {
                parameter.setShoppingid(rs.getInt("shoppingid"));
                parameter.setTypeid(rs.getInt("typeid"));
                parameter.setPrice(rs.getInt("price"));
                parameter.setUrl(rs.getString("save"));
                parameter.setTime(rs.getString("publicdate"));
                parameter.setWight(rs.getString("wheight"));
                parameter.setCpu(rs.getString("CPU"));
                parameter.setBattery(rs.getString("battery"));
                parameter.setSize(rs.getString("screensize"));
                parameter.setResolving(rs.getString("fenbianlv"));
                parameter.setName(rs.getString("name"));
                parameter.setBrand(rs.getString("brand"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return parameter;
    }

    @Override
    public int gopay(int account, String password, int money, int userid) {
        try {
            PreparedStatement pst = conn.prepareStatement("select * from userinfo where account=? && accountid=? && acpassword=?");
            pst.setInt(1, userid);
            pst.setInt(2, account);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()){
               if (money>rs.getInt("money")){
                   return -1;
               }else {
                   PreparedStatement pst2 = conn.prepareStatement("update userinfo set money = money-'"+money+"' where account=? && accountid=? && acpassword=?");
                   pst2.setInt(1, userid);
                   pst2.setInt(2, account);
                   pst2.setString(3, password);
                   pst2.executeUpdate();
                   pst2.close();
               }
            }else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public int addmessage(int userid, String text) {
        try {
            PreparedStatement pst = conn.prepareStatement("insert into feedback( content, contenttime,userid) values(?,now(),?)");

            pst.setString(1, text);
            pst.setInt(2,userid);
            pst.executeUpdate();
            pst.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }


}
