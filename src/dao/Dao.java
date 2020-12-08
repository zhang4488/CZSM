package dao;

import data.*;

import java.util.List;

public interface Dao {
    List<Show> getShopInfo();

    List<Show> findshop(String name);

    User getuser(int id,String password);

    int register(int account, String password);

    Detail getdetail(int id);

    AddShopCar addshopcar(int userid, int shopid, int price, String url, String name);

    List<AddShopCar> getshopcar(int userid);

    void clearshopcar(int userid);

    void deleteshop(int userid, int shopid);

    Parameter getParameter(int shopid, int typeid);

    int gopay(int account, String password, int money, int userid );

    int addmessage(int userid, String text);

    void addorder(List<AddShopCar> addShopCars, String address, String receiver);

    List<Order> getorder(int user);
}
