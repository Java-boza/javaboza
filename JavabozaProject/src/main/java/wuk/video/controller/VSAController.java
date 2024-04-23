package wuk.video.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VSAController implements VideoController {
	private static Log log = LogFactory.getLog(VSAController.class);

	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		VideoDAO videoDao = new VideoDAO();
		VideoDTO videoDTO = new VideoDTO();
		log.info(videoDTO);

		List<VideoDTO> list = new ArrayList<VideoDTO>();
		list = videoDao.videoSelectAll();
		log.info(list);
		request.setAttribute("list", list);
		VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter();
		log.info("동영상 정보 조회");

		videoHandlerAdapter.setPath("/WEB-INF/videoview/content_main_view.jsp");
		return videoHandlerAdapter;
	}

}
