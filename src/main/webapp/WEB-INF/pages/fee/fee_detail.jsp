<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
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
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>资费ID：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${cost.costId}"/></div>
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${cost.costName}"/></div>
        <div class="text_info clearfix"><span>资费状态：</span></div>
        <div class="input_info">
            <select class="readonly" disabled>
                <c:choose>
                    <c:when test="${cost.status == 0}">
                        <option>暂停</option>
                    </c:when>
                    <c:when test="${cost.status == 1}">
                        <option>开通</option>
                    </c:when>
                    <c:otherwise>
                        <option>删除</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">

            <input type="radio" name="radFeeType"
                   <c:if test="${cost.costType == 2}">checked</c:if> id="monthly" disabled="disabled"/>
            <label for="monthly">包月</label>
            <input type="radio" name="radFeeType"
                   <c:if test="${cost.costType == 1}">checked</c:if> id="package" disabled="disabled"/>
            <label for="package">套餐</label>
            <input type="radio" name="radFeeType"
                   <c:if test="${cost.costType == 3}">checked</c:if> id="timeBased" disabled="disabled"/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input type="text" class="readonly" readonly value="${cost.baseDuration}"/>
            <span>小时</span>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input type="text" class="readonly" readonly value="${cost.baseCost}"/>
            <span>元</span>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input type="text" class="readonly" readonly value="${cost.unitCost}"/>
            <span>元/小时</span>
        </div>
        <div class="text_info clearfix"><span>创建时间：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${cost.createTime}"
                                       pattern="yyyy-MM-dd"/></div>
        <div class="text_info clearfix"><span>启动时间：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${cost.startTime}"
                                       pattern="yyyy-MM-dd"/></div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea class="width300 height70 readonly" readonly>${cost.des}</textarea>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/fee/findAllFee';"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
