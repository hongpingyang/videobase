<%--
  Created by IntelliJ IDEA.
  User: hongpy21691
  Date: 2020-03-07
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>

<html>
<head>

    <%--引入bootstrap的css全局样式--%>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container" >
    <!--轮播-->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2200">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- 轮播内容容器 -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${ctx}/images/zxc.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="${ctx}/images/zxc1.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <img src="${ctx}/images/linux-command.jpg" alt="...">
                <div class="carousel-caption">
                    ...
                </div>
            </div>
        </div>

        <!-- Controls控制切换 -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


</div>
<%--引入jquery--%>
<script src="${ctx}/jquery/jquery-1.12.4.min.js"></script>
<%--引入bootstrap的js插件--%>
<script src="${ctx}/js/bootstrap.min.js"></script>
</body>
</html>
