<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 18:14
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

    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight" style="border-radius: 5px">

                <div class="modal-header">

                    <h6 class="modal-title">添加新学员</h6>
                    <small class="font-bold">
                    </small>
                </div>
                <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px">
                    <div class="row" style="padding-top: 20px">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">

                                </div>
                                <div class="ibox-content">
                                    <form id="addstu" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">姓名</label>

                                            <div class="col-sm-9">
                                                <input type="text" class="form-control " name="stu_name" id="stu_id" placeholder="请填写学员姓名">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">学号</label>
                                            <div class="col-sm-9">
                                                <input type="number" name="stu_no"  class="form-control" id="stu_no" placeholder="请填写学员学号">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">性别
                                            </label>
                                            <div class="col-sm-9">
                                                <div class="radio i-checks">
                                                    <label>
                                                        <input type="radio" name="stu_sex" value="1"> <i></i> 男</label>
                                                    <label>
                                                        <input type="radio" name="stu_sex" value="0"> <i></i> 女</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group" id="">
                                            <label class="col-sm-2 control-label">出生日期</label>
                                            <div class="input-group col-sm-9">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="date"  value="" name="stu_birthdays"  class="form-control" id="stu_birthday" >

                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_phone" placeholder="请填写学员手机号" id="stu_phone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">地址</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_address" placeholder="请填写学员地址" id="stu_address" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group" id="data_2">
                                            <label class="col-sm-2 control-label">入学日期</label>
                                            <div class="input-group col-sm-9">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="date" name="stu_startdays" class="form-control" id="stu_startday" >

                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">家长电话</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_parentphone" placeholder="请填写学员家长电话" id="stu_parentphone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">身份证</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_carde" placeholder="请填写学员身份证" id="stu_carde" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">学历</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_education" placeholder="请填写学员学历" id="stu_education" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">邮箱</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_email" placeholder="请填写学员邮箱" id="stu_email" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">班级选择：</label>
                                            <div class="col-sm-2" style="margin-top: -5px">
                                                <div id="classida"  style="padding-left: 0px;padding-top: 8px">
                                                    <select name="class_id" class="selectpicker btn-success btn-xs" style="height: 26px;padding-right: 14px;width:130px;font-size: 14px">
                                                        <option value="-1" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">请选择班级</option>
                                                        <c:forEach items="${requestScope.ct}" var="ct">
                                                            <option value="${ct.classes.class_id}" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">${ct.classes.class_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="col-sm-4 col-sm-offset-2">
                                                <button class="btn btn-primary" type="button" id="insert">保存学员</button>
                                                <button class="btn btn-white" data-dismiss="modal" type="submit">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default collapsed">
                <div class="panel-heading" style="padding-bottom: 2px">
                    <h5> 学员信息</h5>
                </div>
                <div class="panel-heading" style="padding-left:0px;padding-right:0px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
                    <div class="col-md-12" style="border-bottom: 1px solid gainsboro;padding-bottom: 0px">

                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                            <button  class="btn btn-indigo btn-xs" id="addstudent" type="button" data-toggle="modal" data-target="#myModal">
                                <i class="fa fa-paint-brush"></i>&nbsp;&nbsp;<span class="bold">新增学员</span></button>
                        </div>
                        <div class="col-sm-2">
                        <div id="classid"  style="padding-left: 0px;padding-top: 8px">
                        <select id="selectclass_name" class="selectpicker btn-success btn-xs" style="height: 26px;padding-right: 14px;width:130px;font-size: 14px">
                            <option value="-1" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">请选择班级</option>
                            <c:forEach items="${requestScope.ct}" var="ct">
                                <option value="${ct.classes.class_id}" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">${ct.classes.class_name}</option>
                            </c:forEach>
                        </select>
                        </div>  </div>



                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="number" id="th_class_id" class="form-control"style="height: 26.5px;font-size:12px" placeholder="班级名">
                                <span class="input-group-btn">
						<button class="btn btn-primary  btn-xs" id="seletclassid" type="button">
							搜索班级
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="text"  id="stu_stuname" class="form-control"style="height: 26.5px;font-size:12px" placeholder="学员姓名">
                                <span class="input-group-btn">
						<button class="btn btn-primary btn-xs"  id="seletstuname" type="button">
							搜索学员
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;padding-top: 8px">
                            <label style="font-size: 12px;font-weight: 100"> <input name="sturts" type="checkbox" value="0" checked="checked" />在校</label>
                            <label  style="font-size: 12px;font-weight: 100"><input name="sturts" type="checkbox" value="1" />离校</label>
                        </div>
                    </div>

                </div>

                <div class="panel-heading" style="height: 30px;font-size: 2px">
                    &nbsp;
                </div>
                <div class="panel-body" id="tables">
                    <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>班级</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>入学时间</th>
                            <th>父母电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="showstu">
                        <c:forEach var="stus" items="${stulist}">
                            <tr class="gradeX">
                                <td>${stus.stu_name}</td>
                                <td>${stus.stu_no}</td>
                                <td>${stus.class_id}</td>
                                <th>${stus.age}</th>
                                <td class="center">${stus.stu_sex}</td>
                                <td class="center">${stus.stu_phone}</td>
                                <td>${stus.stu_startdays}</td>
                                <td class="center">${stus.stu_parentphone}</td>
                                <td> <div class="btn-group open">
                                    <input type="hidden" value="${stus.stu_id}" class="stuids">
                                    <button type="button" class="btn btn-primary btn-xs studentinfos">查看详情</button>
                                    <button type="button" class="btn btn-indigo btn-xs xiugais">修改</button>
                                </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div><!--end row-->

    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight" style="border-radius: 5px">

                <div class="modal-header">

                    <h6 class="modal-title">修改新学员</h6>
                    <small class="font-bold">
                    </small>
                </div>
                <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px">
                    <div class="row" style="padding-top: 20px">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">

                                </div>
                                <div class="ibox-content">
                                    <form id="addstus" class="form-horizontal">
                                        <input type="hidden" id="studentid">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">姓名</label>

                                            <div class="col-sm-9">
                                                <input type="text" class="form-control " name="stu_name" id="stu_ids" placeholder="请填写学员姓名">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">学号</label>
                                            <div class="col-sm-9">
                                                <input type="number" name="stu_no"  class="form-control" id="stu_nos" placeholder="请填写学员学号">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">性别
                                            </label>
                                            <div class="col-sm-9">
                                                <div class="radio i-checks">
                                                    <label>
                                                        <input type="radio" name="stu_sex" class="stu_sexssss" id="nan"  value="1"> <i></i> 男</label>
                                                    <label>
                                                        <input type="radio" name="stu_sex" id="nv" class="stu_sexssss" value="0"> <i></i> 女</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group" >
                                            <label class="col-sm-2 control-label">出生日期</label>
                                            <div class="input-group col-sm-9">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="date"  value="" name="stu_birthday"  class="form-control" id="stu_birthdays" >

                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_phone" placeholder="请填写学员手机号" id="stu_phones" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">地址</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_address" placeholder="请填写学员地址" id="stu_addresss" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group" id="data_2s">
                                            <label class="col-sm-2 control-label">入学日期</label>
                                            <div class="input-group col-sm-9">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="date" name="stu_startday" class="form-control" id="stu_startdays" >

                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">家长电话</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_parentphone" placeholder="请填写学员家长电话" id="stu_parentphones" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">身份证</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_carde" placeholder="请填写学员身份证" id="stu_cardes" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">学历</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_education" placeholder="请填写学员学历" id="stu_educations" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">邮箱</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="stu_email" placeholder="请填写学员邮箱" id="stu_emails" class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">班级选择：</label>
                                            <div class="col-sm-2" style="margin-top: -5px">
                                                <div id="classidas"  style="padding-left: 0px;padding-top: 8px">
                                                    <select name="class_id" id="classwww" class="selectpicker btn-success btn-xs" style="height: 26px;padding-right: 14px;width:130px;font-size: 14px">
                                                        <option value="-1" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">请选择班级</option>
                                                        <c:forEach items="${requestScope.ct}" var="ct">
                                                            <option value="${ct.classes.class_id}" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">${ct.classes.class_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="col-sm-4 col-sm-offset-2">
                                                <button class="btn btn-primary" type="button" id="insertss" onclick="updateByStudent()">保存学员</button>
                                                <button class="btn btn-white" data-dismiss="modal" id="guanbi" type="button">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <button style="display: none" data-toggle="modal" data-target="#myModal2" id="xiu"></button>
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
<script>

    $(document).ready(function () {
        $('#datatable').dataTable();
    });
