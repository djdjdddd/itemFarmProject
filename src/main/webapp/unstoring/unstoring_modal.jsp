<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0px auto;
}
td {
	padding: 10px 10px;
}
label {
	padding: 0px 10px;
}
</style>
</head>
<body>

	<div class="modal fade" id="unstoringModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">주문번호 상세 조회</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
               	    <%-- unstoringModalList 는 왜 안되고, 갑자기 unstoringList 가 먹히냐고 ㅅㅂ --%>
                
                	<table>
                	<%-- 아니 시벌 왜 unstoringList가 이번엔 또 먹히는거여?? 아깐 안되서 지금 다른 방법으로 했는데 미쳐버리겠네 진짜 --%>
                	   <%--  <c:forEach var="list22" items="${unstoringModalList }"> --%>
                		<tr>
                			<td id="aa" value=""><label>주문자 성함 :</label></td>
                		</tr>
                		<tr>
                			<td id="bb" value=""><label>주문자 주소 :</label></td>
                		</tr>
                		<tr>
                			<td id="cc" value=""><label>송장번호 :</label></td>
                		</tr>
                		<tr>
                			<td id="dd" value=""><label>주문상태 :</label></td> <!-- ${list22.unstoring_state } -->
                		</tr>
                		<%-- </c:forEach> --%>
                	</table>
                	
                	<!-- Page Heading -->
                    <!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <!-- <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div> -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>주문수량</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     	<!-- core 태그를 써야 할까 / 아니면 그냥 json 파싱해서 가져오면 될까 -->
                                        <tr>
                                            <td>${list.unstoring_code }</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
				</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                    <!-- <button class="btn btn-primary" type="submit">등록</button> -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>