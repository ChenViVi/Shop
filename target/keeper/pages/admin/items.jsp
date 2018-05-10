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
          $(document).ready(function() {
              $('.modal').modal();
              $("#btn-add").click(function(){
                  var button = $(this);
                  button.attr("disabled",true);
                  button.attr("disabled","disabled");
                  $.ajax({
                      url:"add",
                      type:"get",
                      data:$("form.add").serialize(),
                      async:true,
                      dataType:'json',
                      success: function (response) {
                          if (response.code == 1) window.location.href = "/admin/article/";
                          else Materialize.toast(response.msg, 3000);
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
              $("#btn-update").click(function(){
                  var button = $(this);
                  button.attr("disabled",true);
                  button.attr("disabled","disabled");
                  $.ajax({
                      url:"update",
                      type:"get",
                      data:$("form.update").serialize(),
                      async:true,
                      dataType:'json',
                      success: function (response) {
                          if (response.code == 1) window.location.href = "/admin/article/";
                          else Materialize.toast(response.msg, 3000);
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
              $(".btn-update").click(function(){
                  $("#id-update").val($(this).attr("data-id"));
                  $("#title-update").val($(this).attr("data-title"));
                  $("#content-update").val($(this).attr("data-content"));
                  Materialize.updateTextFields();
                  $("#modal-update").modal('open');
              });
          });
      </script>
  </head>
  <body>
  <nav class="nav-extended pink accent-1">
      <div class="nav-wrapper">
          <a href="#" class="brand-logo center">ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav" class="left">
              <li><a href="/">首页</a></li>
              <li><a href="items">纪念品欣赏</a></li>
              <li class="active"><a href="/admin/article/">旅游资讯</a></li>
              <li><a href="/admin/about/">关于我们</a></li>
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
  <form class="add">
      <div id="modal-add" class="modal">
          <div class="modal-content">
              <h4>添加纪念品</h4>
              <div class="input-field">
                  <input name="name" id="name" type="text" class="validate" autocomplete="off">
                  <label for="name">名称</label>
              </div>
              <div class="input-field">
                  <input name="detail" id="detail" type="text" class="validate" autocomplete="off">
                  <label for="detail">详细信息</label>
              </div>
              <div class="input-field">
                  <input name="price" id="price" type="number" class="validate" autocomplete="off">
                  <label for="price">价格</label>
              </div>
              <div class="file-field input-field">
                  <div class="btn">
                      <span>图片</span>
                      <input type="file">
                  </div>
                  <div class="file-path-wrapper">
                      <input class="file-path validate" type="text">
                  </div>
              </div>
          </div>
          <div class="modal-footer">
              <a id="btn-add" class="modal-action modal-close waves-effect btn-flat">添加</a>
              <a class="modal-action modal-close waves-effect btn-flat">取消</a>
          </div>
      </div>
  </form>
  <a href="#modal-add"  type="button" class="btn blue" style="margin: 20px">添加</a>
  <c:forEach items="${typeList}" var="type">
      <div id="${type.id}" class="row" style="margin-top: 20px; display: block;">
          <c:forEach items="${itemList}" var="item">
              <c:if test="${item.type.id.equals(type.id)}">
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
                          <div class="card-action">
                              <a href="#" class="btn-update" data-id="${item.id}">编辑</a>
                              <a href="/admin/items/delete/${item.id}">删除</a>
                          </div>
                      </div>
                  </div>
              </c:if>
          </c:forEach>
      </div>
  </c:forEach>
  </div>
  </body>
</html>
