<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>云科技</title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
        <script src="/resources/js/jquery-3.2.1.js"></script>

    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left" />
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
            <form action="" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="10" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info"><input type="text" value="${account.realName}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" value="${account.idcardNo}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" value="${account.loginName}" readonly class="readonly" />
                </div>                   
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200 readonly" readonly value="${account.telephone}" />
                </div>
                <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
                <div class="input_info"><input type="text" readonly id="recomId" class="readonly" value="${account.recommenderId}" /></div>
                <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="230198765432123456" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <select disabled>
                        <option>开通</option>
                        <option>暂停</option>
                        <option>删除</option>
                    </select>                        
                </div>                    
                <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${account.createDate}" /></div>

                <div class="text_info clearfix"><span>上次登录时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${account.pauseDate}" /></div>
                <div class="text_info clearfix"><span>上次登录IP：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value=""/></div>
                <!--可选项数据-->
                <div class="text_info clearfix"><span>生日：</span></div>
                <div class="input_info">
                    <input type="text" readonly class="readonly" value="${account.birthDate}" />
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="width350 readonly" readonly value="${account.email}" />
                </div> 
                <div class="text_info clearfix"><span>职业：</span></div>
                <div class="input_info">
                    <select disabled>
                        <option <c:if test="${account.occupation == '干部'}">selected</c:if>>干部</option>
                        <option <c:if test="${account.occupation == '学生'}">selected</c:if>>学生</option>
                        <option <c:if test="${account.occupation == '技术人员'}">selected</c:if>>技术人员</option>
                        <option <c:if test="${account.occupation == '其他'}">selected</c:if>>其他</option>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>性别：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radSex" <c:if test="${account.gender == '女'}">checked</c:if> id="female" disabled />
                    <label for="female">女</label>
                    <input type="radio" name="radSex" <c:if test="${account.gender == '男'}">checked</c:if> id="male" disabled />
                    <label for="male">男</label>
                </div> 
                <div class="text_info clearfix"><span>通信地址：</span></div>
                <div class="input_info"><input type="text" class="width350 readonly" readonly value="${account.mailAddress}" /></div>
                <div class="text_info clearfix"><span>邮编：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${account.zipCode}" /></div>
                <div class="text_info clearfix"><span>QQ：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${account.qq}" /></div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/account/account_list';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)云科技有限公司 </span>
        </div>

        <script>
            $.post({
                url: "${pageContext.request.contextPath}/account/account_detail",
                data: {
                    accountId: $("#recomId").val()
                }
            })
            $("#")
        </script>
    </body>
</html>
