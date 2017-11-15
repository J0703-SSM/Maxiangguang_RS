<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        function deleteRole(param) {
            var r = window.confirm("确定要删除此角色吗？");
            $.ajax({
                url: "/role/delete_role",
                data: {
                    roleId: param
                }
            });
            // 删除某一行
            var rowid = "#" + param;
            $(rowid).remove();
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
        <li><a href="/index" class="index_on"></a></li>
        <li><a href="/role/role_list" class="role_off"></a></li>
        <li><a href="/admin/admin_list" class="admin_off"></a></li>
        <li><a href="/fee/findAllFee" class="fee_off"></a></li>
        <li><a href="/account/account_list" class="account_off"></a></li>
        <li><a href="/service/service_list" class="service_off"></a></li>
        <li><a href="/bill/bill_list" class="bill_off"></a></li>
        <li><a href="/report/report_list" class="report_off"></a></li>
        <li><a href="/user/user_info" class="information_off"></a></li>
        <li><a href="/user/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <input type="button" value="增加" class="btn_add" onclick="location.href='/role/role_addPrep';"/>
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="/resources/images/close.png" onclick="this.parentNode.style.display='none';"/>
            删除成功！
        </div> <!--删除错误！该角色被使用，不能删除。-->
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>角色 ID</th>
                    <th>角色名称</th>
                    <th class="width600">拥有的权限</th>
                    <th class="td_modi"></th>
                </tr>
                <c:forEach var="role" items="${pageBean.beanList}">
                    <tr id="${role.roleId}">
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>${role.privilege}
                            <c:if test="${role.privilege == null}">暂无权限</c:if>

                        </td>
                        <td>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='/role/role_modiPrep?roleId=${role.roleId}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteRole(${role.roleId});"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
