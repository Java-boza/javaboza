package wuk.video.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VDeleteController implements VideoController {
	private static Log log = LogFactory.getLog(VDeleteController.class);
	
	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		 int VIDEO_NUM = Integer.parseInt(request.getParameter("VIDEO_NUM"));
		 log.info(VIDEO_NUM);
		 VideoDAO videoDao = new VideoDAO( );
		 VideoDTO videoDTO = new VideoDTO( );
		 videoDTO.setVIDEO_NUM(VIDEO_NUM);
		 request.setAttribute("videoDTO", videoDTO);
		 videoDTO = videoDao.videoDelete(VIDEO_NUM);
		 log.info(videoDTO);
		 VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter( );
		 //포워드로 파라미터를 전송한다.
		 videoHandlerAdapter.setPath("/WEB-INF/videoview/video_delete_view.jsp");
		 return videoHandlerAdapter;
		 }
		 }
