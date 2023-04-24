
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/commonCSS.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../common/nav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../common/header.jsp"%>

				<div class="container-fluid">
					
					<h2 class="text-center">입고등록</h2>
					<!-- 이솔: search form  -->
					<form class="form-inline justify-content-center my-5">

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<input class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" id="searchDrop" value="통합검색"> 
								<div id="mytype" class="dropdown-menu">
									<a class="dropdown-item" href="#" data-value="searchTotal">통합검색</a> 
									<a class="dropdown-item" href="#" data-value="searchCode">상품코드</a> 
									<a class="dropdown-item" href="#" data-value="searchName">상품명</a>
								</div>
							</div>
							<input id="inputType" type="hidden" name="valueType"  >
							<input id="textForm" type="text" class="form-control"
								aria-label="Search input with dropdown button" name="selectValue1" placeholder="Search" />
							
							<input id="numberForm" type="number" class="form-control"
								aria-label="Search input with dropdown button" name="selectValue2" placeholder="Search" />	
							
							<input
								id="productSearch" class="btn my-2 my-sm-0 mx-2 bg-primary text-white"
								type="button" id="form_submit" value="Search" /> 
							<input
								class="btn my-2 my-sm-0 mx-2 bg-success text-white"
								value="발주서 불러오기" >
								
						</div>

						
						
					</form>
					<div id="showProduct" class=""></div>
					
					<div class="d-flex flex-row bd-highlight mb-3">
						<h4 class="mx-2">입고품목 리스트</h4>
						<input id="deleteProduct" class="btn  my-2 my-sm-0 mx-2 bg-danger text-white" type="button" value="삭제" />
						<input id="confirmProduct" class="btn my-2 my-sm-0 mx-2 bg-primary text-white" type="button" value="확정" />
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">
									<div class="form-check px-0 mx-0 text-center">
  										<input class="form-check-input" type="checkbox" value="" id="allChecking">
  										<label class="form-check-label" for="flexCheckDefault">
    										전체
  										</label>
									</div>
								</th>
								<th scope="col">#</th>
								<th scope="col">상품번호</th>
								<th scope="col">상품명</th>
								<th scope="col">입고건수</th>
								<th scope="col">발주서연동여부</th>
								<th scope="col">발주서번호</th>
							</tr>
						</thead>
						<tbody id="storingList"></tbody>
					</table>
					<p id="emptyProductList" class="text-center">입고할 품목을 추가해주세요. </p>
					

				</div>
			</div>
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
	<%@ include file="../common/commonETC.jsp"%>
	<%@ include file="../common/commonJS.jsp"%>
<script>
var outputBody = '';
var listCount = 0;

$(function(){
	$('#numberForm').hide();
	var valueType = "searchTotal";
	$('#inputType').attr('value',valueType);
	//var outputBody = '<tr class="text-center"><td colspan="6">입고할 품목을 추가해주세요. </td></tr>'
	//$('#storingList').html(outputBody);
	//console.log($('#storingList tr td').text());
	//$('#deleteProduct').hide();
	//if($('#storingList tr td').text()){
	//	$('#deleteProduct').show();
	//}
	
	//이솔: product 상품명, 상품코드 톻합검색
	$('#mytype a').on('click', function(){
		
		$('#searchDrop').val($(this).text());
		
		valueType = $(this).attr('data-value');
		$('#inputType').attr('value',valueType);
		
		if(valueType=="searchCode"){
			$('#numberForm').show(); 
			$('#textForm').hide();
		} else {
			$('#numberForm').hide();
			$('#textForm').show();
		} 
	
	});
	
	$('#productSearch').on("click", function(){
		$.ajax({
			url: "../storing/storing_insert.do",
			method: "POST",
			data: {"valueType":$('#inputType').val(),"selectValue1":$('#textForm').val(),"selectValue2":$('#numberForm').val()},
			success: function(r){
				$('#showProduct').html(r);
			},
			error: function(message){
				alert(message);
			}
		});	
	});
	
	$("#textForm, #numberForm").on("keyup", function(key){
		if(key.keyCode==13) {
			$('#productSearch').trigger("click");
		}
	});
	
	
	$("#allChecking").on("click",function(){
		
		var checked = $('#allChecking').is(':checked');
		console.log(checked);
		//if(checked) { 
			$('#allChk input').attr('checked',checked);
		//}else{
		//	console.log('현재' + checked);
		//	$('#allChk input').attr('checked',!checked);
		//}
		
	});
	
})

function storingQuantity(code, name, obj, count){  
	/* <input id="deleteProduct" class="btn btn-outline-success my-2 my-sm-0 mx-2 bg-danger text-white" type="button" value="삭제" />  */
		var quantity =  $("#quantity" + count).val();
		listCount++;
		var col = "chk" + listCount;
		outputBody += `
			<tr>
			    <td>
				    <div class="form-check" id="allChk"><input class="form-check-input text-center mx-0 my-2" type="checkbox" value="" 
				    id="${'${col}'}" onclick="checking('chk${"${listCount}"}')">
				    </div>
			    </td>
			    <td>${'${listCount}'}</td>
			    <td>${'${code}'}</td>
			    <td>${'${name}'}</td>
			    <td>
			    	<input type="number" class="form-control-sm border-secondary" value="${'${count}'}">
			    </td>
			    <td>???</td>
			    <td>???</td>
		    </tr>
		
		`;
		/* outputBody += `
			
		          <tr><td><div class="form-check" id="allChk">
		            <input class="form-check-input text-center mx-0 my-2" type="checkbox" value="" 
		          id="chk${listCount}" 
		          onclick="checking("chk${listCount})">
		            </div></td><td>'+listCount+'</td><td>' + code +'</td><td>' + name + '</td><td>
		             <input type="number" class="form-control-sm border-secondary" value="' + quantity + '" / ></td>
		             <td>' + '???' + '</td><td>' + '???' +  '</td>
		           </tr>
		          `; */
		$('#storingList').html(outputBody);
};

function checking(chk){
	console.log(chk);
	var checked = $('#chk1').is(':checked');
	console.log(checked);
	//console.log($(obj).attr('checked'));
	//var checked $(obj).is(':checked');
	/* if($(obj).attr('checked')){
		$(obj).attr('checked',false);
	} else {
		$(obj).attr('checked',true);
	} */
	
};

</script>
<!--  <div id="template" >
    <tr>
    <td>
	    <div class="form-check" id="allChk"><input class="form-check-input text-center mx-0 my-2" type="checkbox" value="" 
	    id="chk1" onclick="checking('chk1')">
	    </div>
    </td>
    <td>1</td><td>99999</td><td>Test_Sol</td>
    <td>
    	<input type="number" class="form-control-sm border-secondary" value="2">
    </td><td>???</td>
    <td>???</td>
    </tr>
 
 </div> -->
 
</body>
</html>

