<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/27 0027
  Time: 8:34
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
    <link href="table/css/pace.css" rel="stylesheet">

    <link href="table/css/jasny-bootstrap.min.css" rel="stylesheet">

    <!-- dataTables -->
    <link href="table/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--template css-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="table/js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<style type="text/css">
    .ldivwai{
        float: left;margin-right: 10px;margin-top: 20px;border: 4px solid #5cc0de;border-radius: 3px
    }
    .ltable{
        height:80px;width: 220px;display: table;float: left
    }
    .ltselect{
        background-color: #5cc0de;border: 0;border-radius: 3px;color: white;height: 22px;width: 88px;
    }
    .ltsop{
        background-color: white;color: #2A2E36
    }
</style>
<body class="gray-bg" style="background-color: whitesmoke">

<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%;background-color: white">



    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row" >
        <div class="col-md-12" >
            <div class="panel-heading" style="padding-bottom:0px;background-color: #5cc0de">
                <input class="" id="classid" type="hidden" value="1">

                <input class="" id="atdno" type="hidden" value="${attendancenumber}">

                <h5>学院点名卡</h5>
            </div>
            <div class="panel-heading" style="padding-left:0px;padding-right:0px;padding-top:0px;padding-bottom: 5px;margin-bottom: 5px">
                <div class="col-md-12" style="padding-bottom: 5px;"style="border-radius: 5px;border: 1px solid gainsboro">


                <c:forEach var="stsl" items="${stutotalscoreList}">
                    <div class="ldivwai" >
                        <table  class="ltable">
                            <tr>
                                <td rowspan="6" style="width:78px;height: 80px">
                                    <c:if test="${stsl.sex==0}">
                                    <img src="ss/559.PNG" style="margin-left:3px;margin-right:7px;width:70px;height: 70px;border-radius:50px;border: solid 3px #5db85d;">
                                    </c:if>
                                    <c:if test="${stsl.sex==1}">
                                    <img src="ss/55.PNG" style="margin-left:3px;margin-right:7px;width:70px;height: 70px;border-radius:50px;border: solid 3px #5db85d;">
                                    </c:if>
                                </td>
                            </tr>
                            <tr style="height:12px "><td></td></tr>
                            <tr style="height:16px;font-size: 13px"><td><span style="border-bottom: 0.1px solid gainsboro;padding-bottom: 3px">
                                    <input type="hidden" value="${stsl.stu_id}" class="stuid">
                                <input type="hidden" value="${stsl.sts_id}" class="stsid">
                                    <input type="hidden" value="${stsl.stu_totalscore}" class="stutotalscore">
                                    <span sty>姓名：</span><span>${stsl.stuname}</span></span></td></tr>
                            <tr style="height:16px;font-size: 12px "><td><span >学号：</span><span>${stsl.stuno}</span></td></tr>
                            <tr style="height:22px;font-size: 13px "><td>
                                <div><select class="ltselect" onchange="changeForm(this.value)">
                                    <c:forEach var="ssdl" items="${scoringstandardList}">
                                    <option class="ltsop" value="${ssdl.ss_id}">${ssdl.ss_name}</option>
                                    </c:forEach>
                                </select></div>
                            </td></tr>
                            <tr style="height:9px "><td></td></tr>
                        </table>
                    </div>
                </c:forEach>



                </div>

            </div>

            <div class="panel-heading" style="height: 30px;font-size: 2px">

            </div>
            <div class="panel-body" id="tables">
                </table>

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

<script type="text/javascript">
    function changeForm() {
        $(".ltselect").change(function () {
            valss=$(this).val()
            if(valss==1){
                $(this).css({"background-color":"#5cc0de"});
            }else if(valss==2){
                $(this).css({"background-color":"#5db85d"});
            }else if(valss==3){
                $(this).css({"background-color":"#1d7bc6"});
            }else if(valss==4){
                $(this).css({"background-color":"#f8ac5a"});
            }else if(valss==5){
                $(this).css({"background-color":"#ed5666"});
            }
        })
    }

    var myMap = new Map();
    function pingfenhuoqu() {
        $.ajax({
            type: "post",
            url: "/getscorings",
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, item) {
                    var ping = new Object();
                    ping.id =item.ss_id;
                    ping.fen=item.ss_fraction;
                    ping.caozuo=item.ss_way;
                    myMap[ping.id]=ping;
                })
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }


    function tijaos() {
        $("#tijiao").click(function () {
            //学生出勤记录
            var stuattendancelist= new Array();
            var classids=$("#classid").val();
            var cadnumber=parseInt($("#atdno").val())+1;
            alert(cadnumber)
            var els =$(".ldivwai")
            //学生分数变更
            var stutotalscorelist=new Array();
            var zhengchang=0;
            var quanbu=0;
            $(".ldivwai").each(function(index,data){
                //学生考勤记录
                var kaoqin =$(data).find(".ltselect").val();
                var stuid=$(data).find(".stuid").val();
                var stsid=$(data).find(".stsid").val();

                quanbu+=1;
                if(kaoqin==1){
                    zhengchang+=1;
                }
                //添加学生考勤记录到集合
                var object = new Object();
                object.stu_id = stuid;
                object.ss_id =kaoqin;
                object.class_id=classids;
                stuattendancelist.push(object);
                //学生分数信息
                var stutotalscore=$(data).find(".stutotalscore").val();
                var stuScoreobject = new Object();
                var a=myMap[kaoqin]
                var score=0;
                if(a.caozuo==1){
                    score=parseInt(stutotalscore)+parseInt(a.fen);
                }else if(a.caozuo==0){
                    score=stutotalscore-a.fen
                }
                stuScoreobject.sts_id = stsid;
                stuScoreobject.stu_totalscore =score;
                stutotalscorelist.push(stuScoreobject);
            });
            var stuattendancelists=JSON.stringify(stuattendancelist);
            alert(stuattendancelists)

            var studentScoreList=JSON.stringify(stutotalscorelist)
            alert(studentScoreList);

            alert(zhengchang+""+quanbu)

            var chuqinglv=((zhengchang/quanbu).toFixed(2)*100);
            alert("本班本次出勤率为"+chuqinglv+"%")
            $.ajax({
                type: "post",
                url: "/doaddatdrecord",
                data:{
                    "stuattendancelists": stuattendancelists,
                    "studentScoreList": studentScoreList,
                    "classids": classids,
                    "chuqinglv": chuqinglv,
                    "cadnumber":cadnumber
                },
                dataType: "json",
                success: function (data) {
                    if (data>0){
                        alert("恭喜添加成功！本班本次出勤率为"+chuqinglv+"%")
                    }else {
                        alert("sorry!系统出错")
                    }
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        })

    }
    $(function () {
        pingfenhuoqu();
        changeForm()
        tijaos()
    })
</script>

</body>
</html>
