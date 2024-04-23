package jin.payment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jin.payment.control.Controller;
import jin.payment.dao.PaymentDAO;
import jin.payment.dto.PaymentDTO;
import jin.payment.handler.PaymentHandlerAdapter;

//주어진 user_id에 해당하는 결제 정보 조회
public class PaymentSelectController implements Controller {

	private static Log log = LogFactory.getLog(PaymentSelectController.class);

	@Override
	public PaymentHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {

		// 세션 가져오기
		HttpSession session = request.getSession();

		// 세션에서 사용자 아이디 가져오기
		String user_id = (String) session.getAttribute("user_id");

		// 세션에 저장된 사용자 아이디
		log.info("세션에 저장된 아이디 조회: " + user_id);

//      결제 정보를 조회하기 위해 PaymentDAO 객체를 생성
		PaymentDAO paymentDAO = new PaymentDAO();

//      사용자 아이디로 결제 정보 조회
		PaymentDTO paymentDTO = paymentDAO.getPaymentByUserId(user_id);

//      조회된 결제 정보를 로그에 기록 
		log.info(paymentDTO);

//      결제 정보를 보여줄 뷰로 이동하기 위해 PaymentHandlerAdapter 객체를 생성
		PaymentHandlerAdapter paymentHandlerAdapter = new PaymentHandlerAdapter();

//      조회된 결제 정보를 request에 속성으로 설정
		request.setAttribute("paymentDTO", paymentDTO);

		paymentHandlerAdapter.setPath("/WEB-INF/view/payment/payment_select_view.jsp"); // 멤버십 정보 페이지로 이동

//      결제 정보를 로그에 다시 기록
		log.info(paymentDTO);

//      PaymentHandlerAdapter 객체를 반환
		return paymentHandlerAdapter;
	}
}