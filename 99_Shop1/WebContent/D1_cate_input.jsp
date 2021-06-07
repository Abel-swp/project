<%@page import="project.CatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.CatDao"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String keep = request.getParameter("keep");
    %>
    
   	<link rel="stylesheet" type="text/css" href="css/style.css"/>
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom2.css">
	
   	<table border="1" class="table">
    	<tr class="active">
    		<td align="center">
    			<a href="D1_cate_input.jsp?keep=<%=keep%>">카테고리 등록</a>
    		</td>
    		<td align="center">
    			<a href="D3_cate_list.jsp?keep=<%=keep%>">카테고리 목록</a>
    		</td>
    		<td align="center">
    			<a href="E1_prod_input.jsp?keep=<%=keep%>">상품 등록</a>
    		</td>
    		<td align="center">
    			<a href="E3_prod_list.jsp?keep=<%=keep%>">상품 목록</a>
    		</td>
    		<td align="center">
    			<a href="F1_shopping_list.jsp?keep=<%=keep%>">쇼핑 내역</a>
    		</td>
    		<td align="center">
    			<a href="ABC/A_user/A1_display.jsp?keep=<%=keep%>">사용자 홈</a>
    		</td>
    	</tr>
   	</table>
	
	<script type="text/javascript">
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "A1_main.jsp";
		}
		function inin() {
			if(document.myform.code.value == ''){
				alert('카테고리 코드를 입력하세요.');
				document.myform.code.focus();
				return false;
			}
			if(document.myform.cname.value == ''){
				alert('카테고리 이름을 입력하세요.');
				document.myform.cname.focus();
				return false;
			}
		}
	</script>

    <font size=6>Food Safety Store</font> <p>
    <a href="A1_main.jsp?keep=<%=Encryption.getEncoding(keep)%>"><font size=3>HOME</font></a> <p>
    
    <table border="1" width="800" height="400" align="center">
    	<tr>
    		<td rowspan="3" align="center">
    		<!-- ********************** -->
    		<form>
			<table border="0" class="table">
				<tr class="active">
					<td bgcolor="#FFCC00" align="center"> :: ID :: <br>
					</td>
				</tr>
				<tr>
					<td style="position:relative; top:9px;">
						<%=keep%> <b>님 환영합니다!</b> <br>
					</td>
				</tr>
			</table>
			<table style="margin:auto;" class="table">
				<tr class="success">
					<td><input type="button" class="btn btn-success" name="logout" value="로그아웃" onClick="outout()"></td>
				</tr>
			</table>
			</form>
			<!-- ********************** -->
    		</td>
    		<%
			CatDao dao1 = CatDao.getInstance();
			ArrayList<CatBean> list1 = dao1.AllCat();
			%>
			<%if(list1.size() == 0) {%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills">
						<li>등록된 카테고리 없음</li>
					</ul>
				</td>
				<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
			<%} else {%>
				<%for(CatBean bean : list1){ // A2_display_top.jsp 에서 가져온 카테고리 for문
				String cname = bean.getCname();
				String ccode = bean.getCcode();%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills">
						<li><a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=keep%>"><%=cname%></a></li>
    				<%-- <a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a> --%>
    				</ul>
    			</td>
				<%}%>
			<%}%>
    	</tr>
    	<tr height="400">
    		<!-- ********************** -->
			<td colspan="<%=list1.size()%>" align="center">
			<form action="D2_cate_inputProc.jsp?keep=<%=keep%>" method="post" name="myform">
			<table width="350" align="center" class="table table-striped">
				<caption style="text-align:center;"><font color="brown"><b>:: 카테고리 등록 ::</b></font></caption>
				<tr>
					<td bgcolor="yellow" align="center">카테고리 코드</td>
					<td style="text-align:left;"><input type="text" name="ccode" size="18"></td>
				</tr>
				<tr>
					<td bgcolor="yellow" align="center">카테고리 이름</td>
					<td style="text-align:left;"><input type="text" name="cname" size="18"></td>
				</tr>
				<tr class="active">
					<td colspan="2" align="center" bgcolor="yellow">
						<input type="submit" value="등록" class="btn btn-success" onClick="return inin()">
						<input type="reset" value="취소" class="btn btn-warning">
					</td>
				</tr>
			</table>
			</form>
			</td>
			<!-- ********************** -->
		</tr>
	    <tr>
	    	<td colspan="<%=list1.size()%>" align="center">HEALTH SHOPPING MALL</td>
	    </tr>
	</table>
	
	