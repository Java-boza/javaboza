package wuk.frontcontrol.video;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.video.control.VideoController;
import wuk.video.controller.VDeleteController;
import wuk.video.controller.VSAController;
import wuk.video.controller.VSController;
import wuk.video.controller.VUpdateController;
import wuk.video.controller.VUploadController;
import wuk.vidoe.handler.VideoHandlerAdapter;

@WebServlet("/VideoDispatcherServlet")
@MultipartConfig
public class VideoDispatcherServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	private static Log log = LogFactory.getLog(VideoDispatcherServlet.class);

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requsetURL = request.getRequestURI();
		String contextPath = request.getContextPath();
		String pathURL = requsetURL.substring(contextPath.length());
		log.info("매핑명 조회 : " + pathURL);

		VideoHandlerAdapter videoHandlerAdapter = null;
		VideoController controller = null;

		if (pathURL.equals("/VideoSelectAll.do")) {
			controller = new VSAController();
			videoHandlerAdapter = controller.execute(request, response);
			log.info("전체 조회 : " + videoHandlerAdapter);
		} else if (pathURL.equals("/VideoSelect.do")) {
			controller = new VSController();
			videoHandlerAdapter = controller.execute(request, response);
			log.info(" 조회 : " + videoHandlerAdapter);

		} else if (pathURL.equals("/VideoUpload.do")) {
			//객체를 처리하여 모델과 뷰에 반환한다.
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_upload.jsp");
			log.info("파일 업로드 확인 - " + videoHandlerAdapter);

		} else if (pathURL.equals("/VideoUploadView.do")) {
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_upload_view.jsp");
			log.info("파일 업로드 뷰 확인 - " + videoHandlerAdapter);

		} else if (pathURL.equals("/VideoUpdate.do")) {
			//객체를 처리하여 모델과 뷰에 반환한다.
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_update.jsp");
			log.info("파일 수정  확인 - " + videoHandlerAdapter);

		} else if (pathURL.equals("/VideoUpdateView.do")) {
			//객체를 처리하여 모델과 뷰에 반환한다.
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_update_view.jsp");
			log.info("파일 수정 뷰 확인 - " + videoHandlerAdapter);
		} else if (pathURL.equals("/VideoDelete.do")) {
			//객체를 처리하여 모델과 뷰에 반환한다.
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_delete.jsp");
			log.info("파일 삭게 - " + videoHandlerAdapter);
		} else if (pathURL.equals("/VideoDeleteView.do")) {
			//객체를 처리하여 모델과 뷰에 반환한다.
			videoHandlerAdapter = new VideoHandlerAdapter();
			//포워드로 파라미터를 전송한다.
			videoHandlerAdapter.setPath("/WEB-INF/videoview/video_delete_view.jsp");
			log.info("파일 삭제 뷰 확인 - " + videoHandlerAdapter);
		}
		if (videoHandlerAdapter != null) {
			if (videoHandlerAdapter.isRedirect()) {
				response.sendRedirect(videoHandlerAdapter.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(videoHandlerAdapter.getPath());
				dispatcher.forward(request, response);

			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
