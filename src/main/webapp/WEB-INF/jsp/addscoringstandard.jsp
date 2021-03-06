<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22 0022
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Bootstrap3 表单构建器</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

    <style>
        .droppable-active{background-color:#ffe!important}.tools a{cursor:pointer;font-size:80%}.form-body .col-md-6,.form-body .col-md-12{min-height:400px}.draggable{cursor:move}
    </style>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  " >

    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-3"></div>
            <div class="col-sm-6" >
                <div class="ibox float-e-margins ">
                    <div class="ibox-title">
                        <h5>新增评分项</h5><a href="javascript:history.back(-1)">点击返回</a>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_editors.html#">选项1</a>
                                </li>
                                <li><a href="form_editors.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="alert alert-info">
                            拖拽左侧的表单元素到右侧区域，即可生成相应的HTML代码，表单代码，轻松搞定！
                        </div>
                        <form role="form" class="form-horizontal m-t" >
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">评分项：</label>
                                <div class="col-sm-9">
                                    <input type="text" name="ss_name" id="ss_name" class="form-control" placeholder="评分项">
                                    <span class="help-block m-b-none">评分项名字</span>
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">分数
                                    ：</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="ss_fraction" id="ss_fraction" placeholder="评分分数">
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">处理：</label>
                                <div class="col-sm-9">
                                    <select class="form-control" name="ss_way" id="ss_way">
                                        <option value="1">加分</option>
                                        <option value="0">减分</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">类型：</label>
                                <div class="col-sm-9">
                                    <select class="form-control" name="ss_type" id="ss_type">
                                        <option value="0">考勤</option>
                                        <option value="1">其他</option>

                                    </select>
                                </div>
                            </div>


                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">
                                <div class="col-sm-12 col-sm-offset-3">
                                    <button class="btn btn-primary" type="button" id="doaddssd">保存内容</button>
                                    <button class="btn btn-white" type="submit">取消</button>
                                </div>
                            </div>
                            <input value="${jieguo}" id="jieguo" type="hidden">
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.5"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script src="js/jquery-ui-1.10.4.min.js"></script>
<script src="js/plugins/beautifyhtml/beautifyhtml.js"></script>

<script type="text/javascript">
    function check() {
            $("#doaddssd").click(function () {
                var ss_name = $("#ss_name").val();
                var ss_fraction = $("#ss_fraction").val()
                if (ss_name == "") {
                    alert("评分项不能为空！sss")
                    return;
                }
                if (ss_fraction == "") {
                    alert("分数不能为空！")
                    return;
                }
                var ss_way = $("#ss_way").val();
                var ss_type = $("#ss_type").val();
                $.ajax({
                    type: "post",
                    url: "/doaddssd",
                    data: {
                        "ss_name": ss_name,
                        "ss_fraction": ss_fraction,
                        "ss_way": ss_way,
                        "ss_type": ss_type
                    },
                    dataType: "json",
                    success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                        if (data = 1) {
                            alert("添加成功")
                            $("#ss_name").val("");
                            $("#ss_fraction").val("")
                        } else if (data == 0) {
                            alert("Sorry！添加失败！请重试！");
                        } else if (data == 2) {
                            alert("Sorry!您提交的数据有问题！请重试！")
                        }
                    }, error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                });
            })
    }
    function yanzheng() {
        $("#ss_name").blur(function () {
            if ($(this).val() == "" || $(this).val() == null) {
                $(this).css({"border": "solid 1px red"})
            } else {
                $(this).css({"border": "solid 1px green"})
            }
        })
        $("#ss_fraction").blur(function () {
            if ($(this).val() == "" || $(this).val() == null) {
                $(this).css({"border": "solid 1px red"})
            } else {
                $(this).css({"border": "solid 1px green"})
            }
        })
    }
    $(function(){
        check();
        yanzheng();
    })
</script>
<script>
    $(document).ready(function(){setup_draggable();$("#n-columns").on("change",function(){var v=$(this).val();if(v==="1"){var $col=$(".form-body .col-md-12").toggle(true);$(".form-body .col-md-6 .draggable").each(function(i,el){$(this).remove().appendTo($col)});$(".form-body .col-md-6").toggle(false)}else{var $col=$(".form-body .col-md-6").toggle(true);$(".form-body .col-md-12 .draggable").each(function(i,el){$(this).remove().appendTo(i%2?$col[1]:$col[0])});$(".form-body .col-md-12").toggle(false)}});$("#copy-to-clipboard").on("click",function(){var $copy=$(".form-body").clone().appendTo(document.body);$copy.find(".tools, :hidden").remove();$.each(["draggable","droppable","sortable","dropped","ui-sortable","ui-draggable","ui-droppable","form-body"],function(i,c){$copy.find("."+c).removeClass(c).removeAttr("style")});var html=html_beautify($copy.html());$copy.remove();$modal=get_modal(html).modal("show");$modal.find(".btn").remove();$modal.find(".modal-title").html("复制HTML代码");$modal.find(":input:first").select().focus();return false})});var setup_draggable=function(){$(".draggable").draggable({appendTo:"body",helper:"clone"});$(".droppable").droppable({accept:".draggable",helper:"clone",hoverClass:"droppable-active",drop:function(event,ui){$(".empty-form").remove();var $orig=$(ui.draggable);if(!$(ui.draggable).hasClass("dropped")){var $el=$orig.clone().addClass("dropped").css({"position":"static","left":null,"right":null}).appendTo(this);var id=$orig.find(":input").attr("id");if(id){id=id.split("-").slice(0,-1).join("-")+"-"+(parseInt(id.split("-").slice(-1)[0])+1);$orig.find(":input").attr("id",id);$orig.find("label").attr("for",id)}$('<p class="tools col-sm-12 col-sm-offset-3">						<a class="edit-link">编辑HTML<a> | 						<a class="remove-link">移除</a></p>').appendTo($el)}else{if($(this)[0]!=$orig.parent()[0]){var $el=$orig.clone().css({"position":"static","left":null,"right":null}).appendTo(this);$orig.remove()}}}}).sortable()};var get_modal=function(content){var modal=$('<div class="modal" style="overflow: auto;" tabindex="-1">	<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a><h4 class="modal-title">编辑HTML</h4></div><div class="modal-body ui-front">	<textarea class="form-control" 	style="min-height: 200px; margin-bottom: 10px;font-family: Monaco, Fixed">'+content+'</textarea><button class="btn btn-success">更新HTML</button></div>				</div></div></div>').appendTo(document.body);return modal};$(document).on("click",".edit-link",function(ev){var $el=$(this).parent().parent();var $el_copy=$el.clone();var $edit_btn=$el_copy.find(".edit-link").parent().remove();var $modal=get_modal(html_beautify($el_copy.html())).modal("show");$modal.find(":input:first").focus();$modal.find(".btn-success").click(function(ev2){var html=$modal.find("textarea").val();if(!html){$el.remove()}else{$el.html(html);$edit_btn.appendTo($el)}$modal.modal("hide");return false})});$(document).on("click",".remove-link",function(ev){$(this).parent().parent().remove()});
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
