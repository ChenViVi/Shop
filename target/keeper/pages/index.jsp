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
          window.setInterval("change_banner()",5000);
          function change_banner() {
              $('.carousel').carousel('next');
          }
          $(document).ready(function() {
              $(".button-collapse").sideNav();
              $('.carousel').carousel();
              $('.carousel.carousel-slider').carousel({full_width: true});

          });

      </script>
  </head>
  <body>
  <nav class="nav-extended pink accent-1">
      <div class="nav-wrapper">
          <a href="#" class="brand-logo center">ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
          <ul class="side-nav" id="mobile-demo" style="transform: translateX(-100%);">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
              <a class="waves-effect waves-light btn pink darken-1" href="/admin/music" target="_blank">管理</a>
          </ul>
      </div>
  </nav>
  <div class="carousel carousel-slider">
    <c:forEach items="${bannerList}" var="banner">
      <a class="carousel-item"><img src="${banner.url}"></a>

    </c:forEach>
  </div>
  <div class="card" style="margin-top: 20px;margin-left: 20px;margin-right: 20px;">
      <div class="card-content">
          <span class="card-title">纪念品推荐</span>
          <div class="row">
              <c:forEach items="${itemList}" var="item">
                  <div class="book-item col s6 m3 l2">
                      <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" width=200px height=200px src="${item.cover}">
                          </div>
                          <div class="card-content">
                              <span class="card-title truncate activator pink-text text-accent-1">${item.name}</span>
                              <p>￥${item.price}
                                  <a class="external-link right pink-text text-accent-1" href="/item/${item.id}">
                                      <i class="material-icons right">fast_forward</i>
                                  </a>
                              </p>
                          </div>
                          <div class="card-reveal">
                              <span class="card-title pink-text text-accent-1"><i class="material-icons right">close</i></span>
                              <p>${item.detail}</p>
                          </div>
                      </div>
                  </div>
              </c:forEach>
          </div>
      </div>
      <div class="card-action">
          <a href="/items" class="pink-text text-accent-1 valign right">查看更多</a>
      </div>
  </div>
  <div class="card" style="margin-top: 20px;margin-left: 20px;margin-right: 20px;">
      <div class="card-content">
          <span class="card-title">旅游资讯推荐</span>
          <ul class="collapsible" data-collapsible="accordion" style="margin:20px">
              <c:forEach items="${articleList}" var="article">
                  <li class="z-depth-1">
                      <div class="collapsible-header">${article.title}</div>
                      <div class="collapsible-body">${article.content}</div>
                  </li>
              </c:forEach>
          </ul>
      </div>
      <div class="card-action">
          <a href="/article" class="pink-text text-accent-1 valign right">查看更多</a>
      </div>
  </div>
  </body>
</html>
