<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22 0022
  Time: 14:35
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
    <link href="table/css/bootstrap.min.css" rel="stylesheet">
    <link href="table/css/simple-line-icons.css" rel="stylesheet">
    <link href="table/css/font-awesome.min.css" rel="stylesheet">
    <link href="table/css/pace.css" rel="stylesheet"><link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="table/css/nanoscroller.css">
    <link rel="stylesheet" href="table/css/metismenu.min.css">
    <!-- dataTables -->
    <link href="table/css/jquery.datatables.min.css" rel="stylesheet" type="text/css">
    <link href="table/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--template css-->
    <link href="table/css/style.css" rel="stylesheet">
    <link href="table/css/sweet-alert.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="table/js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
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
                    <h6 style="margin-top: 5px">评分项管理</h6>
                </div>

                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">
                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <button  class="btn btn-indigo btn-xs" id="addssd" type="button"><i class="fa fa-plus">
                        </i>&nbsp;&nbsp;<span class="bold">新评分项</span>
                        </button>
                    </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                        <div class="input-group">
                            <input type="text" id="ssdnames" class="form-control"style="height: 25.5px;font-size:12px" placeholder="评分项">
                            <span class="input-group-btn">
						        <button class="btn btn-info btn-xs" id="seletbyssd" style="background-color: #24c6c8;color: white" type="button">
                            查询评分项</button>
                                </span>
                        </div>
                    </div>

                </div>

                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid gainsboro"></div>
                </div>

                <div class="panel-body" id="tables" style="padding-top: 0px">
                    <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px">
                        <thead>

                        <tr>
                            <th>评分项</th>
                            <th>分数</th>
                            <th>处理</th>
                            <th>类型</th>
                            <th>创建人</th>
                            <th>创建日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="showstu">
                        <c:forEach var="sst" items="${scoringstandards}">
                        <tr class="gradeX">
                            <td>${sst.ss_name}</td>
                            <td>${sst.ss_fraction}</td>

                            <c:if test="${sst.ss_way==0}">
                                <td>减分</td>
                            </c:if>
                            <c:if test="${sst.ss_way==1}">
                                <td>加分</td>
                            </c:if>
                            <c:if test="${sst.ss_type==0}">
                                <td>考勤</td>
                            </c:if>
                            <c:if test="${sst.ss_type==1}">
                                <td>其他</td>
                            </c:if>
                            <td>${sst.teachername}</td>
                            <td>${sst.ss_createdate}</td>


                            <td> <input type="hidden" value="${sst.ss_id}" class="ssdid">
                                <button type="button" class="btn btn-xs updatessd" style="background-color: #f8ac5a;color: white">修改</button>

                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>

                    </table>

                </div>
            </div>
        </div>
    </div><!--end row-->

    <!--end page content-->
    <div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="border-radius: 5px">
            <div class="modal-content animated flipInY" style="border-radius: 5px">
                <div class="modal-header">
                    <h4 class="modal-title">修改请假信息</h4>
                </div>
                <div class="modal-body">
                    <div class="ibox-content">

                        <form role="form" id="updatesss" class="form-horizontal m-t" >
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">评分项：</label>
                                <div class="col-sm-7">
                                    <input type="text" name="ss_name" id="ssname" class="form-control" placeholder="评分项">
                                    <span class="help-block m-b-none">评分项名字</span>
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">分数
                                    ：</label>
                                <div class="col-sm-7">
                                    <input type="number" class="form-control" name="ss_fraction" id="ssfraction" placeholder="评分分数">
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">处理：</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="ss_way" id="ssway">
                                        <option value="1">加分</option>
                                        <option value="0">减分</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group draggable">
                                <label class="col-sm-3 control-label">类型：</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="ss_type" id="sstype">
                                        <option value="0">考勤</option>
                                        <option value="1">其他</option>
                                    </select>
                                </div>
                            </div>
                            <input value="" type="hidden" name="ss_id" id="ssid" >
                            <div class="hr-line-dashed"></div>
                            <input value="${jieguo}" id="jieguo" type="hidden">
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="modal-footer" >
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanupdate">关闭</button>

                    <button type="button" id="updatess" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
    <button type="" style="display: none" id="addstuleave2" data-toggle="modal" data-target="#myModal3"></button>
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
<script>

    $(document).ready(function () {
        $('#datatable').dataTable();
    });
