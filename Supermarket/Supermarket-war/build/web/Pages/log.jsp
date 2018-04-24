<%@page import="SingletonBeans.SingletonLogBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Singleton Log Bean</title>
        <%@include file="/PageStyle/head.jsp"%>
    </head>
        <!-- Header -->
        <%@include file="/PageStyle/navbar.jsp"%>
        
        <!-- Log -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col"><h4 id="logTitle">Log</h4></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <%
                    SingletonLogBean singletonLogBean = (SingletonLogBean) InitialContext.doLookup("java:global/Supermarket/Supermarket-ejb/SingletonLogBean!SingletonBeans.SingletonLogBean");
                    ArrayList log = singletonLogBean.getLog();
                    for (Object logs : log) {%>
                    <th id="log"><div><h6><%=logs%></h6></div></th>
                <%  }%>
                </tr>
            </tbody>
        </table>
    </body>
</html>
