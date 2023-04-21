package frontcontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.AuthController;
import controller.BaljuCheckListController;
import controller.BaljuConfirmListController;
import controller.BaljuController;
import controller.CancelOrderController;
import controller.CompanyListController;
import controller.CompanyModifyController;
import controller.ProductController;
import controller.StatisticsController;
import controller.StoringInsertController;
import controller.TrackingNumberInputController;
import controller.UnstoringDetailController;
import controller.StoringListController;
import controller.UnstoringInsertController;
import controller.UnstoringListController;
import controller.WarehousingController;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		CommonInterface controller = null;
		Map<String, Object> data = new HashMap<>();
		
		data.put("method", request.getMethod());
		data.put("request", request);
		data.put("response", response);
		
		switch (path) {
		case "/auth/new.do":
			controller = new AuthController();
			break;
		case "/balju/baljuCheckList.do":
			controller = new BaljuCheckListController();
			break;
		case "/balju/baljuConfirmList.do":
			controller = new BaljuConfirmListController();
			break;
		case "/company/companyList.do":
			controller = new CompanyListController();
			break;
		case "/company/companyModify.do":
			controller = new CompanyModifyController();
			break;
		case "/product/new.do":
			controller = new ProductController();
			break;
		case "/statistics/new.do":
			controller = new StatisticsController();
			break;
		case "/storing/storing_insert.do":
			controller = new StoringInsertController();
			break;
		case "/storing/storing_list.do":
			controller = new StoringListController();
			break;
		case "/unstoring/unstoringInsert.do": // 주문건 등록 (출고관리)
			controller = new UnstoringInsertController();
			break;
		case "/unstoring/unstoringList.do": // 주문건 조회 (출고관리)
			controller = new UnstoringListController();
			break;
		case "/unstoring/trackingNumberInput.do": // 송장번호 입력 ajax (출고관리)
			controller = new TrackingNumberInputController();
			break;
		case "/unstoring/cancelOrder.do": // 주문취소 ajax (출고관리)
			controller = new CancelOrderController();
			break;
		case "/unstoring/unstoringDetail.do": // 주문건 상세조회 (모달)
			controller = new UnstoringDetailController();
			break;
		case "/warehousing/new.do":
			controller = new WarehousingController();
			break;
		default:
			break;
		}
		
		String page = null;
		
		try {
			page = controller.execute(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(page.indexOf("redirect:") >= 0) {
			response.sendRedirect(page.substring(9));
		}else if (page.indexOf("responseBody:") >= 0) {
			 response.getWriter().append(page.substring(13)); // 이거 자체가 success의 responseData임!
		}else {
			RequestDispatcher rd;
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}
 
	
}
