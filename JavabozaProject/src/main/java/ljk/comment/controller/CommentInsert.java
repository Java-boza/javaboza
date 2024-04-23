package ljk.comment.controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // 세션을 사용하기 위해 import 추가

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import ljk.comment.control.Controller;
import ljk.comment.dao.CommentDAO;
import ljk.comment.dto.CommentDTO;
import ljk.comment.handler.CommentHandlerAdapter;

public class CommentInsert implements Controller {
    private static Log log = LogFactory.getLog(CommentInsert.class);

    @Override
    public CommentHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
        // 세션에서 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("user_id");

        // 사용자가 입력한 댓글 내용 가져오기
        String content = request.getParameter("comment_content");

        // 현재 시간을 Timestamp로 변환하여 가져오기
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        // CommentDTO 객체 생성 및 설정
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setComment_content(content);
        commentDTO.setComment_date(timestamp);
        commentDTO.setUser_id(name);

        // CommentDAO를 사용하여 댓글 삽입
        CommentDAO commentDAO = new CommentDAO();
        commentDTO = commentDAO.comment_insert(commentDTO);

        // 댓글 목록을 다시 불러와서 설정
        ArrayList<CommentDTO> arrayList = commentDAO.comment_select_all();
        request.setAttribute("list", arrayList);

        // 결과를 JSP로 전달하기 위해 CommentHandlerAdapter 객체 생성 및 설정
        CommentHandlerAdapter commentHandlerAdapter = new CommentHandlerAdapter();
        commentHandlerAdapter.setPath("/WEB-INF/content/commentInsert.jsp");
        return commentHandlerAdapter;
    }
}