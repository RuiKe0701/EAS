<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/28 0028
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Float-Admin</title>

    <!-- Common plugins -->
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
    <![endif]-->
</head>
<style type="text/css">

    .ltselect{
        background-color: #7c86cb;border: 0;border-radius: 3px;color: white;height: 22px;width:80px;
    }
    .ltsop{
        background-color: white;color: #2A2E36
    }
</style>
<body class="gray-bg" >



<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">


    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">新增学员作业记录</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="file-manager">
                            <div class="space-25"></div>
                            <div style="background-color: white;padding-left: 10px;padding-right: 10px;border: solid 0.1px gainsboro;border-top: 0px">
                                <div class="row" style="padding-left: 30px;padding-right: 30px">
                                    <div class="col-md-12" style="padding-left:0px;padding-top: 30px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                        <div style="">
                                            <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i> 请选择班级：</div>
                                            <div class="col-md-5" style="padding-left: 0px">  <select class="btn-indigo" id="atdclass" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                                <c:forEach items="${classteacherList}" var="ct">
                                                    <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                                </c:forEach>
                                            </select></div>
                                        </div>
                                    </div>

                                    <input class="" id="atdno" type="hidden" value="${attendancenumber}">

                                    <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                        <div style="">
                                            <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #5cc0de"></i> 记 录 日 期 ：</div>
                                            <div class="col-md-7" style="padding-left: 0px">
                                                <input id="kaoqindate"  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                        <div style="">
                                            <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #5db85d"></i> 记 录 名 称：</div>
                                            <div class="col-md-7" style="padding-left: 0px">
                                                <input id="kaoqinname" type="text" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px;border: 0.1px solid cadetblue" placeholder="/请输入记录名">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="dibu">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                    <input value="" type="hidden" id="leaveleaveid">
                    <button type="button" id="kaishiji" class="btn btn-primary">开始记录</button>
                </div>
            </div>
        </div>
        <button type="" style="display: none" id="addstuwork2s" data-toggle="modal" data-target="#myModal2"></button>

    </div>
    <button type="" style="display: none" id="showstuneedwork" data-toggle="modal" data-target="#myModal21"></button>
    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default collapsed">



                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>出勤管理</h>
                </div>
                <c:if test="${0==0}">
                    <div class="row"  style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                        <div class="col-md-1" id="new1" style="padding-left: 0px;padding-top: 8px">
                            <select id="classes" onchange="selectmyclass(this.value,1)" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                <optgroup label="test" data-subtext="optgroup subtext">
                                    <option value="0">正在班级</option>
                                    <c:forEach items="${classteacherList}" var="ct">
                                        <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                    </c:forEach>
                                </optgroup>
                            </select>
                        </div>

                        <div class="col-md-1" id="old1" style="padding-left: 0px;padding-top: 8px">
                            <select id="oldclass" onchange="selectmyclass(this.value,2)" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">

                                <option value="0" id="old">历史班级</option>
                                <c:forEach items="${oldclassteacherList}" var="oc">
                                    <option value="${oc.class_id}">${oc.classname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">开始 </span>
                                    <input type="date" id="startday" class="form-control" style="font-size:12px;float:left;">
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">结束 </span>
                                    <input type="date" id="stopday" class="form-control" style="font-size:12px;float:left;">
                                    <span class=" input-group-addon " id="selectindatebydateteach" style="font-size:12px;">查询 </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <button class="btn" id="addhomework">新增记录</button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${quan==2 || quan==3}">
                    <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <c:if test="${quan==2}">
                                <select id="gradeid"  class="selectpicker show-tick form-control" onchange="selectclass(this.value)" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                    <optgroup label="test" data-subtext="optgroup subtext">
                                        <option value="1">s1</option>

                                        <option style="background-color: white;color: darkslategray" value="2">s2</option>

                                    </optgroup>
                                </select>
                            </c:if>
                            <c:if test="${quan==3}">
                                <select id="gradeid"  class="selectpicker show-tick form-control" onchange="selectclass(this.value)" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                    <optgroup label="test" data-subtext="optgroup subtext">
                                        <option value="3">Y2</option>

                                        <option style="background-color: white;color: darkslategray" value="4">学士后</option>

                                    </optgroup>
                                </select>
                            </c:if>
                        </div>
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <select id="allclass" onchange="selectmyclass(this.value)" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                <optgroup label="test" data-subtext="optgroup subtext">
                                    <option value="0">选择班级</option>
                                    <c:forEach items="${classes}" var="oc">
                                        <option value="${oc.class_id}">${oc.class_name}</option>
                                    </c:forEach>
                                </optgroup>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">开始 </span>
                                    <input type="date" id="startday1" class="form-control" style="font-size:12px;float:left;">

                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">结束 </span>
                                    <input type="date" id="stopday1" class="form-control" style="font-size:12px;float:left;">
                                    <span class=" input-group-addon " id="selectindatebydate" style="font-size:12px;">查询 </span>
                                </div>

                            </div>

                        </div>



                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                              <span class="input-group-btn">

					</span>
                            </div><!-- /input-group -->
                        </div>
                    </div>
                </c:if>


                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 15px;padding-bottom: 3px;">
                    <c:if test="${quan==2||quan==3}">
                        <div class="col-sm-3">
                            <label>选择一个日期：
                                <input type="date" id="xuandate">
                                <button class="btn btn-primary" id="selectall">查看所有班级</button>
                            </label>
                        </div>
                    </c:if>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
                </div>

                <div class="modal inmodal" id="myModal21" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
                    <div class="modal-dialog"  style="border-radius: 5px">
                        <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
                            <div class="modal-header">
                                <h3 class="modal-title" id="name">20170701班第27次考勤情况</h3>
                                <small class="font-bold">
                                </small>
                            </div>
                            <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px" id="modalbody1">
                                <div class="row">
                                    <div class="panel-body " id="tables" style="background-color: white">
                                        <div >
                                            <table id="datatables" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                                                <thead>
                                                <tr>
                                                    <th>姓名</th>
                                                    <th>出勤</th>
                                                    <th>评分</th>
                                                </tr>
                                                </thead>
                                                <tr class="gradeX">

                                                    <td>zqk</td>
                                                    <td><span class="label label-warning">正常</span></td>
                                                    <td>+1</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white" id="guanbihaha" data-dismiss="modal">关闭</button>
                                <button type="button" id="addstuhomeworkbao" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body " id="tabless">
                    <div id="classatd">
                        <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                            <thead>
                            <tr>
                                <th>班级名</th>
                                <th>日期</th>
                                <th>出勤统计名</th>
                                <th>次数</th>
                                <th>出勤率</th>
                                <th>操作</th>


                            </tr>
                            </thead>
                            <tbody id="showstu">


                            <c:forEach items="${classattendances}" var="catd">
                                <tr class="gradeX">
                                    <td>${catd.classname}</td>
                                    <td>${catd.cad_dates}</td>
                                    <td>${catd.cad_name}</td>
                                    <td>${catd.cad_number}</td>
                                    <td>${catd.cad_rate}%</td>
                                    <td class="center">
                                        <input value="${catd.cad_id}" type="hidden" class="cadid">
                                        <button class="xiangqing btn-success btn btn-xs"  type="button" style="padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white" onclick="xiangqing(${catd.cad_id})"  data-toggle="modal" data-target="#myModal">查看</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
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

<script src="select/js/bootstrap-select.js"></script>
<script>

    $(document).ready(function () {
        $('#datatable').dataTable();

        $('#datatables').dataTable();
    });

</script>
<script type="text/javascript">
    //根据班级和时间区间查询
    function selelctbyclassanddaybyth() {

        $("#selectindatebydateteach").click(function () {

            var startday=$("#startday").val();
            var stopday=$("#stopday").val();
            var newclass=$("#classes").val();
            var oldclass=$("#oldclass").val();
            var classid;
            if(newclass==0&&oldclass==0){
                swal({
                    title: "",
                    text: "SORRY!请选择一个班级",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }else{
                if(newclass!=0){
                    classid=newclass;
                }else if(oldclass!=0){
                    classid=oldclass;
                }else {
                    swal({
                        title: "",
                        text: "SORRY!系统错误",
                        type: "error",
                        showCancelButton: true,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    });
                }

                var classname=null;
                selectclassatd(classid,startday,stopday)
            }
        })
    }
    function selectbyclassandday() {
        $("#selectindatebydate").click(function () {
            var classid=$("#allclass").val();
            var startday=$("#startday1").val();
            var stopday=$("#stopday1").val();
            var classname=null;
            if(classid==0){
                swal({
                    title: "",
                    text: "SORRY!请悬着您的班级",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }else {
                selectclassatd(classid,startday,stopday,classname)
            }
        })

    }
    //查询所有班级根据具体日期
    function  selectall() {
        $("#selectall").click(function () {
            var grade=$("#gradeid").val();
            var xuandate=$("#xuandate").val();
            if(xuandate==""){
                swal({
                    title: "",
                    text: "SORRY!请选择一个日期在进行全部查询！",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }else {

                $.ajax({
                    type: "post",
                    url: "/selectclassatdbydateandgrade",
                    data:{"grade":grade,"xuandate":xuandate},
                    dataType: "json",
                    success: function (data) {

                        if(data==-1){
                            swal({
                                title: "",
                                text: "SORRY!系统繁忙请稍后再试！",
                                type: "error",
                                showCancelButton: true,
                                cancelButtonClass: 'btn-secondary',
                                confirmButtonClass: 'btn-danger',
                                confirmButtonText: '确定!'
                            });}else {
                            $("#classatd").html("");
                            var str=" <table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                                "                            <thead>\n" +
                                "                            <tr>\n" +
                                "                                <th>班级名</th>\n" +
                                "                                <th>日期</th>\n" +
                                "                                <th>出勤统计名</th>\n" +
                                "                                <th>次数</th>\n" +
                                "                                <th>出勤率</th>\n" +
                                "                                <th>操作</th>\n" +
                                "                            </tr>\n" +
                                "                            </thead>\n" +
                                "                            <tbody id=\"showstu\">\n"
                            $.each(data, function (i, item) {

                                str+="   <tr>   <td>"+item.classname+"</td>\n" +
                                    "                                    <td>"+item.cad_dates+"</td>\n" +
                                    "                                    <td>"+item.cad_name+"</td>\n" +
                                    "                                    <td>"+item.cad_number+"</td>"
                                if(item.cad_rate>=80){
                                    str+="  <td><span class=\"label label-info\">"+item.cad_rate+"</span></td>"
                                }else if((item.cad_rate>=60)){
                                    str+="  <td><span class=\"label label-success\">"+item.cad_rate+"</span></td>"
                                }else if((item.cad_rate<=60)){
                                    str+="  <td><span class=\"label label-warning\">"+item.cad_rate+"</span></td>"
                                }
                                str+=" <td class=\"center\">\n" +
                                    "                                        <input value=\""+item.cad_id+"\" type=\"hidden\" class=\"cadid\">\n" +
                                    "                                        <button class=\"xiangqing btn-success btn btn-xs\"  type=\"button\" style=\"padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white\" onclick=\"xiangqing("+item.cad_id+")\"  data-toggle=\"modal\" data-target=\"#myModal\">查看</button></td>\n" +
                                    "                                </tr>";

                            })
                            str+=" </tbody> </table>"
                            $("#classatd").append(str);
                            $('#datatable').dataTable();}
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
            }
        })
    }


    function seletclassname() {
        $('#seletclassname').click(function () {
            var startday=$("#startday").val();
            var stopday=$("#stopday").val();
            var classid=null;
            var classname=$("#classname").val();
            if(classname==""){
                swal({
                    title: "",
                    text: "SORRY!您的班级名请填写完整",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }else {
                selectclassatd(classid,startday,stopday,classname)
            }
        })
    }


    //根据条件查询学生信息


    function  xiangqing(xiangqing) {
        var cadid=xiangqing;
        $("#modalbody").html("");
        $.ajax({
            type: "post",
            url: "/dostuattendancerecord",
            data:{"cadid":cadid},
            dataType: "json",
            success: function (data) {
                var str="<div class=\"row\">\n" +
                    "                                    <div class=\"panel-body \" id=\"tables\" style=\"background-color: white\">\n" +
                    "                                        <div >\n" +
                    "                                            <table id=\"datatables\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                    "                                                <thead>\n" +
                    "                                                <tr>\n" +
                    "                                                    <th>姓名</th>\n" +
                    "                                                    <th>出勤</th>\n" +
                    "                                                    <th>评分</th>\n" +
                    "                                                </tr>\n" +
                    "                                                </thead>\n" +
                    "                                                <tbody>\n"
                $.each(data, function (i, item) {
                    str+="<tr>"
                    var caozuo="";
                    if(item.caozuo==1){
                        caozuo="+"+item.fen;
                    }else if(item.caozuo==0){
                        caozuo="-"+item.fen;
                    }
                    str+="<td>"+item.stuname+"</td>"
                    if(item.ss_id==1){
                        str+="  <td><span class=\"label label-info\">"+item.ssname+"</span></td>"
                    }else if(item.ss_id==2){

                        str+="  <td><span class=\"label label-success\">"+item.ssname+"</span></td>"
                    }else if(item.ss_id==3){
                        str+=" <td><span class=\"label label-primary\">"+item.ssname+"</span></td>"
                    }else if(item.ss_id==4){
                        str+=" <td><span class=\"label label-warning\">"+item.ssname+"</span></td>"
                    }
                    str+="<td>"+caozuo+"</td>";
                    str+="</tr>"
                })
                str+="               </tbody>\n" +
                    "                                            </table>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>"
                $("#modalbody").append(str);
                $('#datatables').dataTable();
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })


    }
    function selectmyclass(classid,cc) {
        if(cc==1){
            $("#oldclass").val(0);
            $("#old1").find(".filter-option").text("历史班级")
        }else if(cc==2){
            $("#classes").val(0);
            $("#new1").find(".filter-option").text("正在班级")
        }
        var ss=classid

        var startday=null;
        var stopday=null;
        var classname=null;
        selectclassatd(classid,startday,stopday)
    }
    function selectclassatd(classid,startday,stopday,classname) {
        $.ajax({
            type: "post",
            url: "/doselectclassatdss",
            data:{"classsid":classid,"startday":startday,"stopday":stopday,"classname":classname},
            dataType: "json",
            success: function (data) {
                if(data==-1){
                    swal({
                        title: "",
                        text: "SORRY!您没有权限访问该班级或该班级未创建！",
                        type: "error",
                        showCancelButton: true,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    });}else {
                    $("#classatd").html("");
                    var str=" <table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                        "                            <thead>\n" +
                        "                            <tr>\n" +
                        "                                <th>班级名</th>\n" +
                        "                                <th>日期</th>\n" +
                        "                                <th>出勤统计名</th>\n" +
                        "                                <th>次数</th>\n" +
                        "                                <th>出勤率</th>\n" +
                        "                                <th>操作</th>\n" +
                        "                            </tr>\n" +
                        "                            </thead>\n" +
                        "                            <tbody id=\"showstu\">\n"
                    $.each(data, function (i, item) {

                        str+="   <tr>   <td>"+item.classname+"</td>\n" +
                            "                                    <td>"+item.cad_dates+"</td>\n" +
                            "                                    <td>"+item.cad_name+"</td>\n" +
                            "                                    <td>"+item.cad_number+"</td>"
                        if(item.cad_rate>=80){
                            str+="  <td><span class=\"label label-info\">"+item.cad_rate+"%</span></td>"
                        }else if((item.cad_rate>=60)){
                            str+="  <td><span class=\"label label-success\">"+item.cad_rate+"%</span></td>"
                        }else if((item.cad_rate<=60)){
                            str+="  <td><span class=\"label label-warning\">"+item.cad_rate+"%</span></td>"
                        }
                        str+=" <td class=\"center\">\n" +
                            "                                        <input value=\""+item.cad_id+"\" type=\"hidden\" class=\"cadid\">\n" +
                            "                                        <button class=\"xiangqing btn-success btn btn-xs\"  type=\"button\" style=\"padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white\" onclick=\"xiangqing("+item.cad_id+")\"  data-toggle=\"modal\" data-target=\"#myModal\">查看</button></td>\n" +
                            "                                </tr>";

                    })
                    str+=" </tbody> </table>"


                    $("#classatd").append(str);
                    $('#datatable').dataTable();}
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
        var sss=""
    }
    //新增家庭作业
    function addhomework() {
        shengchengkaoqingming();
        $("#addhomework").click(function () {
            alert("sss");
            var classid=$("#atdclass").val();
            chacishu(classid);
            pingfenhuoqu();
            $("#addstuwork2s").click();
        })
    }
    function xinzengwork() {
        $("#kaishiji").click(function () {
            var classid=$("#atdclass").val();
            alert(classid);
            $("#guanadd").click();
            sleectstuofworkbyclassid(classid);
            $("#showstuneedwork").click();
        })
    }
    function chacishu(classid) {
                $.ajax({
                    type: "post",
                    url: "/selecrworknumber.do",
                    data: {"classid": classid},
                    dataType: "json",
                    success: function (data) {
                        if (data >= 0) {
                            alert(data)
                            $("#atdno").val(data);
                            var aaa = parseInt(data) + 1;
                            var bbb = $("#atdclass").find("option:selected").text()
                            var ccc = bbb + "班第" + aaa + "次作业记录"
                            $("#kaoqinname").val(ccc);
                        } else if (data == -1) {

                        }
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
    }
    function shengchengkaoqingming() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        $("#leavedate").val(currentdate);
        $("#kaoqindate").val(currentdate);
    }
    //获取作业记录学生
    var pingfens;
    function pingfenhuoqu() {
        $.ajax({
            type: "post",
            url: "/getregulatonbytypework.do",
            dataType: "json",
            success: function (data) {
                alert(data);
                pingfens=data;
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }

    function sleectstuofworkbyclassid(classid) {
        $.ajax({
            type: "post",
            url: "/selectstuworkstu.do",
            data:{"classid":classid},
            dataType: "json",
            success: function (data) {
                var str="<div class=\"row\">\n" +
                    "                                    <div class=\"panel-body \" id=\"tables\" style=\"background-color: white\">     <div class=\"col-md-12\" style=\"padding-left:0px;padding-top: 0px;padding-bottom: 5px;\"><div style=\"font-size:14px;padding-left:10px;padding-right:10px;width: 100%;background-color: #d9edf7;border-radius: 3px;padding: 5px;border: 0px\" >\n" +
                    "                                    <p id=\"stuleaveinfos\" style=\"padding-left:10px;padding-right:10px\">"+"</p>\n" +
                    "                                </div>\n" +
                    "                                </div>\n" +
                    "                                        <div >\n" +
                    "                                            <table id=\"datatables\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                    "                                                <thead>\n" +
                    "                                                <tr>\n" +
                    "                                                    <th style=\"text-align: center\">姓名</th>\n" +
                    "                                                    <th style=\"text-align: center\">学号</th>\n" +
                    "                                                    <th style=\"text-align: center\">出勤</th>\n" +
                    "                                                </tr>\n" +
                    "                                                </thead>\n" +
                    "                                                <tbody>\n"
                $.each(data, function (i, item) {
                    str+="<tr class=\"ldivwai\">"
                    str+="<td style=\"text-align: center\"> <span class=\"label label-info \">"+item.stuname+"</span><input type=\"hidden\" value="+item.stu_id+" class=\"stuid\"><input type=\"hidden\" value="+item.stuname+" class=\"stunames\">\n" +
                        "                                <input type=\"hidden\" value="+item.sts_id+" class=\"stsid\">\n" +
                        "                                    <input type=\"hidden\" value="+item.stu_totalscore+" class=\"stutotalscore\"></td>"
                    str+="<td style=\"text-align: center\"> "+item.stuno+"</td>";
                    str+="<td style=\"text-align: center\"><div><select class=\"ltselect\" >\n"
                    $.each(pingfens, function (i, item) {
                        str+="<option class=\"ltsop\" value="+item.ras_id+">"+item.ras_name+"</option>\n"
                    })

                    str+="</select></div></td></tr>";
                })
                str+="               </tbody>\n" +
                    "                                            </table>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>"
                $("#modalbody1").html("");

                $("#modalbody1").append(str);

            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
    function tijiao() {
        $("#addstuhomeworkbao").click(function () {
            var cadnumber=parseInt($("#atdno").val())+1;
            var classids=$("#atdclass").val();
            var stuhomework= new Array();
            $(".ldivwai").each(function(index,data) {
                //学生考勤记录
                var stu_id = $(data).find(".stuid").val();
                var ras_id = $(data).find(".ltselect").val();
                var stsid=$(data).find(".stsid").val();
                var object = new Object();
                object.stu_id = stu_id;
                object.ras_id =ras_id;
                object.class_id=classids;
                object.stsid=stsid;

                object.zongfen=$(data).find(".stutotalscore").val();
                stuhomework.push(object);
            })
            var suthomeworks=JSON.stringify(stuhomework);
            var homename=$("#kaoqinname").val();
            var kaoqindates=$("#kaoqindate").val();
            $.ajax({
                type: "post",
                url: "/addstuhomeworks.do",
                data:{
                    "suthomeworks": suthomeworks,
                    "classids": classids,
                    "cadnumber":cadnumber,
                    "kaoqindate":kaoqindates,
                    "homename":homename,
                },
                dataType: "json",
                success: function (data) {
                    if (data!=-1){
                        $("#guanbihaha").click();
                        swal({
                            title: "Sussess！",
                            text: "恭喜添加成功！本次班级作业合格率为"+data+"%",
                            type: "success",
                            showCancelButton: true,
                            cancelButtonClass: 'btn-secondary ',
                            confirmButtonClass: 'btn-success  ',
                            confirmButtonText: '确定'
                        });

                    }else {
                        alert("sorry!系统延迟请稍后再试")
                    }
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        })

    }
    $(function () {

        xinzengwork();
        tijiao();
        addhomework();
        selectbyclassandday();
        seletclassname();
        $("body").on("click",".showstudentinfos",function(){
            alert("sds")
            parent.showstu(1);
        })

        selectall();
        selelctbyclassanddaybyth();
    })

</script>

</body>
</html>
