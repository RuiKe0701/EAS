<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/11 0011
  Time: 16:58
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
    <link href="table/css/bootstrap.min.css" rel="stylesheet">
    <!-- Common plugins -->
    <link href="table/css/simple-line-icons.css" rel="stylesheet">
    <link href="table/css/font-awesome.min.css" rel="stylesheet">
    <link href="table/css/pace.css" rel="stylesheet"><link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="table/css/nanoscroller.css">
    <link rel="stylesheet" href="table/css/metismenu.min.css">
    <!--&lt;!&ndash; dataTables &ndash;&gt;-->
    <link href="table/css/jquery.datatables.min.css" rel="stylesheet" type="text/css">
    <link href="table/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--template css-->
    <link href="table/css/style.css" rel="stylesheet">
    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->



    <base target="_blank">
    <link rel="stylesheet" href="select/dist/css/bootstrap-select.css">

</head>
<style type="text/css">

    .ltselect{
        background-color: #5cc0de;border: 0;border-radius: 3px;color: white;height: 22px;width:50px;
    }
    .ltsop{
        background-color: white;color: #2A2E36
    }
</style>

<body class="gray-bg" >

<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">


    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">



        <div class="col-md-12">
            <div class="" style="background-color: white;border: 0.1px solid gainsboro">
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>学员出勤详情</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">

                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="classes" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">正在班级</option>
                                <c:forEach items="${classteacherList}" var="ct">
                                    <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="oldclass" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">历史班级</option>
                                <c:forEach items="${oldclassteacherList}" var="oc">
                                    <option value="${oc.class_id}">${oc.classname}</option>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="classstu"  class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">学员选择
                                </option>
                                <c:forEach items="${classstus}" var="oc">
                                    <option value="${oc.stu_id}">${oc.stuname}</option>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <c:if test="${xq==0}">
                            <button class="btn btn-success " id="xiangxi" style="display: block">详细查询</button>
                            <button class="btn btn-default" id="putong" style="display: none">普通查询</button>
                        </c:if>
                        <c:if test="${xq==1}">
                            <button class="btn btn-success " id="xiangxi" style="display: none">详细查询</button>
                            <button class="btn btn-default" id="putong" style="display: block">普通查询</button>
                        </c:if>
                    </div>

                </div>
                <input id="xq" type="hidden" value="${xq}">
                <c:if test="${xq==0}"> <div class="row" id="xiang" style="padding-left:30px;padding-right:30px;padding-top: 15px;padding-bottom: 3px;display: none">
                </c:if>

                <c:if test="${xq==1}"> <div class="row" id="xiang" style="padding-left:30px;padding-right:30px;padding-top: 15px;padding-bottom: 3px;display: block">
                </c:if>
                <div class="col-lg-2" style="padding-left:0px ">
                    <label>开始日期
                        <input type="date">
                    </label>
                </div>
                <div class="col-lg-2" style="padding-left:0px ">
                    <label>结束日期
                        <input type="date">
                    </label>
                </div>
                <div class="col-lg-4">
                    <select style="height: 30px;"><option>全部</option></select>
                    <button class="btn btn-primary">查询</button>
                </div>
            </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
                </div>
                <div class="panel-body " id="tabless">
                    <div id="classatd">
                        <c:if test="${xq==0}">
                            <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                                <thead>
                                <tr>
                                    <th>班级名称</th>
                                    <th>学员姓名</th>
                                    <th>作业名称</th>
                                    <th>检查日期</th>
                                    <th>检查情况</th>
                                    <th>分数操作</th>
                                    <th>分数</th>

                                </tr>
                                </thead>
                                <tbody id="showstu">
                                <c:forEach items="${stuhomeworkList}" var="sttdl">
                                    <tr class="gradeX">
                                        <td class="leaveclassnamexian">${sttdl.classname}</td>
                                        <td class="leavestunamexian">${sttdl.stuname}</td>
                                        <td class="leavestunamexian">${sttdl.chwname}</td>
                                        <td class="leaveremarksxian">${sttdl.work_dates}</td>
                                        <td class="leaveremarksxian">${sttdl.rasname}&nbsp;</td>
                                        <c:if test="${sttdl.caozuo==1}">
                                            <td class="leaveremarksxian"><span class="label label-primary">加分</span>&nbsp;</td>
                                        </c:if>
                                        <c:if test="${sttdl.caozuo==0}">
                                            <td class="leaveremarksxian"><span class="label label-warning">减分</span>&nbsp;</td>
                                        </c:if>
                                        <td class="leaveremarksxian">${sttdl.fen}&nbsp;</td>

                                    </tr>
                                </c:forEach>

                                </tbody></table>
                        </c:if>
                        <c:if test="${xq==1}">
                            <table id="da" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                                <thead>
                                <tr>
                                    <th>班级名称</th>
                                    <th>学员姓名</th>
                                    <th>考勤日期</th>
                                    <th>考勤情况</th>
                                    <th>分数操作</th>
                                    <th>分数</th>

                                </tr>
                                </thead>
                                <tbody id="showstus">
                                <c:forEach items="${stuattendanceList}" var="sttdl">
                                    <tr class="gradeX">
                                        <td class="leaveclassnamexian">${sttdl.classname}</td>
                                        <td class="leavestunamexian">${sttdl.stuname}</td>
                                        <td class="leaveremarksxian">${sttdl.sad_recorddates}</td>
                                        <td class="leaveremarksxian">${sttdl.ssname}&nbsp;</td>
                                        <c:if test="${sttdl.caozuo==1}">
                                            <td class="leaveremarksxian"><span class="label label-primary">加分</span>&nbsp;</td>
                                        </c:if>
                                        <c:if test="${sttdl.caozuo==0}">
                                            <td class="leaveremarksxian"><span class="label label-warning">减分</span>&nbsp;</td>
                                        </c:if>
                                        <td class="leaveremarksxian">${sttdl.fen}&nbsp;</td>

                                    </tr>
                                </c:forEach>

                                </tbody></table>
                        </c:if>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <!--end row-->
        <button type="" data-toggle="modal" data-target="#myModal3" id="xiugaixian" style="display: none"></button>
        <input type="hidden" value="${classid}" id="as">
        <input type="hidden" value="${zhuang}" id="zhuang">
        <input type="hidden" value="${stuid}" id="stuids">
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

