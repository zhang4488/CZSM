<%@ page import="dao.Dao" %>
<%@ page import="dao.Daolmpl" %>
<%@ page import="data.Show" %>
<%@ page import="java.util.List" %>
<%@ page import="data.User" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/11/30
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>小米商城</title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: #f5f5f5;
            min-width: 1400px;
        }
        a{
            text-decoration: none;
        }
        ul{
            list-style: none;
        }
        #main{
            background-color: #333333;
            height: 40px;
            width: 100%;
        }
        #main #main-content{
            width: 1226px;
            height: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #main #main-content >div{
            color: #ffffff;
        }
        #main #main-content .nav{
            list-style-type:none ;
            padding: 10px 0px;
            display: flex;
        }
        #main #main-content ul li{
            display: flex;
            justify-content: space-around;
            border-left: solid 1px rgb(176, 176, 176,0.3);
            padding: 0 6px;
        }
        #main #main-content ul li:nth-child(1){
            border: none;
        }
        #main #main-content ul li a{
            color:rgb(176, 176, 176);
            text-decoration: none;
            font-size: 12px;
        }
        #main #main-content ul li a:hover{
            color: #ffffff;
            cursor: pointer;
        }
        #contin{
            height: 120px;
            width: 100%;
            background-color: #fff;
            display: flex;
            justify-content: space-around;
            align-items: center;
            position: relative;
            transition: all 0.8s ease-in-out;
        }
        #contin ul {
            list-style: none;
            display: flex;
        }
        #contin ul li{
            justify-content: space-around;
            padding: 12px 0 0 15px;
        }
        #contin ul li a{
            color: #333333;
            font-size: 16px;
        }
        #contin form{
            width: 300px;
        }
        input{
            outline: none;
        }
        #contin form .form-row #name{
            width: 245px;
            height: 50px;
            border: solid 1px #e0e0e0;
            padding: 0 10px;
        }
        #contin form .form-row #search_text{
            position: absolute;
            width: 50px;
            height: 52px;
            background-color: #fff;
            border: solid 1px #e0e0e0;
            border-left: none;
            background-image: url(./img/pic5.png);
        }
        #contin ul li .contin-a:hover{
            color: #ff6700;
        }
        #contin .tubiao{
            overflow: hidden;
            width: 50px;
            height: 50px;
            margin-left: 80px;
            background-color: #FF6700;
        }
        #contin .tubiao img{
            width: 100px;
            height: 50px;
            transition: all 0.5s ease-in-out;
        }
        #contin .tubiao:hover img{
            transform: translateX(-50px);
        }
        #content{
            width: 80%;
            height: 70px;
            background-color: black;
            margin: 20px auto;
        }
        #content ul{
            display: flex;
            align-items: center;
        }
        #content ul li{
            width: 20%;
            text-align: center;
            line-height: 70px;
            color: #ffffff;
            justify-content: space-around;
            cursor: pointer;
        }
        #content_main{
            width: 101%;
            height: 400px;
            margin: 20px 0;
        }
        .select{
            display: none;
        }
        .action{
            background-color: #F1393A;
        }
        .select_content{
            float: left;
            display: flex;
            width: 32.3%;
            transition: all 0.4s ease-in-out;
            margin-right: 1%;
            margin-top: 10px;
        }
        .select_content .con_photo{
            width: 100%;
            height: 270px;
        }
        .select_content .se_con_text{
            width: 55%;
            height: 270px;
            background-color: #ffffff;
        }
        .select_content:hover{
            transform: translate(0px,-3px);
            box-shadow: 10px 10px 10px rgba(0,0,0,0.1);
        }
        .select_content .se_con_text p{
            font-size: 12px;
            margin: 2% 10%;
        }
        .select_content .se_con_text p:nth-child(1){
            margin-top: 10%;
        }
        .select_content .se_con_text p:nth-child(2){
            color: #BFBFBF;
        }
        .select_content .se_con_text p:nth-child(3){
            margin: 6% 10%;
            color: #F1393A;
            float: left;
        }
        .select_content .se_con_text p:nth-child(4){
            text-decoration: line-through;
            margin: 6% 0;
            float: left;
        }
        .select_content .se_con_text p:nth-child(5) {
            clear: both;
            padding: 1% 5%;
        }
        .select_content .se_con_text p:nth-child(5) a{
            background-color: #F1393A;
            padding: 2% 5%;
            color: #ffffff;
        }
        .service{
            width: 90%;
            height: 80%;
            margin: 3%;
            border-left: solid 1px #bfbfbf;
        }
        .service p:nth-child(1){
            font-size: 18px;
            color: #ff6700;
            text-align: center;
        }
        .service p:nth-child(2){
            font-size: 12px;
            color: #bfbfbf;
            text-align: center;
            margin: 1px 0;
        }
        .service p:nth-child(3){
            text-align: center;
            margin: 8px 0;
        }
        .service p:nth-child(3) a{
            color: #ff6700;
            border: solid 1px #ff6700;
            font-size: 14px;
            padding: 4px 15px;
        }
        .service p:nth-child(3) a:hover{
            color: #ffffff;
            background-color: #ff6700;
        }
        .service p:nth-child(4){
            color: #bfbfbf;
            text-align: center;
            transform: translate(-15%,0);
        }
        .search-panel{
            margin-left: 500px;
            margin-top: 100px;
        }
        .imgstyle{

        }

    </style>

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String typeerro = (String) request.getAttribute("typeerro");
%>
    <%if ( request.getAttribute("loginflag")!=null){%>
        <script type="text/javascript" language="javascript">
                alert("请先登录！");
        </script>
    <%}%>
    <%if (typeerro!=null){%>
        <script type="text/javascript" language="javascript">
            alert("请选择同类商品比较！");
        </script>
    <%}%>
    <%if (request.getAttribute("info")!=null){%>
        <script type="text/javascript" language="javascript">
            alert("<%=request.getAttribute("info")%>");
        </script>
    <%}%>

