<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	alert("로그아웃이 완료되었습니다.")
</script>
 	
<%
	session.invalidate();
%>
    <meta http-equiv="refresh" content="1; url=<%=request.getContextPath()%>/result.fm"> 