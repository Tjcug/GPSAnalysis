
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
  </head>
  
  <body>
   <form action="/fullScan" method="post">
       <div class="form-group">
           <label for="name">选择你要分析的数据文件</label>
               <select name="filename" class="form-control">
                   <#list filenames as name>
                       <option value ="${name}">${name}</option>
                   </#list>
               </select>
                <input type="submit" class="btn btn-primary" value="分析数据">
           <div>
   </form>

   <div class="alert alert-warning alert-dismissible" role="alert">
       <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <strong>${message!}</strong>
   </div>
  </body>
</html>
