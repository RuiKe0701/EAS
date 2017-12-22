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
<body class="gray-bg" >



<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">



    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default collapsed">



                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>出勤管理</h>
                </div>
                <c:if test="${quan==3}">
                    <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <select id="class" onchange="selectmyclass(this.value)" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                <optgroup label="test" data-subtext="optgroup subtext">
                                    <option value="0">正在班级</option>
                                    <c:forEach items="${classteacherList}" var="ct">
                                        <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                    </c:forEach>
                                </optgroup>
                            </select>
                        </div>

                        <div class="col-md-5">
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="startday" class="form-control" style="font-size:12px;float:left;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">开始日期 </span>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5" style="padding-left: 0px;padding-top:8px">
                                <div class="input-group date" style="padding-left: 0px;">
                                    <input type="date" id="stopday" class="form-control" style="font-size:12px;float:left;">
                                    <span class=" input-group-addon " style="font-size:12px;background-color: white">结束日期 </span>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>



                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                              <span class="input-group-btn">
						<button class="btn btn-primary btn-xs"  id="seletclassname" type="button">
							查询
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                    </div>
                </c:if>
                <c:if test="${quan==1}">
                    <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <select id="class2"  class="selectpicker show-tick form-control" onchange="selectclass(this.value)" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                <optgroup label="test" data-subtext="optgroup subtext">
                                    <option value="1">s1</option>

                                    <option style="background-color: white;color: darkslategray" value="2">s2</option>

                                </optgroup>
                            </select>
                        </div>
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <select id="oldclass2" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
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
                                    <span class=" input-group-addon "  style="font-size:12px;">查询 </span>
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
                    <div class="col-sm-3">
                        <label>选择一个日期：
                        <input type="date">
                            <button class="btn btn-primary" id="selectall">查看所有班级</button>
                        </label>
                    </div>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
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
                                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary">保存</button>
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
                                    <td>${catd.cad_date}</td>
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

<script src="table/js/sweet-alert.min.js"></script>

<script src="select/js/bootstrap-select.js"></script>
<script>

    $(document).ready(function () {
        $('#datatable').dataTable();

        $('#datatables').dataTable();
    });

</script>
<script type="text/javascript">
    //查询所有班级根据具体日期
    function  selectall() {
        $("#selectall").click
    }
    //根据年级差班级
    function selectclass(){

    }
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
    function showstudentinfos() {
        $(".showstudentinfos").on("click",function(){

        });

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
    function selectmyclass(classid) {
        var ss=classid
        var startday=null;
        var stopday=null;
        $("#oldclass").val(0);
        alert($("#oldclass").val());
        selectclassatd(classid,startday,stopday)
    }
     function selectclassatd(classid,startday,stopday,classname) {

            $.ajax({
                type: "post",
                url: "/doselectclassatdss",
                data:{"classsid":classid,"startday":startday,"stopday":stopday,"classname":classname},
                dataType: "json",
                success: function (data) {
                    if(data==0){
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
                            "                                    <td>"+item.cad_date+"</td>\n" +
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
            var sss=""
        }

    $(function () {
        showstudentinfo();
        addstudent();
        seletclassname();
        showstudentinfos();
        $("body").on("click",".showstudentinfos",function(){
            alert("sds")
            parent.showstu(1);
        })
    })

</script>

</body>
</html>
