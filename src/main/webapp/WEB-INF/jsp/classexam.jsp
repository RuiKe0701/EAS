<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/11
  Time: 11:42
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
    <link href="table/css/pace.css" rel="stylesheet">
    <link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">
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
    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <script src="table/js/sweet-alert.min.js"></script>
</head>
<style type="text/css">

    .ltselect {
        background-color: #5cc0de;
        border: 0;
        border-radius: 3px;
        color: white;
        height: 22px;
        width: 50px;
    }

    .ltsop {
        background-color: white;
        color: #2A2E36
    }
</style>

<body class="gray-bg">

<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">
    <button type="button" id="m3" data-toggle="modal" data-target="#myModal3" style="display: none"></button>
    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">新增班级考试</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <form id="saveclassexam">
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                <i class="fa fa-tag" style="color: #ed5666"></i>考试名称：
                            </div>
                            <div class="col-md-5" style="padding-left: 15px">
                                <input value="" placeholder="请输入考试名" id="ce_Name" name="ce_Name"
                                       style="height: 28px;padding-left: 5px">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 10px">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                <i class="fa fa-tag" style="color: #5db85d"></i>考试类型：
                            </div>
                            <div class="col-md-5" style="padding-left: 15px">
                                <select id="examtype" class="btn-indigo"
                                        style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                    <option style="background-color: white;color: #2b303a" value="-1">请选择考试类型</option>
                                    <option style="background-color: white;color: #2b303a" value="0">自定义</option>
                                    <option style="background-color: white;color: #2b303a" value="1">月考</option>
                                    <option style="background-color: white;color: #2b303a" value="2">结业考试</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 10px">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                <i class="fa fa-tag" style="color: #5cc0de"></i> 参与考试 ：
                            </div>
                            <div class="col-md-5" style="padding-left: 15px">
                                <select class="btn-indigo" id="se_Id" name="se_Id" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                    <option style="background-color: white;color: darkslategray" value="-1">请选择考试</option>
                            </select></div>
                        </div>

                        <div class="row" style="padding-top: 15px">
                            <div class="col-md-3"></div>
                            <div class="col-md-3"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                <i class="fa fa-tag" style="color: #f8ac5a"></i>考试日期 ：
                            </div>
                            <div class="col-md-4" style="padding-left: 15px">
                                <input id="ce_Examdays" name="examdays" type="date"
                                       style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px">
                            <div class="col-md-3"></div>
                            <div class="col-md-3"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                <i class="fa fa-tag" style="color: #f8ac5a"></i>考试说明 ：
                            </div>
                            <div class="col-md-4"
                                 style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                <textarea id="ce_Remarks" name="ce_Remarks" style="height: 50px"></textarea></div>
                        </div>
                        <div class="row" style="">
                            <div class="col-lg-3"></div>
                        </div>
                        </form>
                    </div>

                </div>
                <div class="modal-footer" id="dibu">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                    <input value="" type="hidden" id="leaveleaveid">
                    <button type="button" id="baochuclassexam" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">修改班级考试</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <form id="updateclassexam">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                    <i class="fa fa-tag" style="color: #ed5666"></i>考试名称：
                                </div>
                                <div class="col-md-5" style="padding-left: 15px">
                                    <input value="" placeholder="请输入考试名" id="updatece_Name" name="ce_Name"
                                           style="height: 28px;padding-left: 5px">
                                </div>
                            </div>

                            <div class="row" style="padding-top: 15px">
                                <div class="col-md-3"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                    <i class="fa fa-tag" style="color: #f8ac5a"></i>考试日期 ：
                                </div>
                                <div class="col-md-4" style="padding-left: 15px">
                                    <input id="updatece_Examdays" name="examdays" type="date"
                                           style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                                </div>
                            </div>
                            <div class="row" style="padding-top: 15px">
                                <div class="col-md-3"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                    <i class="fa fa-tag" style="color: #f8ac5a"></i>考试说明 ：
                                </div>
                                <div class="col-md-4"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px">
                                    <textarea id="updatece_Remarks" name="ce_Remarks" style="height: 50px"></textarea></div>
                            </div>
                            <div class="row" style="">
                                <div class="col-lg-3"></div>
                            </div>
                            <input name="ce_Id" type="hidden" id="updatese_id">
                        </form>
                    </div>

                </div>
                <div class="modal-footer" id="">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanupdate">关闭</button>
                    <button type="button" id="updatece" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated bounceInRight" style="border-radius: 5px">
                <div class="modal-header">

                    <h3 class="modal-title" id="name">20170701班第27次考勤情况</h3>
                    <small class="font-bold">
                    </small>
                </div>
                <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px" id="modalbody">


                    <div class="row">
                        <div class="panel-body " id="tables" style="background-color: white">
                            <div>
                                <table id="datatables" class="table table-striped dt-responsive nowrap"
                                       style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                                    <thead>
                                    <tr>

                                        <th>班级名</th>
                                        <th>笔试平均分</th>
                                        <th>机式平均分</th>
                                        <th>整体平均分</th>
                                    </tr>
                                    </thead>
                                    <tr class="ldivwai">
                                        <td>副学研<input type="hidden" value="3" class="stuid"><input type="hidden"
                                                                                                   value="80"
                                                                                                   class="stutotalscore">
                                        </td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                    </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="guanbi" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="tijiao">保存</button>
                </div>
            </div>
        </div>
    </div>


    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">


        <div class="col-md-12">
            <div class="" style="background-color: white;border: 0.1px solid gainsboro">
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>校级考试安排管理</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                    <form id="classexam">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 15px">
                            <button style="display: none" type="button" class="btn-xs btn btn-primary" data-toggle="modal"
                                    data-target="#myModal2">
                            </button>
                            <button  type="button" class="btn-xs btn btn-primary" id="addstuleave" >新增考试
                            </button>
                            <button type="" style="display: none" id="addstuleave2" data-toggle="modal"
                                    data-target="#myModal2"></button>
                        </div>
                        <div id="classid" class="col-md-2" style="padding-left: 0px;padding-top: 8px;z-index: 999">
                            <select id="class_Id" name="class_Id" class="selectpicker btn-success btn-xs form-control">
                                <c:forEach var="cla" items="${requestScope.cs}">
                                    <option value="${cla.classes.class_id}"
                                            style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">${cla.classes.class_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 11px;margin-left: 0px">
                            <div class="input-group">
                                <span class="input-group-btn">
						            <button class="btn btn-primary  btn-xs" id="findclassexam" type="button">搜索</button>
                                </span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-4" style="padding-left: 0px">
                            <div class="col-md-5" style="padding-left: 0px;;padding-top: 15px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="ce_Examday" name="ce_Examdays" class="form-control"
                                           style="height: 24.5px;font-size:12px;float:left;">
                                    <span class=" input-group-addon"
                                          style="height: 22.5px;font-size:12px;background-color: white;padding-left: 2px;padding-right: 2px;border-radius: 0px">开始日期 </span>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="padding-left: 0px;;padding-top: 15px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="stopDate" name="stopDates" class="form-control"
                                           style="height: 24.5px;font-size:12px;float:left;">
                                    <span class=" input-group-addon "
                                          style="height: 22.5px;font-size:12px;background-color: white;padding-left: 2px;padding-right: 2px;border-radius: 0px">结束日期 </span>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </form>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
                </div>
                <div class="panel-body " id="tabless">
                    <div id="classatd">
                        <table id="datatable" class="table table-striped dt-responsive nowrap"
                               style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                            <thead>
                            <tr>
                                <th>班级名称</th>
                                <th>班级考试名称</th>
                                <th>考试日期</th>
                                <th>参与校考</th>
                                <th>考试内容/说明</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="showstu">
                            <c:forEach items="${requestScope.classExams}" var="ce">
                                <tr class="gradeX">
                                    <td class="leaveclassnamexian">${ce.class_name}</td>
                                    <td class="leavestunamexian">${ce.ce_Name}</td>
                                    <td class="leaveremarksxian"><span>${ce.ce_Eday}</span></td>
                                    <td class="leaveremarksxian">${ce.se_name}</td>
                                    <td class="leaveremarksxian">${ce.ce_Remarks}</td>
                                    <td>
                                        <input value="${ce.ce_Id}" type="hidden" class="leaveidxian">
                                        <button class="btn btn-xs btn-primary classscore">班级成绩</button>
                                        <button class="btn btn-xs btn-indigo classupdate">修改</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div><!--end row-->
    <button type="" data-toggle="modal" data-target="#myModal3" id="xiugaixian" style="display: none"></button>
    <!--end page content-->


    <!--Start footer-->

    <!--end footer-->

