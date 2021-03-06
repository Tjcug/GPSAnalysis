
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<#include "../public/managehead.ftl">

    <style type="text/css">
        #search {
            margin-top: 6;
        }
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            color:#666;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
    </style>

    <script type="text/javascript">
        $(function(){
            $('#dg').datagrid('load', {
            });

            $('#search').searchbox({
                searcher : function(value, name) {
                    $('#dg').datagrid('load', {
                    });
                },
                prompt : 'Please Input Value'
            });
        });


        var url;
        function newUser(){
            $('#dlg').dialog('open').dialog('setTitle','新建用户');
            $('#fm').form('clear');
            url = "/tuser/save";
        }

        function editUser(){
            var rows = $('#dg').datagrid('getSelections');
            if(rows.length!=1) {
                showInfoMessage("只能编辑一个用户");
            }else{
                var row=rows[0];
                $('#dlg').dialog('open').dialog('setTitle','编辑用户');
                $('#fm').form('load',row);
                url = '/updateUser?userId='+row.userId;
            }
        }

        function saveUser() {
            $('#fm').form('submit', {
                url: url,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.errorMsg) {
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');		// close the dialog
                        $('#dg').datagrid('reload');	// reload the user data
                    }
                }
            });
        }
        /**
         * 性别修改器
         * @param val 值
         * @param row 行
         */
        function sexformatter(val,row){
            if(val==0){
                return '<span style="color:red;">男生</span>';
            }else if(val==1){
                return '<span style="color:green;">女生</span>';
            }
        }

        function securityformatter(val,row){
            if(val==0){
                return '<span style="color:red;">普通用户</span>';
            }else if(val==1){
                return '<span style="color:green;">社团用户</span>';
            }else if(val==2){
                return '<span style="color:blue;">学校用户</span>';
            }
        }
        /**
         * 删除用户
         */
        function destroyUser() {
            var rows = $('#dg').datagrid('getSelections');
            if (rows.length != 1) {
                showInfoMessage("只能删除一个用户");
            } else {
                var row = rows[0];
                $.messager.confirm('提示信息', '你确定删除该用户吗？', function (r) {
                    if (r) {
                        $.post('/tuser/delete', {id: row.id}, function (result) {
                            if (result.success) {
                                //让所有选择的选项不选中
                                $('#dg').datagrid('uncheckAll');
                                $('#dg').datagrid('reload');    // 重新载入当前页面数据
                            } else {
                                $.messager.show({	// show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }

    </script>

</head>

<body>
<table id="dg" title="GPGGA 当前卫星信息 (一种偏差资讯，说明卫星定位资讯的优劣状态)" class="easyui-datagrid"
       url="/getGPGSAList"
       toolbar="#toolbar"
       pagination= true
       striped=true
       nowrap=true
       idField="id"
       rownumbers="true" fitColumns="true">

    <thead frozen="true">
    <tr>
        <th field="ck" checkbox="true"></th>
        <th field="id" width="50">ID</th>
    </tr>
    </thead>

    <thead>
    <tr>
        <th field="modes" width="50">模式</th>
        <th field="gpsype" width="50">定位类型</th>
        <th field="prn" width="100">PRN码（伪随机噪声码）</th>
        <th field="pdop" width="50">位置精度因子</th>
        <th field="hdop" width="50">水平精度因子</th>
        <th field="vdop" width="50">垂直精度因子</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
<#--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新建用户</a>-->
<#--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a>-->
<#--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>-->
    <input id="search">
</div>


</body>
</html>
