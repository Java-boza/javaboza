package wuk.video.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wuk.vidoe.handler.VideoHandlerAdapter;

public interface VideoController {
	
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response);
}
