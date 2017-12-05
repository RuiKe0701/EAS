<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 联系人</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link rel="stylesheet" href="table/css/metismenu.min.css">
    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <!--template css-->
    <link href="table/css/style.css" rel="stylesheet">
    <style type="text/css">
        .ldivwai{
            float: left;margin-right: 17px;margin-top: 20px;border: 2px solid #ffffff;border-radius: 3px;background-color: #ffffff;
            box-shadow: 1px 1px 3px;
        }
        .ltable{
            height:80px;width: 210px;display: table;float: left
        }
        .ltselect{
            background-color: #5cc0de;border: 0;border-radius: 3px;color: white;height: 22px;width: 88px;
        }
        .ltsop{
            background-color: white;color: #2A2E36
        }
    </style>
</head>

<body class="gray-bg">
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
    <div class="modal-dialog"  style="border-radius: 5px">
        <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
            <div class="modal-header">

                <h3 class="modal-title" id="name">20170701升班</h3>
                <small class="font-bold">
                </small>
            </div>
            <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px">
                <div class="ibox-content">
                        <input type="hidden" id="class_id" name="class_id" value="${requestScope.classteachers[0].class_id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新班名</label>
                        <div class="input-group col-sm-6">
                            <span class="input-group-addon"><i class="fa fa-hand-spock-o"></i></span>
                            <input type="text" class="form-control"  id="class_name" name="class_name" placeholder="请输入新班名" value="">
                            <small style="color: red"></small>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开班日期</label>
                            <div class="input-group col-sm-6">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="date" class="form-control" name="startday" id="startday" value="2014-11-11">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新班主任</label>
                            <div class="input-group col-sm-6 date">
                                <span class="input-group-addon"><i class="fa fa-user-plus"></i></span>
                                <select name="th_id" id="th_id" class="form-control">
                                    <c:forEach var="teacher" items="${requestScope.teachers}">
                                        <option value="${teacher.th_id}">${teacher.th_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">升班后年级</label>
                            <div class="input-group col-sm-6 date">
                                <span class="input-group-addon"><i class="fa fa-graduation-cap"></i></span>
                                <select name="grade_id" id="grade_id" class="form-control">
                                    <option value="1">S1</option>
                                    <option value="2">S2</option>
                                    <option value="3">Y2</option>
                                </select>
                            </div>
                        </div>
                </div>

            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-white" data-dismiss="modal" id="guan">关闭</button>
                <button type="button" id="shengban" class="btn btn-primary">升班</button>
            </div>
        </div>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-md-12" style="padding-bottom: -30px">
                <div class="panel panel-default collapsed">
                    <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 15px;">
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <select style="background-color: #7c86cb;height: 35px;color: white;border-radius: 5px" id="myclass" >
                                <c:forEach var="ct" items="${requestScope.classteachers}">
                                    <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classes.class_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                            <span class="input-group-btn">
						        <button class="btn btn-primary btn-xs" style="height: 35px;"  id="upclass" type="button" >开 始 升 班</button>
					            <button id="tan" style="display: none;" data-toggle="modal" data-target="#myModal"></button>
                            </span>
                            </div><!-- /input-group -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="biaoshi">
                <div class="panel-heading" style="margin-top: -5px;margin-bottom: -20px;">
                    <h5>选择升班学生</h5>
                </div>
                <c:forEach items="${requestScope.stuList}" var="stu">
                    <div class="ldivwai">
                <table  class="ltable">
                    <tr>
                        <td rowspan="6" style="width:78px;height: 80px">
                            <img src="ss/559.PNG" style="margin-left:3px;margin-right:7px;width:70px;height: 70px;border-radius:50px;border: solid 3px #5db85d;">
                        </td>
                    </tr>
                    <tr style="height:12px "><td></td></tr>
                    <tr style="height:16px;font-size: 13px"><td><span style="border-bottom: 0.1px solid gainsboro;padding-bottom: 3px">
                                    <input type="hidden" value="1" class="stuid">
                                    <input type="hidden" value="80" class="stutotalscore">
                                    <span sty>姓名：</span><span>${stu.stu_name}</span></span></td></tr>
                    <tr style="height:16px;font-size: 12px "><td><span >学号：</span><span>${stu.stu_no}</span></td></tr>
                    <tr style="height:22px;font-size: 13px "><td>
                        <div>
                            <input type="hidden"  value="${stu.stu_id}">
                            <select class="ltselect">
                                <option class="ltsop" value="1">升班</option>
                                <option class="ltsop" value="2">离校</option>
                            </select>
                        </div>
                    </td></tr>
                    <tr style="height:9px "><td></td></tr>
                </table>
            </div>
                </c:forEach>
            </div>

        </div>
    </div>
<script src="table/js/jquery.min.js"></script>
<script src="table/js/bootstrap.min.js"></script>
    <script src="table/js/sweet-alert.min.js"></script>
    <script>
        alert("注意选择学生是否离校状态!")
//        var count = 0;
//        $(document).ready(function() {
//            $(window).scroll(function() {
//                if ($(document).scrollTop() >= $(document).height() - $(window).height() && count == 0) {
//                    count = 1;
//                    $("#upclass").show();
//                }
//            });
//        });
        $(function () {
            classChange();
            $("#myclass").change(function () {
                $("#class_id").val($(this).val());
            });
            $("#shengban").click(function () {
                ajaxUpClass();
            });
            $("#class_name").blur(function () {
                yanzhengname();
            });

            upclass();
            guan();
        });
        
        function classChange() {
            $("#myclass").change(function () {
                var class_id = $(this).val();
                $("#biaoshi").find(".ldivwai").remove();
                $.ajax({
                    type: "post",
                    url: "/showclassstuinfo",
                    data:{"classid" : class_id},
                    dataType: "json",
                    success: function (data) {
                        var da = eval(data);
                        var str = "";
                        $.each(da,function (i,item) {
                            str+="<div class=\"ldivwai\">\n" +
                                "                <table  class=\"ltable\">\n" +
                                "                    <tr>\n" +
                                "                        <td rowspan=\"6\" style=\"width:78px;height: 80px\">\n" +
                                "                            <img src=\"ss/559.PNG\" style=\"margin-left:3px;margin-right:7px;width:70px;height: 70px;border-radius:50px;border: solid 3px #5db85d;\">\n" +
                                "                        </td>\n" +
                                "                    </tr>\n" +
                                "                    <tr style=\"height:12px \"><td></td></tr>\n" +
                                "                     <tr style=\"height:16px;font-size: 13px\"><td><span style=\"border-bottom: 0.1px solid gainsboro;padding-bottom: 3px\">\n" +
                                "                                    <input type=\"hidden\" value=\"1\" class=\"stuid\">\n" +
                                "                                    <input type=\"hidden\" value=\"80\" class=\"stutotalscore\">\n" +
                                "                                    <span sty>姓名：</span><span>"+item.stu_name+"</span></span></td></tr>\n" +
                                "                    <tr style=\"height:16px;font-size: 12px \"><td><span >学号：</span><span>"+item.stu_no+"</span></td></tr>\n" +
                                "                    <tr style=\"height:22px;font-size: 13px \"><td>\n" +
                                "                        <div>\n" +
                                "                            <input type=\"hidden\"  value=\""+item.stu_id+"\">\n" +
                                "                            <select class=\"ltselect\">\n" +
                                "                                <option class=\"ltsop\" value=\"1\">升班</option>\n" +
                                "                                <option class=\"ltsop\" value=\"2\">离校</option>\n" +
                                "                            </select>\n" +
                                "                        </div>\n" +
                                "                    </td></tr>\n" +
                                "                    <tr style=\"height:9px \"><td></td></tr>\n" +
                                "                </table>\n" +
                                "            </div>\n"
                        })
                        $("#biaoshi").append(str);
                    }
                })
            });
        }
        function upclass() {
            $("#upclass").click(function () {
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
                    $("#tan").click();
                });

            })
        }
        function shengban() {
            $("#shengban").click(function () {
                swal({
                    title: "",
                    text: "恭喜您升班成功!",
                    type: "success",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary ',
                    confirmButtonClass: 'btn-success  ',
                    confirmButtonText: '确定!'
                });

            })
        }

        function guan() {
            $("#guan").click(function () {
                swal({
                    title: "Are you sure?",
                    text: "您已取消了升班!",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            })
        }
        function studentid() {
            var stuarr = new Array();
            $(".ldivwai").each(function (i,item) {
                var va = $(item).find("select").val();
                if (va == 1){
                    var obj = new Object();
                    obj.stu_id = $(item).find("select").prev().val();
                    stuarr.push(obj);
                }
            })
            return JSON.stringify(stuarr);
        };
        
        function ajaxUpClass() {
            var startday = $("#startday").val();
            var th_id = $("#th_id").val();
            var class_id = $("#class_id").val();
            var grade_id = $("#grade_id").val();
            var class_name = $("#class_name").val();

            var cla = new Object();
            cla.class_id = class_id;
            cla.class_name = class_name;
            cla.grade_id = grade_id;
            var classteacher = new Object();
            classteacher.teacher_id = th_id;
            classteacher.ct_startday = startday;

            var classstus = studentid();

//            alert(JSON.stringify(classstus));
//            alert(JSON.stringify(classteacher));
//            alert(JSON.stringify(cla));
            $.ajax({
                type: "post",
                url: "/stuupgraded",
                data:{
                    "cls" : classstus,
                    "classteacher"  :JSON.stringify(classteacher),
                    "cla" : JSON.stringify(cla)
                },
                dataType: "json",
                success: function (data) {
                    $("#guan").click();
                    if (data == 1){
                        swal("Seccess!", "升班成功!", "success");
                    }else {
                        var  str;
                        if (data == -1){
                            str = "修改原来班级失败!";
                        } else if (data == -2){
                            str = "修改旧班的老师班级失败!";
                        } else if (data == -3){
                            str = "增加新班级失败!";
                        } else if (data == -4 || data == -5){
                            str = "将学生添加到新班级失败!";
                        }else {
                            str="升班失败!";
                        }
                        swal("Cancelled", str, "error");
                    }
                },
                error: function () {
                    $("#guan").click();
                    swal({
                        title: "",
                        text: "系统出现异常!",
                        type: "error",
                        showCancelButton: true,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: 'Danger!'
                    });
                }
            });
        }

        function yanzhengname() {
            var class_name = $("#class_name").val();
            if (class_name == ''){
                $("#class_name").next().html("班级名不得为空!")
                return false;
            }
            var boo = false;
            $.ajax({
                type: "POST",
                url:  "/verificationclass_name",
                data: {'class_name':class_name},
                async:false,
                success: function(data) {
                    if (data == 1){
                        $("#class_name").next().html("班级名重复!请重新填写!");
                        $("#class_name").focus();
                    }else {
                        boo = true;
                        $("#class_name").next().html("");
                    }
                }
            });
            return boo;
        }
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>