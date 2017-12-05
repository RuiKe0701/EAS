<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/30 0030
  Time: 15:25
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

    <script src="table/js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>


    <base target="_blank">
    <link rel="stylesheet" href="select/dist/css/bootstrap-select.css">

</head>
<style type="text/css">

    .ltselect{
        background-color: #5cc0de;border: 0;border-radius: 3px;color: white;height: 22px;width:50px;
    }
    .ltsop{
        background-color: white;color: #2A2E36
    }
</style>

<body class="gray-bg" >

<!--main content start-->
<section style="width: 96.8%;margin-left: 1.6%;margin-top: 1.6%">



    <!--page header start-->

    <!--page header end-->


    <!--start page content-->

    <div class="row">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-content mailbox-content">
                    <div class="file-manager">
                        <a class="btn btn-block compose-mail" style="background-color: white ;color: #2A2E36;border: 1px solid gainsboro" href="mail_compose.html">新增考勤记录</a>
                        <div class="space-25"></div>
                        <div style="background-color: white;padding-left: 10px;padding-right: 10px;border: solid 0.1px gainsboro;border-top: 0px">
                            <div class="row" style="padding-left: 30px;padding-right: 30px">
                                <div class="col-md-12" style="padding-left:0px;padding-top: 30px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                    <div style="">
                                        <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i> 请选择班级：</div>
                                        <div class="col-md-5" style="padding-left: 0px">  <select class="btn-indigo" id="atdclass" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                            <c:forEach items="${classteacherList}" var="ct">
                                                <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                            </c:forEach>
                                        </select></div>
                                    </div>
                                </div>

                                <input class="" id="atdno" type="hidden" value="${attendancenumber}">

                                <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                    <div style="">
                                        <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #5cc0de"></i> 考 勤 日 期 ：</div>
                                        <div class="col-md-7" style="padding-left: 0px">
                                            <input id="kaoqindate"  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                    <div style="">
                                        <div class="col-md-4" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 0px;padding-top: 5px"><i class="fa fa-tag" style="color: #5db85d"></i> 班级考勤名：</div>
                                        <div class="col-md-7" style="padding-left: 0px">
                                            <input id="kaoqinname" type="text" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px;border: 0.1px solid cadetblue" placeholder="/请输入考勤名">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">
                                    <div style="">
                                        <div class="col-md-4" style=""><button  class="btn btn-success btn-xs"  id="startkao">开始考勤</button></div>
                                        <button style="display: none" id="kaishi" data-toggle="modal" data-target="#myModal"></button>
                                        <div class="col-md-7" style="padding-left: 0px">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro"><div style="font-size:14px;padding-left:10px;padding-right:10px;width: 100%;background-color: #d9edf7;border-radius: 3px;padding: 5px;border: 0px" >
                                    <p id="stuleaveinfos" style="padding-left:10px;padding-right:10px"></p>
                                </div>
                                </div>


                                <div class="col-md-12" style="padding-left:0px;padding-top: 20px;padding-bottom: 5px;border-bottom: 1px solid gainsboro">&nbsp;</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-8">
            <div class="" style="background-color: white;border: 0.1px solid gainsboro">
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 0px;">
                    <h>请假记录管理</h>
                </div>
                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 3px;">

                    <div class="col-md-1" style="padding-left: 0px;padding-top: 8px">
                        <button class="btn-xs btn btn-primary"  id="addstuleave">新增请假</button>
                        <button type="" style="display: none" id="addstuleave2" data-toggle="modal" data-target="#myModal2"></button>

                    </div>

                    <div class="modal inmodal" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" style="border-radius: 5px">
                            <div class="modal-content animated flipInY" style="border-radius: 5px">
                                <div class="modal-header">
                                    <h4 class="modal-title">修改请假信息</h4>
                                </div>
                                <div class="modal-body">

                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i> 学 员 班 级 ：</div>
                                        <div class="col-md-5" style="padding-left: 15px">    <input type="" style="height: 26px;border-radius:5px;padding-left:10px;background-color: lightgrey;border: 0px" readonly="readonly" id="leaveclassname" value="20170701">
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 8px"><i class="fa fa-tag" style="color: #24c6c8"></i> 请 假 学 员 ：</div>
                                        <div class="col-md-3" style="padding-top: 5px;padding-left: 15px" >
                                            <input type="" readonly="readonly" value="郑庆坤" style="height: 26px;border-radius:5px;padding-left:10px;background-color: lightgrey;border: 0px" id="leavestuname">
                                        </div>
                                    </div>


                                    <div class="row" style="padding-top: 15px">
                                        <div class="col-lg-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #5cc0de"></i> 考 勤 日 期 ：</div>
                                        <div class="col-md-4" style="padding-left: 15px">
                                            <input  readonly="readonly" id="leavedays"  type="date" style="border-radius:5px;background-color: lightgrey;border: 0px;width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 10px"><i class="fa fa-tag" style="color: #f8ac5a"></i> 备注 / 原因：</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"></div>
                                        <div class="col-md-6" style="padding-top: 2px;padding-left: 15px">
                                            <textarea style="height: 60px" id="leaveremark"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer" >
                                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanupdate">关闭</button>
                                    <input value="" type="hidden" id="leaveupdateid">
                                    <button type="button" id="updateleave" class="btn btn-primary">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" style="border-radius: 5px">
                            <div class="modal-content animated flipInY" style="border-radius: 5px">
                                <div class="modal-header">
                                    <h4 class="modal-title">学员请假记录</h4>
                                </div>
                                <div class="modal-body">
                                    <div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 5px"><i class="fa fa-tag" style="color: #ed5666"></i> 请选择班级：</div>
                                        <div class="col-md-5" style="padding-left: 15px">  <select class="btn-indigo" id="leaveclass" style="height:26px;padding-left: 0px;color: white;border-radius: 5px">
                                            <c:forEach items="${classteacherList}" var="ct">
                                                <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                                            </c:forEach>
                                        </select></div>
                                    </div>

                                    <div class="row" style="margin-top: 5px">
                                            <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 8px"><i class="fa fa-tag" style="color: #24c6c8"></i> 请选择学员：</div>
                                        <div class="col-md-3" style="padding-top: 2px;padding-left: 15px" id="selectstu">
                                            <select class="btn-success" id="leavestu" style="height:26px;width:84.1px;padding-left: 0px;color: white;border-radius: 5px">
                                                    <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>
                                                <option style="background-color: white;color: darkslategray" value="1">正秦昆</option>

                                            </select></div>
                                            </div>


                                    <div class="row" style="padding-top: 15px">
                                        <div class="col-lg-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 2px"><i class="fa fa-tag" style="color: #5cc0de"></i> 考 勤 日 期 ：</div>
                                        <div class="col-md-4" style="padding-left: 15px">
                                            <input id="leavedate"  type="date" style="width:100%;height: 26px;font-size: 12px;padding-left: 8px" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-md-3" style="font-size: 15px ;font-weight: 400;padding-right: 0px;padding-left: 15px;padding-top: 10px"><i class="fa fa-tag" style="color: #f8ac5a"></i> 备注 / 原因：</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"></div>
                                        <div class="col-md-6" style="padding-top: 2px;padding-left: 15px">
                                            <textarea style="height: 60px" id="yuanyin"></textarea>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="modal-footer" id="dibu">
                                    <button type="button" class="btn btn-white" data-dismiss="modal" id="guanadd">关闭</button>
                                    <input value="" type="hidden" id="leaveleaveid">
                                    <button type="button" id="baochustuleave" class="btn btn-primary">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2" style="padding-left: 0px;padding-top: 8px">
                        <select style="background-color: #7c86cb;height: 26px;color: white;border-radius: 5px" id="myclass">
                            <c:forEach items="${classteacherList}" var="ct">
                                <option style="background-color: white;color: darkslategray" value="${ct.class_id}">${ct.classname}</option>
                            </c:forEach>
                        </select>
                    </div>





                    <div class="col-md-3" style="padding-left: 0px;padding-top: 8px">
                        <div class="input-group">
                            <input type="text"  id="classname" class="form-control"style="height: 26.5px;font-size:12px" placeholder="请输入班级名">
                            <span class="input-group-btn">
						<button class="btn btn-primary btn-xs"  id="seletclassname" type="button">
							班级查询
						</button>
					</span>

                        </div><!-- /input-group -->
                    </div>


                </div>

                <div class="row" style="padding-left:30px;padding-right:30px;padding-top: 5px;padding-bottom: 8px;">
                    <div class="col-md-12" style="border-bottom: 1px solid silver"></div>
                </div>
                <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="border-radius: 5px">
                    <div class="modal-dialog"  style="border-radius: 5px">
                        <div class="modal-content animated bounceInRight"  style="border-radius: 5px">
                            <div class="modal-header">

                                <h3 class="modal-title" id="name">20170701班第27次考勤情况</h3>
                                <small class="font-bold">
                                </small>
                            </div>
                            <div class="modal-body" style="padding:16px;padding-top: 0px;padding-bottom: 0px" id="modalbody">
                                <div class="row">
                                    <div class="panel-body " id="tables" style="background-color: white">
                                        <div >
                                            <table id="datatables" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                                                <thead>
                                                <tr>

                                                    <th>姓名</th>
                                                    <th>学号</th>
                                                    <th>评分</th>
                                                </tr>
                                                </thead>

                                                <tr class="ldivwai">

                                                    <td>副学研<input type="hidden" value="3" class="stuid">
                                                        <input type="hidden" value="80" class="stutotalscore"> </td>
                                                    <td><span class="label label-warning">2020</span></td>
                                                    <td><div><select class="ltselect">
                                                        <option class="ltsop" value="1">正常</option>
                                                        <option class="ltsop" value="2">请假</option>
                                                        <option class="ltsop" value="3">迟到</option>
                                                        <option class="ltsop" value="4">旷课</option>
                                                        <option class="ltsop" value="5">待定</option>
                                                    </select></div></td>
                                                </tr>

                                                <tr class="ldivwai">

                                                    <td>zqk<input type="hidden" value="3" class="stuid">
                                                        <input type="hidden" value="80" class="stutotalscore"></td>
                                                    <td><span class="label label-info">正常</span></td>
                                                    <td><div><select class="ltselect">
                                                        <option class="ltsop" value="1">正常</option>
                                                        <option class="ltsop" value="2">请假</option>
                                                        <option class="ltsop" value="3">迟到</option>
                                                        <option class="ltsop" value="4">旷课</option>
                                                        <option class="ltsop" value="5">待定</option>
                                                    </select></div></td>
                                                </tr>

                                                <tr class="ldivwai">

                                                    <td>笑你快<input type="hidden" value="3" class="stuid">
                                                        <input type="hidden" value="80" class="stutotalscore"></td>
                                                    <td><span class="label label-info">请假</span></td>
                                                    <td><div><select class="ltselect">
                                                        <option class="ltsop" value="1">正常</option>
                                                        <option class="ltsop" value="2">请假</option>
                                                        <option class="ltsop" value="3">迟到</option>
                                                        <option class="ltsop" value="4">旷课</option>
                                                        <option class="ltsop" value="5">待定</option>
                                                    </select></div></td>
                                                </tr>

                                                </tbody>

                                            </table>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="guanbi" class="btn btn-white" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="tijiao">保存</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body " id="tabless">
                    <div id="classatd">
                        <table id="datatable" class="table table-striped dt-responsive nowrap" style="border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro">
                            <thead>
                            <tr>
                                <th>班级名</th>
                                <th>姓名</th>
                                <th>备注/原因</th>
                                <th>日期</th>
                                <th>操作</th>


                            </tr>
                            </thead>
                            <tbody id="showstu">


                            <c:forEach items="${stuleaveList}" var="sl">
                                <tr class="gradeX">
                                    <td class="leaveclassnamexian">${sl.classname}</td>
                                    <td class="leavestunamexian">${sl.stuname}</td>
                                    <c:if test="${sl.stuleave_state==1}">
                                        <td class="leaveremarksxian"><span>${sl.stuleave_remarks}</span>&nbsp;<span class="label label-warning">默认</span></td>
                                    </c:if>
                                    <c:if test="${sl.stuleave_state==0}">
                                        <td class="leaveremarksxian">${sl.stuleave_remarks}&nbsp;</td>
                                    </c:if>

                                    <td claas="leavedayxian">${sl.stuleave_days}</td>
                                    <td class="center">
                                        <input value="${sl.stuleave_id}" type="hidden" class="leaveidxian">
                                        <button class="btn-success btn btn-xs xiugai"   type="button" style="padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white" >修改</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div><!--end row-->
    <button type="" data-toggle="modal" data-target="#myModal3" id="xiugaixian" style="display: none"></button>
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

