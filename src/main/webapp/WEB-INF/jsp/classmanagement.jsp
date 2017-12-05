<%@ page import="com.ruike.eas.pojo.Classteacher" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <link href="table/css/pace.css" rel="stylesheet">
    <link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">
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
<body class="gray-bg">


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
                <div class="panel-heading"
                     style="padding-left:0px;padding-right:0px;padding-top: 5px;padding-bottom: 5px;margin-bottom: 5px">
                    <div class="col-md-12" style="border-bottom: 1px solid gainsboro;padding-bottom: 5px">

                        <div id="classid" class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                            <select class="selectpicker btn-success btn-xs" style="height: 26px;padding-right: 14px;width:130px;font-size: 14px">
                                <c:forEach var="cla" items="${requestScope.classcs}">
                                    <option value="${cla.classes.class_id}" style="background-color: white;color: #0F769F;height: 26px;padding-top: 5px">${cla.classes.class_name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-1" style="padding-left: 0px;padding-top: 8px;margin-left: -40px">
                            <div class="input-group">
                                <span class="input-group-btn">
						            <button class="btn btn-primary  btn-xs" id="seletclassid" type="button">班级老师管理</button>
                                </span>
                            </div><!-- /input-group -->
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-top: 8px;margin-left: 70px">
                            <div class="input-group">
                                <input type="text" id="stu_stuname" class="form-control"
                                       style="height: 26.5px;font-size:12px" placeholder="请输入班级名">
                                <span class="input-group-btn">
						            <button class="btn btn-primary btn-xs" id="seletclassname" type="button">历史班级</button>
					            </span>
                            </div><!-- /input-group -->
                        </div>
                    </div>

                </div>

                <div class="panel-heading" style="height: 30px;font-size: 2px">
                    &nbsp;
                </div>
                <input id="pageclassname" type="hidden" value="${requestScope.classcs[0].classes.class_name}"/>
                <input id="pageclassid" type="hidden" value="${requestScope.classcs[0].classes.class_id}"/>
                <div class="panel-body" id="tables">
                    <table id="datatable" class="table table-striped dt-responsive nowrap"
                           style="border-top: solid 1px gainsboro;margin-top: 5px">
                        <thead>
                        <tr>
                            <th>班级名</th>
                            <th>老师名</th>
                            <th>老师类型</th>
                            <th>信息状态</th>
                            <th>开始代课</th>
                            <th>结束代课</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="showstu">
                        <c:forEach var="ct" items="${requestScope.clate}">
                            <c:if test="${ct.class_id==requestScope.classcs[0].class_id}">
                                <tr class="gradeX">
                                    <td>${ct.classes.class_name}</td>
                                    <td>${ct.teacher.th_name}</td>
                                    <td>
                                        <c:if test="${ct.ct_type==0}">班主任</c:if>
                                        <c:if test="${ct.ct_type==1}">主教员</c:if>
                                        <c:if test="${ct.ct_type==2}">辅教员</c:if>
                                    </td>
                                    <td><c:if test="${ct.status==0}">当前</c:if>
                                        <c:if test="${ct.status==1}">历史</c:if>
                                    </td>
                                    <td class="center">${ct.ct_startdays}</td>
                                    <td class="center">
                                        <c:if test="${ct.ct_stopdays==null}">未结束</c:if>
                                        <c:if test="${ct.ct_stopdays!=null}">${ct.ct_stopdays}</c:if>
                                    </td>
                                    <td>${ct.remarks}</td>
                                    <td>
                                        <input type="hidden" value="${ct.ct_id}">
                                        <c:if test="${ct.ct_stopdays==null}">
                                            <div class="btn-group open"><button type="button" class="btn btn-primary btn-xs showstudentinfo endate">结束代课</button></div>
                                        </c:if>
                                        <c:if test="${ct.ct_stopdays!=null}">
                                            <div class="btn-group open"><button type="button" disabled="disabled" class="btn btn-primary btn-xs showstudentinfo endate">结束代课</button></div>
                                        </c:if>
                                        </td>
                                </tr>
                            </c:if>
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
<script src="table/js/pace.min.js"></script>
<script src="table/js/jasny-bootstrap.min.js"></script>
<script src="table/js/jquery.slimscroll.min.js"></script>
<script src="table/js/jquery.nanoscroller.min.js"></script>
<script src="table/js/metismenu.min.js"></script>
<script src="table/js/float-custom.js"></script>

<!-- Datatables-->
<script src="table/js/jquery.datatables.min.js"></script>
<script src="table/js/datatables.responsive.min.js"></script>
<script>
    $(function () {
        $("#seletclassid").click(function () {
            window.location.href='/addclassteacher?classid='+$("#pageclassid").val()+'&classname='+$("#pageclassname").val();
        });
        $('#datatable').dataTable();
        $("#classid").change(function () {
            ajaxClassTeacher($("#classid option:selected").text(),null);
        });

        $("#seletclassname").click(function () {
            var classname = $(this).parent().prev().val();
            ajaxClassTeacher(classname,1);
        });

        $("body").on("click",".endate",function(){
            var ctid = $(this).parent().prev().val();
            if (confirm("请问是否结束代课?")==true){
                endSub(ctid)
            }
        });
    });
    
    function endSub(ctid) {
        $.ajax({
            type:"post",
            url:"/endsub",
            data:{'ctid':ctid},
            datatype:"json",
            success: function (data) {
                if (data == 1){
                    ajaxClassTeacher($("#pageclassname").val(),null);
                }else {
                    alert("操作失败")
                }
            },error:function (data) {
                
            }
        })
    }

    function ajaxClassTeacher(classname,status) {
        $("#pageclassname").val(classname);
        $.ajax({
            type:"post",
            url:"/jsonclass",
            data:{'classname':classname,'status':status},
            datatype:"json",
            success: function (data) {
                var aaa=eval(data);
                $("#tables").html("");
                $("#pageclassid").val(aaa[0].class_id)
                var strs="<table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\"\n" +
                    "                           style=\"border-top: solid 1px gainsboro;margin-top: 5px\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>班级名</th>\n" +
                    "                            <th>老师名</th>\n" +
                    "                            <th>老师类型</th>\n" +
                    "                            <th>信息状态</th>\n" +
                    "                            <th>开始代课</th>\n" +
                    "                            <th>结束代课</th>\n" +
                    "                            <th>备注</th>\n" +
                    "                            <th>操作</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>\n" +
                    "                        <tbody id=\"showstu\">";

                if (aaa != 0) {
                    $.each(aaa, function (i, item) {
                        var typename = "";
                        if (item.ct_type == 0) {
                            typename = "班主任";
                        } else if (item.ct_type == 1) {
                            typename = "主教员";
                        } else {
                            typename = "辅教员";
                        }
                        var butt = item.ct_stopdays == null ?
                            "<div  class=\"btn-group open\"><button type=\"button\" class=\"btn btn-primary btn-xs showstudentinfo endate\">结束代课</button></div>"
                            : "<div  class=\"btn-group open\"><button type=\"button\" disabled=\"disabled\" class=\"btn btn-primary btn-xs showstudentinfo endate\">结束代课</button></div>";
                        strs += "                                <tr class=\"gradeX\">\n" +
                            "                                    <td>" + item.classes.class_name + "</td>\n" +
                            "                                    <td>" + item.teacher.th_name + "</td>\n" +
                            "                                    <td>\n" + typename + " </td>\n" +
                            "                                    <td>" + (item.status == 0 ? "当前" : "历史") + "  </td>\n" +
                            "                                    <td class=\"center\">" + item.ct_startdays + "</td>\n" +
                            "                                    <td class=\"center\">\n" + (item.ct_stopdays == null ? "未结束" : item.ct_stopdays) + "  </td>\n" +
                            "                                    <td>" + item.remarks + "</td>\n" +
                            "                                    <td><input type=\"hidden\" value=\""+item.ct_id+"\">"+butt +"</td>"
                            "                                </tr>\n";

                    })
                }else {
                    alert("您查找的班级没有记录或者您没有权限查看此班级");
                }
                strs+="</tbody> </table>\n"
                $("#tables").append(strs);
                $('#datatable').dataTable();
            },
            error: function (data) {
                alert("系统异常，请稍后重试！");
            }
        })
    }
</script>
</body>
</html>