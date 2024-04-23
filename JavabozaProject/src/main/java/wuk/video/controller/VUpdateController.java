package wuk.video.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VUpdateController implements VideoController {
	private static Log log = LogFactory.getLog(VUpdateController.class);
	
	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		// 수정할 동영상 정보를 파라미터에서 가져옴
		int VIDEO_NUM = Integer.parseInt(request.getParameter("VIDEO_NUM"));
		log.info(VIDEO_NUM);
		System.out.println(VIDEO_NUM);
		
		VideoDAO videoDao = new VideoDAO();
		VideoDTO videoDTO = new VideoDTO();
		
		videoDTO = videoDao.videoSelect(VIDEO_NUM);
		request.setAttribute("videoDTO", videoDTO);
		VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter();
		log.info("특정 동영상 조회");
		
		videoHandlerAdapter.setPath("/WEB-INF/videoview/video_update.jsp");
		return videoHandlerAdapter;
	}

}
