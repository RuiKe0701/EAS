<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加新的学员信息 </h5><a href="javascript:history.back(-1)">点击返回</a>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form method="get" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_name}">
                            </div>
                            <label class="col-sm-2 control-label">学号</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_no}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_sex}">
                            </div>
                            <label class="col-sm-2 control-label">出生日期</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_birthday}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_phone}">
                            </div>
                            <label class="col-sm-2 control-label">入学日期</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_startday}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group" id="data_2">
                            <label class="col-sm-2 control-label">家长电话</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_parentphone}">
                            </div>
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_email}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证</label>

                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_carde}">
                            </div>
                            <label class="col-sm-2 control-label">学历</label>

                            <div class="col-sm-2">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_education}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">

                            <label class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-primary btn-sm" style="background-color: #5db85d">
                                    ${stu.class_id}</button></div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">地址</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control "  readonly="readonly" value="${stu.stu_address}">
                            </div>

                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">保存内容</button>
                                <button class="btn btn-white" type="submit">取消</button>
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
<script src="js/demo/form-advanced-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>




