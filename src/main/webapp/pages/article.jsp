<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ViVi的杂货铺</title>
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <script type="text/javascript">
          $(document).ready(function() {
              $(".button-collapse").sideNav();
          });
      </script>
  </head>
  <body>
  <nav class="nav-extended pink accent-1">
      <div class="nav-wrapper">
          <a href="#" class="brand-logo center">ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
              <li><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li class="active"><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
          <ul class="side-nav" id="mobile-demo" style="transform: translateX(-100%);">
              <li><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li class="active"><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
      </div>
  </nav>
  <ul class="collapsible" data-collapsible="accordion" style="margin:20px">
      <c:forEach items="${videoList}" var="video">
          <li class="z-depth-1">
              <div class="collapsible-header">${video.title}</div>
              <div class="collapsible-body">
                      ${video.content}
              </div>
          </li>
      </c:forEach>
  </ul>
  </body>
</html>
