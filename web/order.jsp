<%@ page import="dao.Dao" %>
<%@ page import="dao.Daolmpl" %>
<%@ page import="data.Order" %>
<%@ page import="data.AddShopCar" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2020/12/7
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
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
            margin-left: 400px;
            margin-top: 25px;
        }
        div.search-panel{
            margin-left: 660px;
            margin-top: -40px;
            float: left;
        }
        div.content{
            height:180px;
            margin:30px 400px;
            width: 900px;
            border-bottom: orangered;
        }
        div.table tr td{
            vertical-align: middle;
            border: #DCDCDC 1px solid;
        }
        input.shopnum{
            text-align:center;
        }
        tr.title{
            background-color: #DCDCDC;
            text-align:center;
        }
        td.shopname{
            float: left;
        }
        div.soperate a{
            text-decoration: none;
            color:black;
        }
        div.soperate a:hover{
            text-decoration: none;
            color:red;
        }
        tr.title1{
            text-align:center;
            background-color: aliceblue;
        }
        tr.ordertime{
            text-align:center;
            background-color: aliceblue;
        }
        td.kefu a{
            text-decoration: none;
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
<%
    request.setCharacterEncoding("UTF-8");
    boolean login = Boolean.parseBoolean(request.getParameter("login"));
    if (!login){
        request.setAttribute("loginflag","ddd");
        request.getRequestDispatcher("show.jsp").forward(request,response);
    }
    String toorderuserid = request.getParameter("toorderuserid");
    int user = Integer.parseInt(toorderuserid);
    Dao dao = new Daolmpl();
    List<Order> orders = dao.getorder(user);
    System.out.println(orders);

%>
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
            <a href="#">我的订单</a>
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
<div class="search">
    <div class="logo">我的订单</div>
    <div class="search-panel">
        <input id="q" name="q" value="请输入订单号进行查询" style="border: #FF8C00 2px solid; height: 30px;" size="80">
        <button class="btn-search" type="submit"  style="height: 32px; width: 60px;">搜 索</button>
    </div>
</div>
<div class="content">
    <table class="table" width="900px">
        <tr class="title">
            <td>宝贝</td>
            <td>数量</td>
            <td>价格</td>
            <td>总金额</td>
            <td>收货人</td>
            <td>交易操作</td>
        </tr>
        <%
            for (Order order : orders) {
        %>
        <tr class="ordertime"  style="border-top:solid 1px #006393">
            <td colspan="2"><%=order.getOrdertome()%></td>
            <td colspan="2">订单号:<%=order.getOrderid()%></td>
            <td class="kefu" colspan="3"><a href="#">联系客服</a></td>
        </tr>

        <tr class="title1"  style="border-buttom:solid 1px #006393">
            <td>
                <img alt="图片" src="<%=order.getUrl()%>" style="width:140px;height:120px;border: gray 1px solid;">
                <div class="shopname">  <%=order.getShopname()%></div>
            </td>
            <td style="height:100px;line-height: 150px;">
                <input class="shopnum"  type="text" size="1" name="num" value="<%=order.getShopnum()%>" style="width:50px;height:20px;"/>
            </td>
            <td>￥ <b><%=order.getShopprice()%></b></td>
            <td>￥ <b><%=order.getShopprice()*order.getShopnum()%></b></td>
            <td><%=order.getRecever()%></td>
            <td>
                <div class="soperate">
                    <p><a href="#"><%=order.getAddress()%></a></p>
                </div>
            </td>
        </tr>
        <%}%>

    </table>
    </content>
    <div class="banquan">
        <p>&copy; 2020 <EStore>ShuMa</ShuMa> Company, Inc. </p>
    </div>
</div>
</body>
</html>
