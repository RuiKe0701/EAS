<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Float-Admin</title>

    <!-- Common plugins -->
    <link href="table/css/bootstrap.min.css" rel="stylesheet">
    <link href="table/css/simple-line-icons.css" rel="stylesheet">
    <link href="table/css/font-awesome.min.css" rel="stylesheet">
    <link href="table/css/pace.css" rel="stylesheet">

    <link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">

    <!-- dataTables -->
    <link href="table/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--template css-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="table/js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="gray-bg" style="background-color: whitesmoke">



<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%;background-color: white">



    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row" >
        <div class="col-md-12" >
            <div class="panel panel-default" >
                <div class="panel-heading" style="padding-bottom: 2px">
                    <h5> 班级出勤记录查询</h5>
                </div>
                <div class="panel-heading" style="padding-left:0px;padding-right:0px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
                    <div class="col-md-12" style="border: 1px solid gainsboro;padding-bottom: 5px;">
                        <button id="ssssss"> ssss</button>


                    </div>
                </div>

                <div class="panel-heading" style="height: 30px;font-size: 2px">
                    &nbsp;
                </div>
                <div class="panel-body" id="tables">
                    </table>

                </div>
            </div>
        </div>
    </div><!--end row-->

    <!--end page content-->


    <!--Start footer-->

    <!--end footer-->

</section>
<!--end main content-->



<!--Common plugins-->
<script src="table/js/jquery.min.js"></script>
<script src="table/js/bootstrap.min.js"></script>
<script src="table/js/pace.min.js"></script><script src="table/js/jasny-bootstrap.min.js"></script>
<script src="table/js/jquery.slimscroll.min.js"></script>
<script src="table/js/jquery.nanoscroller.min.js"></script>
<script src="table/js/metismenu.min.js"></script>
<script src="table/js/float-custom.js"></script>

<!-- Datatables-->
<script src="table/js/jquery.datatables.min.js"></script>
<script src="table/js/datatables.responsive.min.js"></script>
<script>

    function  aa() {
        $(".ss").click(function () {
            var a=$(this).text()
            $("#banji").text(a);
        });
    }

    $(document).ready(function () {
        aa()
        $('#datatable').dataTable();
    });
</script>
<script type="text/javascript">
    //添加学生信息页面跳转
    function addstudent() {
        1.//根据iframe的id获取对象
        $("#addstudent").click(function () {
            window.location.href='/thaddstudent';
        })
        //var i1 = window.frames['iframeId'];搜索
    }
    //单个展示学生信息页面跳转
    function showstudentinfo() {
        $(".showstudentinfo").on("click",function(){
            alert("sds")
            parent.showstu(1);
        })
    }
    var str="<div class=\"ldivwai\">\n" +
        "                <table  class=\"ltable\">\n" +
        "                    <tr>\n" +
        "                        <td rowspan=\"6\" style=\"width:78px;height: 80px\">\n" +
        "                            <img src=\"ss/559.PNG\" style=\"margin-left:3px;margin-right:7px;width:70px;height: 70px;border-radius:50px;border: solid 3px #5db85d;\">\n" +
        "                        </td>\n" +
        "                    </tr>\n" +
        "                    <tr style=\"height:12px \"><td></td></tr>\n" +
        "                    <tr style=\"height:16px;font-size: 13px\"><td><span style=\"border-bottom: 0.1px solid gainsboro;padding-bottom: 3px\">\n" +
        "                                    <input type=\"hidden\" value=\"1\" class=\"stuid\">\n" +
        "                                    <input type=\"hidden\" value=\"80\" class=\"stutotalscore\">\n" +
        "                                    <span sty>姓名：</span><span>${stu.stu_name}</span></span></td></tr>\n" +
        "                    <tr style=\"height:16px;font-size: 12px \"><td><span >学号：</span><span>${stu.stu_no}</span></td></tr>\n" +
        "                    <tr style=\"height:22px;font-size: 13px \"><td>\n" +
        "                        <div>\n" +
        "                            <input type=\"hidden\"  value=\"${stu.stu_id}\">\n" +
        "                            <select class=\"ltselect\">\n" +
        "                                <option class=\"ltsop\" value=\"1\">升班</option>\n" +
        "                                <option class=\"ltsop\" value=\"2\">离校</option>\n" +
        "                            </select>\n" +
        "                        </div>\n" +
        "                    </td></tr>\n" +
        "                    <tr style=\"height:9px \"><td></td></tr>\n" +
        "                </table>\n" +
        "            </div>\n"
    function aaaaaa() {
        $("#ssssss").click(function () {
            alert("sss")
            var a=[1,2,3]
            var b=1;
            for (var i=0;i<=a.length;i++){
                if(b==a[i]){
                    alert("ssssssssss")
                }
            }

        })

        }

    function showstudentinfos() {
        $(".showstudentinfos").on("click",function(){
            alert("sd")
        });

    }
    //根据条件查询学生信息
    function selectByStudent(classname,stuname,status) {
        $.ajax({
            type: "post",
            url: "/thselecstudentbystu",
            data:{"classname":classname,"stuname":stuname,"sturts":status},
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构

                $("#tables").html("");
                var strs="<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>姓名</th>\n" +
                    "                            <th>学号</th>\n" +
                    "                            <th>班级</th>\n" +
                    "                            <th>年龄</th>\n" +
                    "                            <th>性别</th>\n" +
                    "                            <th>电话</th>\n" +
                    "                            <th>入学时间</th>\n" +
                    "                            <th>父母电话</th>\n" +
                    "                            <th>操作</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>\n" +
                    "                        <tbody id=\"showstu\">";
                $.each(data, function(i, item) {

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
                        "                        <td> <button type=\"button\" class=\"btn btn-primary btn-xs showstudentinfos\">查看详情</button>\n" +
                        "                        </td>\n" +
                        "                        </tr>"
                })
                strs+="</tbody></table>"
                $("#tables").append(strs);
                $('#datatable').dataTable();
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
        aaaaaa();
        showstudentinfo();
        selectBystuname();
        $("#an").click();
        selectByclassid();
        addstudent();
        selctByclassid();
        showstudentinfos();
        $("body").on("click",".showstudentinfos",function(){
            alert("sds")
            parent.showstu(1);
        })
    })

</script>

</body>
</html>