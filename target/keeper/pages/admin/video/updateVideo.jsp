<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/18
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改视频</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<nav class="nav-extended pink accent-1">
    <div class="nav-wrapper">
        <a href="/admin/video" class="breadcrumb">&nbsp;&nbsp;视频</a>
        <a href="/admin/video/update/${video.id}" class="breadcrumb">修改</a>
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a class="dropdown-button" data-activates="music">音乐<i class="material-icons right">arrow_drop_down</i></a></li>
            <li class="active"><a class="dropdown-button" data-activates="video">视频<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" data-activates="article">文章<i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
        <ul id="music" class="dropdown-content">
            <li><a class="pink-text text-accent-1" href="/admin/music" >查看音乐</a></li>
            <li class="divider"></li>
            <li><a class="pink-text text-accent-1" href="/admin/musicType">查看分类</a></li>
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
    <form:form action="/admin/video/updateP" method="post" commandName="videoP" role="form">
        <div class="input-field col s4">
            <input type="text" class="form-control" id="name" name="name" placeholder="输入标题:" value="${video.name}"/>
            <label for="name">名称:</label>
        </div>
        <div class="input-field col s4">
            <label for="score">评分:</label>
            <input type="text" class="form-control" id="score" name="score" placeholder="输入评分:" value="${video.score}"/>
        </div>
        <div class="form-group col s4">
            <label for="type.id">分类:</label>
            <select class="browser-default" id="type.id" name="type.id">
                <c:forEach items="${typeList}" var="type">
                    <c:if test="${type.id==video.type.id}">
                        <option value="${type.id}" selected="selected">${type.name}</option>
                    </c:if>
                    <c:if test="${type.id!=video.type.id}">
                        <option value="${type.id}">${type.name}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="input-field col s6">
            <label for="cover">封面:</label>
            <input type="text" class="form-control" id="cover" name="cover" placeholder="输入封面:" value="${video.cover}"/>
        </div>
        <div class="input-field col s6">
            <label for="link">链接:</label>
            <input type="text" class="form-control" id="link" name="link" placeholder="输入链接:" value="${video.link}"/>
        </div>
        <div class="input-field col s12">
            <label for="comment">简评:</label>
            <textarea class="materialize-textarea" id="comment" name="comment" placeholder="输入简评">${video.comment}</textarea>
        </div>
        <input type="hidden" id="id" name="id" value="${video.id}"/>
        <div class="input-field col s12">
            <button type="submit" class="waves-effect waves-light btn pink darken-1">提交</button>
        </div>
    </form:form>

</div>
</body>
</html>
