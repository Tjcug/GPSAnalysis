
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

          <div class="btn-group" role="group" aria-label="...">
              <button id="startanalogy" type="button" class="btn btn-default">开始模拟</button>
              <button id="pauseanalogy" type="button" class="btn btn-info">暂停模拟</button>
              <button id="resetanalogy" type="button" class="btn btn-success">重置模拟</button>
          </div>

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
                  <span class="label label-success">PRN码（伪随机噪声码）</span><label id="gpgsvprn"></label><br/>
                  <span class="label label-default">卫星仰角</span><label id="gpgsvte"></label><br/>
                  <span class="label label-primary">卫星方位角</span><label id="gpgsvazimuth"></label><br/>
                  <span class="label label-info">信号信噪比</span><label id="gpgsvsnr"></label><br/>
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
          //给Date对象的prototype属性添加添加更多方法
          Date.prototype.Format = function (fmt) { //author: meizz
              var o = {
                  "M+": this.getMonth() + 1, //月份
                  "d+": this.getDate(), //日
                  "h+": this.getHours(), //小时
                  "m+": this.getMinutes(), //分
                  "s+": this.getSeconds(), //秒
                  "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                  "S": this.getMilliseconds() //毫秒
              };
              if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
              for (var k in o)
                  if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
              return fmt;
          }

          $(function(){
              var map = new BMap.Map("container");
              addControlMap(map,"武汉",12);

              /*------------------------------初始化地图元素----------------------------------------------*/
              ajax("/GPRMCList",{},"post",function(data){
                  var points=[];
                  for(var i=0;i<data.length;i++){
                      var GPRMC=data[i];
                      var point = new BMap.Point(GPRMC.longitude,GPRMC.latitude);
                      points.push(point);
                  }
                  var wrongline = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.7});   //创建折线
                  map.addOverlay(wrongline);   //增加折线

                  //由于百度地图坐标转换API限制，每秒钟只能进行十次坐标转换，所以这里需要进行每次转换十条记录
                  var total = 0; //总记录数
                  var groupCount = 0; //每次转十条
                  if (points.length % 10 > 0) {
                      groupCount = (points.length / 10) + 1;
                  }
                  else {
                      groupCount = (points.length / 10);
                  }
                  var changepoints=[];

                  for(var i=0;i<groupCount;i++) { //外层循环，有多少组十条
                      var pos = new Array();
                      for(var j=0;j<10;j++){ //内层循环，每组十条
                          if(total<points.length){ //不超过总记录数结束
                              var point = new BMap.Point(points[(i * 10) + j].lng,points[(i * 10) + j].lat);
                              pos.push(point);
                          }
                          total++;
                      }
                      //坐标转换完之后的回调函数
                      var translateCallback = function (data){
                          if(data.status === 0) {
                              //添加线路
                              changepoints.push(data.points);
                              console.info(changepoints);
                              var polyline = new BMap.Polyline(data.points, {strokeColor:"red", strokeWeight:2, strokeOpacity:0.7});   //创建折线
                              map.addOverlay(polyline);   //增加折线
                          }
                      }
                      //进行坐标转换
                      var convertor = new BMap.Convertor();
                      convertor.translate(pos, 1, 5, translateCallback);
                  }
              });
              /*------------------------------初始化地图元素----------------------------------------------*/


              var timer={};
              var p = new BMap.Point(116.404, 39.915);
              var marker = new BMap.Marker(p);  // 创建标注
              map.addOverlay(marker);               // 将标注添加到地图中
              marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

              $("#startanalogy").click(function(){
                  timer=setInterval(getData,1000*0.5);
                  alert("开始模拟");
              });
              $("#pauseanalogy").click(function(){
                  window.clearInterval(timer);
                  alert("暂停模拟");
              });
              $("#resetanalogy").click(function(){
                  ajax("/resetanalogy",{},"post",function(data){
                      alert("重置模拟");
                  });
              });

              //获取数据每隔1秒钟调用
              function getData(){
                  console.info("hello");
                  ajax("/scanLine",{},"post",function(data){
                      if(data.gprmc){
                          var gprmc=data.gprmc;
                          console.info(gprmc);
                          $("#gprmclocationstatus").text(" "+gprmc.locationstatus);
                          $("#gprmcdate").text(" "+gprmc.date);
                          $("#gprmcrate").text(" "+gprmc.rate);
                          $("#gprmcdirection").text(" "+gprmc.direction);
                          $("#gprmcmodeindication").text(" "+gprmc.modeindication);
                          $("#gprmclatitude").text(" "+gprmc.latitude);
                          $("#gprmclongitude").text(" "+gprmc.longitude);
                          $("#gprmclongitudearth").text(" "+gprmc.longitudearth);
                          $("#gprmclatitudearth").text(" "+gprmc.latitudearth);
                          var point = new BMap.Point(gprmc.longitude,gprmc.latitude);
                          //坐标转换完之后的回调函数
                          var translateCallback = function (data){
                              console.info(data);
                              if(data.status === 0) {
                                  console.info(data.points[0]);
                                  marker.setPosition(data.points[0]);
                              }
                          }
                          //进行坐标转换
                          setTimeout(function(){
                              var pointArr = [];
                              pointArr.push(point);
                              var convertor = new BMap.Convertor();
                              convertor.translate(pointArr, 1, 5, translateCallback)
                          }, 500);
                      }
                      if(data.gpgga){
                          var gpgga=data.gpgga;
                          $("#gpggalocationstatus").text(" "+gpgga.locationstatus);
                          var date = new Date(gpgga.date);
                          $("#gpggadate").text(" "+date.Format("hh:mm:ss"));
                          $("#gpggalatitude").text(" "+gpgga.latitude);
                          $("#gpggalongitude").text(" "+gpgga.longitude);
                          $("#gpggalongitudearth").text(" "+gpgga.longitudearth);
                          $("#gpggalatitudearth").text(" "+gpgga.latitudearth);
                          $("#gpggasatellitenum").text(" "+gpgga.satellitenum);
                          $("#gpggahdop").text(" "+gpgga.hdop);
                      }
                      if(data.gpgsv){
                          var gpgsv=data.gpgsv;
                          var gpgsvprn="";
                          var gpgsvte="";
                          var gpgsvazimuth="";
                          var gpgsvsnr="";
                          $("#gpgsvgsvtotal").text(" "+gpgsv.gsvtotal);
                          $("#gpgsvgsvnum").text(" "+gpgsv.gsvnum);
                          $("#gpgsvsatellitetotal").text(" "+gpgsv.satellitetotal);
                          for(var i=0;i<gpgsv.gpgsvSatelliteList.length;i++){
                              var GPGSVSatellite=gpgsv.gpgsvSatelliteList[i];
                              gpgsvprn+=GPGSVSatellite.prn+" ";
                              gpgsvte+=GPGSVSatellite.te+" ";
                              gpgsvazimuth+=GPGSVSatellite.azimuth+" ";
                              gpgsvsnr+=GPGSVSatellite.snr+" ";
                          }
                          $("#gpgsvprn").text(" "+gpgsvprn);
                          $("#gpgsvte").text(" "+gpgsvte);
                          $("#gpgsvazimuth").text(" "+gpgsvazimuth);
                          $("#gpgsvsnr").text(" "+gpgsvsnr);
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
