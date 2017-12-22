<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <![endif]-->
</head>
<body class="gray-bg">

    <!--start page content-->

    <section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default collapsed">
                <form id="selectinfo">
                <div class="panel-heading" style="padding-bottom: 2px">
                    <h5> 学员信息</h5>
                </div>
                <div class="panel-heading"
                     style="padding-left:0px;padding-right:0px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
                    <div class="col-md-12" style="border-bottom: 1px solid gainsboro;padding-bottom: 0px">
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="number" id="class_name" name="classes.class_name" class="form-control"
                                       style="height: 26.5px;font-size:12px" placeholder="班级名">
                                <span class="input-group-btn">
						<button class="btn btn-primary  btn-xs" id="seletclassid" type="button">
							搜索班级
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <div class="input-group">
                                <input type="text" id="stu_name" name="stu_name" class="form-control"
                                       style="height: 26.5px;font-size:12px" placeholder="学员姓名">
                                <span class="input-group-btn">
						<button class="btn btn-primary btn-xs" id="seletstuname" type="button">
							搜索学员
						</button>
					</span>
                            </div><!-- /input-group -->
                        </div>
                        <<input type="hidden" name="stu_state" id="stu_state" value="">
                        <div class="col-md-3" style="padding-left: 0px;padding-top: 8px">
                            <label style="font-size: 12px;font-weight: 100"> <input id="stu1"  type="checkbox"
                                                                                    value="0"
                                                                                    checked="checked"/>在校</label>
                            <label style="font-size: 12px;font-weight: 100"><input id="stu2"  type="checkbox"
                                                                                   value="1"/>离校</label>
                        </div>
                    </div>
                </div>
                </form>
                <div class="panel-heading" style="height: 30px;font-size: 2px">
                    &nbsp;
                </div>
                <div class="panel-body" id="tables">
                    <table id="datatable" class="table table-striped dt-responsive nowrap"
                           style="border-top: solid 1px gainsboro;margin-top: 5px">
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
                        <c:forEach var="stus" items="${requestScope.pager.list}">
                            <tr class="gradeX">
                                <td>${stus.stu_name}</td>
                                <td>${stus.stu_no}</td>
                                <td>${stus.class_id}</td>
                                <th>${stus.age}</th>
                                <td class="center">${stus.stu_sex}</td>
                                <td class="center">${stus.stu_phone}</td>
                                <td>${stus.stu_startdays}</td>
                                <td class="center">${stus.stu_parentphone}</td>
                                <td>
                                    <div class="btn-group open">
                                        <input type="hidden" value="${stus.stu_id}" class="stuids">
                                        <button type="button" class="btn btn-primary btn-xs studentinfos">查看详情</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${requestScope.pager.totalPages > 1}">
                        <div id="curr" style="float: right">
                            <button class="yemian" value='${requestScope.pager.currentPage-1}'>< 上一页</button>
                            <c:forEach begin="1" end="${requestScope.pager.totalPages}" var="i">
                                <c:if test="${i == requestScope.pager.currentPage}">
                                    <button class="yemian" value="${i}" style="background-color: gainsboro">${i}</button>
                                </c:if>
                                <c:if test="${i != requestScope.pager.currentPage}">
                                    <button class="yemian" value="${i}">${i}</button>
                                </c:if>
                            </c:forEach>
                            <button class="yemian" value="${requestScope.pager.currentPage+1}" >下一页 ></button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div><!--end row-->
</section>
<!--end main content-->

<!--Common plugins-->
<script src="table/js/jquery.min.js"></script>
<script src="table/js/bootstrap.min.js"></script>
<script src="table/js/pace.min.js"></script>
<script src="table/js/jasny-bootstrap.min.js"></script>
<script src="table/js/jquery.slimscroll.min.js"></script>
<script src="table/js/jquery.nanoscroller.min.js"></script>
<script src="table/js/metismenu.min.js"></script>
<script src="table/js/float-custom.js"></script>

<!-- Datatables-->
<script src="table/js/jquery.datatables.min.js"></script>
<script src="table/js/datatables.responsive.min.js"></script>
<script type="text/javascript">

    //根据条件查询学生信息
    function selectByStudent(pager) {
        if (!($('#stu1').is(':checked')&&$('#stu2').is(':checked'))){
            if ($("#stu1").attr("checked")){
                $("#stu_state").val(0);
            }else {
                $("#stu_state").val(1);
            }
        }else {
            $("#stu_state").val("");
        }
        var $inf =  $("#selectinfo").serialize();
        if (pager != null){
            $inf+="&currentPage="+pager;
        }
        $.ajax({
            type: "post",
            url: "/anotherajaxstudentinfo.do",
            data: $inf,
            dataType: "json",
            success: function (data) {//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
                if (data != 0) {
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
                    $.each(data.list, function (i, item) {

                        strs += "<tr class=\"gradeX\">\n" +
                            "                        <td>" + item.stu_name + "</td>\n" +
                            "                        <td>" + item.stu_no + "</td>\n" +
                            "                        <td>" + item.class_id + "</td>\n" +
                            "                        <th>" + item.age + "</th>\n" +
                            "                        <td class=\"center\">" + item.stu_sex + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_phone + "</td>\n" +
                            "                        <td>" + item.stu_startdays + "</td>\n" +
                            "                        <td class=\"center\">" + item.stu_parentphone + "</td>\n" +
                            "                        <td><input type=\"hidden\" value=" + item.stu_id + " class=\"stuids\">" +
                            "                        <button type=\"button\" class=\"btn btn-primary btn-xs studentinfos\">查看详情</button>\n" +
                            "                        </td>\n" +
                            "                        </tr>"
                    })
                    strs += "</tbody></table>"
                    var pages = "  <div id=\"curr\" style=\"float: right\">" +
                        "<button class=\"yemian\" value='"+(data.currentPage-1)+"'>< 上一页</button>";
                    alert(data.totalPages);
                    for (var i = 1; i <= data.totalPages ; i++){
                        if (i == data.currentPage){
                            pages += "<button class=\"yemian\" value=\""+i+"\" style=\"background-color: gainsboro\">"+i+"</button>"
                        }else {
                            pages += "<button class=\"yemian\" value=\""+i+"\" >"+i+"</button>"
                        }
                    };
                    pages+="<button class=\"yemian\"value=\""+(data.currentPage-1)+"\" >下一页 ></button></div>";
                    $("#tables").append(strs+pages);
                }
            },
            error: function () {

            }
        });
    }


    $(function () {
        selectclasssname();
        showstudentinfo();
        $("body").on("click", ".showstudentinfos", function () {
            parent.showstu(1);
        });
    })
    function selectclasssname() {
        $("#seletclassid").click(function () {
            selectByStudent(null);
        })
        $("#seletstuname").click(function () {
            selectByStudent(null);
        })
        $("body").on("click", ".yemian", function () {
            selectByStudent($(this).val());
        });
    }
    function showstudentinfo() {
        $("body").on("click", ".studentinfos", function () {
            aas=$(this).parent().find(".stuids").val();
            window.location.href='/showstudents?stuid='+aas;
        })
    }

</script>

</body>
</html>
