<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/6
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
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
        div.container{
            width: 580px;
            margin: 10px auto;
            text-align: center;
        }
        label.title{
            font-size: 20px;
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

        p{
            text-align: center;
        }
        .mar{
            margin-top: 150px;
        }
    </style>
</head>
<body>
<%if (request.getAttribute("erron")!=null){%>
<script type="text/javascript" language="javascript">
    alert("<%=request.getAttribute("erron")%>");
</script>
<%}%>
<%
    request.setCharacterEncoding("UTF-8");
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
<div class="container" >
    <form class="form-signin" action="PayServlet?money=<%=request.getParameter("money")%>&userid=<%=request.getParameter("userid")%>" method="post" style="width:550px;margin:0 auto;">
        <h1 class="mar">您一共需要支付<%=request.getParameter("money")%>元，请使用银行卡完成支付！</h1>
        <label  class="title">信用卡账号</label>
        <input type="text" name="accountId" class="form-control" style="margin-top:10px;margin-bottom: 20px;border-radius: 8px;height: 20px;" placeholder="信用卡账号" required=""><br>
        <label class="title">信用卡密码</label>
        <input type="password" name="password" class="form-control"style="border-radius: 8px;height: 20px;" placeholder="信用卡密码" required=""><br>

        <button class="" type="submit" style="margin:20px auto;background-color:deepskyblue;width: 150px;height: 40px;border-radius: 10px;">确认支付</button>
    </form>
</div>
<hr color="#DCDCDC">
<div class="banquan">
    <p>&copy; 2020 <EStore>ShuMa</ShuMa> Company, Inc. </p>
</div>
</body>
</html>
