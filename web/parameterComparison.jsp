<%@ page import="dao.Dao" %>
<%@ page import="dao.Daolmpl" %>
<%@ page import="data.Parameter" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/5
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="//misc.360buyimg.com/jdf/1.0.0/unit/??ui-base/1.0.0/ui-base.css,shortcut/2.0.0/shortcut.css,global-header/1.0.0/global-header.css,myjd/2.0.0/myjd.css,nav/2.0.0/nav.css,shoppingcart/2.0.0/shoppingcart.css,global-footer/1.0.0/global-footer.css,service/1.0.0/service.css" />
    <script type="text/javascript">
        window.pageConfig = {
            compatible: true,
            jdfVersion: '2.0.0'
        };
    </script>
    <script type="text/javascript" src="//misc.360buyimg.com/jdf/1.0.0/unit/base/1.0.0/base.js"></script>
    <link type="text/css" rel="stylesheet" href="//misc.360buyimg.com/product/compare/0.0.1/css/widget.css" source="widget" />

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Parameter parameter = (Parameter) session.getAttribute("parameter");
    if (request.getParameter("delete1")!=null){
        session.removeAttribute("parameter");
        parameter = null;
    }
    int price = 0;
    int shopid = 1;
    String brand = "待添加";
    String name = "待添加";
    String ptime = "待添加";
    String weight = "待添加";
    String nc = "待添加";
    String dcrl = "待添加";
    String psize = "待添加";
    String Resolving = "待添加";
    String url = "./img/czsm.png";
    if (parameter!=null){
         price = parameter.getPrice();
         shopid = parameter.getShoppingid();
         brand = parameter.getBrand();
         name = parameter.getName();
         ptime = parameter.getTime();
         weight = parameter.getWight();
         nc = parameter.getNc();
         dcrl = parameter.getBattery();
         psize = parameter.getSize();
         url = parameter.getUrl();
         Resolving = parameter.getResolving();
    }

    Parameter parameter2 = (Parameter) session.getAttribute("parameter2");
    if (request.getParameter("delete2")!=null){
        session.removeAttribute("parameter2");
        parameter2 = null;
    }
    int price2 = 0;
    int shopid2 = 1;
    String brand2 = "待添加";
    String name2 = "待添加";
    String ptime2 = "待添加";
    String weight2 = "待添加";
    String nc2 = "待添加";
    String dcrl2 = "待添加";
    String psize2 = "待添加";
    String Resolving2 = "待添加";
    String url2 = "./img/czsm.png";
    if (parameter2!=null){
        price2 = parameter2.getPrice();
        shopid2 = parameter2.getShoppingid();
        brand2 = parameter2.getBrand();
        name2 = parameter2.getName();
        ptime2 = parameter2.getTime();
        weight2 = parameter2.getWight();
        nc2 = parameter2.getNc();
        dcrl2 = parameter2.getBattery();
        psize2 = parameter2.getSize();
        url2 = parameter2.getUrl();
        Resolving2 = parameter2.getResolving();
    }

%>

