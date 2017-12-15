<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 11:31
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
    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <script src="table/js/sweet-alert.min.js"></script>

    <base target="_blank">
    <link rel="stylesheet" href="select/dist/css/bootstrap-select.css">

</head>
<style type="text/css">
    .yemian{
        background-color:white;border:0.1px solid gainsboro;
        padding: 4px;
        padding-left: 13px;
        padding-right: 13px;
        margin-left: 5px;
    }

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


    <!--page header start-->

    <!--page header end-->


    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">新增校级考试安排</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <form id="saveexam">
                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i>考试名称：</div>
                            <div class="col-md-5" style="padding-left: 15px">
                                <input value="" id="se_Name" name="se_Name" placeholder="请输入考试名" style="height: 28px;padding-left: 5px">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 10px">
                            <div class="col-sm-2"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #5db85d"></i> 考试类型：</div>
                            <div class="col-md-3" style="padding-left: 15px">
                                <select class="btn-indigo" id="se_Examtype" name="se_Examtype" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                    <option style="background-color: white;color: #2b303a" value="1">月考</option>
                                    <option style="background-color: white;color: #2b303a" value="2">结业考试</option>
                                </select>
                            </div>
                        </div>
                        <div class="row"  style="padding-top: 10px;display: none" >
                            <div class="col-sm-2"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #5cc0de"></i> 参与班级 ：</div>
                            <div class="col-md-2" style="padding-left: 15px">
                                <select class="btn-indigo" id="grade_id" name="grade_id" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                    <option style="background-color: white;color: #2b303a" value="-1">请选择结业年级</option>
                                    <option style="background-color: white;color: #2b303a" value="1">s1结业</option>
                                    <option style="background-color: white;color: #2b303a" value="2">s2结业</option>
                                    <option style="background-color: white;color: #2b303a" value="3">y2结业</option>
                                    <option style="background-color: white;color: #2b303a" value="4">学士后结业</option>
                                </select>
                            </div>
                            <div class="col-md-2" style="margin-left: 25px">
                                <select class="btn-indigo" id="class_id" name="class_id" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                    <option style="background-color: white;color: #2b303a" value="0">请选择年级</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px">
                            <div class="col-sm-2"> </div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #f8ac5a"></i>开始日期 ：</div>
                            <div class="col-md-4" style="padding-left: 15px">
                                <input id="se_Startds" name="se_Startds"  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px">
                            <div class="col-sm-2"> </div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #f8ac5a"></i>结束日期 ：</div>
                            <div class="col-md-4" style="padding-left: 15px">
                                <input id="se_Stopds" name="se_Stopds"  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer" id="dibu">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                    <input value="" type="hidden" id="leaveleaveid">
                    <button type="button" id="savesc" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!--start page content-->

    <div class="row">


        <div class="col-md-12">
            <div class="" style="background-color: white;border: 0.1px solid gainsboro">
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>校级考试安排管理</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">

                    <div class="col-md-1" style="padding-left: 0px;padding-top: 15px">
                        <button class="btn-xs btn btn-success"  id="addstuleave" data-toggle="modal" data-target="#myModal2">新增考试安排</button>
                        <button type="" style="display: none" id="addstuleave2" data-toggle="modal"
                                data-target="#myModal2"></button>
                    </div>
                    <form id="selectexam">
                        <input type="hidden" id="currentPage" name="currentPage" value="1">
                        <div class="col-md-2" style="padding-top: 8px">
                            <button class="btn-xs btn btn-primary" type="button" id="selectinfo"
                                    style=";height:100%;float: left;border-radius: 0px">搜索
                            </button>
                            <input class="col-sm-8" name="se_Name" placeholder="考试名称" style="padding-left: 10px;">
                        </div>
                        <div class="col-md-5" style="padding-left: 0px">
                            <div class="col-md-5" style="padding-left: 0px;;padding-top: 8px">

                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="se_Startday" name="se_Startds" class="form-control"
                                           style="font-size:12px;float:left;">
                                    <span class=" input-group-addon "
                                          style="font-size:12px;background-color: white;padding-left: 2px;padding-right: 2px;border-radius: 0px">开始日期 </span>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="padding-left: 0px;;padding-top: 8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="se_Stopday" name="se_Stopds" class="form-control"
                                           style="font-size:12px;float:left;">
                                    <span class=" input-group-addon "
                                          style="font-size:12px;background-color: white;padding-left: 2px;padding-right: 2px;border-radius: 0px">结束日期 </span>
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
                                <th>校级考试名称</th>
                                <th>开始参与考试日期</th>
                                <th>结束参与考试日期</th>
                                <th>考试类型</th>
                                <th>参与班级</th>
                                <th>创建人</th>
                                <th>创建日期</th>

                                <th>操作</th>

                            </tr>
                            </thead>
                            <tbody id="showexam">
                            <c:forEach var="se" items="${requestScope.schoolExams.list}">
                                <tr class="gradeX">
                                    <td class="leaveclassnamexian">${se.se_Name}</td>
                                    <td class="leavestunamexian">${se.se_Startdays}</td>
                                    <td class="leaveremarksxian"><span>${se.se_Stopdays}</span>&nbsp;
                                    <td class="leaveremarksxian">
                                        <c:if test="${se.se_Examtype == 1}">&nbsp;&nbsp;月考 </c:if>
                                        <c:if test="${se.se_Examtype == 2}">结业考试</c:if>
                                        <c:if test="${se.se_Examtype == 3}">班内考试</c:if>
                                    </td>
                                    <td class="leaveremarksxian">
                                        <c:choose>
                                            <c:when test="${se.se_Examtype == 1}">全部班级</c:when>
                                            <c:when test="${se.se_Examtype == 2}">${se.class_name}</c:when>
                                            <c:otherwise>班内所有人</c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td claas="leavedayxian">${se.th_name}</td>
                                    <td claas="leavedayxian">${se.se_Createdates}</td>
                                    <td>
                                        <div>
                                            <button class="btn btn-primary btn-xs selectid">查看详情</button>
                                            <input type="hidden" value="${se.se_Id}">
                                            <button class="btn btn-warning btn-xs deleteid">删除</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="curr" style="float: right">
                            <button class="yemian" value="${requestScope.schoolExams.currentPage-1}">< 上一页</button>
                            <c:forEach begin="1" end="${requestScope.schoolExams.totalPages}" var="i">
                                <c:if test="${i == requestScope.schoolExams.currentPage}">
                                    <button class="yemian" value="${i}" style="background-color: gainsboro">${i}</button>
                                </c:if>
                                <c:if test="${i != requestScope.schoolExams.currentPage}">
                                    <button class="yemian" value="${i}">${i}</button>
                                </c:if>
                            </c:forEach>
                            <button class="yemian"value="${requestScope.schoolExams.currentPage+1}" >下一页 ></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--end row-->
    <button type="" data-toggle="modal" data-target="#myModal3" id="xiugaixian" style="display: none"></button>


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
        $("#selectinfo").click(function () {
            ajaxExam();
        });
        $("body").on("click",".yemian",function () {
            $("#currentPage").val($(this).val());
            ajaxExam();
        });
        $("#se_Examtype").change(function () {
            var type = $(this).val();
            if (type == 1){
                $(".row").eq(2,3).attr("disabled","disabled").toggle();
                $("#class_id").html("<option style=\"background-color: white;color: #2b303a\" value=\"0\">请选择年级</option>");
            }else {
                $(".row").eq(2,3).attr("disabled","").toggle();
            }
        })
        $("#grade_id").change(function () {
            var typeid = $(this).val();
            if (typeid != -1){
                ajaxClassInfo(typeid);
            }else {
                $("#class_id").html("<option style=\"background-color: white;color: #2b303a\" value=\"-1\">请选择年级</option>");
            }
        });
        $("#savesc").click(function () {
            ajaxAddSchooExam();
        });
        
        $("body").on("click",".deleteid",function () {
            var se_Id = $(this).prev().val();
            var boo = true;
            swal({
                title: "",
                text: "您是否确定以下学员进行升班?",
                type: "warning",
                showCancelButton: true,
                cancelButtonClass: 'btn-secondary ',
                confirmButtonClass: 'btn-warning',
                confirmButtonText: "确定!",
                closeOnConfirm: false
            }, function () {
                boo = deleteSchoolExam(se_Id);
            });
            if (boo){
                $(this).parents("tr").remove();
            }
        });
        
        $("body").on("click",".selectid",function () {
           var se_id = $($this).next().val();
        });
    });

    function deleteSchoolExam(se_Id) {
        var boo = true;
        $.ajax({
            type:'POST',
            url:'/deleteschool',
            data:{'se_Id':se_Id},
            success:function (data) {
                if (data == 1){
                    swal({
                        title: "success",
                        text: "删除成功!",
                        type: "success",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                }else {
                    swal({
                        title: "ERROR",
                        text: "删除失败!",
                        type: "error",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    })
                    boo = false;
                };
            },
            error:function () {

            }
        })
        return boo;
    }

    function ajaxAddSchooExam() {
        alert($("#saveexam").serializeArray())
        $.ajax({
            type:'POST',
            url:'/addschoolexam',
            data:$("#saveexam").serialize(),
            success:function (data) {
                alert(data);
            },
            error:function () {

            }
        })
    }
    
    
    function ajaxClassInfo(grade_id) {
        $.ajax({
            type: 'POST',
            url: '/selectclassbytype.do',
            data: {'grade_id':grade_id},
            dataType: "json",
            success: function (data) {
                var classes = eval(data);
                var ops = "";
                $.each(classes,function (i, item) {
                    ops += "<option style=\"background-color: white;color: darkslategray\" value=\""+item.class_id+"\">"+item.class_name+"</option>";
                })
                alert(ops);
                $("#class_id").html(ops);
            },
            error:function () {
                
            }
        });
    }
    
    function ajaxExam() {
        $.ajax({
            type: 'POST',
            url: '/ajaxexaminfo.do',
            data: $("#selectexam").serialize(),
            dataType: "json",
            success: function (data) {
                var exam = eval(data);
                $("#currentPage").val(exam.currentPage);
                str = "";
                $("#showexam ").html("");
                $("#curr").html("");
                $.each(exam.list, function (i, item) {
                    var se_Examtype = item.se_Examtype;
                    var className = "";
                    if (se_Examtype == 1) {
                        se_Examtype = "&nbsp;&nbsp;月考";
                        className = "全部班级";
                    } else if (se_Examtype == 2) {
                        se_Examtype = "结业考试";
                        className = item.class_name;
                    } else {
                        se_Examtype = "班内考试";
                        className = "班内全部人";
                    }
                    ;
                    str += "<tr class=\"gradeX\">\n" +
                        "                                    <td class=\"leaveclassnamexian\">" + item.se_Name + "</td>\n" +
                        "                                    <td class=\"leavestunamexian\">" + item.se_Startdays + "</td>\n" +
                        "                                    <td class=\"leaveremarksxian\"><span>" + item.se_Stopdays + "</span>&nbsp;\n" +
                        "                                    <td class=\"leaveremarksxian\">\n" + se_Examtype +
                        "                                    </td>\n" +
                        "                                    <td class=\"leaveremarksxian\">\n" + className + "                                    </td>\n" +
                        "                                    <td claas=\"leavedayxian\">" + item.th_name + "</td>\n" +
                        "                                    <td claas=\"leavedayxian\">" + item.se_Createdates + "</td>\n" +
                        "                                    <td>\n" +
                        "                                        <div>\n" +
                        "                                            <button class=\"btn btn-primary btn-xs selectid\">查看详情</button>" +
                        "                                            <input type=\"hidden\" value=\""+item.se_Id+"\">"+
                        "                                            <button class=\"btn btn-warning btn-xs deleteid\">删除</button>\n" +
                        "                                        </div>\n" +
                        "                                    </td>\n" +
                        "                                </tr>\n";
                });
                var pages = "<button class=\"yemian\" value='"+(exam.currentPage-1)+"'>< 上一页</button>";
                for (var i = 1; i <= exam.totalPages ; i++){
                       if (i == exam.currentPage){
                           pages += "<button class=\"yemian\" value=\""+i+"\" style=\"background-color: gainsboro\">"+i+"</button>"
                       }else {
                           pages += "<button class=\"yemian\" value=\""+i+"\" >"+i+"</button>"
                       }
                };
                pages += "<button class=\"yemian\" value='"+(exam.currentPage+1)+"'>下一页 ></button>"
                $("#showexam ").append(str);
                $("#curr").append(pages);
            },
            error: function () {

            }
        })
    }
</script>
</body>
</html>
