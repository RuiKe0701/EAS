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
                    <c:if test="${sessionScope.thtype==2 || sessionScope.thtype==3}">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">

                        <select id="gread_id" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">选择年级</option>
                                <c:if test="${sessionScope.thtype == 2}">
                                    <c:if test="${requestScope.stuScore.gread_id==1}">
                                        <option style="background-color: white;color: darkslategray" value="1" selected >S1</option>
                                        <option style="background-color: white;color: darkslategray" value="2">S2</option>
                                    </c:if>
                                    <c:if test="${requestScope.stuScore.gread_id==2}">
                                        <option style="background-color: white;color: darkslategray" value="1">S1</option>
                                        <option style="background-color: white;color: darkslategray" value="2" selected>S2</option>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.thtype == 3}">
                                    <c:if test="${requestScope.stuScore.gread_id==3}">
                                        <option style="background-color: white;color: darkslategray" value="3" selected >Y2</option>
                                        <option style="background-color: white;color: darkslategray" value="4">学士后</option>
                                    </c:if>
                                    <c:if test="${requestScope.stuScore.gread_id==4}">
                                        <option style="background-color: white;color: darkslategray" value="3">Y2</option>
                                        <option style="background-color: white;color: darkslategray" value="4" selected>学士后</option>
                                    </c:if>
                                </c:if>
                            </optgroup>
                        </select>
                    </div>
                    </c:if>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="class" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">正在班级</option>
                                <c:forEach items="${requestScope.classes}" var="ct">
                                    <c:if test="${ct.class_state==0}">
                                        <c:if test="${ct.class_id == requestScope.stuScore.class_id}">
                                            <option style="background-color: white;color: darkslategray" value="${ct.class_id}" selected>${ct.class_name}</option>
                                        </c:if>
                                        <c:if test="${ct.class_id != requestScope.stuScore.class_id}">
                                            <option style="background-color: white;color: darkslategray" value="${ct.class_id}" >${ct.class_name}</option>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="oldclass" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">历史班级</option>
                                <c:forEach items="${requestScope.classes}" var="ct">
                                    <c:if test="${ct.class_state==1}">
                                        <c:if test="${ct.class_id == requestScope.stuScore.class_id}">
                                            <option style="background-color: white;color: darkslategray" value="${ct.class_id}" selct>${ct.class_name}</option>
                                        </c:if>
                                        <c:if test="${ct.class_id != requestScope.stuScore.class_id}">
                                            <option style="background-color: white;color: darkslategray" value="${ct.class_id}" >${ct.class_name}</option>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="classexam"  class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">选择班级考试</option>
                                <c:forEach items="${requestScope.classExams}" var="oc" varStatus="status">
                                    <c:if test="${oc.ce_Id==stuScore.ce_Id}">
                                        <option value="${oc.ce_Id}" selected>${oc.ce_Name}</option>
                                    </c:if>
                                    <c:if test="${oc.ce_Id!=stuScore.ce_Id}">
                                        <option value="${oc.ce_Id}">${oc.ce_Name}</option>
                                    </c:if>
                                </c:forEach>
                            </optgroup>
                        </select>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <select id="classstu"  class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                            <optgroup label="test" data-subtext="optgroup subtext">
                                <option value="0">学员选择</option>
                                <c:forEach items="${requestScope.stus}" var="oc">
                                    <option value="${oc.stu_id}">${oc.stu_name}</option>
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
                                <th>学员姓名</th>
                                <th>考试名</th>
                                <th>参加日期</th>
                                <th>笔试</th>
                                <th>机试</th>
                                <th>平均</th>
                            </tr>
                            </thead>
                            <tbody id="showstu">
                            <c:forEach items="${requestScope.stuScores}" var="sttdl">
                                <tr class="gradeX">
                                    <td class="leavestunamexian">${sttdl.stu_name}</td>
                                    <td class="leaveremarksxian">${sttdl.ce_Name}</td>
                                    <td class="leaveremarksxian">${sttdl.ce_Examdays}</td>
                                    <td class="leaveremarksxian">${sttdl.stuc_Wtscores}</td>
                                    <td class="leaveremarksxian">${sttdl.stuc_Ctscores}</td>
                                    <td class="leaveremarksxian">${sttdl.stuc_Avgscores}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--<div id="curr" style="float: right">--%>
                            <%--<button class="yemian" value="${requestScope.schoolExams.currentPage-1}">< 上一页</button>--%>
                            <%--<c:forEach begin="1" end="${requestScope.schoolExams.totalPages}" var="i">--%>
                                <%--<c:if test="${i == requestScope.schoolExams.currentPage}">--%>
                                    <%--<button class="yemian" value="${i}" style="background-color: gainsboro">${i}</button>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${i != requestScope.schoolExams.currentPage}">--%>
                                    <%--<button class="yemian" value="${i}">${i}</button>--%>
                                <%--</c:if>--%>
                            <%--</c:forEach>--%>
                            <%--<button class="yemian"value="${requestScope.schoolExams.currentPage+1}" >下一页 ></button>--%>
                        <%--</div>--%>
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
        $("#class").change(function () {
            var str = $("#gread_id").val()==null?"" :"&gread_id="+$("#gread_id").val();
           window.location.href='/tzstuscoreinfo.do?class_id='+$(this).val()+str;
        });
        $("#oldclass").change(function () {
            var str = $("#gread_id").val()==null?"" :"&gread_id="+$("#gread_id").val();
            window.location.href='/tzstuscoreinfo.do?class_id='+$(this).val()+str;
        });
        $("#classexam").change(function () {
            var class_id = $("#class").val();
            if (class_id == 0){
                class_id = $("#oldclass").val();
            }
            ajaxClassExamByClassId(class_id,$(this).val())
        })
        $("#gread_id").change(function () {
            window.location.href='/tzstuscoreinfo.do?gread_id='+$(this).val();
        })
        
        $("#classstu").change(function () {
            var class_id = $("#class").val();
            if (class_id == 0){
                class_id = $("#oldclass").val();
            }
            if($(this).val() != 0){
                ajaxStu_id(class_id,$(this).val());
            }
        });
    });
    function ajaxStu_id(class_id,stu_id) {
        $.ajax({
            type:'post',
            url:'/ajaxstuscoreinfo.do',
            data:{'class_id':class_id,'stu_id':stu_id},
            success:function (data) {
                $("#showstu").html("");
                var str = "";
                if (data != 0){
                    var da = eval(data);
                    $.each(da,function (i, item) {
                        str+="<tr class=\"gradeX\">\n" +
                            "                                    <td class=\"leavestunamexian\">"+item.stu_name+"</td>\n" +
                            "<td class=\"leaveremarksxian\">"+item.ce_Name+"</td>" +
                            "                                    <td class=\"leaveremarksxian\">"+item.ce_Examdays+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Wtscores+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Ctscores+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Avgscores+"</td>\n" +
                            "</tr>";
                    })
                }
                $("#showstu").html(str);
            },
            error:function () {

            }
        })
    }



    function ajaxClassExamByClassId(class_Id,ce_Id) {
        $.ajax({
            type:'post',
            url:'/ajaxstuscoreinfo.do',
            data:{'class_id':class_Id,'ce_Id':ce_Id},
            success:function (data) {
                $("#showstu").html("");
                var str = "";
                if (data != 0){
                    var da = eval(data);
                    $.each(da,function (i, item) {
                        str+="<tr class=\"gradeX\">\n" +
                            "                                    <td class=\"leavestunamexian\">"+item.stu_name+"</td>\n" +
                            "<td class=\"leaveremarksxian\">"+item.ce_Name+"</td>" +
                            "                                    <td class=\"leaveremarksxian\">"+item.ce_Examdays+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Wtscores+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Ctscores+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.stuc_Avgscores+"</td>\n" +
                            "</tr>";
                    })
                }
                $("#showstu").html(str);
            },
            error:function () {

            }
        })
    }
</script>
</body>
</html>