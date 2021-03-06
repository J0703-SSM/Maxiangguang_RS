﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script language="javascript" type="text/javascript">
        //删除
        function deleteAccount() {
            var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
            document.getElementById("operate_result_info").style.display = "block";
        }
        //开通或暂停
        function setState() {
            var r = window.confirm("确定要开通此账务账号吗？");
            document.getElementById("operate_result_info").style.display = "block";
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="../images/logo.png" alt="logo" class="left"/>
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
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>身份证：<input type="text" value="" placeholder="18位身份证号码" class="text_search"/></div>
            <div>姓名：<input type="text" class="width70 text_search" value="" placeholder="如: 张三"/></div>
            <div>登录名：<input type="text" value="" placeholder="如: zhangsan" class="text_search"/></div>
            <div>
                状态：
                <select class="select_search">
                    <option>全部</option>
                    <option>开通</option>
                    <option>暂停</option>
                    <option>删除</option>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search"/></div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/account/account_addPrep';"/>
        </div>
        <!--删除等的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
            删除成功，且已删除其下属的业务账号！
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>账号ID</th>
                    <th>姓名</th>
                    <th class="width150">身份证</th>
                    <th>登录名</th>
                    <th>状态</th>
                    <th class="width100">创建日期</th>
                    <th class="width150">上次登录时间</th>
                    <th class="width200"></th>
                </tr>

                <c:forEach var="account" items="${pageBean.beanList}">
                    <tr>
                        <td>${account.accountId}</td>
                        <td><a href="${pageContext.request.contextPath}/account/account_detail?accountId=${account.accountId}">${account.realName}</a></td>
                        <td>${account.idcardNo}</td>
                        <td>${account.loginName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${account.status == 0}">
                                    未开通
                                </c:when>
                                <c:when test="${account.status == 1}">
                                    开通
                                </c:when>
                                <c:when test="${account.status == 2}">
                                    暂停
                                </c:when>
                                <c:when test="${account.status == 3}">
                                    删除
                                </c:when>
                            </c:choose>

                        </td>
                        <td><fmt:formatDate value="${account.createDate}" pattern="yyyy-MM-dd"/></td>
                        <td>${account.closeDate}</td>
                        <td class="td_modi">
                            <input type="button" value="暂停" class="btn_pause" onclick="setState();"/>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='${pageContext.request.contextPath}/account/account_updatePrep?accountId=${account.accountId}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p>业务说明：<br/>
                1、创建则开通，记载创建时间；<br/>
                2、暂停后，记载暂停时间；<br/>
                3、重新开通后，删除暂停时间；<br/>
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>
                5、暂停账务账号，同时暂停下属的所有业务账号；<br/>
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br/>
                7、删除账务账号，同时删除下属的所有业务账号。</p>
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
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司 </p>
</div>
</body>
</html>
