<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/6
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>反馈箱</title>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
        }
        div.big{
            margin: 50px auto;
            font-size: 55px;
            text-align: center;
            font-family: 隶书;
        }
        div.content{
            margin-left: 350px;
            height: 200px;
            width: 740px;
        }
        div.submit{
            margin-left:655px;
            width: 70px;
            float: left;
            margin-top: 110px;
        }
        div.button{
            width: 70px;
            float: left;
            margin-left:40px;
            margin-top: 110px;
        }
    </style>
</head>
<body>
<%if ( request.getAttribute("addflag")!=null){%>
    <script type="text/javascript" language="javascript">
        alert("<%=request.getAttribute("addflag")%>");
    </script>
<%}%>
    <div class="big">
        成职数码反馈箱
    </div>
    <form action="MessageServlet?method=add&user=<%=request.getAttribute("user")%>" method="post">
        <div class="content">
            <input name="textfield" type="text" size="125" style="height:270px;border-radius: 20px;">
        </div>
        <div class="submit">
            <input type="submit" name="submit" value="提交" style="height:40px;width: 90px;background-color: royalblue;border-radius: 10px;">
        </div>
        <div class="button">
            <a href="show.jsp"><input type="button"  value="返回" style="height:40px;width: 90px;background-color: royalblue;border-radius: 10px;"/></a>
        </div>
    </form>
</body>
</html>
