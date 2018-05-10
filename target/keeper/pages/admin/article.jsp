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
  </nav>
  <form class="add">
      <div id="modal-add" class="modal">
          <div class="modal-content">
              <h4>添加资讯</h4>
              <div class="input-field">
                  <input name="title" id="title" type="text" class="validate" autocomplete="off">
                  <label for="title">标题</label>
              </div>
              <div class="input-field">
                  <input name="content" id="content" type="text" class="validate" autocomplete="off">
                  <label for="content">内容</label>
              </div>
          </div>
          <div class="modal-footer">
              <a id="btn-add" class="modal-action modal-close waves-effect btn-flat">添加</a>
              <a class="modal-action modal-close waves-effect btn-flat">取消</a>
          </div>
      </div>
  </form>
  <form class="update">
      <div id="modal-update" class="modal">
          <div class="modal-content">
              <h4>修改资讯</h4>
              <input type="hidden" id="id-update" name="id"/>
              <div class="input-field">
                  <input name="title" id="title-update" type="text" class="validate" autocomplete="off">
                  <label for="title-update">标题</label>
              </div>
              <div class="input-field">
                  <input name="content" id="content-update" type="text" class="validate" autocomplete="off">
                  <label for="content-update">内容</label>
              </div>
          </div>
          <div class="modal-footer">
              <a id="btn-update" class="modal-action modal-close waves-effect btn-flat">修改</a>
              <a class="modal-action modal-close waves-effect btn-flat">取消</a>
          </div>
      </div>
  </form>
  <a href="#modal-add"  type="button" class="btn blue" style="margin: 20px">添加</a>
  <div class="row">
      <c:forEach items="${articleList}" var="article">
          <div class="card col s12" style="margin: 20px">
              <div class="card-content">
                  <span class="card-title">${article.title}</span>
                  <p>${article.content}</p>
              </div>
              <div class="card-action">
                  <a href="#" class="btn-update" data-id="${article.id}" data-title="${article.title}" data-content="${article.content}">编辑</a>
                  <a href="/admin/article/delete/${article.id}">删除</a>
              </div>
          </div>
    </c:forEach>
  </div>
  </body>
</html>