<%
    String name = request.getParameter("name");
    Dao dao = new Daolmpl();
    List<Show> shows = dao.getShopInfo();
    if (name!=null){
        List<Show> shows2 = dao.findshop(name);
        shows=shows2;
    }

    User user = ((User) session.getAttribute("user"));
    boolean login = false;
    if (user!=null){
        login = true;
        if (request.getParameter("out")!=null){
            login = false;
            session.removeAttribute("user");
        }
    }else {
        login = false;
    }

    String method = "para1";
    if (session.getAttribute("parameter")==null){
        method="para1";
    }else if (session.getAttribute("parameter")!=null){
        method="para2";
    }

    String yztype = (String) session.getAttribute("typeid");
    if (yztype==null){
        yztype="0";
    }

%>

<div id="main">
    <div id="main-content" onclick="alertVal()">
        <ul class="nav">
            <li><a href="index.jsp">成职数码</a></li>
            <li><a href="#">我的订单</a></li>
            <li><a href="parameterComparison.jsp">对比栏</a></li>
            <% if (session.getAttribute("user") != null) {%>
            <li><a href="MessageServlet?toboxuserid=<%=user.getId()%>&method=just&login=<%=login%>">意见反馈</a></li>
            <%} else {%>
            <li><a href="MessageServlet?method=just&login=<%=login%>">意见反馈</a></li>
            <%}%>
            <li><a href="#">金融</a></li>
            <li><a href="#">有品</a></li>
            <li><a href="#">小爱开放平台</a></li>
            <li><a href="#">企业团购</a></li>
            <li><a href="#">资质证照</a></li>
            <li><a href="#">协议规则</a></li>
            <li><a href="#">下载App</a></li>
            <li><a href="#">智能生活</a></li>
        </ul>
        <ul class="nav">
            <% if (session.getAttribute("user") != null) {%>
            当前用户：<%=user.getUsername()%>
            <li><a href="show.jsp?out=true">退出登录</a></li>
            <li><a href="register.jsp">注册</a></li>
            <li><a href="shopcar.jsp?userid=<%=user.getId()%>">购物车</a></li>
            <%} else {%>
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
            <li><a href="ShopCarServlet?method=add">购物车</a></li>
            <%}%>
        </ul>
    </div>
</div>
<div class="search-panel">
    <form action=show.jsp method=post>
        <input name="name" placeholder="请输入查询商品" style="border: #FF8C00 2px solid; height: 30px;" size="80">
        <button class="btn-search" type="submit"  style="height: 32px; width: 60px;">查询</button>
    </form>

