package data;

public class Order {
    int orderid;
    String ordertome;
    String url;
    String shopname;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getOrdertome() {
        return ordertome;
    }

    public void setOrdertome(String ordertome) {
        this.ordertome = ordertome;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public int getShopnum() {
        return shopnum;
    }

    public void setShopnum(int shopnum) {
        this.shopnum = shopnum;
    }

    public int getShopprice() {
        return shopprice;
    }

    public void setShopprice(int shopprice) {
        this.shopprice = shopprice;
    }

    public String getRecever() {
        return recever;
    }

    public void setRecever(String recever) {
        this.recever = recever;
    }

    int shopnum;
    int shopprice;
    String recever;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    String address;
    int userid;
}
