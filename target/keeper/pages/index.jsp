<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ViVi的杂货铺</title>
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <script type="text/javascript">
          window.setInterval("change_banner()",5000);
          function change_banner() {
              $('.carousel').carousel('next');
          }
          $(document).ready(function() {
              var nav =  $("#nav");
              var account = Cookies.get('account');
              if (account) {
                  nav.children().eq(4).remove();
                  nav.append("<li><a class='waves-effect waves-light btn pink darken-1'>个人中心</a></li>");
              }
              <c:if test="${login == -1}">
              Materialize.toast("密码错误", 3000);
              </c:if>
              <c:if test="${password == 1}">
              Materialize.toast("登录成功", 3000);
              </c:if>
              $('.modal').modal();
              $(".button-collapse").sideNav();
              $('.carousel').carousel();
              $('.carousel.carousel-slider').carousel({full_width: true});
              $("a.login-btn").click(function(){
                  var button = $(this);
                  button.attr("disabled",true);
                  button.attr("disabled","disabled");
                  $.ajax({
                      url:"user/login",
                      type:"get",
                      data:$("form.login").serialize(),
                      async:true,
                      dataType:'json',
                      success: function (response) {
                          Materialize.toast(response.msg, 3000);
                          if (response.code == 1){
                              Cookies.set('account', response.data, { expires: 1 });
                              nav.children().eq(4).remove();
                              nav.append("<li><a class='waves-effect waves-light btn pink darken-1'>个人中心</a></li>");
                              $("#login").modal('close');
                          }
                      },
                      error:function (jqXHR, textStatus, errorThrown) {
                          Materialize.toast("未知错误", 3000);
                      },
                      complete:function (jqXHR, textStatus, errorThrown) {
                          button.removeAttr("disabled");
                          button.attr("disabled",false);
                      }
                  });
              });
              $("a.register-btn").click(function(){
                  var button = $(this);
                  button.attr("disabled",true);
                  button.attr("disabled","disabled");
                  $.ajax({
                      url:"user/register",
                      type:"get",
                      data:$("form.login").serialize(),
                      async:true,
                      dataType:'json',
                      success: function (response) {
                          Materialize.toast(response.msg, 3000);
                          if (response.code == 1){
                              Cookies.set('account', response.data, { expires: 1 });
                              nav.children().eq(4).remove();
                              nav.append("<li><a class='waves-effect waves-light btn pink darken-1'>个人中心</a></li>");
                              $("#login").modal('close');
                          }
                      },
                      error:function (jqXHR, textStatus, errorThrown) {
                          Materialize.toast("未知错误", 3000);
                      },
                      complete:function (jqXHR, textStatus, errorThrown) {
                          button.removeAttr("disabled");
                          button.attr("disabled",false);
                      }
                  });
              });
              $("#logout-btn").click(function(){
                   Cookies.remove('account');
                   nav.children().eq(4).remove();
                   nav.append("<li id='login-li'><a class='waves-effect waves-light btn pink darken-1' href='#login'>登录</a></li>");
               });
          });
      </script>
  </head>
  <body>
  <ul id="dropdown1" class="dropdown-content">
      <li><a href="#logout" class="pink-text text-accent-1">注销</a></li>
  </ul>
  <nav class="nav-extended pink accent-1">
      <div class="nav-wrapper">
          <a href="#" class="brand-logo center">ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav" class="right hide-on-med-and-down">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
              <li id="login-li"><a class="waves-effect waves-light btn pink darken-1" href="#login">登录</a></li>
          </ul>
      </div>
  </nav>
  <form class="login">
      <div id="login" class="modal">
          <div class="modal-content">
              <h4>注册或登录</h4>
              <div class="input-field">
                  <input name="account" id="account" type="text" class="validate" autocomplete="off">
                  <label for="account">账号</label>
              </div>
              <div class="input-field">
                  <input name="password" id="password" type="password" class="validate" autocomplete="off">
                  <label for="password">密码</label>
              </div>
          </div>
          <div class="modal-footer">
              <a class="register-btn modal-action modal-close waves-effect btn-flat">注册</a>
              <a class="login-btn waves-effect btn-flat">登录</a>
          </div>
      </div>
  </form>
  <div id="logout" class="modal">
      <div class="modal-content">
          <h4>注销</h4>
          <p>你确定要注销吗？</p>
      </div>
      <div class="modal-footer">
          <a id="logout-btn" class="modal-action modal-close waves-effect btn-flat">确定</a>
          <a class="modal-action modal-close waves-effect btn-flat">取消</a>
      </div>
  </div>
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
          <a href="/items" class="pink-text text-accent-1">查看更多</a>
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
          <a href="/article" class="pink-text text-accent-1">查看更多</a>
      </div>
  </div>
  </body>
</html>
