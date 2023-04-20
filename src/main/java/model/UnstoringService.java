package model;

import java.util.List;
import java.util.Map;

import vo.CompanyVO;
import vo.UnstoringVO;

public class UnstoringService {

	UnstoringDAO dao = new UnstoringDAO();

	// 송장입력 버튼 => 입력한 송장번호로 update
	public int trackingNumberInput(UnstoringVO unstoring) {
		return dao.trackingNumberInput(unstoring);
	}

	// 주문취소 버튼 => 주문상태(unstoring_state)를 '주문취소'로 update
	public int cancelOrder(UnstoringVO unstoring) {
		return dao.cancelOrder(unstoring);
	}

	// 신규 주문건 등록 (참조 : EmpDAO - empInsert)
	public int unstoringInsert(UnstoringVO unstore) {
		return dao.unstoringInsert(unstore);
	}

	// 주문건 조회
	public List<UnstoringVO> selectAll(CompanyVO company) {
		return dao.selectAll(company);
	}
	
	public List<UnstoringVO> selectAllByUnstoringCode(UnstoringVO unstoring) {
		return dao.selectAllByUnstoringCode(unstoring);
	}
	
	// test (Map 타입으로 받아서 주면 JS에선 어떻게 받을까??) (우선 List는 콘솔에 출력해보니 [OOO:ㅁㅁㅁ, ~~] 처럼 대괄호에 쌓인 형태였음
	public Map<String, UnstoringVO> selectAllbyMap(CompanyVO company) {
		return dao.selectAllbyMap(company);
	}
}
