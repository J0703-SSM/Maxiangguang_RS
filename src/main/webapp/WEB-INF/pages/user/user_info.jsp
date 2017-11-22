<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"/>
    <script language="javascript" type="text/javascript">
        //保存成功的提示信息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
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
<!--主要区域开始-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，数据并发错误！-->
    <form action="${pageContext.request.contextPath}/user/user_update" method="post" class="main_form">
        <input type="hidden" name="adminId" value="${admin.adminId}">
        <input type="hidden" name="password" value="${admin.password}"/>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" name="adminCode"
                                       value="${admin.adminCode}"/></div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info">
            <input type="text" readonly="readonly" class="readonly width400" name="role" value="${admin.role}"/>
        </div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" id="name" name="name" value="${admin.name}" onblur="isString(this.value)"/>
            <span class="required">*</span>
            <div id="test1" class="validate_msg_long error_msg">${nameEr.defaultMessage}
                <c:if test="${nameEr ==null || nameEr == ''}">20长度以内的汉字、字母的组合</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" id="tel" class="width200" name="telephone" value="${admin.telephone}" onblur="isTelephone(this.value)"/>
            <div id="test2" class="validate_msg_medium">${telephoneEr.defaultMessage}
                <c:if test="${telephoneEr ==null || telephoneEr == ''}">电话号码格式：手机或固话</c:if></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" id="email" class="width200" name="email" value="${admin.email}" onblur="isEmail(this.value)"/>
            <div id="test3" class="validate_msg_medium">
                ${emailEr.defaultMessage}
                <c:if test="${emailEr ==null || emailEr == ''}">50长度以内，符合 email 格式</c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>创建时间：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" name="enrolldate"
                                       value="${admin.enrolldate}"/></div>
        <div class="button_info clearfix">
            <input type="submit" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="location.href = '${pageContext.request.contextPath}/index'"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司 </p>
</div>
<script>
    function isEmail(obj){
        var reg=/^\w{3,}@\w+(\.\w+)+$/;
        if(!reg.test(obj)){
            $("#test3").html("<b>请输入正确的邮箱地址</b>");
        }else{
            $("#test3").html("");
        }
    }
    function isString(obj){
        var reg=/^[a-z,A-Z]+$/;
        if(!reg.test(obj)){
            $("#test1").html("<b>只能输入字符</b>");
        }else{
            $("#test1").html("");
        }
    }
    function isTelephone(obj){
        var reg1=/^(\d{3,4}\-)?[1-9]\d{6,7}$/;
        var reg2=/^(\+\d{2,3}\-)?\d{11}$/;
        if(!reg1.test(obj) || !reg2.test(obj)){
            $("#test2").html("<b>请输入正确的电话号码！</b>");
        }else{
            $("#test2").html("");
        }
    }
</script>
</body>
</html>
