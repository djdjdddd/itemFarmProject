<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/commonCSS.jsp"%>
<link href="/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<title>Insert title here</title>
<script>
		function sendModal_test(param){
			var number = param;
			console.log(number);
			location.href = "/unstoring/unstoringDetail.do?unstoring_code=" + number;
		}
		
		function sendModal(param){
			var attr = $.attr("data-test");
			console.log(attr);
			
			console.log(param, typeof(param));
			
			number = param;
			
			$.ajax({
				url:"/unstoring/unstoringDetail.do",
				data:{"number":number},
				success:function(obj){
					console.log(obj);
					alert('ajax는 성공했음');
					
					json = JSON.parse(obj);
					console.log(json);
					
					$("#aa").val(json["customer_name"]);
					$("#bb").val(json["customer_address"]);
					$("#cc").val(json["tracking_number"]);
					$("#dd").val(json["unstoring_state"]);
					
					console.log('json' +json["customer_name"]);
					
					
					console.log('그냥obj'+ obj.customer_name);
					console.log('따옴표 준 obj'+ 'obj.customer_name');
				},
				error:function(){
					alert('ajax부터 실패했음');
				}
			});
		}
	
		$(document).ready(function sendModal(){
		
		});
	</script>
</head>
<body>
	<c:set var="test2" value="테스트2"/>
	<div id="wrapper">
		<%@ include file="../common/nav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../common/header.jsp"%>

				<div class="container-fluid">
				<c:set var="test3" value="테스트3"/>
					<!-- empSelect.jsp 보고 따라함 -->
					<!-- 여기 안에 내용을 다 써야 한다는 소리구나 -->
					<h1>주문건 조회 페이지</h1>
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>


						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>순서</th>
											<th>주문번호</th>
											<th>주문자 성함</th>
											<th>주문자 주소</th>
											<th>주문일자</th>
											<th>출고일자</th>
											<th>송장번호</th>
											<th>주문상태</th>
											<th>출고담당자</th>
											<th>주문메모(비고)</th>
											<th>송장버튼</th>
											<th>취소버튼</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="test4" value="테스트4" />
										<c:forEach var="list" items="${unstoringList }" varStatus="status" >
											<tr>
												<td>${status.count }</td>
												<!-- 은빈 -->
												<!-- 데이터 전송의 경우 VO의 toString을 data-tmp의 형태처럼 나오도록 수정해야 함 (companyVO 참고) -->
												<!-- data-tmp로 임시로 적었는데 여기의 data-@@와 jQuery의 data(@@)의 이름이 같아야 함 -->
												<td><a data-test="${list.unstoring_code }"
													   onclick="sendModal(${list.unstoring_code})"
													   class="modal-link btn btn-icon-split" 
													   href="#" 
													   role="button" 
													   aria-haspopup="true" 
													   aria-expanded="false"
													   data-toggle="modal" 
													   data-target="#unstoringModal">${list.unstoring_code }
												    </a>
												</td>
												<!-- data-target의 이름과 modal.jsp의 id가 같아야 함(현재 이름: connectModalName) -->
												<td>${list.customer_name }</td>
												<td>${list.customer_address }</td>
												<td>${list.order_register }</td>
												<td>${list.unstoring_date }</td>
												<td>${list.tracking_number }</td>
												<td>${list.unstoring_state }</td>
												<td>${list.manager_id }</td>
												<td>${list.unstoring_memo }</td>
												
												<!-- 송장입력 버튼을 누르면 => 비어있던 송장번호(tracking_number)를 요놈으로 update -->
												<td><c:if test="${list.unstoring_state == '출고대기' }">
														<a type="button"
															href="javascript:tracking_number_input(${list.unstoring_code })"
															class="btn btn-success btn-icon-split"
															data-input="${list.unstoring_code }"> 
															<span class="icon text-white-50"> 
															<i class="fas fa-check"></i>
															</span> 
															<span class="text">송장입력</span>
														</a>
													</c:if></td>

												<!-- 주문취소 버튼을 누르면 => 주문번호(unstoring_code)를 가져가서 그 놈의 주문상태(unstoring_state)를 바꿔줘야 하니까 -->
												<td><c:if test="${list.unstoring_state == '출고대기' }">
														<a type="button"
															href="javascript:cancel_order(${list.unstoring_code })"
															class="btn btn-danger btn-icon-split"
															data-del="${list.unstoring_code }"> <span
															class="icon text-white-50"> <i
																class="fas fa-trash"></i></span> <span class="text">주문취소</span>
														</a>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
	
	<%@ include file="../common/commonETC.jsp"%>
	<%@ include file="../common/commonJS.jsp"%>
	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>


	<!-- 송장입력 및 주문취소 버튼 누르면 => ajax로 해당 로직 처리하게끔 하는 JS 코드 -->
	<script>
		// 1. 송장입력 => ★고민: 이것도 포맷이 있는데... 이걸 어떻게 적용하지??
		function tracking_number_input(unstoring_code) {
			// ★★★ 송장번호 입력도 모달창으로 구현할까??
			alert("tracking_number_input 함수가 실행됨");
			var tracking_number = prompt('송장번호 입력');
			location.href = "/unstoring/trackingNumberInput.do?unstoring_code="
					+ unstoring_code + "&tracking_number=" + tracking_number; // get 요청이니까
		}

		// 2. 주문취소
		function cancel_order(unstoring_code) {
			alert("tracking_number_input 함수가 실행됨");
			var result = "${result}";
			location.href = "/unstoring/cancelOrder.do?unstoring_code="
					+ unstoring_code;

			if (result == 1) {
				alert('주문취소에 성공하였습니다');
			} else {
				alert('주문취소에 실패하였습니다');
			}
		}

	</script>
	<%@ include file="/unstoring/unstoring_modal.jsp"%>
</body>
</html>