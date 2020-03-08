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

        <link href="${ctx}/css/carousel.css" rel="stylesheet" type="text/css">
</head>
<body>


<div class="container" >

    <nav class="navbar navbar-default" role="navigation" >
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">H</a>
            </div>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </nav>

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


    <h3 class="hborder" style="padding-left: 10px;"> <span class="label label-success">综艺</span></h3>

    <div class="row">
        <div class="col-lg-3">
            <img src="${ctx}/images/zxc.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. Etiam porta sem malesuaam id dolor idvestibulum at eros. Praeus magna.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img  src="${ctx}/images/zxc1.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Duis mollis, est non commodo lttis consectetur rsus commodo, s condimentum nibh.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img  src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
        <div class="col-lg-3">
            <img  src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
    </div>

    <h3 class="hborder" style="padding-left: 10px;"> <span class="label label-success">电影</span></h3>

    <div class="row">
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/zxc.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. Etiam porta sem malesuaam id dolor idvestibulum at eros. Praeus magna.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/zxc1.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Duis mollis, est non commodo lttis consectetur rsus commodo, s condimentum nibh.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
    </div>

    <h3 class="hborder" style="padding-left: 10px;"> <span class="label label-success">电视剧</span></h3>

    <div class="row">
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/zxc.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. Etiam porta sem malesuaam id dolor idvestibulum at eros. Praeus magna.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/zxc1.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Duis mollis, est non commodo lttis consectetur rsus commodo, s condimentum nibh.</p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
        <div class="col-lg-3">
            <img class="img-rounded" src="${ctx}/images/linux-command.jpg" alt="Generic placeholder image" width="260" height="140">
            <p>Donec sed odio dui. risus.</p>
        </div>
    </div>


</div>
<%--引入jquery--%>
<script src="${ctx}/jquery/jquery-1.12.4.min.js"></script>
<%--引入bootstrap的js插件--%>
<script src="${ctx}/js/bootstrap.min.js"></script>
</body>
</html>