<script src="table/js/sweet-alert.min.js"></script>

<script src="js/bootstrap-select.js"></script>

<script src="select/js/bootstrap-select.js"></script>
<script>
    $(document).ready(function () {
        $('#datatables').dataTable();
        $('#datatable').dataTable();
    });
</script>
<script type="text/javascript">

    //详细查询和普通查询切换
    function xiangxi() {
        $("#xiangxi").click(function () {
            $("#xiang").css({"display":"block"});
            $("#xq").val(1);
            $("#putong").css({"display":"block"});
            $("#xiangxi").css({"display":"none"});
        })
        $("#putong").click(function () {
            $("#xiang").css({"display":"none"});
            $("#xq").val(0);
            $("#putong").css({"display":"none"});
            $("#xiangxi").css({"display":"block"});
        })
    }


    function childtest() {
        alert("这是子页面的方法！");
    }
    function aa() {
        $("#classes").change(function () {
            classid=$(this).val();
            if(classid!=0){
                alert(classid)
                var xq=$("#xq").val();
                alert(xq)
                window.location.href="/stuhomeworkinfobystuid.do?classid="+classid+"&zhuang=0&xq="+xq;
            }})
        $("#oldclass").change(function () {
            classid=$(this).val();
            if(classid!=0) {
                alert(classid)
                var xq=$("#xq").val();
                alert(xq)
                window.location.href = "/stuhomeworkinfobystuid.do?classid=" + classid + "&zhuang=1&xq="+xq;
            }
        })
    }
    function classstu() {
        $("#classstu").change(function () {
            var stuid=$("#classstu").val();
            if(stuid!=0){
                classs=$("#classes").val();
                alert(classs)
                oldclass=$("#oldclass").val();
                var classs;
                if(classs!=0){
                    selectstuadtbystu(classs,stuid);
                }else if(oldclass!=0){
                    selectstuadtbystu(oldclass,stuid);
                }else {
                    swal({
                        title: "Sorry!",
                        text: "对不起！系统繁忙稍后再试",
                        type: "warning",
                        showCancelButton: true,
                        cancelButtonClass: 'btn-secondary ',
                        confirmButtonClass: 'btn-warning  ',
                        confirmButtonText: '确定!'
                    });
                }
            }
        })
    }
    function selectstuadtbystu(classid,stuid) {
        $.ajax({
            type: "post",
            url: "/selectstuworkbystuid.do",
            data:{"classid":classid,"stuid":stuid},
            dataType: "json",
            success: function (data) {
                $("#classatd").html("");
                var str="<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                    "                            <thead>\n" +
                    "                            <tr>\n" +
                    "                                <th>班级名称</th>\n" +
                    "                                <th>学员姓名</th>\n" +
                    "                                <th>考勤日期</th>\n" +
                    "                                <th>考勤情况</th>\n" +
                    "                                <th>分数操作</th>\n" +
                    "                                <th>分数</th>\n" +

                    "                            </tr>\n" +
                    "                            </thead>\n" +
                    "                            <tbody id=\"showstu\">"
                $.each(data, function (i, item) {
                    var c="";
                    if(item.caozuo==1){
                        c="<td class=\"leaveremarksxian\"><span class=\"label label-primary\">加分</span>&nbsp;</td>\n"
                    }else {
                        c="<td class=\"leaveremarksxian\"><span class=\"label label-warning\">减分</span>&nbsp;</td>\n"
                    }
                    str+=" <tr class=\"gradeX\">\n" +
                        "                                <td class=\"leaveclassnamexian\">"+item.classname+"</td>\n" +
                        "                                <td class=\"leavestunamexian\">"+item.stuname+"</td>\n" +
                        "                                <td class=\"leaveremarksxian\">"+item.work_dates+"</td>\n" +
                        "                                <td class=\"leaveremarksxian\">"+item.rasname+"&nbsp;</td>\n" +c+ " <td class=\"leaveremarksxian\">"+item.fen+"&nbsp;</td>\n" +
                        "                            </tr>"
                })
                str+="  </tbody></table>";
                $("#classatd").append(str);
                $('#datatable').dataTable();
            } , error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
    function classs() {
        var lei=$("#zhuang").val();
        if(lei!=""){
            if(lei==0){
                if($("#as").val()!=""){
                    var a=$("#as").val();
                    $("#classes").val(a);
                }
            }else if(lei==1){
                if($("#as").val()!=""){
                    var a=$("#as").val();
                    $("#oldclass").val(a);
                }
            }
        }
        if($("#stuids").val()!=""){
            $("#classstu").val($("#stuids").val());
        }
    }
    $(function(){
        xiangxi();
        aa();
        classs();
        classstu();
    })
</script>


</body>
</html>