</div>
<div id="content">
    <ul id="content_ul">
        <li class="action act">智能手机</li>
        <li class="act">专业相机</li>
        <li class="act">智能手表</li>
        <li class="act">手机配件</li>
        <li class="act">相机配件</li>
    </ul>
    <div id="content_main">
        <div class="select" style="display: block;">
            <%
                for (Show show : shows) {
            %>
            <%if (show.getStid()==1){%>
            <div class="select_content">
                <a href="detail.jsp?sid=<%=show.getSid()%>" id="imgstyle">
                <img src="<%=show.getUrl()%>" alt="#" class="con_photo">
                </a>
                <div class="se_con_text">
                    <p><%=show.getSname()%></p>
                    <p><%=show.getIntroduce()%></p>
                    <p><%=show.getNprice()+"元"%></p>
                    <p><%=show.getOprice()+"元"%></p>
                    <p><a href="ConstractServlet?method=<%=method%>&Pshopid=<%=show.getSid()%>&typeid=<%=show.getStid()%>&yztypeid2=<%=yztype%>">添加到对比篮</a></p>
                    <% if (session.getAttribute("user") != null) {%>
                    <a href="ShopCarServlet?method=add&userid=<%=user.getId()%>&shopid=<%=show.getSid()%>&shopurl=<%=show.getUrl()%>&shopprice=<%=show.getNprice()%>&shopname=<%=show.getSname()%>&login=<%=login%>"><p>加入购物车</p></a>
                    <%} else {%>
                    <a href="ShopCarServlet?method=add&shopid=<%=show.getSid()%>&shopurl=<%=show.getUrl()%>&shopprice=<%=show.getNprice()%>&shopname=<%=show.getSname()%>&login=<%=login%>"><p>加入购物车</p></a>
                    <%}%>
                </div>
            </div>
            <%}}%>
        </div>

        <div class="select" style="display: block;">
            <%
                for (Show show : shows) {
            %>
            <%if (show.getStid()==2){%>
            <div class="select_content">
                <a href="detail.jsp?sid=<%=show.getSid()%>" id="imgstyle">
                    <img src="<%=show.getUrl()%>" alt="#" class="con_photo">
                </a>
                <div class="se_con_text">
                    <p><%=show.getSname()%></p>
                    <p><%=show.getIntroduce()%></p>
                    <p><%=show.getNprice()+"元"%></p>
                    <p><%=show.getOprice()+"元"%></p>
                    <p><a href="ConstractServlet?method=<%=method%>&Pshopid=<%=show.getSid()%>&typeid=<%=show.getStid()%>&yztypeid2=<%=yztype%>">添加到对比篮</a></p>
                    <% if (session.getAttribute("user") != null) {%>
                    <a href="ShopCarServlet?method=add&userid=<%=user.getId()%>&shopid=<%=show.getSid()%>&shopurl=<%=show.getUrl()%>&shopprice=<%=show.getNprice()%>&shopname=<%=show.getSname()%>&login=<%=login%>"><p>加入购物车</p></a>
                    <%} else {%>
                    <a href="ShopCarServlet?method=add&shopid=<%=show.getSid()%>&shopurl=<%=show.getUrl()%>&shopprice=<%=show.getNprice()%>&shopname=<%=show.getSname()%>&login=<%=login%>"><p>加入购物车</p></a>
                    <%}%>
                </div>
            </div>
            <%}}%>
        </div>
        <div class="select" style="display: block;">
            <%
                for (Show show : shows) {
            %>
            <%if (show.getStid()==3){%>
            <div class="select_content">
                <img src="<%=show.getUrl()%>" alt="#" class="con_photo">
                <div class="se_con_text">
                    <p><%=show.getSname()%></p>
                    <p><%=show.getIntroduce()%></p>
                    <p><%=show.getNprice()+"元"%></p>
                    <p><%=show.getOprice()+"元"%></p>
                    <p>添加到对比篮</p>
                </div>
            </div>
            <%}}%>
        </div>
        <p class="select">4</p>
        <p class="select">5</p>
    </div>
</div>
</div>
<script >//点击切换
var mouse = document.querySelectorAll(".act");
var pb = document.querySelectorAll(".select");
for(var i=0; i<mouse.length; i++){
    mouse[i].setAttribute('index',i);//添加指定的属性，并为其赋指定的值。如果这个指定的属性已存在，则仅设置/更改值。
    mouse[i].onclick = function (){
        for(var i=0; i<mouse.length; i++){
            mouse[i].className = "";
        }
        this.className = "action";
        var index = this.getAttribute('index');
        for(var i = 0; i<pb.length; i++){
            pb[i].style.display = "none";
        }
        pb[index].style.display = "block";
    }
}
</script>
</body>
</html>