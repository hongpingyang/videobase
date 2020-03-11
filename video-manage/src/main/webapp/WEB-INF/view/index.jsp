<%--
  Created by IntelliJ IDEA.
  User: wangwei
  Date: 2019/9/18
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>

<html>
<head>
    <%--引入bootstrap的css全局样式--%>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/fileinput.min.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/carousel.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/all.css" crossorigin="anonymous">
    <link href="${ctx}/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <%--引入jquery--%>
    <script src="${ctx}/jquery/jquery-1.12.4.min.js"></script>

    <script src="${ctx}/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${ctx}/plugins/piexif.js" type="text/javascript"></script>
    <script src="${ctx}/plugins/sortable.js" type="text/javascript"></script>
    <script src="${ctx}/js/fileinput.min.js"></script>
    <%--引入bootstrap的js插件--%>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/locales/fr.js" type="text/javascript"></script>
    <script src="${ctx}/locales/es.js" type="text/javascript"></script>
    <script src="${ctx}/fas/theme.js" type="text/javascript"></script>
    <script src="${ctx}/explorer-fas/theme.js" type="text/javascript"></script>
</head>
<body>
     <%--
		Bootstrap 提供了栅格系统，栅格系统用于通过一系列的行（row）与列（column）的组合来创建页面布局
		行（row）必须包含在类 .container，你的内容应当放置于“列（column）”内，并且，只有“列（column）”可以作为行（row）”的直接子元素
		系统会自动分为最多12列，栅格系统中的列是通过指定1到12的值来表示其跨越的范围
	--%>
     <div class="container">
    <%--第一行 标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>视频添加</h1>
        </div>
    </div>
    <%--第二行 增加 删除 按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-success" id="video_btn_add">新增</button>
            <button class="btn btn-danger" id="video_btn_del">删除</button>
        </div>
    </div>
    <%--第三行 表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>#</th>
                    <th>分类</th>
                    <th>标题</th>
                    <th>副标题</th>
                    <th>播放地址</th>
                    <th>图片</th>
                    <th>图片2</th>
                    <th>内容</th>
                    <th>创建时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="obj" items="${pageInfo.list}">
                    <tr>
                        <td>${obj.id}</td>
                        <td>${obj.categoryId}</td>
                        <td>${obj.title}</td>
                        <td>${obj.subTitle}</td>
                        <td>${obj.url}</td>
                        <td>${obj.pic}</td>
                        <td>${obj.pic2}</td>
                        <td>${obj.content}</td>
                        <td><fmt:formatDate value="${obj.created}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                        <td><fmt:formatDate value="${obj.updated}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                        <td>
                            <button class="btn btn-info btn-sm " onclick="edit()" >
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm delbtn">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--第四行 底部导航栏--%>
    <div class="row">
        <%--页面信息--%>
        <div class="col-md-6">
            当前第 <span class="label label-default">${pageInfo.pageNum}</span> 页，
            共 <span class="label label-default">${pageInfo.pages}</span> 页，
            共 <span class="label label-default">${pageInfo.total}</span> 条记录
        </div>
        <%--页面导航--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--当前页是第一页--%>
                    <c:if test="${pageInfo.isFirstPage == true}">
                        <li><a href="#">首页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.isFirstPage == false}">
                        <li><a href="${ctx}?pageNumber=1">首页</a></li>
                    </c:if>
                    <%--如果有上一页，则显示下一页符号，并设置跳转参数--%>
                    <c:if test="${pageInfo.hasPreviousPage == true}">
                        <li>
                            <a href="${ctx}?pageNumber=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--遍历导航页号--%>
                    <c:forEach var="num" items="${pageInfo.navigatepageNums}">
                        <%--遍历到当前页号，则不能点击，且高亮显示--%>
                        <c:if test="${pageInfo.pageNum == num}">
                            <li class="active"><a href="#">${num}</a></li>
                        </c:if>
                        <%--遍历到其他页号，则跳转查询相应页信息--%>
                        <c:if test="${pageInfo.pageNum != num}">
                            <li><a href="${ctx}?pageNumber=${num}">${num}</a></li>
                        </c:if>
                    </c:forEach>
                    <%--如果有下一页，则显示下一页符号，并设置跳转参数--%>
                    <c:if test="${pageInfo.hasNextPage == true}">
                        <li>
                            <a href="${ctx}?pageNumber=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--当前页是第最后一页--%>
                    <c:if test="${pageInfo.isLastPage == true}">
                        <li><a href="#">尾页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.isLastPage == false}">
                        <li><a href="${ctx}?pageNumber=${pageInfo.pages}">尾页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

     <!--引入添加按钮-->
     <jsp:include page="video-add.jsp"/>

<script>

    function edit() {

    }

    $(".delbtn").on('click', function(e) {
        var id = $(this).parent().parent().children().first().text();
        alert(id);
    });

</script>
</body>
</html>