<!-- main -->
<div id="container" class="compare-cont">
    <div class="w">
        <div><a href="show.jsp">返回</a> </div>
        <div class="compare-main">
            <div class="compare-goods">
                <table class="compare-table1">
                    <colgroup>
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>
                            <div class="goods-item">
                                <div class="p-img" >
                                    <a>
                                        <img src="<%=url%>" width="120px" height="170px">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="#">
                                        <%=name%>
                                    </a>
                                </div>
                                <div class="p-btnbox">
                                    <% if (session.getAttribute("parameter") != null) {%>
                                    <a href="detail.jsp?sid=<%=shopid%>" class="btn-primary">立即查看</a>
                                    <a href="parameterComparison.jsp?delete1=delete" class="btn-primary">删除</a>
                                    <%} else {%>
                                    <a href="show.jsp" class="btn-primary">添加对比商品</a>
                                    <%}%>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="goods-item">
                                <div class="p-img">
                                    <a href="#">
                                        <img src="<%=url2%>" width="120px" height="170px">
                                    </a>
                                </div>
                                <div class="p-name" >
                                    <a href="#">
                                        <%=name2%>
                                    </a>
                                </div>
                                <div class="p-btnbox">
                                    <% if (session.getAttribute("parameter2") != null) {%>
                                    <a href="detail.jsp?sid=<%=shopid2%>" class="btn-primary">立即查看</a>
                                    <a href="parameterComparison.jsp?delete2=delete" class="btn-primary">删除</a>
                                    <%} else {%>
                                    <a href="show.jsp" class="btn-primary">添加对比商品</a>
                                    <%}%>
                                </div>
                            </div>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <table class="compare-table2" id="compareResult">
                <tbody>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">品牌<div>
                    </th>
                    <td>
                        <div class='tb-text'><%=brand%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=brand2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">名称</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=name%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=name2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">价格</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=price%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=price2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">上市时间</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=ptime%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=ptime2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">机身重量</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=weight%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=weight2%></div>
                    </td>

                </tr>
                </tbody>
                <tbody class="tab-category J-tab-compare">
                <tr class="tr-category">
                    <th colspan="3">
                        <h5 class="tb-subtit"><i class="i-fold"></i><em>存储参数</em></h5>
                    </th>
                </tr>

                <tr class="tr-item">
                    <th>
                        <div class="tb-title">手机内存</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=nc%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=nc2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">电池容量</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=dcrl%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=dcrl2%></div>
                    </td>

                </tr>
                </tbody>
                <tbody class="tab-category J-tab-compare">
                <tr class="tr-category">
                    <th colspan="3">
                        <h5 class="tb-subtit"><i class="i-fold"></i><em>屏幕参数</em></h5>
                    </th>
                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">屏幕分辨率</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=Resolving%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=Resolving2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">主屏幕尺寸（英寸）</div>
                    </th>
                    <td>
                        <div class='tb-text'><%=psize%></div>
                    </td>
                    <td>
                        <div class='tb-text'><%=psize2%></div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">屏幕类型</div>
                    </th>
                    <td>
                        <div class='tb-text'>触摸屏</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>

                </tbody>
                <tbody class="tab-category J-tab-compare">
                <tr class="tr-category">
                    <th colspan="3">
                        <h5 class="tb-subtit"><i class="i-fold"></i><em>电源参数</em></h5>
                    </th>
                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">充电功率</div>
                    </th>
                    <td>
                        <div class='tb-text'>支持</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">电池续航时间</div>
                    </th>
                    <td>
                        <div class='tb-text'>约 135 分钟（在 1080p/30fps 分辨率模式下，关闭 RockSteady 时测得）， 约 63 分钟（在 4K/60fps（16：9） 分辨率模式下，开启
                            RockSteady 时测得）</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                </tbody>


                <tbody class="tab-category J-tab-compare">
                <tr class="tr-category">
                    <th colspan="3">
                        <h5 class="tb-subtit"><i class="i-fold"></i><em>基本信息</em></h5>
                    </th>
                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">上市时间</div>
                    </th>
                    <td>
                        <div class='tb-text'>2020年9月17日</div>
                    </td>
                    <td>
                        <div class='tb-text'>2019年5月</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">品牌</div>
                    </th>
                    <td>
                        <div class='tb-text'>Gopro</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">语言</div>
                    </th>
                    <td>
                        <div class='tb-text'>中文；英文</div>
                    </td>
                    <td>
                        <div class='tb-text'>中文；英文</div>
                    </td>


                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">用途</div>
                    </th>
                    <td>
                        <div class='tb-text'>运动相机</div>
                    </td>
                    <td>
                        <div class='tb-text'>运动相机</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">颜色</div>
                    </th>
                    <td>
                        <div class='tb-text'>黑色</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">型号</div>
                    </th>
                    <td>
                        <div class='tb-text'>HERO9</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">操作方式</div>
                    </th>
                    <td>
                        <div class='tb-text'>APP；远程控制；按键操作；触摸控制；语音操控；其他</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">商品产地</div>
                    </th>
                    <td>
                        <div class='tb-text'>中国大陆</div>
                    </td>
                    <td>
                        <div class='tb-text'>中国</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">类型</div>
                    </th>
                    <td>
                        <div class='tb-text'>运动相机</div>
                    </td>
                    <td>
                        <div class='tb-text'>运动相机</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">系统支撑</div>
                    </th>
                    <td>
                        <div class='tb-text'>其他</div>
                    </td>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">使用环境温度</div>
                    </th>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>
                    <td>
                        <div class='tb-text'>-10° C 至 40° C</div>
                    </td>

                </tr>
                <tr class="tr-item">
                    <th>
                        <div class="tb-title">防水等级|防水保护功能的级别</div>
                    </th>
                    <td>
                        <div class='tb-text'>--</div>
                    </td>
                    <td>
                        <div class='tb-text'>转入保护壳可潜水40米</div>
                    </td>

                </tr>
                </tbody>
            </table>
</body>
</html>

