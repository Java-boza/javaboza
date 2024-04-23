package jms.member.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jms.member.handler.HandlerAdapter;

public interface Controller {
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response);

}
