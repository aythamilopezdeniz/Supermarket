<%   if (session.getAttribute("user") == null && session.getAttribute("password") == null) {%>
        <%@include file="/PageStyle/nonActiveSession.jsp"%>
<%  } else {%>
        <%@include file="/PageStyle/sessionActive.jsp"%>
<%  }%>