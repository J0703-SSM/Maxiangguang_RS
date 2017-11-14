﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/JQ3.2.1.js"></script>
</head>
<body class="index">
<div class="login_box">
    <table>
        <form action="/login" method="post">
            <tr>
                <td class="login_info">账号：</td>
                <td colspan="2"><input name="name" type="text" class="width150" /></td>
                <td class="login_error_info"><span class="required">
                    <c:choose>
                        <c:when test="${nameError == '' || nameError == null}">30长度的字母、数字和下划线</c:when>
                        <c:otherwise>${nameError.defaultMessage}</c:otherwise>
                    </c:choose>
                </span></td>
            </tr>
            <tr>
                <td class="login_info">密码：</td>
                <td colspan="2"><input name="password" type="password" class="width150" /></td>
                <td><span class="required">
                    <c:choose>
                        <c:when test="${pwdError == '' || pwdError == null}">30长度的字母、数字和下划线</c:when>
                        <c:otherwise>${pwdError.defaultMessage}</c:otherwise>
                    </c:choose>
                </span></td>
            </tr>
            <tr>
                <td class="login_info">验证码：</td>
                <td class="width70"><input name="code" type="text" class="width70"/></td>
                <td><img src="/getVerifyCode" alt="验证码" title="点击更换" id="verifyCodeImage" onclick="changeImage()"/></td>
                <td><span class="required">${codeError}</span></td>
            </tr>
            <tr>
                <td></td>
                <td class="login_button" colspan="2">
                    <img id="sub" src="/resources/images/login_btn.png" onclick="document.forms[0].submit()"/>
                </td>
                <td><span class="required">${error}</span></td>
            </tr>
            <%--<input type="text" name="adminId" value="23" hidden="hidden">--%>
        </form>
    </table>
</div>
<script>
    function changeImage() {
        $('#verifyCodeImage').attr('src', '/getVerifyCode');
    }
</script>
</body>
</html>
