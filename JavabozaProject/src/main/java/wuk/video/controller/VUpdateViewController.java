package wuk.video.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VUpdateViewController implements VideoController{
	private static Log log = LogFactory.getLog(VUpdateViewController.class);
	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {

		int VIDEO_NUM = Integer.parseInt(request.getParameter("VIDEO_NUM"));
		log.info(VIDEO_NUM);
		String VIDEO_TITLE = request.getParameter("VIDEO_TITLE");
		log.info(VIDEO_TITLE);
		String VIDEO_DESCRIPTION = request.getParameter(VIDEO_TITLE);
		log.info(VIDEO_DESCRIPTION);
		
		VideoDAO videoDao = new VideoDAO();
		VideoDTO videoDTO = new VideoDTO();
		
		videoDTO.setVIDEO_NUM(VIDEO_NUM);
		videoDTO.setVIDEO_TITLE(VIDEO_TITLE);
		videoDTO.setVIDEO_DESCRIPTION(VIDEO_DESCRIPTION);
		
		videoDTO = videoDao.videoUpdate(videoDTO);
		log.info(videoDTO);
		request.setAttribute("videoDTO", videoDTO);
		VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter();
		videoHandlerAdapter.setPath("/WEB-INF/videoview/video_update.jsp");
		return videoHandlerAdapter;
	}
	
}
