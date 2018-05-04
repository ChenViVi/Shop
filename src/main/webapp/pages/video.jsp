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
          <a href="#" class="brand-logo">&nbsp;&nbsp;ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
              <li><a href="/">音乐</a></li>
              <li class="active"><a href="/video">视频</a></li>
              <li><a href="/article">文章</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
          <ul class="side-nav" id="mobile-demo" style="transform: translateX(-100%);">
              <li><a href="/">音乐</a></li>
              <li class="active"><a href="/video">视频</a></li>
              <li><a href="/article">文章</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
      </div>
      <div class="nav-content">
          <ul class="tabs pink accent-1">
              <c:forEach items="${typeList}" var="type">
                  <li class="tab"><a href="#${type.id}"  class="white-text">${type.name}</a></li>
              </c:forEach>
              <li class="indicator white" style="right: 186px; left: 68px;"></li>
          </ul>
      </div>
  </nav>

    <c:forEach items="${typeList}" var="type">
     <div id="${type.id}" class="row" style="margin-top: 20px; display: block;">
        <c:forEach items="${videoList}" var="video">
            <c:if test="${video.type.id.equals(type.id)}">
            <div class="book-item col s6 m3 l2">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" width=200px height=200px src="${video.cover}">
                    </div>
                    <div class="card-content">
                        <span class="card-title truncate activator pink-text text-accent-1">${video.name}</span>
                        <p>评分: ${video.score}
                            <a class="external-link right pink-text text-accent-1" href="${video.link}" target="_blank">
                                <i class="material-icons right">fast_forward</i>
                            </a>
                        </p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title pink-text text-accent-1">简评<i class="material-icons right">close</i></span>
                        <p>${video.comment}</p>
                    </div>
                </div>
            </div>
            </c:if>
        </c:forEach>
     </div>
    </c:forEach>
  </body>
</html>
