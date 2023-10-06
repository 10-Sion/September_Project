<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="QnA.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>