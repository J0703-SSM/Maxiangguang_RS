<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //显示角色详细信息
        function showDetail(flag, a) {
            var detailDiv = a.parentNode.getElementsByTagName("div")[0];
            if (flag) {
                detailDiv.style.display = "block";
            } else {
                detailDiv.style.display = "none";
            }
        }
        //重置密码
        function resetPwd() {
            var check = $("input[type=checkbox]:checked");

            if (check.length == 0) {
                alert("请至少选择一条数据！");
            } else {
                var str = prompt("请输入新密码! ");
                if (str) {
                    alert("您输入的新密码是：" + str)
                }
                if (str) {
                    check.each(function () {
                        var adminId = $(this).attr("name");
                        $.post({
                            url: "${pageContext.request.contextPath}/admin/admin_updatePwd",
                            data: {
                                adminId: adminId,
                                password: str
                            }
                        })

                        document.getElementById("operate_result_info1").style.display = "block";
                    });
                } else {
                    return "#";
                }
            }
        }
        //删除
        function deleteAdmin(param) {
            var r = window.confirm("确定要删除此管理员吗？");
            if (r) {
                $.post({
                    type: "post",
                    url: "${pageContext.request.contextPath}/admin/admin_delete",
                    data: {
                        adminId: param
                    }

                });
                // 删除某一行
                var rowid = "#" + param;
                $(rowid).remove();
                document.getElementById("operate_result_info").style.display = "block";
            } else {
                return "#";
            }

        }

        //全选
        function selectAdmins(inputObj) {
            var first = document.getElementById("datalist");
            var inputArray = first.getElementsByTagName("input");
            for (var i = 1; i < inputArray.length; i++) {
                if (inputArray[i].type == "checkbox") {
                    inputArray[i].checked = inputObj.checked;
                }
            }
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
    <form action="${pageContext.request.contextPath}/admin/admin_find" method="post">
        <!--查询-->
        <div class="search_add">
            <div>
                模块：
                <select id="selModules" class="select_search" name="privilegeId">
                    <option value="-1">全部</option>
                    <c:forEach var="privilege" items="${privilegeList}">
                        <option value="${privilege.privilegeId}">${privilege.privilegeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div>角色：<input type="text" id="role" name="role" class="text_search width200" placeholder="例如:管理员"/></div>
            <div><input type="submit" value="搜索" class="btn_search"/></div>
            <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();"/>
            <input type="button" value="增加" class="btn_add"
                   onclick="location.href='${pageContext.request.contextPath}/admin/admin_addPrep';"/>
        </div>
        <!--删除和密码重置的操作提示-->
        <div id="operate_result_info" class="operate_fail">
            <img src="/resources/images/close.png" onclick="this.parentNode.style.display='none';"/>
            <span>删除成功！</span><!--密码重置失败！数据并发错误。-->
        </div>
        <div id="operate_result_info1" class="operate_fail" style="display: none">
            <img src="/resources/images/close.png" onclick="this.parentNode.style.display='none';"/>
            <span>密码重置成功！</span><!--密码重置失败！数据并发错误。-->
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="th_select_all">
                        <input type="checkbox" onclick="selectAdmins(this);" name=0/>
                        <span>全选</span>
                    </th>
                    <th>管理员ID</th>
                    <th>姓名</th>
                    <th>登录名</th>
                    <th>电话</th>
                    <th>电子邮件</th>
                    <th>授权日期</th>
                    <th class="width100">拥有角色</th>
                    <th></th>
                </tr>
                <c:forEach var="admin" items="${pageBean.beanList}">
                    <tr id="${admin.adminId}">
                        <td><input type="checkbox" name="${admin.adminId}"/></td>
                        <td>${admin.adminId}</td>
                        <td>${admin.name}</td>
                        <td>${admin.adminCode}</td>
                        <td>${admin.telephone}</td>
                        <td>${admin.email}</td>
                        <td><fmt:formatDate value="${admin.enrolldate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <a class="summary"
                                    <c:if test="${admin.roles.size() > 1 || admin.roleList.size() > 1}">
                                        onmouseover="showDetail(true,this);"
                                        onmouseout="showDetail(false,this);"
                                    </c:if>>
                                    ${admin.roleList.get(0).roleName}
                                <c:choose>
                                    <c:when test="${admin.roles.size()>1}">
                                        ${admin.roles.get(0)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${admin.roles.get(0)}
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                                <c:forEach items="${admin.roles}" var="r">
                                    ${r}
                                </c:forEach>
                                <c:forEach items="${admin.roleList}" var="role">
                                    ${role.roleName}
                                </c:forEach>
                            </div>
                        </td>
                        <td class="td_modi">
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='${pageContext.request.contextPath}/admin/admin_modiPrep?adminId=${admin.adminId}';"/>
                            <input type="button" value="删除" class="btn_delete"
                                   onclick="deleteAdmin(${admin.adminId});"/>
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
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
