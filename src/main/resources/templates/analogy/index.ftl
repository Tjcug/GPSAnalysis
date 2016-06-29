
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My FTL starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

      <!-- 新 Bootstrap 核心 CSS 文件 -->
      <link rel="stylesheet" href="/libs/bootstrap/css/bootstrap.min.css">
      <!--新 Bootstrap时间选择器的 CSS 文件-->
      <link href="/libs/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

      <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
      <script src="/libs/jquery/jquery-2.0.0.min.js" charset="UTF-8"></script>

      <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
      <script src="/libs/bootstrap/js/bootstrap.min.js"></script>
     <#include "../public/maphead.ftl">
  </head>
  
  <body>


      <div class="col-md-5">
          <div class="panel panel-warning">
              <div class="panel-heading">GPRMC 基本GNSS信息，推荐定位信息</div>
              <div class="panel-body">
                  <span class="label label-primary">定位状态</span><label id="gprmclocationstatus"></label><br/>
                  <span class="label label-info">日期</span><label id="gprmcdate"></label><br/>
                  <span class="label label-danger">地面速率</span><label id="gprmcrate"></label><br/>
                  <span class="label label-info">地面航向</span><label id="gprmcdirection"></label><br/>
                  <span class="label label-default">模式指示</span><label id="gprmcmodeindication"></label><br/>
                  <span class="label label-success">纬度</span><label id="gprmclatitude"></label>&nbsp;<label id="gprmclatitudearth"></label><br/>
                  <span class="label label-info">经度</span><label id="gprmclongitude"></label>&nbsp;<label id="gprmclongitudearth"></label><br/>
              </div>
          </div>

          <div class="panel panel-success">
              <div class="panel-heading">
                  <h3 class="panel-title">GPGGA GPS定位信息</h3>
              </div>
              <div class="panel-body">
                  <span class="label label-primary">日期</span><label id="gpggadate"></label><br/>
                  <span class="label label-info">定位状态</span><label id="gpggalocationstatus"></label><br/>
                  <span class="label label-danger">正在使用解算位置的卫星数量</span><label id="gpggasatellitenum"></label><br/>
                  <span class="label label-info">HDOP水平精度因子</span><label id="gpggahdop"></label><br/>
                  <span class="label label-default">纬度</span><label id="gpggalatitude"></label>&nbsp;<label id="gpggalatitudearth"></label><br/>
                  <span class="label label-success">经度</span><label id="gpggalongitude"></label>&nbsp;<label id="gpggalongitudearth"></label><br/>
              </div>
          </div>

          <div class="panel panel-info">
              <div class="panel-heading">
                  <h3 class="panel-title">GPGSV 可见卫星信息</h3>
              </div>
              <div class="panel-body">
                  <span class="label label-primary">GSV总数</span><label id="gpgsvgsvtotal"></label><br/>
                  <span class="label label-info">GSV编号</span><label id="gpgsvgsvnum"></label><br/>
                  <span class="label label-danger">可见卫星总数</span><label id="gpgsvsatellitetotal"></label><br/>
              </div>
          </div>

          <div class="panel panel-danger">
              <div class="panel-heading">
                  <h3 class="panel-title">GPGSA 当前卫星信息</h3>
              </div>
              <div class="panel-body">
                  <span class="label label-primary">模式</span><label id="gpgsamodes"></label><br/>
                  <span class="label label-info">定位类型</span><label id="gpgsagpsype"></label><br/>
                  <span class="label label-success">正在用于解算位置的卫星号</span><label id="gpgsaprn"></label><br/>
                  <span class="label label-info">位置精度因子</span><label id="gpgsapdop"></label><br/>
                  <span class="label label-danger">水平精度因子</span><label id="gpgsahdop"></label><br/>
                  <span class="label label-info">垂直精度因子</span><label id="gpgsavdop"></label><br/>
              </div>
          </div>
      </div>

      <div class="col-md-7">
          <div id="container"
               style="width: 100%; height: 100%; overflow:hidden;">
          </div>
      </div>

      <script type="text/javascript">
          $(function(){
              var map = new BMap.Map("container");
              addControlMap(map,"武汉",12);

              ajax("/GPRMCList",{},"post",function(data){
                  var points=[];
                  for(var i=0;i<data.length;i++){
                      var GPRMC=data[i];
                      var point = new BMap.Point(GPRMC.longitude,GPRMC.latitude);
                      points.push(point);
                  }
                  //添加线路
                  var polyline = new BMap.Polyline(points, {strokeColor:"red", strokeWeight:2, strokeOpacity:0.7});   //创建折线
                  map.addOverlay(polyline);   //增加折线
              });

              var timer=setInterval(getData,1000*1);
              function getData(){
                  console.info("hello");
                  ajax("/scanLine",{},"post",function(data){
                      if(data.gprmc){
                          var gprmc=data.gprmc;
                          $("#gprmclocationstatus").text(" "+gprmc.locationstatus);
                          $("#gprmcdate").text(" "+gprmc.date);
                          $("#gprmcrate").text(" "+gprmc.rate);
                          $("#gprmcdirection").text(" "+gprmc.direction);
                          $("#gprmcmodeindication").text(" "+gprmc.modeindication);
                          $("#gprmclatitude").text(" "+gprmc.latitude);
                          $("#gprmclongitude").text(" "+gprmc.longitude);
                          $("#gprmclongitudearth").text(" "+gpgga.longitudearth);
                          $("#gprmclatitudearth").text(" "+gpgga.latitudearth);
                      }
                      if(data.gpgga){
                          var gpgga=data.gpgga;
                          $("#gpggalocationstatus").text(" "+gpgga.locationstatus);
                          $("#gpggadate").text(" "+gpgga.date);
                          $("#gpggalatitude").text(" "+gpgga.latitude);
                          $("#gpggalongitude").text(" "+gpgga.longitude);
                          $("#gpggalongitudearth").text(" "+gpgga.longitudearth);
                          $("#gpggalatitudearth").text(" "+gpgga.latitudearth);
                          $("#gpggasatellitenum").text(" "+gpgga.satellitenum);
                          $("#gpggahdop").text(" "+gpgga.hdop);
                      }
                      if(data.gpgsv){
                          var gpgsv=data.gpgsv;
                          $("#gpgsvgsvtotal").text(" "+gpgsv.gsvtotal);
                          $("#gpgsvgsvnum").text(" "+gpgsv.gsvnum);
                          $("#gpgsvsatellitetotal").text(" "+gpgsv.satellitetotal);
                      }
                      if(data.gpgsa){
                          var gpgsa=data.gpgsa;
                          $("#gpgsamodes").text(" "+gpgsa.modes);
                          $("#gpgsagpsype").text(" "+gpgsa.gpsype);
                          $("#gpgsaprn").text(" "+gpgsa.prn);
                          $("#gpgsapdop").text(" "+gpgsa.pdop);
                          $("#gpgsahdop").text(" "+gpgsa.hdop);
                          $("#gpgsavdop").text(" "+gpgsa.vdop);
                      }
                  });
                  //每隔4秒，读取一次.
                  //setTimeout('getData()', 2000);
              }
      });

      </script>
  </body>
</html>
