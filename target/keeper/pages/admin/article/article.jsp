<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/18
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>查看文章</title>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<nav class="nav-extended pink accent-1">
    <div class="nav-wrapper">
        <a href="/admin/article" class="breadcrumb">&nbsp;&nbsp;文章</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li> <a class="dropdown-button" data-activates="music">音乐<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" data-activates="video">视频<i class="material-icons right">arrow_drop_down</i></a></li>
            <li class="active"><a class="dropdown-button" data-activates="article">文章<i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
        <ul id="music" class="dropdown-content">
            <li><a class="pink-text text-accent-1" href="/admin/music" >音乐</a></li>
            <li class="divider"></li>
            <li><a class="pink-text text-accent-1" href="/admin/musicType">分类</a></li>
        </ul>
        <ul id="video" class="dropdown-content">
            <li><a class="pink-text text-accent-1" href="/admin/video" >视频</a></li>
            <li class="divider"></li>
            <li><a class="pink-text text-accent-1" href="/admin/videoType">分类</a></li>
        </ul>
        <ul id="article" class="dropdown-content">
            <li><a class="pink-text text-accent-1" href="/admin/article" >文章</a></li>
            <li class="divider"></li>
            <li><a class="pink-text text-accent-1" href="/admin/articleType">分类</a></li>
        </ul>
    </div>
</nav>
<div class="row" style="margin: 20px; display: block;">
    <a href="/admin/article/add" type="button" class="waves-effect waves-light btn pink darken-1" style="margin-bottom: 20px;">添加文章</a></h3>
    <c:if test="${!empty articleList}">
        <table class="table highlight">
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>分类</th>
            </tr>

            <c:forEach items="${articleList}" var="article">
                <tr>
                    <td>${article.id}</td>
                    <td>${article.title}</td>
                    <td>${article.type.name}</td>
                    <td>
                        <a href="/admin/article/update/${article.id}" type="button" class="btn btn-sm btn-success">修改</a>
                        <a href="/admin/article/delete/${article.id}" type="button" class="waves-effect waves-light btn red lighten-1">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>