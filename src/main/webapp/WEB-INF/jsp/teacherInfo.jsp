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
<button id="tan" style="display: none;" data-toggle="modal" data-target="#myModal"></button>
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
    <div class="modal-dialog"  style="border-radius: 5px">
        <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
            <div class="modal-header">
                <h3 class="modal-title" id="name">新增教师信息</h3>
                <small class="font-bold">
                </small>
            </div>
            <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px">
                <form id="tea">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="input-group col-sm-6">
                                <span class="input-group-addon"><i class="fa fa-hand-spock-o"></i></span>
                                <input type="text" class="form-control"  id="th_name" name="th_name" placeholder="请输入姓名" value="">
                                <small style="color: red"></small>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择类型</label>
                            <div class="input-group col-sm-6 date">
                                <span class="input-group-addon"><i class="fa fa-user-plus"></i></span>
                                <select name="th_type" id="th_type" class="form-control">
                                    <c:forEach var="type" items="${requestScope.thTypes}">
                                        <option value="${type.ty_id}">${type.ty_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal" id="guan">关闭</button>
                <button type="button" id="shengban" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<button id="tan1" style="display: none;" data-toggle="modal" data-target="#myModal1"></button>
<div class="modal inmodal" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
    <div class="modal-dialog"  style="border-radius: 5px">
        <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
            <div class="modal-header">
                <h3 class="modal-title">新添账号信息</h3>
                <small class="font-bold">
                </small>
            </div>
            <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px">
                <form id="thlogin">
                    <div class="ibox-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择老师</label>
                            <div id="tetype" class="input-group col-sm-6">
                                <span class="input-group-addon"><i class="fa fa-hand-spock-o"></i></span>
                                <select id="th_id" name="th_id" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                    <optgroup label="test" data-subtext="optgroup subtext">
                                        <option value="0">选择教师</option>
                                        <c:forEach items="${requestScope.teacherInfos}" var="oc">
                                            <option value="${oc.th_id}">${oc.th_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择添加类型</label>
                            <div class="input-group col-sm-6 date">
                                <span class="input-group-addon"><i class="fa fa-user-plus"></i></span>
                                <select name="ty_id" id="ty_id" class="form-control">
                                    <c:forEach var="type" items="${requestScope.thTypes}">
                                        <option value="${type.ty_id}">${type.ty_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal" id="guansave">关闭</button>
                <button type="button" id="save" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">
    <div class="row">
        <div class="col-md-12">
            <div class="" style="background-color: white;border: 0.1px solid gainsboro">
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>老师及老师账号信息</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                    <c:if test="${sessionScope.thtype==2 || sessionScope.thtype==3}">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px;width: 150px">
                            <select id="status" class="selectpicker show-tick form-control" style="height: 20px;padding-top: 2px;padding-bottom: 2px;font-size: 12px" data-live-search="true">
                                <optgroup label="test" data-subtext="optgroup subtext">
                                    <option value="-1">正在班级</option>
                                    <option value="0" selected/>在职</option>
                                    <option value="1">离职</option>
                                </optgroup>
                            </select>
                        </div>
                    </c:if>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px;margin-right: 10px">
                        <button id="addteacher" class="btn btn-primary btn-xs" style="height: 34px">添加新老师信息</button>
                    </div>
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <button id="addoldteacher" class="btn btn-primary btn-xs" style="height: 34px">添加已有老师账号信息</button>
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
                                <th>教师姓名</th>
                                <th>任职类型</th>
                                <th>账号</th>
                                <th>密码</th>
                                <th>入职日期</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="showstu">
                            <c:forEach items="${requestScope.teachers}" var="sttdl">
                                <tr class="gradeX">
                                    <td class="leavestunamexian">${sttdl.teacher.th_name}</td>
                                    <td class="leaveremarksxian">${sttdl.ty_name}</td>
                                    <td class="leaveremarksxian">${sttdl.thl_number}</td>
                                    <td class="leaveremarksxian">${sttdl.thl_password }</td>
                                    <td class="leaveremarksxian">${sttdl.teacher.th_entrydates}</td>
                                    <td>
                                        <input type="hidden" value="${sttdl.teacher.th_id}"/>
                                        <button type="button" class="btn btn-xs btn-indigo deleteteacher" style="color: white">离职</button>
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

</section>
<!--end main content-->

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
<!--Common plugins-->
<script>
    $(document).ready(function () {
        $('#datatables').dataTable();
        $("#datatable").dataTable();

        $("#status").change(function () {
            if ($(this).val() != -1){
                ajaxTeacherByStatus($(this).val());
            }
        });
        $("#addteacher").click(function () {
            $("#tan").click();
        });

        $("#shengban").click(function () {
            addTeacher();
        });
        $("#addoldteacher").click(function () {
            $("#tan1").click();
        })
        $("#save").click(function () {
            addLogin();
        });
        $("#th_name").blur(function () {
            ajaxVerificationTeacherName();
        })
    });

    function ajaxVerificationTeacherName() {
        $.ajax({
            type:'post',
            url:'/verificationTeacherName.do',
            data:{"th_name": $("#th_name").val()},
            success:function (data) {
                $("#th_name").next().html("");
                if (data == 1){
                    $("#th_name").next().html("您输入的姓名是重复姓名");
                }
            },
            error:function () {

            }
        })
    }
    
    function initSelect() {
        $("#th_name").val("");
        $("#th_type option:first").prop("selected", 'selected');
        $("#th_id option:first").prop("selected", 'selected');
        $("#ty_id option:first").prop("selected", 'selected');
        $("#tetype").find(".filter-option").text("选择教师");
    }
    
    function sw(status) {
        if (status == 1){

        }else if(status == 2) {
            swal({
                title: "",
                text: "保存信息失败!",
                type: "error",
                showCancelButton: false,
                cancelButtonClass: 'btn-secondary ',
                confirmButtonClass: 'btn-success  ',
                confirmButtonText: '确定!'
            });
        }else if (status == 3){
            swal({
                title: "",
                text: "系统异常!",
                type: "error",
                showCancelButton: false,
                cancelButtonClass: 'btn-secondary ',
                confirmButtonClass: 'btn-success  ',
                confirmButtonText: '确定!'
            });
        }
    }
    
    function addTeacher() {
        $.ajax({
            type:'post',
            url:'/ajaxAddTeacherInfo.do',
            data:$("#tea").serialize(),
            datatype:'json',
            success:function (data) {
                if (data != 0){
                    var aa=JSON.parse(data)
                    swal({
                        title: "",
                        text: "保存信息成功!账号:"+aa.thl_number+" 初始密码:123456",
                        type: "success",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary ',
                        confirmButtonClass: 'btn-success  ',
                        confirmButtonText: '确定!'
                    });
                    ajaxTeacherByStatus($("#status").val());
                }else {
                    sw(2);
                }
            },
            error:function () {
                sw(3);
            }
        })
        $("#guan").click();
        initSelect();
    }
    function addLogin() {
        $.ajax({
            type:'post',
            url:'/ajaxOldTeacher.do',
            data:$("#thlogin").serialize(),
            success:function (data) {
                if (data == 0){
                    sw(2);
                }else if (data == -1){
                    swal({
                        title: "",
                        text: "此教师已有此权限账号,不可重复添加",
                        type: "error",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary ',
                        confirmButtonClass: 'btn-success  ',
                        confirmButtonText: '确定!'
                    });
                }else {
                    alert(data)
                    var aa=JSON.parse(data)
                    swal({
                        title: "",
                        text: "保存信息成功!账号:"+aa.thl_number+" 初始密码:123456",
                        type: "success",
                        showCancelButton: false,
                        cancelButtonClass: 'btn-secondary ',
                        confirmButtonClass: 'btn-success  ',
                        confirmButtonText: '确定!'
                    });
                    ajaxTeacherByStatus($("#status").val());
                }
            },
            error:function () {
                sw(3);
            }
        })
        $("#guansave").click();
        initSelect();
    }
    function ajaxTeacherByStatus(status) {
        $.ajax({
            type:'post',
            url:'/ajaxTeacherByStatus.do',
            data:{'teacher.th_status':status},
            success:function (data) {
                var str = '<table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">\n' +
                    '                            <thead>\n' +
                    '                            <tr>\n' +
                    '                                <th>教师姓名</th>\n' +
                    '                                <th>任职类型</th>\n' +
                    '                                <th>账号</th>\n' +
                    '                                <th>密码</th>\n' +
                    '                                <th>入职日期</th>\n' +
                    '                                <th>操作</th>\n' +
                    '                            </tr>\n' +
                    '                            </thead>\n' +
                    '                            <tbody id="showstu">';
                var da = eval(data);
                if (da != 0){
                    $.each(da,function (i,item) {
                        str+=" <tr class=\"gradeX\">\n" +
                            "                                    <td class=\"leavestunamexian\">"+item.teacher.th_name+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.ty_name+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.thl_number+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.thl_password+"</td>\n" +
                            "                                    <td class=\"leaveremarksxian\">"+item.teacher.th_entrydates+"</td>\n" +
                            "                                    <td><input type=\"hidden\" value=\""+item.teacher.th_id+"\"/>\n" +
                            "                                        <button type=\"button\" class=\"btn btn-xs btn-indigo deleteteacher\" style=\"color: white\">离职</button></td>\n" +
                            "                                </tr>";
                    })
                }
                str+="</tbody>\n" +
                    "                        </table>";
                $("#classatd").html(str);
                $('#datatables').dataTable();
                $("#datatable").dataTable();
            },
            error:function () {

            }
        })
    }
</script>
</body>
</html>