﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //排序按钮的点击事件
        function sort(btnObj) {
            if (btnObj.className == "sort_desc") {
                btnObj.className = "sort_asc";
                if (btnObj.value == "基费") {
                    location.href = "/fee/fee_order?orderByCost=desc";
                } else {
                    location.href = "/fee/fee_order?orderByDuration=desc";
                }
            } else {
                btnObj.className = "sort_desc";
                if (btnObj.value == "基费") {
                    location.href = "/fee/fee_order?orderByBase=acs";
                } else {
                    location.href = "/fee/fee_order?orderByDuration=asc";
                }
            }
            if (btnObj.value == "基费" && btnObj.className == "sort_desc") {
                btnObj.className = "sort_asc";
                location.href = "/fee/fee_order?orderByCost=desc";
            } else if (btnObj.value == "基费" && btnObj.className == "sort_asc") {
                btnObj.className = "sort_desc";
                location.href = "/fee/fee_order?orderByCost=asc";
            }


        }

        //启用
        function startFee(param) {
            var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
            if (r) {
                $.post({
                    url: "${pageContext.request.contextPath}/fee/startFee",
                    data: {
                        costId: param
                    }
                });
                location.href = "${pageContext.request.contextPath}/fee/findAllFee";

                document.getElementById("operate_result_info").style.display = "block";
            }

        }
        //删除
        function deleteFee(param) {
            var r = window.confirm("确定要删除此资费吗？");
            if (r) {

                $.post({
                    url: "${pageContext.request.contextPath}/fee/deleteFee",
                    data: {
                        costId: param
                    }
                });
                // 删除某一行
                var rowid = "#" + param;
                $(rowid).remove();
                document.getElementById("operate_result_info").style.display = "block";
            } else {
                return "";
            }
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="/resources/images/logo.png" alt="logo" class="left"/>
    <a href="${pageContext.request.contextPath}/exit">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="${pageContext.request.contextPath}/index" class="index_on"></a></li>
        <c:forEach items="${applicationScope.admin.roleList}" var="role">
            <c:forEach items="${role.privilegeList}" var="privilege">
                <c:if test="${privilege.privilegeId eq 1}">
                    <li><a href="${pageContext.request.contextPath}/role/role_list" class="role_off"></a></li>

                </c:if>
                <c:if test="${privilege.privilegeId eq 2}">
                    <li><a href="${pageContext.request.contextPath}/admin/admin_list" class="admin_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 3}">
                    <li><a href="${pageContext.request.contextPath}/fee/findAllFee" class="fee_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 4}">
                    <li><a href="${pageContext.request.contextPath}/account/account_list" class="account_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 5}">
                    <li><a href="${pageContext.request.contextPath}/service/service_list" class="service_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 6}">
                    <li><a href="${pageContext.request.contextPath}/bill/bill_list" class="bill_off"></a></li>
                </c:if>
                <c:if test="${privilege.privilegeId eq 7}">
                    <li><a href="${pageContext.request.contextPath}/report/report_list" class="report_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <li><a href="${pageContext.request.contextPath}/user/user_info" class="information_off"></a></li>
        <li><a href="${pageContext.request.contextPath}/user/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--排序-->
    <div class="search_add">
        <div>
            <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />-->
            <input type="button" value="基费"
                   class="${pageBean.orderByCost}<c:if test="${pageBean.orderByCost==''||pageBean.orderByCost==null}">sort_asc</c:if>"
                   onclick="sort(this);" id="b1"/>
            <input type="button" value="时长"
                   class="${pageBean.orderByDuration}<c:if test="${pageBean.orderByDuration==''||pageBean.orderByDuration==null}">sort_asc</c:if>"
                   onclick="sort(this);" id="b2"/>
        </div>
        <input type="button" value="增加" class="btn_add" onclick="location.href='/fee/preparedAdd';"/>
    </div>
    <!--启用操作的操作提示-->
    <div id="operate_result_info" class="operate_success">
        <img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
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
            <c:forEach var="cost" items="${pageBean.beanList}">
                <tr id="${cost.costId}">
                    <td id="t1">${cost.costId}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/fee/fee_detail?costId=${cost.costId}">${cost.costName}</a>
                    </td>
                    <td><c:if test="${cost.baseDuration != 0}">${cost.baseDuration}</c:if></td>
                    <td><c:if test="${cost.baseCost != 0}">${cost.baseCost}</c:if></td>
                    <td><c:if test="${cost.unitCost != 0}">${cost.unitCost}</c:if></td>
                    <td><fmt:formatDate value="${cost.createTime}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${cost.startTime}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${cost.status == 0}">
                                暂停
                            </c:when>
                            <c:when test="${cost.status == 1}">
                                开通
                            </c:when>
                        </c:choose>

                    </td>
                    <td>
                        <c:if test="${cost.status == '0'}">
                            <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.costId});"/>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='${pageContext.request.contextPath}/fee/updatePrepared?costId=${cost.costId}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${cost.costId});"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>业务说明：<br/>
            1、创建资费时，状态为暂停，记载创建时间；<br/>
            2、暂停状态下，可修改，可删除；<br/>
            3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br/>
            4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
        </p>
    </div>
    <!--分页-->
    <div id="pages">
        <%--第M/N 页, 首页  上一页 [1] [2]...[10] 下一页  尾页 []Go!--%>
        第 ${pageBean.pc} 页 / 共 ${pageBean.tp} 页
        <a href="${pageBean.url}">首页</a>&nbsp;
        <c:if test="${pageBean.pc > 1}">
            <a href="${pageBean.url}?pc=${pageBean.pc-1}">上一页</a>&nbsp;
        </c:if>

        <%-- 计算 begin 和 end
                 > 如果总页数小于 10 : begin = 1 , end = tp;
                 > 如果总页数大于10 ;
                     计算公式计算: begin= pc -5 , end = pc + 4;
                         * 头溢出: begin < 1 ,  begin = 1;
                         * 尾溢出: end > tp , end = tp
         --%>
        <c:choose>
            <%-- 总页数 <= 10时 --%>
            <c:when test="${pageBean.tp <= 10}">
                <c:set value="1" var="begin"/>
                <c:set value="${pageBean.tp}" var="end"/>
            </c:when>

            <%-- 总页数 > 10 , 使用计算公式计算end ,begin--%>
            <c:otherwise>
                <c:set var="begin" value="${pageBean.pc - 5}"/>
                <c:set var="end" value="${pageBean.pc + 4}"/>

                <%-- 头溢出--%>
                <c:if test="${begin < 1}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="10"/>
                </c:if>

                <%-- 尾溢出--%>
                <c:if test="${end > pageBean.tp}">
                    <c:set value="${pageBean.tp}" var="end"/>
                    <c:set value="${pageBean.tp - 9}" var="begin"/>
                </c:if>
            </c:otherwise>
        </c:choose>

        <%-- for循环遍历 begin -- end  --%>
        <c:forEach begin="${begin}" end="${end}" var="i">
            <c:choose>
                <c:when test="${pageBean.pc == i}">
                    ${i}
                </c:when>
                <c:otherwise>
                    <a href="${pageBean.url}?pc=${i}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>


        <c:if test="${pageBean.pc < pageBean.tp}">
            <a href="${pageBean.url}?pc=${pageBean.pc+1}">下一页</a>&nbsp;
        </c:if>
        <a href="${pageBean.url}?pc=${pageBean.tp}">尾页</a>&nbsp;
    </div>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司</p>
</div>

</body>
</html>
