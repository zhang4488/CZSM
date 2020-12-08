<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/11/30
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/11/30
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="index.css">
  <title>成职数码</title>
  <style>
    *{
      margin: 0;
      padding: 0;
    }
    .topBar{
      width: 100%;
      height: 40px;
      background: #E6E6E6;
      font-size: 15px;
    }
    .topBar-left{
      float: left;
      width: 150px;
      height: 40px;
      margin-left: 200px;
    }
    .topBar-left p{
      float: left;
      margin: 10px 20px;
      color: #A4A4A4;
    }
    .topBar-right{
      float: left;
      width: 550px;
      height: 40px;
      margin-left: 619px;
    }
    .topBar-right p{
      float: left;
      margin-top: 10px;
      color: #A4A4A4;
    }
    .topBar-right p a{
      color: #A4A4A4;
      text-decoration: none;
    }
    .topBar-right p a span{
      color: red;
    }
    .topBar-right p a:hover{
      color: red;
    }
    .logo{
      width: 180px;
      height: 55px;
      float: left;
      margin-top: 70px;
      margin-left: -1419px;
      border-radius: 10px;
    }
    .middle{
      width: 80%;
      height: 500px;
      float: left;
      margin: 120px 100px;
    }
    .fenlei{
      width: 250px;
      height: 100%;
    }
    .fenlei .title{
      width: 100%;
      height: 55px;
      background: #2b3251;
      color: #fff;
      font-size: 21px;
      font-weight: bold;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .content{
      width: 100%;
      height: 145px;
      margin-top: 10px;
    }
    .content img{
      float: left;
      margin-top: 15px;
      margin-left: 15px;
    }
    .content-title{
      font-size: 18px;
      float: left;
      margin-top: 15px;
      margin-left: 3px;
      cursor: pointer;
    }
    .content-title a{
      text-decoration: none;
      color: #000000;
    }
    .content-title:hover{
      color: red;
    }
    .content-text{
      width: 100%;
      height: 70px;
      border-bottom: 1px #E6E6E6 solid;
      float: left;
      margin-top: 10px;
      line-height: 25px;
      text-indent: 10px;
    }
    .content-text a{
      color: #A4A4A4;
      text-decoration: none;
    }
    .middle #lunbo{
      width: 1100px;
      height: 100%;
      float: left;
      margin-top: -500px;
      margin-left: 260px;
      overflow: hidden;
    }
    .middle #photo {
      width: 4400px;
      animation: switch 25s ease-out infinite;
    }
    .middle #photo img {
      float: left;
      width: 1100px;
      height: 500px;
    }
    @keyframes switch {
      0%, 22% {
        margin-left: 0;
      }
      32%, 44% {
        margin-left: -1100px;
      }
      54%, 66% {
        margin-left: -2200px;
      }
      76%, 100% {
        margin-left: -4400px;
      }
    }
  </style>
</head>
<body>
<div class="topBar">
  <div class="topBar-left">
    <p>首页</p>
    <p></p>
  </div>
  <div class="topBar-right">
    <p><a href="login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
    <p><a href="">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
    <p><a href="order.html">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
    <p><a href="">意见反馈</a>&nbsp;&nbsp;</p>
  </div>
  <div class="top">
    <div class="logo">
      <img src="img/pic5.png" alt="" width="250px" height="80px" style="border-radius: 10px;">
    </div>
  </div>
  <div class="middle">
    <div class="fenlei">
      <p class="title">数码分类</p>
      <div class="content">
        <img src="img/手机.png" alt="" width="25px">
        <p class="content-title"><a href="show.jsp">智能手机</a></p>
        <div class="content-text">
          <a href="#">大屏手机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">游戏手机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">手机背套</a>
          &nbsp;&nbsp;<a href="#">家居音箱</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">专业音频</a>
        </div>
      </div>
      <div class="content">
        <img src="img/watch.png" alt="" width="25px">
        <p class="content-title"><a href="show.html">智能手表</a></p>
        <div class="content-text">
          <a href="#">智能手环</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">智能手表</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">路由器</a>
          &nbsp;&nbsp;<a href="#">智能家居</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">VR眼镜</a>
        </div>
      </div>
      <div class="content">
        <img src="img/相机.png" alt="" width="25px">
        <p class="content-title"><a href="show.html">摄影摄像</a></p>
        <div class="content-text">
          <a href="#">微单相机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">专业单反</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">运动相机</a>
          &nbsp;&nbsp;<a href="#">摄像机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
          <a href="#">拍立得</a>
        </div>
      </div>
    </div>
    <div id="lunbo">
      <div id="photo">
        <img src="img/picic1.webp"/>
        <img src="img/picic2.webp"/>
        <img src="img/picic3.webp"/>
        <img src="img/picic4.webp"/>
      </div>
    </div>
  </div>
  <div class="fashion">

  </div>
</div>
</body>
</html>