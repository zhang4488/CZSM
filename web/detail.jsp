<%@ page import="data.Detail" %>
<%@ page import="dao.Dao" %>
<%@ page import="dao.Daolmpl" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/3
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品详情 </title>
    <style type="text/css">
        .first{
            text-decoration: none;
            color: sandybrown;
        }
    </style>
</head>
<body>
<%
//    Detail detail = ((Detail) request.getAttribute("detail"));
    String sid = request.getParameter("sid");
    int id = Integer.parseInt(sid);
    System.out.println(id);
    Dao dao = new Daolmpl();
    Detail detail = dao.getdetail(id);
%>
<center>
    <div class="thumbnail">
        <img src="<%=detail.getUrl()%>" style="width:450px;height:400px;"/>
    </div>
    <div class="caption">
        <br><br>
        品牌：<%=detail.getBrand()%>
        <br><br>
        型号: <%=detail.getShopname()%>
        <br><br>
        价格: ￥ <%=detail.getPrice()%>
        <br><br>
        发布时间: <%=detail.getPublictime()%>
        <br><br>
        商品备注: <%=detail.getTips()%>
        <br><br>

        <a href="show.jsp" class="first">继续购物</a>
    </div>

</center>

</body>
</html>