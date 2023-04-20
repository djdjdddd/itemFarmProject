package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import frontcontroller.CommonInterface;
import model.UnstoringService;
import vo.CompanyVO;
import vo.UnstoringVO;

public class UnstoringDetailController implements CommonInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		HttpSession session = request.getSession();
		String number = request.getParameter("number");
		System.out.println("컨트롤러에서 "+ number);
		
		UnstoringVO unstoring = new UnstoringVO();
		UnstoringService service = new UnstoringService();
		unstoring.setUnstoring_code(number);
		System.out.println("컨트롤러에서 "+unstoring);
		
		List<UnstoringVO> unstoringModalList = service.selectAllByUnstoringCode(unstoring);
		
		session.setAttribute("unstoringModalList", unstoringModalList);
		System.out.println("unstoringModalList "+ unstoringModalList);
		
		JSONObject obj = new JSONObject();
		for(UnstoringVO list : unstoringModalList) {
			obj.put("unstoring_code", list.getUnstoring_code());
			obj.put("customer_name", list.getCustomer_name());
			obj.put("customer_address", list.getCustomer_address());
			obj.put("tracking_number", list.getTracking_number());
			obj.put("unstoring_state", list.getUnstoring_state());
		}
		
		
		System.out.println(obj);
		
		
		String page = "responseBody:" + obj;
		return page;
	}

}
