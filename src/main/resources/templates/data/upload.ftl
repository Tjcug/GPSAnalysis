
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My FTL starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <!-- 新 Bootstrap 核心 CSS 文件 -->
      <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
      <!-- Bootstrap 文件上传 CSS 文件-->
      <link rel="stylesheet" href="libs/bootstrap/css/fileinput.min.css">
      <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
      <script src="libs/jquery/jquery-2.0.0.min.js" charset="UTF-8"></script>

      <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
      <script src="libs/bootstrap/js/bootstrap.min.js"></script>
      <!-- 最新的 Bootstrap 文件上传 JavaScript 文件 -->
      <script src="libs/bootstrap/js/fileinput.min.js"></script>
      <!-- 最新的 Bootstrap 文件上传 JavaScript 文件 -->
      <script src="libs/bootstrap/js/locales/fileinputzh.js"></script>
  </head>
  
  <body>
  <form method="POST" enctype="multipart/form-data" action="/uploadFile">
      <h3>选择文件：</h3><br />
      <input id="uploadfile" type="file" name="file" class="file"><br />
      <#--<input type="submit" class="btn btn-primary" value="Upload"> Press here to data the file!-->
  </form>
  <div class="alert alert-warning alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <strong>${message!}</strong>
  </div>
  </body>

</html>
