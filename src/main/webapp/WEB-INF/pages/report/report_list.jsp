<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resources/styles/global_color.css" />
        <script language="javascript" type="text/javascript">
            function changeTab(e,ulObj) {                
                var obj = e.srcElement || e.target;
                if (obj.nodeName == "A") {
                    var links = ulObj.getElementsByTagName("a");
                    for (var i = 0; i < links.length; i++) {
                        if (links[i].innerHTML == obj.innerHTML) {
                            links[i].className = "tab_on";
                        }
                        else {
                            links[i].className = "tab_out";
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#" onclick="window.close()">[退出]</a>
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
        <div id="report_main">
        	<div class="tabs">
    	        <ul onclick="changeTab(event,this);">
        	        <li><a href="#####" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a href="#####" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                    <li><a href="#####" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
                </ul>
            </div>            
            <div class="report_box">
                <!--数据区域：用表格展示数据-->
                <div id="report_data">
                    <table id="datalist">
                        <tr>                            
                            <th>账号 ID</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th>电话</th>
                            <th class="width150">月份</th>
                            <th class="width150">累积时长</th>
                        </tr>                      
                        <tr>
                            <td>1</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年1月</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年2月</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年3月</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>tony</td>
                            <td>真真</td>
                            <td>220222020202020202</td>
                            <td>13987654345</td>
                            <td>2013年1月</td>
                            <td>16小时32分</td>
                        </tr>
                    </table>
                    <table id="datalist1" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th class="width150">累积时长</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>106小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.20</td>
                            <td>tony</td>
                            <td>米奇</td>
                            <td>220222020202020202</td>
                            <td>96小时32分</td>
                        </tr><tr>
                            <td>192.168.0.20</td>
                            <td>jecy</td>
                            <td>米妮</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                    </table>
                    <table id="datalist2" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>包月</th>
                            <th>套餐</th>
                            <th>计时</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>345</td>
                            <td>21</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>32</td>
                            <td>221</td>
                            <td>314</td>
                        </tr>                        
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

            </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)云科技有限公司 </p>
        </div>
    </body>
</html>
