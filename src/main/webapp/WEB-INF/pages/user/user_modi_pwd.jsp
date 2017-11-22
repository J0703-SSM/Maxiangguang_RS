<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
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
        <!--导航区域结束-->
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->      
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，旧密码错误！-->
            <form action="${pageContext.request.contextPath}/user/user_update_pwd" method="post" class="main_form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" name="password" value="${oldPwd}"/><span class="required">*</span>
                    <div class="validate_msg_medium">${passwordEr}
                        <c:if test="${(passwordEr == null || passwordEr == '')&&(oldPwd == null || oldPwd == '')}">30长度以内的字母、数字和下划线的组合</c:if>
                    </div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input type="password"  class="width200" name="newPassword" value="${newPwd}" /><span class="required">*</span>
                    <div class="validate_msg_medium">
                        ${newPasswordEr}
                        <c:if test="${(newPasswordEr == null || newPasswordEr == '') && (newPwd ==null||newPwd=='')}">30长度以内的字母、数字和下划线的组合</c:if>
                    </div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" name="reNewPassword" /><span class="required">*</span>
                    <div class="validate_msg_medium">
                        ${reNewPasswordEr}
                        <c:if test="${reNewPasswordEr == null || reNewPasswordEr == ''}">两次新密码必须相同</c:if>
                    </div>
                </div>
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" onclick="window.history.back(-1)"/>
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