</script>
<script type="text/javascript">
    function insert() {
        var stuid;
        $("#insert").click(function () {
            if ($("#stu_id").val() == "" || $("#stu_id").val() == null) {
                alert("学员姓名不能为空！")
                return
            }else {
                stuid=$("#stu_id").val();
            }
            var stuno
            if($("#stu_no").val() == "" || $("#stu_no").val() == null)
            {
                alert("学号不能为空！")
                return
            }else {
                stuno=$("#stu_no").val();
            }
            var stubirth
            if($("#stu_birthday").val() == "" || $("#stu_birthday").val() == null)
            {
                alert("出生日期不能为空！")
                return
            }else {
                stubirth=$("#stu_birthday").val();
            }
            var stuphone
            if($("#stu_phone").val() == "" || $("#stu_phone").val() == null)
            {
                alert("手机号码不能为空！")
                return
            }else {
                stuphone=$("#stu_phone").val();
            }
            var stuaddress
            if($("#stu_address").val() == "" || $("#stu_address").val() == null)
            {
                alert("地址不能为空！")
                return
            }else {
                stuaddress=$("#stu_address").val();
            }
            var stustarty
            if($("#stu_startday").val() == "" || $("#stu_startday").val() == null)
            {
                alert("入学日期不能为空！")
                return
            }else {
                stustarty=$("#stu_startday").val();
            }
            var stuparentphone
            if($("#stu_parentphone").val() == "" || $("#stu_parentphone").val() == null)
            {
                alert("家长电话不能为空！")
                return
            }else {
                stuparentphone=$("#stu_parentphone").val();
            }
            var stucarde
            if($("#stu_carde").val() == "" || $("#stu_carde").val() == null)
            {
                alert("身份证不能为空！")
                return
            }else {
                stucarde=$("#stu_carde").val();
            }
            var stueducation
            if($("#stu_education").val() == "" || $("#stu_education").val() == null)
            {
                alert("学历不能为空！")
                return
            }else {
                stueducation=$("#stu_education").val();
            }
            var stuemail
            if($("#stu_email").val() == "" || $("#stu_email").val() == null)
            {
                alert("邮箱不能为空！")
                return
            }else {
                stuemail=$("#stu_email").val();
            }
        })
    }
    function yanzheng() {
        $("#stu_id").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_no").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_birthday").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_phone").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_address").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_startday").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_parentphone").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_carde").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_startday").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_education").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
        $("#stu_email").blur(function () {
            if($(this).val()==""||$(this).val()==null){
                $(this).css({"border":"solid 1px red"})
            }else {
                $(this).css({"border":"solid 1px green"})
            }
        })
    }
    //添加学生信息页面跳转

    //单个展示学生信息页面跳转
    function showstudentinfo() {
        $("body").on("click", ".studentinfos", function () {
            aas=$(this).parent().find(".stuids").val();
            window.location.href='/showstudents?stuid='+aas;
        })
    }
    //根据条件查询学生信息
    function selectByStudent(classname,stuname,status) {
        $.ajax({
            type: "post",
            url: "/thselecstudentbystu",
            data:{"classname":classname,"stuname":stuname,"sturts":status},
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                if(data!=0) {
                    $("#tables").html("");
                    var strs = "<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px\">\n" +
                        "                        <thead>\n" +
                        "                        <tr>\n" +
                        "                            <th>姓名</th>\n" +
                        "                            <th>学号</th>\n" +
                        "                            <th>班级</th>\n" +
                        "                            <th>年龄</th>\n" +
                        "                            <th>性别</th>\n" +
                        "                            <th>电话</th>\n" +
                        "                            <th>入学时间</th>\n" +
                        "                            <th>父母电话</th>\n" +
                        "                            <th>操作</th>\n" +
                        "                        </tr>\n" +
                        "                        </thead>\n" +
                        "                        <tbody id=\"showstu\">";
                    $.each(data, function (i, item) {

                        strs += "<tr class=\"gradeX\">\n" +
                            "                        <td>" + item.stu_name + "</td>\n" +
                            "                        <td>" + item.stu_no + "</td>\n" +
                            "                        <td>" + item.class_id + "</td>\n" +
                            "                        <th>" + item.age + "</th>\n" +
                            "                        <td class=\"center\">" + item.stu_sex + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_phone + "</td>\n" +
                            "                        <td>" + item.stu_startdays + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_parentphone + "</td>\n" +
                            "                        <td><input type=\"hidden\" value="+item.stu_id+" class=\"stuids\">" +
                            "                        <button type=\"button\" class=\"btn btn-primary btn-xs studentinfos\">查看详情</button>\n" +
                            "                        </td>\n" +
                            "                        </tr>"
                    })
                    strs += "</tbody></table>"
                    $("#tables").append(strs);
                    $('#datatable').dataTable();
                    $("#an").click()
                }else {
                    alert("您没有访问此班级的权限或该班级未创建")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        });
    }
    function selectByclassid() {
        $("#seletclassid").click(function () {
            var obj=document.getElementsByName('sturts');
            var s=[];
            for(var i=0; i<obj.length; i++){
                if(obj[i].checked){
                    s[i]=obj[i].value;
                } //如果选中，将value添加到变量s中
            }
            if(s.length==0){
                alert("请选择状态")
            }else {
                var sturts;
                if(s[0]!=null&&s[0]!=""&&s[1]!=null&&s[1]!=""){
                    sturts=-1;
                }else {
                    if (s[0] != null && s[0] != "") {
                        sturts = s[0]
                    } else if (s[1] != null && s[1] != "") {
                        sturts = s[1]
                    }
                }
                if(sturts!=null){
                    var classname=$("#th_class_id").val();
                    if(classname==null||classname==""){
                        alert("SORRY!请先输入班级名在进行查询！")
                    }else {
                        var stuname=null;
                        selectByStudent(classname,stuname,sturts);
                    }
                }
            }

        });
    };
    function selectBystuname() {
        $("#seletstuname").click(function () {
            var obj=document.getElementsByName('sturts');
            var s=[];
            for(var i=0; i<obj.length; i++){
                if(obj[i].checked){
                    s[i]=obj[i].value;
                } //如果选中，将value添加到变量s中
            }
            if(s.length==0){
                alert("请选择状态")
            }else {
                var sturts;
                if(s[0]!=null&&s[0]!=""&&s[1]!=null&&s[1]!=""){
                    sturts=-1;
                }else {
                    if (s[0]!= null && s[0] != "") {
                        sturts = s[0]
                    } else if (s[1] != null && s[1] != "") {
                        sturts = s[1]
                    }
                }
                if(sturts!=null){
                    var stuname=$("#stu_stuname").val();
                    if(stuname==null||stuname==""){
                        alert("SORRY!请先输入学员姓名在进行查询！")
                    }else {
                        var classname=null;
                        selectByStudent(classname,stuname,sturts);
                    }
                }
            }

        })
    }
    function addstu() {
        $("#insert").click(function (){
            $("#aaa").val($("#stu_birthday").val())
            $("#aaas").val($("#stu_startday").val())
            $.ajax({
                type: "post",
                url: "/addstuinfo",
                data:$("#addstu").serialize(),
                success: function (data){
                    if (data == -1){
                        alert("学生信息添加失败");
                    }else if (data == 0){
                        alert("分配学生到班级失败");
                    }else if (data == 1){
                        alert("添加并分配成功");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    /*弹出jqXHR对象的信息*/
                    alert(jqXHR.status);
                }
            })
        });
    }
    $(function () {
        selectclasssname();
        addstu();
        yanzheng();
        insert();
        showstudentinfo();
        selectBystuname();
        $("#an").click();
        xiugais();
        selctByclassid();
        showstudentinfos();
        $("body").on("click",".showstudentinfos",function(){
            alert("sds")
            parent.showstu(1);
        });

    })
    //修改学生信息
    function xiugais() {
        $("body").on("click", ".xiugais", function () {
            aas=$(this).parent().find(".stuids").val();
            $.ajax({
                url: "/updateByidinfo.do",
                method: "post",
                data: {id:aas},
            dataType:"json",
                success: function (data) {
                if (null != data) {
                    $("#stu_ids").val(data.stu_name);
                    $("#stu_nos").val(data.stu_no);
                    var man=$("#nan").val();
                    var gril=$("#nv").val();
                    var sex= data.stu_sex;
                    if (sex==man){
                        $("#nan").attr("checked","checked");
                    }
                    if (sex==gril){
                        $("#nv").attr("checked","checked");
                    }
                    $("#studentid").val(data.stu_id);
                    $("#stu_birthdays").val(data.stu_birthdays);
                    $("#stu_phones").val(data.stu_phone);
                    $("#stu_addresss").val(data.stu_address);
                    $("#stu_startdays").val(data.stu_startdays);
                    $("#stu_parentphones").val(data.stu_parentphone);
                    $("#stu_cardes").val(data.stu_carde);
                    $("#stu_educations").val(data.stu_education);
                    $("#stu_emails").val(data.stu_email);
                    $("#classwww").val(data.class_id);
                }
            }, error: function () {
                alert("error");
            }
        });
            $("#xiu").click();

        })
    }
    function selectclasssname() {
        $("#selectclass_name").change(function () {
            if ($(this).val() != -1) {
                var classname = $(this).find("option:selected").text();
                selectByStudent(classname, null, null);
            };
        });
    }
    //根据条件查询取值修改
    function  updateByStudent() {
        var stuleave=new Object();
        stuleave.stu_id=$("#studentid").val(),
            stuleave.stu_name=$("#stu_ids").val(),
            stuleave.stu_no=$("#stu_nos").val(),
        stuleave.stu_sex==$(".stu_sexssss").val(),
            stuleave.stu_birthday=$("#stu_birthdays").val(),
            stuleave.stu_phone=$("#stu_phones").val(),
            stuleave.stu_address=$("#stu_addresss").val(),
            stuleave.stu_startdays=$("#stu_startdays").val(),
            stuleave.stu_parentphone=$("#stu_parentphones").val(),
            stuleave.stu_carde=$("#stu_cardes").val(),
            stuleave.stu_education=$("#stu_educations").val(),
            stuleave.stu_email=$("#stu_emails").val()
        var stuleaves=JSON.stringify(stuleave);
        $.ajax({
            url:"/updatestuinfo.do",
            data:{"s":stuleaves},
            type:"post",
            dataType:"json",
            success:function (data) {
                if (data==1){
                    alert("修改成功！");
                    $("#guanbi").click();
                }else {
                    alert("修改失败！");
                }
            },error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
    //根据条件查询学生信息
    function selectByStudent(classname,stuname,status) {
        $.ajax({
            type: "post",
            url: "/thselecstudentbystu",
            data:{"classname":classname,"stuname":stuname,"sturts":status},
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                if(data!=0) {
                    $("#tables").html("");
                    var strs = "<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px\">\n" +
                        "                        <thead>\n" +
                        "                        <tr>\n" +
                        "                            <th>姓名</th>\n" +
                        "                            <th>学号</th>\n" +
                        "                            <th>班级</th>\n" +
                        "                            <th>年龄</th>\n" +
                        "                            <th>性别</th>\n" +
                        "                            <th>电话</th>\n" +
                        "                            <th>入学时间</th>\n" +
                        "                            <th>父母电话</th>\n" +
                        "                            <th>操作</th>\n" +
                        "                        </tr>\n" +
                        "                        </thead>\n" +
                        "                        <tbody id=\"showstu\">";
                    $.each(data, function (i, item) {

                        strs += "<tr class=\"gradeX\">\n" +
                            "                        <td>" + item.stu_name + "</td>\n" +
                            "                        <td>" + item.stu_no + "</td>\n" +
                            "                        <td>" + item.class_id + "</td>\n" +
                            "                        <th>" + item.age + "</th>\n" +
                            "                        <td class=\"center\">" + item.stu_sex + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_phone + "</td>\n" +
                            "                        <td>" + item.stu_startdays + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_parentphone + "</td>\n" +
                            "                        <td><input type=\"hidden\" value="+item.stu_id+" class=\"stuids\">" +
                            "                        <button type=\"button\" class=\"btn btn-primary btn-xs studentinfos\">查看详情</button>\n" +
                            "                               <button type=\"button\" class=\"btn btn-indigo btn-xs xiugais\">修改</button>"+
                            "</td>\n" +
                            "                        </tr>"
                    })
                    strs += "</tbody></table>"
                    $("#tables").append(strs);
                    $('#datatable').dataTable();
                    $("#an").click()
                }else {
                    alert("您没有访问此班级的权限或该班级未创建")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        });
    }


</script>

</body>
</html>
