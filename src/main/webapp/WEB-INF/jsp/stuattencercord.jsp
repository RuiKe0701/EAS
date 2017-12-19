<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/11 0011
  Time: 12:48
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

    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">新增班级考试</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i>考试名称：</div>
                            <div class="col-md-5" style="padding-left: 15px">
                                <input value="" placeholder="请输入考试名" style="height: 28px;padding-left: 5px">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 10px">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #5db85d"></i>考试类型：</div>
                            <div class="col-md-5" style="padding-left: 15px">  <select class="btn-indigo" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                <option style="background-color: white;color: #2b303a" value="0">自定义</option>
                                <option style="background-color: white;color: #2b303a" value="1">月考</option>
                                <option style="background-color: white;color: #2b303a" value="2">结业考试</option>
                            </select></div>
                        </div>
                        <div class="row"  style="padding-top: 10px">
                            <div class="col-sm-3"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #5cc0de"></i> 参与考试 ：</div>
                            <div class="col-md-5" style="padding-left: 15px">  <select class="btn-indigo" id="leaveclass" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                <c:forEach items="${classteacherList}" var="ct">
                                    <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                </c:forEach>
                            </select></div>
                        </div>



                        <div class="row" style="padding-top: 15px">
                            <div class="col-lg-3"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #f8ac5a"></i>考试日期 ：</div>
                            <div class="col-md-4" style="padding-left: 15px">
                                <input id=""  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px">
                            <div class="col-lg-3"></div>
                            <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #f8ac5a"></i>考试说明 ：</div>
                            <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><textarea style="height: 50px"></textarea></div>
                        </div>
                        <div class="row" style="">
                            <div class="col-lg-3"></div>

                        </div>

                    </div>
                </div>
                <div class="modal-footer" id="dibu">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                    <input value="" type="hidden" id="leaveleaveid">
                    <button type="button" id="baochustuleave" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
        <div class="modal-dialog"  style="border-radius: 5px">
            <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
                <div class="modal-header">

                    <h3 class="modal-title" id="name">20170701班第27次考勤情况</h3>
                    <small class="font-bold">
                    </small>
                </div>
                <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px" id="modalbody">


                    <div class="row">
                        <div class="panel-body " id="tables" style="background-color: white">
                            <div >
                                <table id="datatables" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
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
                                            <input type="hidden" value="80" class="stutotalscore"> </td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                    </tr>

                                    <tr class="ldivwai">

                                        <td>副学研<input type="hidden" value="3" class="stuid">
                                            <input type="hidden" value="80" class="stutotalscore"> </td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                        <td><span class="label label-warning">2020</span></td>
                                    </tr>

                                    <tr class="ldivwai">

                                        <td>副学研<input type="hidden" value="3" class="stuid">
                                            <input type="hidden" value="80" class="stutotalscore"> </td>
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



                    <div class="col-md-1" style="padding-top: 15px;padding-left: 0px">
                        <select class="btn-indigo" id="classid" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                            <c:forEach items="${classteacherList}" var="ct">
                                <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                            </c:forEach>
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

                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
                </div>
                <div class="panel-body " id="tabless">
                    <div id="classatd">
                        <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                            <thead>
                            <tr>
                                <th>班级名称</th>
                                <th>学生姓名</th>
                                <th>学员正常出勤</th>
                                <th>班级考勤次数</th>
                                <th>学生出勤率</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="showstu">
                            <c:forEach var="ss" items="${stuattendanceList}">
                            <tr class="gradeX">
                                <td class="leaveclassnamexian">${ss.classname}</td>
                                <td class="leavestunamexian">${ss.stuname}</td>
                                <td class="leaveremarksxian">${ss.attendancetime}&nbsp;</td>
                                <td class="leaveremarksxian">${ss.classattendancetime}&nbsp;</td>
                                <c:if test="${ss.attendancerate>=90}">
                                <td class="leaveremarksxian"><span>${ss.attendancerate}%</span>&nbsp;<span class="label label-success">优秀</span></td>
                            </c:if>
                                <c:if test="${ss.attendancerate>=80 && ss.attendancerate<90}">
                                    <td class="leaveremarksxian"><span>${ss.attendancerate}%</span>&nbsp;<span class="label label-primary">良好</span></td>
                                </c:if>
                                <c:if test="${ss.attendancerate>=70 && ss.attendancerate<80}">
                                    <td class="leaveremarksxian"><span>${ss.attendancerate}%</span>&nbsp;<span class="label label-indigo">一般</span></td>
                                </c:if>
                                <c:if test="${ss.attendancerate<=70}">
                                    <td class="leaveremarksxian"><span>${ss.attendancerate}%</span>&nbsp;<span class="label label-warning">很差</span></td>
                                </c:if>
                                <td>
                                    <input value="${ss.stu_id}" type="hidden" class="sadid">
                                    <button class="btn btn-xs btn-primary xiangqing" >出勤详情</button>
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
    <button type="button" type="button" id="ssss">sss</button>
    <button type="" data-toggle="modal" data-target="#myModal3" id="xiugaixian" style="display: none"></button>
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
    $(function () {
        xiangiqng();
        selelctbyclassid();
        selectbyoldclassid();
        cc();
    })
    function cc() {
        $("#ssss").click(function () {
            alert(s)
        })
    }

    function xiangiqng() {
        $(".xiangqing").click(function () {
            var newclass=$("#classid").val();
            var oldclass=$("#oldclass").val();
            var b=$(this).parent().find(".sadid").val();
            var a;
            var d;
            if(newclass!=null){
                a=newclass;
                d=0;
            }else {
                a=oldclass;
                d=1;
            }
            parent.addstuattebcercorerecord(a,b,d);
            })
    }
    function selelctbyclassid() {
        $("#classid").change(function () {
            var classid=$(this).val();
            selelctbyclassidajax(classid);
       })
    }
    function selectbyoldclassid() {
        $("#oldclass").change(function () {
            var classid=$(this).val();
            selelctbyclassidajax(classid);
        })
    }
    function selelctbyclassidajax(classid) {
        $.ajax({
            type: "post",
            url: "/selectstuadtbyclassid",
            data: {"classid": classid},
            dataType: "json",
            success: function (data) {
                $("#classatd").html("");
                var str=" <table id=\"datatable\"" +
                    " class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                    "                            <thead>\n" +
                    "                            <tr>\n" +
                    "                                <th>班级名称</th>\n" +
                    "                                <th>学生姓名</th>\n" +
                    "                                <th>学员正常出勤</th>\n" +
                    "                                <th>班级考勤次数</th>\n" +
                    "                                <th>学生出勤率</th>\n" +
                    "                                <th>操作</th>\n" +
                    "                            </tr>\n" +
                    "                            </thead>\n" +
                    "                            <tbody id=\"showstu\">"
                $.each(data, function (i, item) {
                    var c=""
                    if(item.attendancerate>=90){
                        c="<span class=\"label label-success\">优秀</span>";
                    }else if(item.attendancerate>=80){
                        c="<span class=\"label label-primary\">良好</span>";
                    }else if(item.attendancerate>=70){
                        c="<span class=\"label label-indigo\">一般</span>";
                    }else if(item.attendancerate>=60){}
                    str+="   <tr class=\"gradeX\">\n" +
                        "                                <td class=\"leaveclassnamexian\">"+item.classname+"</td>\n" +
                        "                                <td class=\"leavestunamexian\">"+item.stuname+"</td>\n" +
                        "                                <td class=\"leaveremarksxian\">"+item.attendancetime+"&nbsp;</td>\n" +
                        "                                <td class=\"leaveremarksxian\">"+item.classattendancetime+"&nbsp;</td>"+
                        " <td class=\"leaveremarksxian\"><span>"+item.attendancerate+"%</span>&nbsp;"+c+"</td>\n" +
                        "    <td>\n" +
                        "                                    <input value="+item.stu_id+" type=\"hidden\" class=\"sadid\">\n" +
                        "                                    <button class=\"btn btn-xs btn-primary xiangqing\" >出勤详情</button>\n" +
                        "                                </td>\n" +
                        "                            </tr>"
                })
                str+=" </tbody></table>\n"
                $("#classatd").append(str);
                $('#datatable').dataTable();
            }, error: function () {
                swal({
                    title: "Sorry!",
                    text: "SORRY!系统异常，请稍后再试！",
                    type: "error",
                    showCancelButton: false,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }
        })

    }
</script>

</body>
</html>
