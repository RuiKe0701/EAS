<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 基本表单</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加新的学员信息 <a href="javascript:history.back(-1)">点击返回</a></h5>
                </div>
                <div class="ibox-content">
                    <form id="classform" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择班级类型</label>
                            <div class="col-sm-6">
                                <select name="grade_id" class="form-control">
                                    <option value="1">ACCP</option>
                                    <option value="4">学士后</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">输入班级名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="class_name" name="class_name"  placeholder="请填写班级名">
                                <span style="color: red"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择班主任</label>
                            <div class="col-sm-6">
                                <select name="th_id" id="th_id" class="form-control">
                                    <c:forEach var="teacher" items="${requestScope.teachers}">
                                        <option value="${teacher.th_id}">${teacher.th_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group" id="data_2">
                            <label class="col-sm-2 control-label">开班日期</label>
                            <div class="col-sm-6">
                                <input type="date" id="class_startday" name="class_startday" class="form-control" value="2017-11-11">
                                <span style="color: red"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary btn-xs" type="button" id="insert">保存学员</button>
                                <button class="btn-xs btn btn-white" type="submit">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.5"></script>
<script src="js/content.min.js?v=1.0.0"></script>

<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script src="js/plugins/switchery/switchery.js"></script>

<script src="js/plugins/cropper/cropper.min.js"></script>
<script src="table/js/sweet-alert.min.js"></script>
<%--<script src="js/demo/form-advanced-demo.min.js"></script>--%>
<%--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>--%>
<%--<script src="js/plugins/iCheck/icheck.min.js"></script>--%>
<script>

</script>

<script type="text/javascript" >
    $(function () {
        $("#class_name").blur(function () {
            yanzhengname();
        });
        $("#insert").click(function () {
            classSubmit();
        });
    });
    function yanzhengday() {
        var day = $("#class_startday").val();
        if (day == ''){
            $("#class_startday").next().html("开班日期不得为空!")
            return false;
        }
        return true;
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
    
    function classSubmit() {
        var boo =  yanzhengname() & yanzhengday();
        if (boo) {
            $.ajax({
                type: "POST",
                url: "/addclassandteacher",
                data: $("#classform").serialize(),
                success: function (data) {
                    if (data == 1) {
                        swal("Seccess!", "添加班级成功!", "success");
                    }else {
                        swal("Cancelled", "添加班级失败!", "error");
                    }
                },
                error: function () {
                    swal("Cancelled", "系统发生异常!", "error");
                }
            })
        }
    }
</script>
<%--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>--%>
</body>

</html>