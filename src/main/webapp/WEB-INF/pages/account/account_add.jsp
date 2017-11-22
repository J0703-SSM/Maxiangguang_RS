<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"></script>
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

        //显示选填的信息项
        function showOptionalInfo(imgObj) {
            var div = document.getElementById("optionalInfo");
            if (div.className == "hide") {
                div.className = "show";
                imgObj.src = "../images/hide.png";
            }
            else {
                div.className = "hide";
                imgObj.src = "../images/show.png";
            }
        }

        // 获得生日
        function getBirthDate(obj) {
            $.post({
                url: "${pageContext.request.contextPath}/account/getBirthDate",
                data: {
                    idcardNo: obj.value
                },
                success: function (result) {
                    alert(result);
                    $("#birth").val(result)
                }
            })

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
    <!--保存成功或者失败的提示消息-->
    <div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div>
    <form action="${pageContext.request.contextPath}/account/account_add" method="post" class="main_form">
        <!--必填项-->
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" value="${account.realName}" name="realName"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${realNameEr.defaultMessage}
                <c:if test="${(realNameEr == null || realNameEr == '')&& (account.realName == null || account.realName =='')}">
                    20长度以内的汉字、字母和数字的组合
                </c:if>
                </div>
        </div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text" value="${account.idcardNo}" name="idcardNo" onblur="getBirthDate(this)"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${idcardNoEr.defaultMessage}
                <c:if test="${(idcardNoEr == null || idcardNoEr == '')&&(account.idcardNo == null || account.idcardNo =='')}">
                    正确的身份证号码格式
                </c:if>
            </div>
        </div>
        <div class="text_info clearfix"><span>登录账号：</span></div>
        <div class="input_info">
            <input type="text" value="${account.loginName}" name="loginName"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${loginNameEr.defaultMessage}
                <c:if test="${(loginNameEr == null || loginNameEr == '')&&(account.loginName==null || account.loginName =='')}">
                    30长度以内的字母、数字和下划线的组合
                </c:if>
                </div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password" name="loginPasswd" value="${account.loginPasswd}"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${passwordEr.defaultMessage}
                <c:if test="${(passwordEr == null || passwordEr == '')&&(account.loginPasswd==null||account.loginPasswd=='')}">
                    30长度以内的字母、数字和下划线的组合
                </c:if>
                </div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password" name="rePassWord" value="${account.rePassWord}"/>
            <span class="required">*</span>
            <div class="validate_msg_long">
                ${rePasswordEr.defaultMessage}${error}
                <c:if test="${(rePasswordEr == null || rePasswordEr == '')&&(account.rePassWord==null || account.rePassWord=='')
                &&(error==null || error =='')}">
                    两次密码必须相同
                </c:if>
                </div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="telephone" value="${account.telephone}"/>
            <span class="required">*</span>
            <div class="validate_msg_medium">
                ${telephoneEr.defaultMessage}
                <c:if test="${(telephoneEr == null || telephoneEr == '')&&(account.telephone==null||account.telephone=='')}">
                    正确的电话号码格式：手机或固话
                </c:if>
                </div>
        </div>
        <!--可选项-->
        <div class="text_info clearfix"><span>可选项：</span></div>
        <div class="input_info">
            <img src="../images/show.png" alt="展开" onclick="showOptionalInfo(this);"/>
        </div>
        <div id="optionalInfo" class="hide">
            <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
            <div class="input_info">
                <input type="text" name="recommenderIdCard"/>
                <div class="validate_msg_long">
                    ${recommenderIdEr}
                    <c:if test="${(recommenderIdEr == null || recommenderIdEr =='')&&(account.recommenderIdCard==null||account.recommenderIdCard=='')}">
                        正确的身份证号码格式
                    </c:if>
                </div>
            </div>
            <div class="text_info clearfix"><span>生日：</span></div>
            <div class="input_info">
                <input type="text" value="${account.birthDate}" readonly class="readonly" name="birthDate" id="birth"/>
            </div>
            <div class="text_info clearfix"><span>Email：</span></div>
            <div class="input_info">
                <input type="text" class="width350" name="email" value="${account.email}"/>
                <div class="validate_msg_tiny">
                    ${idcardNoEr}
                    <c:if test="${(idcardNoEr == null || idcardNoEr == '')&&(account.email ==null || account.email=='')}">
                        50长度以内，合法的 Email 格式
                    </c:if>
                    </div>
            </div>
            <div class="text_info clearfix"><span>职业：</span></div>
            <div class="input_info">
                <select name="occupation">
                    <option value="干部" <c:if test="${account.occupation == '干部'}">selected</c:if>>干部</option>
                    <option value="学生" <c:if test="${account.occupation == '学生'}">selected</c:if>>学生</option>
                    <option value="技术人员" <c:if test="${account.occupation == '技术人员'}">selected</c:if>>技术人员</option>
                    <option value="其他" <c:if test="${account.occupation == '其他'}">selected</c:if>>其他</option>
                </select>
            </div>
            <div class="text_info clearfix"><span>性别：</span></div>
            <div class="input_info fee_type">
                <input type="radio" name="gender" <c:if test="${account.gender =='女'||account.gender == ''||account.gender==null}">checked</c:if> id="female" value="female"/>
                <label for="female">女</label>
                <input type="radio" name="gender" <c:if test="${account.gender =='男'}">checked</c:if> id="male" value="male"/>
                <label for="male">男</label>
            </div>
            <div class="text_info clearfix"><span>通信地址：</span></div>
            <div class="input_info">
                <input type="text" class="width350" name="mailAddress"/>
                <div class="validate_msg_tiny">
                    ${mailAddressEr}
                    <c:if test="${(mailAddressEr == null || mailAddressEr == '')&&(account.mailAddress ==null || account.mailAddress=='')}">
                        50长度以内
                    </c:if>
                </div>
            </div>
            <div class="text_info clearfix"><span>邮编：</span></div>
            <div class="input_info">
                <input type="text" name="zipCode"/>
                <div class="validate_msg_long">
                    ${mailAddressEr}
                    <c:if test="${(mailAddressEr == null || mailAddressEr == '')&&(account.mailAddress ==null || account.mailAddress=='')}">
                        6位数字
                    </c:if>
                </div>
            </div>
            <div class="text_info clearfix"><span>QQ：</span></div>
            <div class="input_info">
                <input type="text" name="qq"/>
                <div class="validate_msg_long">
                    ${mailAddressEr}
                    <c:if test="${(mailAddressEr == null || mailAddressEr == '')&&(account.mailAddress ==null || account.mailAddress=='')}">
                        5到13位数字
                    </c:if>
                </div>
            </div>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="submit" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="window.history.back(-1)"/>
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
