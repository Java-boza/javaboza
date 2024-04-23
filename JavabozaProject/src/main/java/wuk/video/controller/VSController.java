package wuk.video.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VSController implements VideoController {
	private static Log log = LogFactory.getLog(VSController.class);

	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		int VIDEO_NUM = Integer.parseInt(request.getParameter("VIDEO_NUM"));
		log.info(VIDEO_NUM);

		VideoDAO videoDao = new VideoDAO();
		VideoDTO videoDTO = new VideoDTO();
		videoDTO = videoDao.videoSelect(VIDEO_NUM);
		log.info(videoDTO);

		request.setAttribute("VideoDTO", videoDTO);
		VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter();
		log.info("동영상 조회");

		videoHandlerAdapter.setPath("/WEB-INF/videoview/content.jsp");
		return videoHandlerAdapter;
	}

}