</section>
<!--end main content-->


<!--Common plugins-->
<script src="table/js/jquery.min.js"></script>
<script src="table/js/bootstrap.min.js"></script>
<script src="table/js/pace.min.js"></script>
<script src="table/js/jasny-bootstrap.min.js"></script>
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
        //搜索按钮单击事件
        $("#findclassexam").click(function () {
            ajaxSelect();
        });
        //选择考试类型改变事件
        $("#examtype").change(function () {
           var exa = $(this).val();
           if (exa != -1){
               ajaxExamType(exa);
           }else {
               $("#se_Id").html("<option style=\"background-color: white;color: darkslategray\" value=\"-1\">请选择考试</option>")
           }
        });
//        保存单击
        $("#baochuclassexam").click(function () {
            ajaxSaveClassExam();
        });

        $("body").on("click",".classupdate",function () {
            var ce_id = $(this).prev().prev().val();
            var boo = ajaxVerification(ce_id);
            if (boo){
                var $tds = $(this).parent().siblings();
                $("#myModal3").find("#updatece_Name").val($($tds).eq(1).html());
                $("#myModal3").find("#updatece_Examdays").val($($tds).eq(2).children("span").html());
                $("#myModal3").find("#updatece_Remarks").val($($tds).eq(4).html());
                $("#myModal3").find("#updatese_id").val(ce_id);
                $("#m3").click();
            }else {
                swal({
                    title: "不可修改此次考试",
                    text: "已录入分数或考试已经开始!",
                    type: "info",
                    showCancelButton: false,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                })
            }
        });
        $("#updatece").click(function () {
            ajaxUpdate();
        });
        $("#se_Id").change(function () {
            var se_Id = $(this).val();

        });

        $("#addstuleave").click(function () {
           if ($("#class_Id").val() == "null"){
                $(this).prev().click();
           }else {
               swal({
                   title: "ERROR",
                   text: "您没有班级!!",
                   type: "error",
                   showCancelButton: false,
                   cancelButtonClass: 'btn-secondary',
                   confirmButtonClass: 'btn-danger',
                   confirmButtonText: '确定!'
               })
           }
        });
    });

    
    function ajaxUpdate() {
        $("#guanupdate").click();
        $.ajax({
            type:"post",
            url:"/updateclassexam.do",
            data:$("#updateclassexam").serialize(),
            success:function (data) {
                if (data == 1){
                    swal({
                        title: "success",
                        text: "保存成功!",
                        type: "success",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                    //刷新一遍数据
                    ajaxSelect();
                }else {
                    swal({
                        title: "ERROR",
                        text: "保存失败!",
                        type: "error",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                }
            },
            error:function () {
                
            }
        })
    }
    
    //验证是否可以修改
    function ajaxVerification(ce_id) {
        var boo = true;
        $.ajax({
            type:'POST',
            url:'ajaxverification.do',
            data:{'ce_Id':ce_id},
            async:false,
            success:function (data) {
                if (data == 0){
                    boo = false;
                }
            },
            error:function () {

            }
        });
        return boo;
    }

    function ajaxSaveClassExam() {
        $("#guanadd").click();
        $.ajax({
            type:"POST",
            url:"/ajaxsaveclassexam.do",
            data:$("#saveclassexam").serialize()+"&class_Id="+$("#class_Id").val(),
            success:function (data) {
                if (data == 1){
                    swal({
                        title: "success",
                        text: "保存成功!",
                        type: "success",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                    //刷新一遍数据
                    ajaxSelect();
                }else {
                    swal({
                        title: "ERROR",
                        text: "保存失败!",
                        type: "error",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                };
            },
            error:function () {

            }
        })
    }
    
    function ajaxExamType(examtype) {
        $.ajax({
            type: "POST",
            url: "/ajaxselectschoolexambytype.do",
            data: {'examType': examtype},
            datatype: "json",
            success: function (data) {
                var da = eval(data);
                var str = "<option style=\"background-color: white;color: darkslategray\" value=\"-1\">请选择考试</option>";
                if (data != "null"){
                    $.each(da, function (i, item) {
                        str += "<option style=\"background-color: white;color: darkslategray\" value=\"" + item.se_Id + "\">" + item.se_Name + "</option>";
                    })
                }
                $("#se_Id").html(str);
            },
            error: function () {

            }
        })
    }
    
    function ajaxSelect() {
        $.ajax({
            type: "POST",
            url: "/ajaxselectclassexam.do",
            data: $("#classexam").serialize(),
            datatype: "json",
            success: function (data) {
                var da = eval(data);
                $("#classatd").html("");
                var str = "<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">" +
                    "<thead>\n" +
                    "                            <tr>\n" +
                    "                                <th>班级名称</th>\n" +
                    "                                <th>班级考试名称</th>\n" +
                    "                                <th>考试日期</th>\n" +
                    "                                <th>参与校考</th>\n" +
                    "                                <th>考试内容/说明</th>\n" +
                    "                                <th>操作</th>\n" +
                    "                            </tr>\n" +
                    "                            </thead>\n" +
                    "                            <tbody id=\"showstu\">";
                if (da != -1){
                    $.each(da, function (i, item) {
                        str += "<tr class=\"gradeX\">\n" +
                            "                                    <td class=\"leaveclassnamexian\">" + item.class_name + "</td>\n" +
                            "                                    <td class=\"leavestunamexian\">" + item.ce_Name + "</td>\n" +
                            "                                    <td class=\"leaveremarksxian\"><span>" + item.ce_Eday + "</span></td>\n" +
                            "                                    <td class=\"leaveremarksxian\">" + item.se_name + "</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">" + item.ce_Remarks + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <input value=\"" + item.ce_Id + "\" type=\"hidden\" class=\"leaveidxian\">\n" +
                            "                                        <button class=\"btn btn-xs btn-primary classscore\">班级成绩</button>\n" +
                            "                                        <button class=\"btn btn-xs btn-indigo classupdate\">修改</button>\n" +
                            "                                    </td>\n" +
                            "                                </tr>\n";
                    });
                }
                str += "</tbody> </table>\n"
                $("#classatd").html(str);
                $('#datatable').dataTable();

            },
            error: function () {

            }
        })
    }

</script>


</body>
</html>
