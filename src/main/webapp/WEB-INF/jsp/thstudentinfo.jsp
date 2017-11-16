<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 数据表格</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/chosen/chosen.css" rel="stylesheet">




    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-title">
                    <h5>学员信息<small>分类，查找</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_data_tables.html#">选项1</a>
                            </li>
                            <li><a href="table_data_tables.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>

                </div>

                <div class="ibox-title" style="border: 0px ">
                    <div>
                        <button class="btn btn-success " type="button"><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">批量导入</span>
                        </button>
                        <button id="addstudent" class="btn-primary btn" href="studentinfo.html" style="color: white"><i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold">添加学员</span></button>
                        <span>我正在带的班级：&nbsp;&nbsp;<span style="background-color: #5cc0de;padding: 7px;border-radius:5px;color: white">20170807</span>&nbsp;&nbsp;
                        <span style="background-color: #5cc0de;padding: 7px;border-radius:5px;color: white">20170807</span>&nbsp;&nbsp;
                        <span style="background-color: #5cc0de;padding: 7px;border-radius:5px;color: white">20170807</span></span>
                    </div>
                    <div role="form" class="form-inline">
                        <div class="form-group">
                            <label for="exampleInputEmail2" class="sr-only">用户名</label>
                            <input type="email" placeholder="请输入班级名" id="exampleInputEmail2" class="form-control">
                            <button class="btn btn-primary "  type="button" style="margin-top: 5px;background-color:#5db85d"><i class="fa fa-search"></i>&nbsp;&nbsp;<span class="bold">班级查询</span>
                            </button>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2" class="sr-only">密码</label>
                            <input type="password" placeholder="请输入学员名" id="exampleInputPassword2" class="form-control">
                            <button class="btn btn-primary " type="button" style="margin-top: 5px;background-color:#5db85d"><i class="fa fa-search"></i>&nbsp;&nbsp;<span class="bold">姓名查询</span>
                            </button>
                        </div>

                        <div class="checkbox checkbox-success">
                            <input id="checkbox3" type="checkbox">
                            <label for="checkbox4">
                                在校
                            </label>
                        </div>
                        <div class="checkbox checkbox-info">
                            <input id="checkbox4" type="checkbox">
                            <label for="checkbox4">
                                离校
                            </label>
                        </div>
                    </div>

                </div>

                <div class="ibox-content">

                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>

                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>班级</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>入学时间</th>

                            <th>父母电话</th>
                            <th>操作</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="stus" items="${stulist}">
                        <tr class="gradeX">
                            <td>${stus.stu_name}</td>
                            <td>${stus.stu_no}</td>
                            <td>${stus.class_id}</td>
                            <th>${stus.stu_birthday}</th>
                            <td class="center">${stus.stu_sex}</td>
                            <td class="center">${stus.stu_phone}</td>
                            <td>${stus.stu_startday}</td>
                            <td class="center">${stus.stu_parentphone}</td>

                            <td> <div class="btn-group open">
                                <button data-toggle="dropdown" class="btn btn-warning btn-sm dropdown-toggle" aria-expanded="false">操作 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li> <input type="hidden" value="${stus.stu_id}"><a class="showstudentinfo">查看详情</a>
                                    </li>
                                    <li><a href="buttons.html#" class="font-bold">修改</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="buttons.html#">删除</a>
                                    </li>
                                </ul>
                            </div>
                            </td>
                        </tr>
                        </c:forEach>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>班级</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>入学时间</th>

                            <th>父母电话</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                    <button style="display: none" value="ss" id="an"></button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.5"></script>

<script src="js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/hplus.min.js?v=4.0.0"></script>
<script type="text/javascript" src="js/contabs.min.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>

<script type="text/javascript">
    function addstudent() {
        1.//根据iframe的id获取对象
        $("#addstudent").click(function () {
            parent.addstu();
        })
        //var i1 = window.frames['iframeId'];搜索
    }
    function showstudentinfo() {
        $(".showstudentinfo").click(function () {
            parent.showstu(1);
        })
    }
    $(function () {
        showstudentinfo();
        $("#an").click();
        addstudent();
    })

</script>
<script>
    $(document).ready(function(){
        $(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{
            "callback":function(sValue,y){
                var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])}
            ,"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
</script>
</body>

</html>
