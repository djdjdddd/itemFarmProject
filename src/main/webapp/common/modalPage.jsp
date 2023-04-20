<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- modalPage.jsp 입니다!! -->
    <%@ include file="../common/commonCSS.jsp" %>
	<title>Insert title here</title>
</head>
<body>
<c:set var="test3" value="test3"/>
	<div id="wrapper">
		<%@ include file="../common/nav.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../common/header.jsp" %>
				<c:set var="test2" value="test2"/>
				
				<div class="container-fluid">
					<c:set var="test" value="test"/>
					<a class="modal-link btn btn-icon-split" 
					href="#" 
					role="button" 
					aria-haspopup="true" 
					aria-expanded="false" 
					data-toggle="modal" 
					data-target="#connectModalName">모달</a>
				</div>
			</div>
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
	<%@ include file="modal.jsp" %>
	<%@ include file="../common/commonETC.jsp" %>
	<%@ include file="../common/commonJS.jsp" %>
</body>
</html>