<script src="table/js/sweet-alert.min.js"></script>

<script src="js/bootstrap-select.js"></script>

<script src="select/js/bootstrap-select.js"></script>
<script>

    $(document).ready(function () {
        $('#datatable').dataTable();
        $('#datatables').dataTable();
    });

</script>
<script type="text/javascript">
    //保存修改请假信息
    function xiugaibaocun() {
        $("#updateleave").click(function () {
            var leaveremark=$("#leaveremark").val();
            var leaveupdateid=$("#leaveupdateid").val();
            if(leaveremark==""){
                $("#guanupdate").click();
                swal({
                    title: "",
                    text: "备注/原因不能为空！请填写完整！",
                    type: "info",
                    showCancelButton: false,
                    cancelButtonClass: 'btn-secondary ',
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "填写",
                    cancelButtonText: "No, cancel plx!",
                }, function (isConfirm) {
                    if (isConfirm) {
                        $("#xiugaixian").click();
                    }
                });
            }else {
                $.ajax({
                    type: "post",
                    url: "/updateleave",
                    data:{"stuleaveid":leaveupdateid,
                            "leaveremark":leaveremark},
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
                        }
                    }, error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
            }
        })
    }
    function  baocunstuleave() {
        $("#baochustuleave").click(function () {
            if($("#yuanyin").val()==""){
                $("#guanadd").click();
                swal({
                    title: "",
                    text: "备注/原因不能为空！请填写完整！",
                    type: "info",
                    showCancelButton: false,
                    cancelButtonClass: 'btn-secondary ',
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "填写",
                    cancelButtonText: "No, cancel plx!",
                }, function (isConfirm) {
                    if (isConfirm) {
                        $("#addstuleave2").click();
                    }
                });
            }else {
                var stuleave=new Object();
                stuleave.class_id=$("#leaveclass").val();
                stuleave.stu_id=$("#leavestu").val();
                stuleave.stuleave_day=$("#leavedate").val();
                stuleave.stuleave_remarks=$("#yuanyin").val();
                stuleave.stuleave_state=0;
                var stuleaves=JSON.stringify(stuleave)
                $.ajax({
                    type: "post",
                    url: "/insertstuleave",
                    data:{"stuleaves":stuleaves},
                    dataType: "json",
                    success: function (data) {
                            if(data==1){
                                $("#guanadd").click();
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
                                $("#guanadd").click();
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
                    }, error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
            }
        })
    }
    //根据班级id获取该班级学员信息
    function selectstuinfobyleaveclassid() {
        $("#leaveclass").change(function () {
            var classid=$("#leaveclass").val();
            huoquxueyuan(classid);
        })
    }
//获取请假学员
    function addstuleave() {
        $("#addstuleave").click(function () {
            $("#addstuleave2").click();
            var classid=$("#leaveclass").val();
            huoquxueyuan(classid);
        })
    }
    function huoquxueyuan(classid) {
        $.ajax({
            type: "post",
            url: "/selectstubyclassid",
            data:{"classid":classid},
            dataType: "json",
            success: function (data) {
                $("#leavestu").html("");
                var str="";
                $.each(data, function (i, item) {
                    str+="                        <option style=\"background-color: white;color: darkslategray\" value="+item.stu_id+">"+item.stu_name+"</option>\n"
                })
                $("#leavestu").append(str)
            }, error: function () {
                alert("系统异常，请稍后重试！");
            }
    })

    }
    function  atdclass() {
        $("#atdclass").change(function () {
            selectnumber();
            selectatdleave();
        })
    }
    function selectstuleavebymyclass() {
        $("#myclass").change(function () {
            var stuleaves=new Object();
            stuleaves.class_id=$("#myclass").val();
            var stuleave=JSON.stringify(stuleaves)
            selectstuleavebystu(stuleave);
        })
    }
    //根据条件查询请假学员
    function selectstuleavebystu(stuleaves) {
        $.ajax({
            type: "post",
            url: "/selectstuleavebystu",
            data:{"stuleaves":stuleaves},
            dataType: "json",
            success: function (data) {
                if(data==1){
                    swal({
                        title: "",
                        text: "SORRY!您没有权限访问该班级或该班级未创建！",
                        type: "error",
                        showCancelButton: true,
                        cancelButtonClass: 'btn-secondary',
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: '确定!'
                    });}else {
                    $("#classatd").html("");
                    var str = " <table id=\"datatable\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                        "                            <thead>\n" +
                        "                            <tr>\n" +
                        "                                <th>班级名</th>\n" +
                        "                                <th>姓名</th>\n" +
                        "                                <th>备注/原因</th>\n" +
                        "                                <th>日期</th>\n" +
                        "                                <th>操作</th>\n" +
                        "                            </tr>\n" +
                        "                            </thead>\n" +
                        "                            <tbody id=\"showstu\">";
                    $.each(data, function (i, item) {
                        var c = ""
                        if (item.stuleave_state == 1) {
                            c += "<span class=\"label label-warning\">默认</span>";
                        } else {
                            c += "";
                        }
                        str += "                              <tr class=\"gradeX\">\n" +
                            "                                    <td >" + item.classname + "</td>\n" +
                            "                                    <td>" + item.stuname + "</td>\n" +
                            "                                    <td>" + item.stuleave_remarks + "&nbsp;" + c + "</td>\n" +
                            "                                    <td>" + item.stuleave_days + "</td>\n" +
                            "                                    <td class=\"center\">\n" +
                            "                                        <input value=" + item.stuleave_id + " type=\"hidden\" class=\"leaveidxian\">\n" +
                            "                    <button class=\"btn-success btn btn-xs xiugai\"   type=\"button\" style=\"padding-top: 2px;padding-bottom: 5px;height: 22px;background-color: #24c6c8;color: white\" >修改</button>\n" +
                            "                 </tr>\n" +
                            "  "
                    })
                    str += "  </tbody></table>"
                    $("#classatd").append(str);
                    $('#datatable').dataTable();
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
    //考勤日期更变
    function kaoqingdatechange() {
        $("#kaoqindate").change(function () {
            selectatdleave();
        })
    }
    var stuleave=new Array();
    var stuleaveinfo="";
    //查询考勤请假学院
    function selectatdleave() {
        var classid=$("#atdclass").val()
        var classname=$("#atdclass").find("option:selected").text()
        var kaoqingdate=$("#kaoqindate").val();

        $.ajax({
            type: "post",
            url: "/getclassleave",
            data:{"classid":classid,"kaoqingdate":kaoqingdate},
            dataType: "json",
            success: function (data) {
                if(data==2){
                    stuleaveinfo=classname+"班"+kaoqingdate+"日暂无请假人员"
                    $("#stuleaveinfos").html(stuleaveinfo);
                }else if(data ==0){
                }else{
                    stuleaveinfo=stuleaveinfo=classname+"班"+kaoqingdate+"日请假人员有："
                    $.each(data, function (i, item) {
                        stuleave.push(item.stu_id);
                        stuleaveinfo+=item.stuname+",";

                        $("#stuleaveinfos").html(stuleaveinfo);
                    })
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    }
    //查询班级考勤次数
    function selectnumber() {
        var classid=$("#atdclass").val();
        $.ajax({
            type: "post",
            url: "/addatdgetno",
            data:{"classid":classid},
            dataType: "json",
            success: function (data) {
                $("#atdno").val(data);
                var aaa=parseInt(data)+1;
                var bbb=$("#atdclass").find("option:selected").text()
                var ccc=bbb+"班第"+aaa+"次考勤记录"
                $("#kaoqinname").val(ccc);
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })

    }
    //根据班级名称查询请假记录
    function seletclassname() {
        $('#seletclassname').click(function () {
            if(classname==""){
                swal({
                    title: "",
                    text: "SORRY!您的班级名请填写完整",
                    type: "error",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary',
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: '确定!'
                });
            }else {
                var stuleaves=new Object();
                stuleaves.classname=$("#classname").val();
                var stuleave=JSON.stringify(stuleaves)
                selectstuleavebystu(stuleave);
            }
        })
    }
    //
    function showstudentinfos() {
        $(".showstudentinfos").on("click",function(){

        });

    }
    //根据条件查询学生信息
    function huoquxuesheng(){
        $("#startkao").click(function () {
            var classid=$("#atdclass").val();
            $("#modalbody").html("");
            if(classid==-1){
                swal({
                    title: "Sorry!",
                    text: "对不起！您目前没有正在带的班级",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonClass: 'btn-secondary ',
                    confirmButtonClass: 'btn-warning  ',
                    confirmButtonText: '确定!'
                });
            }else {
                $("#kaishi").click();
                $.ajax({
                    type: "post",
                    url: "/addatdrecord",
                    data:{"classid":classid},
                    dataType: "json",
                    success: function (data) {
                        var str="<div class=\"row\">\n" +
                            "                                    <div class=\"panel-body \" id=\"tables\" style=\"background-color: white\">     <div class=\"col-md-12\" style=\"padding-left:0px;padding-top: 0px;padding-bottom: 5px;\"><div style=\"font-size:14px;padding-left:10px;padding-right:10px;width: 100%;background-color: #d9edf7;border-radius: 3px;padding: 5px;border: 0px\" >\n" +
                            "                                    <p id=\"stuleaveinfos\" style=\"padding-left:10px;padding-right:10px\">"+stuleaveinfo+"</p>\n" +
                            "                                </div>\n" +
                            "                                </div>\n" +
                            "                                        <div >\n" +
                            "                                            <table id=\"datatables\" class=\"table table-striped dt-responsive nowrap\" style=\"border-top: solid 1px gainsboro;margin-top: 5px;border-bottom: 1px solid gainsboro\">\n" +
                            "                                                <thead>\n" +
                            "                                                <tr>\n" +
                            "                                                    <th style=\"text-align: center\">姓名</th>\n" +
                            "                                                    <th style=\"text-align: center\">学号</th>\n" +
                            "                                                    <th style=\"text-align: center\">出勤</th>\n" +
                            "                                                </tr>\n" +
                            "                                                </thead>\n" +
                            "                                                <tbody>\n"
                        $.each(data, function (i, item) {
                            str+="<tr class=\"ldivwai\">"
                            str+="<td style=\"text-align: center\"> <span class=\"label label-info \">"+item.stuname+"</span><input type=\"hidden\" value="+item.stu_id+" class=\"stuid\"><input type=\"hidden\" value="+item.stuname+" class=\"stunames\">\n" +
                                "                                <input type=\"hidden\" value="+item.sts_id+" class=\"stsid\">\n" +
                                "                                    <input type=\"hidden\" value="+item.stu_totalscore+" class=\"stutotalscore\"></td>"
                            str+="<td style=\"text-align: center\"> "+item.stuno+"</td>";
                            str+="<td style=\"text-align: center\"><div><select class=\"ltselect\" >\n"
                            $.each(pingfens, function (i, item) {
                                str+="<option class=\"ltsop\" value="+item.ss_id+">"+item.ss_name+"</option>\n"
                            })

                            str+="</select></div></td></tr>";
                        })
                        str+="               </tbody>\n" +
                            "                                            </table>\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>"
                        $("#modalbody").append(str);

                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
            }

        })
    }
    function changeForm() {
        $("body").on("change", ".ltselect", function () {
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
    //生成考勤名当前日期等初始辅助工具
    function shengchengkaoqingming() {
        var aaa=parseInt($("#atdno").val())+1;
        var bbb=$("#atdclass").find("option:selected").text()
        var ccc=bbb+"班第"+aaa+"次考勤记录"
        $("#kaoqinname").val(ccc);
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        $("#leavedate").val(currentdate);
        $("#kaoqindate").val(currentdate);
    }
    var myMap = new Map();
    var pingfens;
    //评分标准获取
    function pingfenhuoqu() {
        $.ajax({
            type: "post",
            url: "/getscorings",
            dataType: "json",
            success: function (data) {
                pingfens=data;
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
    //提交考勤结果
    function tijaos() {
        $("#tijiao").click(function () {
            //学生出勤记录
            var kaoqindates=$("#kaoqindate").val();
            var stuleaveList=new Array();
            var stuattendancelist= new Array();
            var classids=$("#atdclass").val();
            var cadnumber=parseInt($("#atdno").val())+1;
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
                var stuname=$(data).find(".stunames").val();
                if(kaoqin==2){
                    var count=0;
                    for (var i=0;i<=stuleave.length;i++){
                        if(stuid==stuleave[i]){
                            count =1;
                        }
                    }
                    if(count!=1){
                        var objectl = new Object();
                        objectl.stuname=stuname
                        objectl.stu_id = stuid;
                        objectl.stuleave_remarks ="请假";
                        objectl.stuleave_state=1;
                        objectl.class_id=classids;
                        alert(stuname);
                        stuleaveList.push(objectl);
                    }
                }
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
            var studentScoreList=JSON.stringify(stutotalscorelist);
            var leaveLists=JSON.stringify(stuleaveList);
            var chuqinglv=((zhengchang/quanbu).toFixed(2)*100);
            var classatdname=$("#kaoqinname").val();

                $.ajax({
                    type: "post",
                    url: "/doinsetadt",
                    data:{
                        "stuattendancelists": stuattendancelists,
                        "studentScoreList": studentScoreList,
                        "leaveLists":leaveLists,
                        "classids": classids,
                        "chuqinglv": chuqinglv,
                        "cadnumber":cadnumber,
                        "kaoqindate":kaoqindates,
                        "classatdname":classatdname,
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data==1){
                            $("#guanbi").click();
                            selectnumber();
                            selectatdleave();
                            swal({
                                title: "Sussess！",
                                text: "恭喜添加成功！本班本次出勤率为"+chuqinglv+"%",
                                type: "success",
                                showCancelButton: true,
                                cancelButtonClass: 'btn-secondary ',
                                confirmButtonClass: 'btn-success  ',
                                confirmButtonText: '确定'
                            });

                        }else if (data==3){
                            alert("222222222222222222")
                        }else{
                            alert("sorry!系统出错")
                        }
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
        })

    }
    function xiugaixianshi() {
        $("body").on("click",".xiugai",function(){

            var leaveid=$(this).parent().find(".leaveidxian").val();

            $.ajax({
                type: "post",
                url: "/selectstubystuleaveid",
                data:{"stuleaveid":leaveid},
                dataType: "json",
                success: function (data) {
                    if(data==0||data==1){
                        swal({
                            title: "Sorry!",
                            text: "SORRY!系统延迟或访问的人过多轻稍后再试！",
                            type: "error",
                            showCancelButton: false,
                            cancelButtonClass: 'btn-secondary',
                            confirmButtonClass: 'btn-danger',
                            confirmButtonText: '确定!'
                        });
                    }else {
                        $("#leaveremark").val(data.stuleave_remarks);
                        $("#leaveclassname").val(data.classname);
                        $("#leavestuname").val(data.stuname);
                        $("#leaveupdateid").val(data.stuleave_id);
                        $("#leavedays").val(data.stuleave_days);
                        $("#xiugaixian").click();
                    }
                }, error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })
        })
    }
    function xiugai() {
        $(".xiugai").click(function () {
            var leaveid=$(this).parent().find(".leaveidxian").val();

            $.ajax({
                type: "post",
                url: "/selectstubystuleaveid",
                data:{"stuleaveid":leaveid},
                dataType: "json",
                success: function (data) {
                    if(data==0||data==1){
                        swal({
                            title: "Sorry!",
                            text: "SORRY!系统延迟或访问的人过多轻稍后再试！",
                            type: "error",
                            showCancelButton: false,
                            cancelButtonClass: 'btn-secondary',
                            confirmButtonClass: 'btn-danger',
                            confirmButtonText: '确定!'
                        });
                    }else {
                        $("#leaveremark").val(data.stuleave_remarks);
                        $("#leaveclassname").val(data.classname);
                        $("#leavestuname").val(data.stuname);
                        $("#leaveupdateid").val(data.stuleave_id);
                        $("#leavedays").val(data.stuleave_days);
                        $("#xiugaixian").click();
                    }
                }, error: function () {
                    alert("系统异常，请稍后重试！");
                }
            })


        })
    }
    $(function () {
        xiugaixianshi();
        xiugaibaocun();
        baocunstuleave();

        selectstuleavebymyclass();
        shengchengkaoqingming();
        addstuleave();
        kaoqingdatechange();
        selectatdleave();
        atdclass();
        selectstuinfobyleaveclassid();
        seletclassname();
        huoquxuesheng();
        seletclassname();
        pingfenhuoqu();
        changeForm()
        tijaos()
        showstudentinfos();

    })

</script>

</body>
</html>
