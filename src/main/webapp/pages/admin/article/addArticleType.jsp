<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/18
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加文章分类</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<nav class="nav-extended pink accent-1">
    <div class="nav-wrapper">
        <a href="/admin/articleType" class="breadcrumb">&nbsp;&nbsp;文章分类</a>
        <a href="/admin/articleType/add" class="breadcrumb">添加</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a class="dropdown-button" data-activates="music">音乐<i class="material-icons right">arrow_drop_down</i></a></li>
            <li class="active"><a class="dropdown-button" data-activates="video">视频<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" data-activates="article">文章<i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
        <ul id="music" class="dropdown-content">
            <li><a class="pink-text text-accent-1" href="/admin/music" >查看音乐</a></li>
            <li class="divider"></li>
            <li><a class="pink-text text-accent-1"href="/admin/musicType">查看分类</a></li>
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
    <form:form action="/admin/articleType/addP" method="post" commandName="type" role="form">
        <div class="input-field">
            <label for="name">分类名称:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="输入分类名称:"/>
        </div>
        <div class="input-field">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>
</body>
</html>
