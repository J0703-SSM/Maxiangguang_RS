﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
        <script src="/resources/js/jquery-3.2.1.js"></script>
        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc")
                    btnObj.className = "sort_asc";
                else
                    btnObj.className = "sort_desc";
            }

            //启用
            function startFee() {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //删除
            function deleteFee() {
                var r = window.confirm("确定要删除此资费吗？");
                document.getElementById("operate_result_info").style.display = "block";
            }
        </script>        
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="/index" class="index_off"></a></li>
                <li><a href="/role_list" class="role_off"></a></li>
                <li><a href="/admin_list" class="admin_off"></a></li>
                <li><a href="/fee_list" class="fee_off"></a></li>
                <li><a href="/account_list" class="account_off"></a></li>
                <li><a href="/service_list" class="service_off"></a></li>
                <li><a href="/bill_list" class="bill_off"></a></li>
                <li><a href="/report_list" class="report_off"></a></li>
                <li><a href="/user_info" class="information_off"></a></li>
                <li><a href="/user_modi_pwd" class="password_on"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="">
                <!--排序-->
                <div class="search_add">
                    <div>
                        <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />-->
                        <input type="button" value="基费" class="sort_asc" onclick="sort(this);" id="b1" />
                        <input type="button" value="时长" class="sort_asc" onclick="sort(this);" id="b2"/>
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='fee_add.jsp';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长(小时)</th>
                            <th>基本费用(元)</th>
                            <th>单位费用(元/小时)</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>
                        <c:forEach var="cost" items="${costList}" varStatus="vs">
                            <tr>
                                <td>${cost.costId}</td>
                                <td><a href="fee_detail.jsp">${cost.costName}</a></td>
                                <td><c:if test="${cost.baseDuration != 0}">${cost.baseDuration}</c:if></td>
                                <td><c:if test="${cost.baseCost != 0}">${cost.baseCost}</c:if></td>
                                <td><c:if test="${cost.unitCost != 0}">${cost.unitCost}</c:if></td>
                                <td><fmt:formatDate value="${cost.creatTime}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${cost.startTime}" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${cost.status == '0'}">
                                            暂停
                                        </c:when>
                                        <c:when test="${cost.status == '1'}">
                                            开通
                                        </c:when>
                                    </c:choose>

                                </td>
                                <td>
                                    <c:if test="${cost.status == '0'}">
                                        <input type="button" value="启用" class="btn_start" onclick="startFee();" />
                                        <input type="button" value="修改" class="btn_modify" onclick="location.href='fee_modi.jsp';" />
                                        <input type="button" value="删除" class="btn_delete" onclick="deleteFee();" />
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)云科技有限公司</p>
        </div>
        <script>

            $("#b1").click(function () {
                $.ajax({
                    type: "POST",
                    url: "/feeOrderByBaseDuration",
                    data: {
                        baseDuration: 1,
                        des: $("#b1").className.val()
                    },
                    success: function (result) {
                        console.log(result.data);

                        if (result.errorCode == 0) {

                            // for循环添加tr标签
                            console.log(1111);
                        }
                    }
                })
            })


        </script>

    </body>
</html>