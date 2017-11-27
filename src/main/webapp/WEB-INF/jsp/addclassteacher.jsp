<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 18:13
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
<style type="text/css">
    body{
        zoom:90%
    }

</style>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加新的学员信息 <a href="javascript:history.back(-1)">点击返回</a></h5>
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
                    <form id="cteacher" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">班级名</label>
                            <div class="col-sm-6">
                                <input  name="class_id"  type="hidden" class="form-control " value="${requestScope.classid}" >
                                <input disabled="disabled" type="text" class="form-control " value="${requestScope.classname}" >
                            </div>
                        </div>
                        <%--分隔线--%>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择老师类型</label>
                            <div class="col-sm-6">
                                <select id="classtype" name="tetype" style="height: 34px;width:120px">
                                    <option value="-1">请选择老师类型</option>
                                    <option value="0">班主任</option>
                                    <option value="1">教员</option>
                                </select>
                                <select id="teacher_id" name="teacher_id" style="height: 34px;width:120px" >

                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">选择任教类型</label>
                            <div class="col-sm-6">
                                <select id="ct_type" name="ct_type" style="height: 34px;width:120px">
                                    <option value="0">班主任</option>
                                    <option value="1">主教员</option>
                                    <option value="2">辅教员</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">填写备注</label>
                            <div class="col-sm-6">
                                <textarea name="remarks" style="outline:none;resize:none;overflow: hidden" rows="10" cols="100"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <input type="hidden" name="sta" value="" >
                                <button id="clasum" class="btn btn-primary" type="button">保存内容</button>
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


<script type="text/javascript">

        $(document).ready(function(){
//            $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
            $("#classtype").change(function () {
                teacherTypeChage($(this).val());
            });
            $("#clasum").click(function () {
                submitClassTea();
            })
        });

        function submitClassTea() {
            $.ajax({
                cache: true,
                type: "POST",
                url:  "/addclassteacherinfo",
                data: $('#cteacher').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                    if (data == 1){
                        alert("保存成功")
                    }else{
                        alert("保存失败")
                    }
                }
            });
        }
        
        function teacherTypeChage(index) {
            if (index >= 0){
                $.ajax({
                    type:"post",
                    url:"/ajaxteacherinfo",
                    data:{'th_type':index},
                    datatype:"json",
                    success: function (data) {
                        str="";
                        var da = eval(data);
                        $.each(da,function (i,item) {
                            str+="<option value=\""+item.th_id+"\">"+item.th_name+"</option>"
                        })
                        $("#teacher_id").html(str);
                    },error:function (data) {
                        alert(data);
                    }
                })
            }else{
                $("#teacher_id").html('');
            }
        }
</script>


</body>

</html>