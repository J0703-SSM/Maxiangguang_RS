<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css"/>
    <script src="/resources/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //排序按钮的点击事件
        function sort(btnObj, string) {
            if (btnObj.className == "sort_desc") {
                btnObj.className = "sort_asc";
                if (string == "rankBaseC") {
                    $("#i1").val("asc");
                }
                if (string == "rankBaseD") {
                    $("#i2").val("asc");
                }
            } else {
                btnObj.className = "sort_desc";
                $("#i1").innerText = "desc";
                $("#i2").innerText = "desc";
            }
        }

        //启用
        function startFee(param) {
            var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
            $.post({
                url: "/startFee",
                data: {
                    costId: param
                }
            });

            location.href = "/findAllFee";

            document.getElementById("operate_result_info").style.display = "block";
        }
        //删除
        function deleteFee(param) {
            var r = window.confirm("确定要删除此资费吗？");
            $.post({
                url: "/deleteFee",
                data: {
                    costId: param
                }
            });
            location.href = "/findAllFee";
            document.getElementById("operate_result_info").style.display = "block"
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
        <li><a href="/index" class="index_off"></a></li>
        <li><a href="/role_list" class="role_off"></a></li>
        <li><a href="/admin_list" class="admin_off"></a></li>
        <li><a href="/findAllFee" class="fee_off"></a></li>
        <li><a href="/account_list" class="account_off"></a></li>
        <li><a href="/service_list" class="service_off"></a></li>
        <li><a href="/bill_list" class="bill_off"></a></li>
        <li><a href="/report_list" class="report_off"></a></li>
        <li><a href="/user_info" class="information_off"></a></li>
        <li><a href="/user_modi_pwd" class="password_on"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--排序-->
    <div class="search_add">
        <div>
            <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />-->
            <form action="/feeOrderByBaseCost" method="post">
                <input type="button" value="基费" class="sort_asc" onclick="sort(this, $('#i1').name);document.forms[0].submit" id="b1"/>
                <input type="hidden" name="rankBaseC" value="desc" id="i1"/>
                <input type="button" value="时长" class="sort_asc" onclick="sort(this, $('#i2').name);document.forms[0].submit" id="b2"/>
                <input type="hidden" name="rankBaseD" value="desc" id="i2"/>
            </form>
        </div>
        <input type="button" value="增加" class="btn_add" onclick="location.href='/preparedAdd';"/>
    </div>
    <!--启用操作的操作提示-->
    <div id="operate_result_info" class="operate_success">
        <img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
        删除成功！
    </div>
    <!--数据区域：用表格展示数据-->
    <div id="data">
        <table id="datalist">
            <tr>
                <th>资费ID</th>
                <th class="width100">资费名称</th>
                <th>基本时长(小时)</th>
                <th>基本费用(元)</th>
                <th>单位费用(元/小时)</th>
                <th>创建时间</th>
                <th>开通时间</th>
                <th class="width50">状态</th>
                <th class="width200"></th>
            </tr>
            <c:forEach var="cost" items="${pageBean.beanList}">
                <tr>
                    <td id="t1">${cost.costId}</td>
                    <td><a href="fee_detail.jsp">${cost.costName}</a></td>
                    <td><c:if test="${cost.baseDuration != 0}">${cost.baseDuration}</c:if></td>
                    <td><c:if test="${cost.baseCost != 0}">${cost.baseCost}</c:if></td>
                    <td><c:if test="${cost.unitCost != 0}">${cost.unitCost}</c:if></td>
                    <td><fmt:formatDate value="${cost.createTime}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${cost.startTime}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${cost.status == 0}">
                                暂停
                            </c:when>
                            <c:when test="${cost.status == 1}">
                                开通
                            </c:when>
                        </c:choose>

                    </td>
                    <td>
                        <c:if test="${cost.status == '0'}">
                            <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.costId});"/>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='/updatePrepared?costId=${cost.costId}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${cost.costId});"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>业务说明：<br/>
            1、创建资费时，状态为暂停，记载创建时间；<br/>
            2、暂停状态下，可修改，可删除；<br/>
            3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br/>
            4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
        </p>
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
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司</p>
</div>
<script>

    $("#b1").click(function () {
        alert("666");
        $.ajax({
            type: "post",
            url: "/feeOrderByBaseDuration",
            data: {
                baseDuration: 1,
                des: $("#b1").class.val()
            },
            success: function (result) {
                console.log(result.data);

                if (result.errorCode == 0) {

                    // for循环添加tr标签
                    console.log(1111);
                }
            }
        })
    })


</script>

</body>
</html>