</script>
<script type="text/javascript">
    //添加学生信息页面跳转
    function addssd() {
        1.//根据iframe的id获取对象
        $("#addssd").click(function () {
            parent.addscoringstandard();
        })
        //var i1 = window.frames['iframeId'];搜索
    }
    //修改评分需求
    function updatessd() {
        $(".updatessd").click(function () {
            var ssdid= $(this).parent().find(".ssdid").val();
            selectssdbyid(ssdid);
            $("#addstuleave2").click();
        })
    }
    
    function doupdate() {
        $("#updatess").click(function () {

            $.ajax({
                type: "post",
                url: "/updatess",
                data:$("#updatesss").serialize(),
                dataType: "json",
                success: function (data) {
                    if(data==1){
                        $("#guanupdate").click();
                        swal({
                            title: "Success",
                            text: "恭喜！修改成功！请刷新后查看！",
                            type: "success",
                            showCancelButton: false,
                            cancelButtonClass: 'btn-secondary ',
                            confirmButtonClass: 'btn-success  ',
                            confirmButtonText: '确定!'
                        });
                    }else if(data==0){
                        $("#guanupdate").click();
                        swal({
                            title: "Sorry!",
                            text: "SORRY!系统延迟！请稍后再试！",
                            type: "error",
                            showCancelButton:false,
                            cancelButtonClass: 'btn-secondary',
                            confirmButtonClass: 'btn-danger',
                            confirmButtonText: '确定!'
                        });
                    }else if(data==2){
                        $("#guanupdate").click();
                        swal({
                            title: "Sorry!",
                            text: "SORRY!您给的参数有误请确定您的参数无误后重试",
                            type: "error",
                            showCancelButton:false,
                            cancelButtonClass: 'btn-secondary',
                            confirmButtonClass: 'btn-danger',
                            confirmButtonText: '确定!'
                        });
                    }
                },error: function () {
                    swal({
                        title: "Sorry!",
                        text: "SORRY!系统延迟！请稍后再试！",
                        type: "error",
                        showCancelButton:false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    });
                }
            });
        })
    }
    function selectssdbyid(ssdid) {
        $.ajax({
            type: "post",
            url: "/selectss",
            data:{"ssid":ssdid},
            dataType: "json",
            success: function (data) {
                if(data!=0){
                    $("#ssname").val(data.ss_name);
                    $("#ssfraction").val(data.ss_fraction);
                    $("#ssway").val(data.ss_way);
                    $("#sstype").val(data.ss_type);
                    $("#ssid").val(data.ss_id);
                }else if(data==0){
                    swal({
                        title: "Sorry!",
                        text: "SORRY!系统延迟！请稍后再试！",
                        type: "error",
                        showCancelButton:false,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    });
                }
            },error: function () {
                swal({
                    title: "Sorry!",
                    text: "SORRY!系统延迟！请稍后再试！",
                    type: "error",
                    showCancelButton:false,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }
            });
    }
    function selectByssd(ssdname) {
        $.ajax({
            type: "post",
            url: "/selectbyssd",
            data:{"ssdname":ssdname},
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                alert(data)
                $("#tables").html("");
                var strs=" <table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px\">\n" +
                    "                        <thead>\n" +
                    "\n" +
                    "                        <tr>\n" +
                    "                            <th>评分项</th>\n" +
                    "                            <th>分数</th>\n" +
                    "                            <th>处理</th>\n" +
                    "                            <th>类型</th>\n" +
                    "                            <th>创建人</th>\n" +
                    "                            <th>创建日期</th>\n" +
                    "                            <th>操作</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>\n" +
                    "                        <tbody id=\"showstu\">";
                $.each(data, function(i, item) {
                    var way="";
                    var ssdtype;
                    if(item.ss_way==1){
                        way="加分";
                    }else if(item.ss_way==0){
                        way="减分";
                    }
                    if(item.ss_type==1){
                        ssdtype="其他";
                    }else if(item.ss_type==0){
                        ssdtype="考勤";
                    }
                    strs+=" <tr class=\"gradeX\">\n" +
                        "                            <td>"+item.ss_name+"</td>\n" +
                        "                            <td>"+item.ss_fraction+"</td>\n" +
                        "                            <td>"+way+"</td>\n" +
                        "                            <td>"+ssdtype+"</td>\n" +
                        "                            <td>"+item.teachername+"</td>\n" +
                        "                            <td>"+item.ss_createdate+"</td>\n" +
                        "                            <td><input type=\"hidden\" value="+item.ss_id+" class=\"ssdid\">"+
                        "                                <button type=\"button\" class=\"btn btn-xs showstudentinfo\" style=\"background-color: #f8ac5a;color: white\">修改</button>\n" +
                        "                            </td>\n" +
                        "                        </tr>"
                })
                strs+="</tbody></table>"
                $("#tables").append(strs);
                $('#datatable').dataTable();
                $("#an").click()
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        });
    }
    function seletbyssd() {
        $("#seletbyssd").click(function () {
            ssdname=$("#ssdnames").val();
            if(ssdname==null||ssdname==""){
                alert("SORRY!请先评分项名字名在进行查询！")
            }else {

                selectByssd(ssdname);
            }
        })
    }

    $(function () {
        seletbyssd();
        addssd();
        updatessd();
        doupdate();
    })

</script>

</body>
</html>
