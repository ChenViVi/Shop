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
              $("#submit").click(function(){
                  var button = $(this);
                  button.attr("disabled",true);
                  button.attr("disabled","disabled");
                  $.ajax({
                      url:"update",
                      type:"get",
                      data:$("form").serialize(),
                      async:true,
                      dataType:'json',
                      success: function (response) {
                          Materialize.toast(response.msg, 3000);
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
          });
      </script>
  </head>
  <body>
  <nav class="nav-extended pink accent-1">
      <div class="nav-wrapper">
          <a href="#" class="brand-logo center">ViVi的杂货铺</a>
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul id="nav" class="left">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="/items">纪念品欣赏</a></li>
              <li><a href="/article">旅游资讯</a></li>
              <li><a href="/about">关于我们</a></li>
          </ul>
      </div>
  </nav>
  <form>
      <div class="input-field col s12">
          <textarea id="content" name="content" class="materialize-textarea">${about.content}</textarea>
          <label for="content">关于</label>
      </div>
      <button id="submit" class="waves-effect waves-light btn pink darken-1">提交</button>
  </form>
  </body>
</html>
