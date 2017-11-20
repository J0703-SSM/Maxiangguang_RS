<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
    </head>
    <body class="index">
        <!--导航区域开始-->
        <div id="index_navi">
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath}/index" class="index_on"></a></li>
                <li><a href="${pageContext.request.contextPath}/role/role_list" class="role_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/admin_list" class="admin_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/fee/findAllFee" class="fee_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/account/account_list" class="account_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/service/service_list" class="service_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/bill/bill_list" class="bill_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/report/report_list" class="report_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/user/user_info" class="information_off"></a></li>
                <li><a href="${pageContext.request.contextPath}/user/user_modi_pwd" class="password_off"></a></li>
            </ul>
        </div>
    </body>
</html>
