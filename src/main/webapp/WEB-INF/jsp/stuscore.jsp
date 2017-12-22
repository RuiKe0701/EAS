<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/12
  Time: 16:04
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

    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">班级成绩录入</h4>
                </div>
                <div class="modal-body">
                    <form id="addallscore">
                        <div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-sm-2"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                    <i class="fa fa-tag" style="color: #5db85d"></i>录入的班级：
                                </div>
                                <div class="col-md-5" style="padding-left: 15px">
                                    <select class="btn-indigo" id="classchange" name="class_Id"
                                            style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                        <option style="background-color: white;color: #2b303a" value="-1">请选择班级</option>
                                        <c:forEach var="cla" items="${requestScope.cs}">
                                            <option style="background-color: white;color: #2b303a"
                                                    value="${cla.classes.class_id}">${cla.classes.class_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-sm-2"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                    <i class="fa fa-tag" style="color: #5cc0de"></i> 录入的考试 ：
                                </div>
                                <div class="col-md-5" style="padding-left: 15px">
                                    <select class="btn-indigo" id="ajaxclassexam" name="ce_id"
                                            style="height:26px;padding-left: 0px;color: white;border-radius: 5px">

                                    </select>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 10px">
                                <div class="col-sm-2"></div>
                                <div class="col-md-3"
                                     style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px">
                                    <i class="fa fa-tag" style="color: #5cc0de"></i> 录入的考试 ：
                                </div>
                                <div class="col-md-5" style="padding-left: 15px">
                                    <input type="file" name="upload">
                                </div>
                            </div>

                            <div class="row" style="">
                                <div class="col-lg-3"></div>
                            </div>

                        </div>
                        <input type="hidden" id="se_Examtype" name="se_Examtype" value="">
                    </form>
                </div>
                <div class="modal-footer" id="dibu">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                    <input value="" type="hidden" id="leaveleaveid">
                    <button type="button" id="saveallscore" class="btn btn-primary">开始录入</button>
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

                                        <td>副学研<input type="hidden" value="3" class="stuid">
                                            <input type="hidden" value="80" class="stutotalscore"></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                    </tr>

                                    <tr class="ldivwai">

                                        <td>副学研<input type="hidden" value="3" class="stuid">
                                            <input type="hidden" value="80" class="stutotalscore"></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                    </tr>

                                    <tr class="ldivwai">

                                        <td>副学研<input type="hidden" value="3" class="stuid">
                                            <input type="hidden" value="80" class="stutotalscore"></td>
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
                    <h>班级成绩管理</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                    <div class="col-md-2" style="padding-left: 0px;padding-top: 15px">
                        <div class="col-sm-5">
                            <button class="btn-xs btn btn-primary" id="addstuleave" data-toggle="modal"
                                    data-target="#myModal2">录入成绩
                            </button>
                            <button type="" style="display: none" id="addstuleave2" data-toggle="modal"
                                    data-target="#myModal2"></button>
                        </div>
                        <div class="col-sm-5">
                            <button class="btn-xs btn btn-success" data-toggle="modal" data-target="#myModal2">导入成绩
                            </button>
                            <button type="" style="display: none" id="" data-toggle="modal"
                                    data-target="#myModal2"></button>
                        </div>
                    </div>
                    <div class="col-md-1" style="padding-left: 15px;padding-top: 15px">
                        <select id="classid" class="btn-indigo"
                                style="height:26px;padding-left: 10px;color: white;border-radius: 5px">
                            <c:forEach var="cla" items="${requestScope.cs}">
                                <option style="background-color: white;color: #2b303a"
                                        value="${cla.classes.class_id}">${cla.classes.class_name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-2" style="padding-top: 15px">
                        <button class="btn-xs btn btn-primary" style="float: left;border-radius: 0px">搜索</button>
                        <input class="col-sm-8" placeholder="考试名称" style="padding-left: 10px;height: 26px">
                    </div>
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
                                <th>班级名</th>
                                <th>考试名</th>
                                <th>笔试成绩</th>
                                <th>机式成绩</th>
                                <th>平均成绩</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="showstu">
                            <c:forEach var="cscore" items="${requestScope.classScores}">
                                <tr class="gradeX">
                                    <td>${cscore.class_name}</td>
                                    <td>${cscore.ce_name}</td>
                                    <td>${cscore.cs_Wtavg}</td>
                                    <td>${cscore.cs_Ctavg}</td>
                                    <td>${cscore.cs_Avg}</td>
                                    <td class="center">
                                        <input value="${cscore.ce_Id}" type="hidden" name="cs_Id" class="leaveidxian">
                                        <input value="${cscore.class_id}" type="hidden">
                                        <button class="btn-success btn btn-xs xiugai" type="button"
                                                style="padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white">
                                            详情查看
                                        </button>
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
<script src="js/jquery.form.js"></script>
<script>

    $(document).ready(function () {
        $('#datatables').dataTable();
        $('#datatable').dataTable();

        $("#classchange").change(function () {
            if ($(this).val() == -1) {
                $("#ajaxclassexam").html("")
            } else {
                ajaxSelectClassExamByNull($(this).val());
            }
        });

        $("#saveallscore").click(function () {
            postFile();
        });

        $("#ajaxclassexam").change(function () {
            var cetype = $(this).find("option:selected").attr("cetype");
            $("#se_Examtype").val(cetype);
        });
        $("#classid").change(function () {
            //调用根据班级id ajax查询班级成绩信息
            ajaxSelectScoreInfo($(this).val());
        })
        $("body").on("click",".xiugai",function () {
            var classid = $(this).prev().val();
            var ce_id = $(this).prev().prev().val();

        });

    });
    
    function ajaxSelectScoreInfo(class_id) {
        $.ajax({
            type:"post",
            url:'/ajaxfindclassscoreinfo.do',
            data:{'class_id':class_id},
            datatype:'json',
            success:function (data) {
                var str="<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\"\n" +
                    "                               style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                    "                            <thead>\n" +
                    "                            <tr>\n" +
                    "                                <th>班级名</th>\n" +
                    "                                <th>考试名</th>\n" +
                    "                                <th>笔试成绩</th>\n" +
                    "                                <th>机式成绩</th>\n" +
                    "                                <th>平均成绩</th>\n" +
                    "                                <th>操作</th>\n" +
                    "                            </tr>\n" +
                    "                            </thead>\n" +
                    "                            <tbody id=\"showstu\">\n";
                if (data != 0){
                    var da = eval(data);
                    $.each(da,function (i, item) {
                        str+="<tr class=\"gradeX\">\n" +
                            "                                <td>"+item.class_name+"</td>\n" +
                            "                                <td>"+item.ce_name+"</td>\n" +
                            "                                <td>"+item.cs_Wtavg+"</td>\n" +
                            "                                <td>"+item.cs_Ctavg+"</td>\n" +
                            "                                <td>"+item.cs_Avg+"</td>\n" +
                            "                                <td class=\"center\">\n" +
                            "                                    <input value=\""+item.cs_Id+"\" type=\"hidden\" class=\"leaveidxian\">\n" +
                            "                                    <button class=\"btn-success btn btn-xs xiugai\" type=\"button\"\n" +
                            "                                            style=\"padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white\">\n" +
                            "                                        详情查看\n" +
                            "                                    </button>\n" +
                            "                                </td>\n" +
                            "                            </tr>"
                    })
                }
                str+="</tbody>\n" +
                    "                        </table>";
                $("#classatd").html(str);
                $('#datatable').dataTable();
            },
            error:function () {

            }
        });
    }
    
    function ajaxSelectClassExamByNull(class_id) {
        $.ajax({
            type: 'post',
            url: '/ajaxclassexaminfos.do',
            data: $("#addallscore").serialize(),
            success: function (data) {
                var da = eval(data);
                var str = "";
                $("#se_Examtype").val("");
                if (da != 0) {
                    $("#se_Examtype").val(da[0].se_Examtype);
                    $.each(da, function (i, item) {
                        str += "<option style=\"background-color: white;color: #2b303a\" value=\"" + item.ce_Id + "\" cetype=\"" + item.se_Examtype + "\" >" + item.ce_Name + "</option>";
                    });
                }
                alert(str);
                $("#ajaxclassexam").html(str);
            }
        });
    }

    function postFile() {
        var option = {
            url: '/ajaxaddallstuscore.do',
            type: 'POST',
            //  dataType : 'json/',
            headers: {"ClientCallMode": "ajax"}, //添加请求头部
            success: function (data) {
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
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                swal({
                    title: "ERROR",
                    text: "系统异常!",
                    type: "error",
                    showCancelButton: false,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                })
            }
        };
        $("#addallscore").ajaxSubmit(option);
    }
</script>

</body>
</html>