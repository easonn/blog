<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login ITHOUGHT</title>
  <link rel="stylesheet" href="${ctx_path}/admin/css/style.css" type="text/css">
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>ithought' </h1>
      <form method="post" action="${ctx_path}/admin/">
        <p><input type="text" name="admin.name" value="" placeholder="Username"></p>
        <p><input type="password" name="admin.pass" value="" placeholder="Password"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>
  </section>
</body>
</html>
