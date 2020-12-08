<%@ page import="dao.Dao" %>
<%@ page import="dao.Daolmpl" %>
<%@ page import="data.AddShopCar" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/4
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>购物车</title>
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        div.nav{
            height:40px;
            background-color: gainsboro;
        }

        li.nav-menu1{
            float:left;
            margin-left: 30px;
            margin-right: 200px;
            margin-top: 6px;
            list-style: none;
        }
        li.nav-menu{
            float:left;
            margin-left: 30px;
            list-style: none;
            margin-top: 6px;
        }
        li.nav-menu2{
            float:left;
            margin-left: 340px;
            list-style: none;
            margin-top: 6px;
        }
        li.nav-menu1 a{
            text-decoration: none;
            color:black;
        }
        li.nav-menu2 a{
            text-decoration: none;
            color:black;
        }
        li.nav-menu a{
            text-decoration: none;
            color:black;
        }
        div.search{
            height:100px;
            margin:0 auto;
        }
        div.logo{
            float: left;
            font-size: 45px;
            font-weight: bold;
            color:darkorange;
            font-family: "agency fb";
            margin-left: 330px;
            margin-top: 25px;
        }
        div.search-panel{
            margin-left: 660px;
            margin-top: -40px;
            float: left;
        }
        div.content{
            height:180px;
            margin:0 340px;
            width: 900px;
            border-bottom: orangered;
        }
        div.table tr td{
            vertical-align: middle;
        }
        input.shopnum{
            text-align:center;
        }
        tr.title{
            background-color: #DCDCDC;
            text-align:center;

        }


        div.delete{
            position: relative;
            left: 40px;
            width: 60px;
            height: 28px;
            border-radius: 8px;
            background-color:#ee2c2c;
        }
        div.delete a{
            color: white;
            text-decoration: none;
        }
        tr.title1{
            text-align:center;
            border-bottom:1px red solid;
            background-color: aliceblue;
        }
        div.container{
            margin-top: 50px;
            height:90px;
            background-color: #DCDCDC;
            border-top: 1px black solid;
        }

        div.buttom {
            margin-left: 450px;
        }
        div.buttom ul li{
            list-style: none;
            float:left;
            margin-top: 25px;
            width: 100px;
            height: 35px;
            margin-left: 45px;
            text-align: center;
            padding-top: 10px;
        }
        div.buttom ul li a{
            text-decoration: none;
            color: white;

        }
        li.goshopping{
            border-radius: 10px;
            background-color:#4a77d4;
        }
        li.clear{
            border-radius: 10px;
            background-color: #4a77d4;
        }
        li.pay{
            border-radius: 10px;
            background-color: #EE2C2C;
        }
        div.banquan{
            border-top: #DCDCDC 1px solid;
            width: 900px;
            height: 30px;
            margin-top: 35px;
        }
        p{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="nav">
    <ul class="nav-l">
        <li class="nav-menu2">
            <a href="#">  亲，请登录</a>
        </li>

        <li class="nav-menu1">
            <a href="#">免费注册</a>
        </li>

        <li class="nav-menu">
            <a href="#">数码网首页</a>
        </li>
        <li class="nav-menu">
            <a href="order.html">我的订单</a>
        </li>
        <li class="nav-menu">
            <a href="shopcar3.html">🛒购物车（0）</a>
        </li>

        <li class="nav-menu">
            <a href="#">我的宝贝</a>
        </li>

        <li class="nav-menu">
            <a href="#">关于</a>
        </li>

        <li class="nav-menu">
            <a href="#">联系客服</a>
        </li>
    </ul>
</div>
<%
    request.setCharacterEncoding("UTF-8");
    String temp = request.getParameter("userid");
    int userid = Integer.parseInt(temp);
    Dao dao = new Daolmpl();
    List<AddShopCar> addShopCars = dao.getshopcar(userid);
    int totalmoney=0;
    for (AddShopCar money : addShopCars) {
        totalmoney += money.getPrice()*money.getNumber();
    }


%>
<div class="search">
    <div class="logo">购物车</div>
    <div class="search-panel">
        <input id="q" name="q" value="请输入搜索文字" style="border: #FF8C00 2px solid; height: 30px;" size="80">
        <button class="btn-search" type="submit"  style="height: 32px; width: 60px;">搜 索</button>
    </div>
</div>
<div class="content">
    <%
        for (AddShopCar addShopCar : addShopCars) {
    %>
    <table class="table" width="900px">
        <tr class="title">
            <td>商品名</td>
            <td>数量</td>
            <td>价格</td>
            <td>总金额</td>
            <td>操作</td>
        </tr>
        <tr class="title1" style="border-top:solid 1px #006393">
            <td>
                <img alt="图片" src="<%=addShopCar.getUrl()%>" style="width:140px;height:120px;border: gray 1px solid;">
                <div class="shopname"><%=addShopCar.getName()%></div>
            </td>
            <td style="height:100px;line-height: 150px;">
                <input class="shopnum"  type="text" size="1" name="num" value="<%=addShopCar.getNumber()%>" style="width:50px;height:20px;"/>
            </td>
            <td >￥ <b><%=addShopCar.getPrice()%></b></td>
            <td>￥ <b><%=addShopCar.getPrice()*addShopCar.getNumber()%></b></td>
            <td>
                <div class="delete">
                    <a href="ShopCarServlet?method=deleteshop&userid=<%=userid%>&shopid=<%=addShopCar.getShopid()%>">删除</a>
                </div>
            </td>
        </tr>
    </table>
    <%}%>
    </content>
    <div class="container">
        <div class="buttom">
            <ul>
                <li class="goshopping"><a href="show.jsp" role="button">继续购物</a></li>
                <li class="clear"><a href="ShopCarServlet?method=clearshopcar&userid=<%=userid%>" role="button">清空购物车</a></li>
                <li class="pay"><a href="pay.jsp?money=<%=totalmoney%>&userid=<%=userid%>" role="button">结账</a></li>
            </ul>
        </div>
    </div>
    <div class="banquan">
        <p>&copy; 2020 <EStore>ShuMa</ShuMa> Company, Inc.</p>
    </div>
</div>
</body>
</html>

