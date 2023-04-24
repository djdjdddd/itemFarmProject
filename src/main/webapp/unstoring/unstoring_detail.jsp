<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/commonCSS.jsp"%>
<<<<<<< HEAD
<link href="/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<title>Insert title here</title>
<style>
	b{
		display: table-cell;
		padding-right: 1em;
	}
</style>
</head>
<body>
	<!-- ★ modal로 구현할 페이지 : 주문번호 상세 조회 -->
	<!-- 주문 번호를 누르면 주문에 대한 상세 페이지로 이동 -->
	<div id="wrapper">
		<%@ include file="../common/nav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../common/header.jsp"%>




				<div class="container-fluid">




					<!-- 여기 안에 내용을 다 써야 한다는 소리구나 -->
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="text-align: center;">주문건 상세조회 - 기업 이름도 보여줄 것</h1>
					<p class="mb-4"></p>


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<a href="/unstoring/unstoringList.do" class="btn btn-secondary btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
							</span> <span class="text">조회 페이지로 돌아가기(위치 오른쪽으로 하고 싶은데)</span>
							</a>
						</div>


						<div class="card-body">
							<div class="table-responsive">

								<div>
									<div class="row" > <!-- style="margin: 0 auto" -->
										<div class="col-xl-3 col-md-6 mb-4">
											<div class="card border-left-primary shadow h-100 py-2">
												<div class="card-body">
													<div class="row no-gutters align-items-center">
														<div class="col mr-2">
															<div
																class="text-lg font-weight-bold text-primary text-uppercase mb-1">주문자
																정보</div>
															<div class="h5 mb-0 font-weight-bold text-gray-800">
																<div
																	class="text-xs font-weight-lighter text-gray-800 text-uppercase mb-1">
																	<c:forEach begin="0" end="0" var="detailList" items="${detailVO }">
																	<table>
																		<tr>
																			<td><b>주문번호</b></td>
																			<td>: ${detailList.unstoring_code }</td>
																		</tr>
																		<tr>
																			<td><b>성함</b></td>
																			<td>: ${detailList.customer_name }</td>
																		</tr>
																		<tr>
																			<td><b>주소</b></td>
																			<td>: ${detailList.customer_address }</td>
																		</tr>
																		<tr>
																			<td><b>송장번호</b></td>
																			<td>: ${detailList.tracking_number }</td>
																		</tr>
																		<tr>
																			<td><b>주문상태</b></td>
																			<td>: ${detailList.unstoring_state }</td>
																		</tr>
																	</table>
																	</c:forEach>
																</div>
															</div>
														</div>
														<div class="col-auto">
															<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<hr>

								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>순서</th>
											<th>상품코드</th>
											<th>상품명</th>
											<th>주문수량</th>
										</tr>
									</thead>
									<tbody>
										<%-- 용희: UnstoringListController에서 set한 걸 get한 데이터 --%>
										<c:forEach var="detailList" items="${detailVO }"
											varStatus="status">
											<tr>
												<th>${status.count }</th>
												<td>${detailList.product_code }</td>
												<td>${detailList.product_name }</td>
												<td>${detailList.unstoring_quantity }</td>
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
</body>
</html>