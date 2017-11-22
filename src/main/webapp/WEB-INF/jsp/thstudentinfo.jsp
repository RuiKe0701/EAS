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
                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px"><button  class="btn btn-indigo btn-xs" id="addstudent" type="button"><i class="fa fa-paint-brush"></i>&nbsp;&nbsp;<span class="bold">新增学员</span></button>
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="number" id="th_class_id" class="form-control"style="height: 26.5px;font-size:12px" placeholder="请输入班级名">
                                <span class="input-group-btn">
						<button class="btn btn-primary  btn-xs" id="seletclassid" type="button">
							搜索班级
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="text"  id="stu_stuname" class="form-control"style="height: 26.5px;font-size:12px" placeholder="请输入学员姓名">
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
                                <th>${stus.stu_birthday}</th>
                                <td class="center">${stus.stu_sex}</td>
                                <td class="center">${stus.stu_phone}</td>
                                <td>${stus.stu_startday}</td>
                                <td class="center">${stus.stu_parentphone}</td>

                                <td> <div class="btn-group open">
                                    <input type="hidden" value="${stus.stu_id}" class="stuids">
                                    <button type="button" class="btn btn-primary btn-xs studentinfos">查看详情</button>
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
                            "                        <th>" + item.stu_birthday + "</th>\n" +
                            "                        <td class=\"center\">" + item.stu_sex + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_phone + "</td>\n" +
                            "                        <td>" + item.stu_startday + "</td>\n" +
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

        })
    }
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
    $(function () {
        showstudentinfo();
        selectBystuname();
        $("#an").click();
        selectByclassid();
        addstudent();
        selctByclassid();
        showstudentinfos();
        $("body").on("click",".showstudentinfos",function(){
            alert("sds")
            parent.showstu(1);
        })
    })

</script>

</body>
</html>
