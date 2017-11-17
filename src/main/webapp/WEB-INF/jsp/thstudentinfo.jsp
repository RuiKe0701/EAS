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
<style type="text/css">
    body{
        zoom:80%
    }

</style>
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
                        <span>我正在带的班级：
                            <c:forEach var="ct" items="${ct}">
                            &nbsp;&nbsp;<span style="background-color: #5cc0de;padding: 7px;border-radius:5px;color: white">${ct.classes.class_name}<input type="hidden" value="${ct.classes.class_id}"></span>
                            </c:forEach>
                        </span>
                    </div>
                    <div role="form" class="form-inline">
                        <div class="form-group">
                            <label for="exampleInputEmail2" class="sr-only">班级名</label>
                            <input type="number" id="th_class_id" placeholder="请输入班级名" id="exampleInputEmail2" class="form-control">
                            <button class="btn btn-primary " id="seletclassid" type="button" style="margin-top: 5px;background-color:#5db85d"><i class="fa fa-search"></i>&nbsp;&nbsp;<span class="bold">班级查询</span>
                            </button>
                        </div>
                        <div class="form-group">
                            <label  class="sr-only">密码</label>
                            <input type="text" placeholder="请输入学员名" id="stu_stuname" class="form-control">
                            <button class="btn btn-primary " id="seletstuname" type="button" style="margin-top: 5px;background-color:#5db85d"><i class="fa fa-search"></i>&nbsp;&nbsp;<span class="bold">姓名查询</span>
                            </button>
                        </div>

                        <div class="checkbox checkbox-success" style="zoom:135%">
                            <input id="zaixiao" type="checkbox" name="sturts" value="0" checked="checked" style="zoom:250%">
                            <label for="zaixiao">
                                在校
                            </label>
                        </div>
                        <div class="checkbox checkbox-info" style="zoom:130%">
                            <input id="lixao" type="checkbox" name="sturts" value="1" style="zoom:250%">
                            <label for="lixao">
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
                        <tbody id="showstu">
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
    //添加学生信息页面跳转
    function addstudent() {
        1.//根据iframe的id获取对象
        $("#addstudent").click(function () {
            parent.addstu();
        })
        //var i1 = window.frames['iframeId'];搜索
    }
    //单个展示学生信息页面跳转
    function showstudentinfo() {
        $(".showstudentinfo").click(function () {
            parent.showstu(1);
        })
    }
    //根据条件查询学生信息
    function selectByStudent(classname,stuname,status) {
        $.ajax({
            type: "post",
            url: "/thselecstudentbystu",
            data:{"classname":classname,"stuname":stuname,"sturts":status},
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                alert(data);
                $("#showstu").html("");
                var strs;
                $.each(data, function(i, item) {
                    alert(item.stu_name)
                    strs+="<tr class=\"gradeX\">\n" +
                        "                        <td>"+item.stu_name+"</td>\n" +
                        "                        <td>"+item.stu_no+"</td>\n" +
                        "                        <td>"+item.class_id+"</td>\n" +
                        "                        <th>"+item.stu_birthday+"</th>\n" +
                        "                        <td class=\"center\">"+item.stu_sex+"</td>\n" +
                        "                        <td class=\"center\">"+item.stu_phone+"</td>\n" +
                        "                        <td>"+item.stu_startday+"</td>\n" +
                        "                        <td class=\"center\">"+item.stu_parentphone+"</td>\n" +
                        "\n" +
                        "                        <td> <div class=\"btn-group open\">\n" +
                        "                        <button data-toggle=\"dropdown\" class=\"btn btn-warning btn-sm dropdown-toggle\" aria-expanded=\"false\">操作 <span class=\"caret\"></span>\n" +
                        "                        </button>\n" +
                        "                        <ul class=\"dropdown-menu\">\n" +
                        "                        <li> <input type=\"hidden\" value="+item.stu_id+"><a class=\"showstudentinfo\">查看详情</a>\n" +
                        "                        </li>\n" +
                        "                        <li><a href=\"buttons.html#\" class=\"font-bold\">修改</a>\n" +
                        "                        </li>\n" +
                        "                        <li class=\"divider\"></li>\n" +
                        "                        <li><a href=\"buttons.html#\">删除</a>\n" +
                        "                        </li>\n" +
                        "                        </ul>\n" +
                        "                        </div>\n" +
                        "                        </td>\n" +
                        "                        </tr>"
                })
                alert(strs)
                $("#showstu").append(strs);
                $("#an").click()
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        });
    }
    function selectByclassid() {
        $("#seletclassid").click(function () {
            var obj=document.getElementsByName('sturts');
            var s=[];
            for(var i=0; i<obj.length; i++){
                if(obj[i].checked){
                    s[i]=obj[i].value;
                } //如果选中，将value添加到变量s中
            }
            if(s.length==0){
                alert("请选择状态")
            }else {
                var sturts;
                if(s[0]!=null&&s[0]!=""&&s[1]!=null&&s[1]!=""){
                    sturts=-1;
                }else {
                    if (s[0] != null && s[0] != "") {
                        sturts = s[0]
                    } else if (s[1] != null && s[1] != "") {
                        sturts = s[1]
                    }
                }
                if(sturts!=null){
                    var classname=$("#th_class_id").val();
                    if(classname==null||classname==""){
                        alert("SORRY!请先输入班级名在进行查询！")
                    }else {
                        var stuname=null;
                        selectByStudent(classname,stuname,sturts);
                    }
                }
            }

        })
    }
    function selectBystuname() {
        $("#seletstuname").click(function () {
            var obj=document.getElementsByName('sturts');
            var s=[];
            for(var i=0; i<obj.length; i++){
                if(obj[i].checked){
                    s[i]=obj[i].value;
                } //如果选中，将value添加到变量s中
            }
            if(s.length==0){
                alert("请选择状态")
            }else {
                var sturts;
                if(s[0]!=null&&s[0]!=""&&s[1]!=null&&s[1]!=""){
                    sturts=-1;
                }else {
                    if (s[0]!= null && s[0] != "") {
                        sturts = s[0]
                    } else if (s[1] != null && s[1] != "") {
                        sturts = s[1]
                    }
                }
                if(sturts!=null){
                    var stuname=$("#stu_stuname").val();
                    if(stuname==null||stuname==""){
                        alert("SORRY!请先输入学员姓名在进行查询！")
                    }else {
                        var classname=null;
                        selectByStudent(classname,stuname,sturts);
                    }
                }
            }

        })
    }
    $(function () {
        showstudentinfo();
        selectBystuname();
        $("#an").click();
        selectByclassid();
        addstudent();
        selctByclassid();
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
