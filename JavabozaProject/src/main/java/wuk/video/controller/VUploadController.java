package wuk.video.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.oreilly.servlet.multipart.Part;

import wuk.dao.video.VideoDAO;
import wuk.dto.video.VideoDTO;
import wuk.video.control.VideoController;
import wuk.vidoe.handler.VideoHandlerAdapter;

public class VUploadController implements VideoController {
	private static Log log = LogFactory.getLog(VUploadController.class);

	@Override
	public VideoHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String VIDEO_TITLE = request.getParameter("VIDEO_TITLE");
		String VIDEO_DESCRIPTION = request.getParameter("VIDEO_DESCRIPTION");
		String VIDEO_DIRECTORY = "./videos";

		// VideoDTO 객체를 생성하고 정보를 설정합니다.
		VideoDTO videoDTO = new VideoDTO();
		videoDTO.setVIDEO_TITLE(VIDEO_TITLE);
		videoDTO.setVIDEO_DESCRIPTION(VIDEO_DESCRIPTION);

		// 업로드된 파일을 저장할 경로 설정
		String uploadDirectory = request.getServletContext().getRealPath(VIDEO_DIRECTORY);

		try {
			// 파일을 업로드하고 파일명을 받아옵니다.
			String fileName = uploadFile(request, uploadDirectory);
			if (fileName != null) {
				// 파일 업로드에 성공하면 VideoDTO에 파일 경로를 저장합니다.
				videoDTO.setUPLOAD_DIRECTORY(VIDEO_DIRECTORY + "/" + fileName);

				// VideoDAO를 사용하여 동영상 정보를 DB에 저장합니다.
				VideoDAO videoDAO = new VideoDAO();
				VideoDTO uploadedVideo = videoDAO.videoUpload(videoDTO);

				if (uploadedVideo != null) {
					log.info("동영상 정보 저장 완료: " + uploadedVideo);
					// 포워드로 파라미터를 전송합니다.
					VideoHandlerAdapter videoHandlerAdapter = new VideoHandlerAdapter();
					videoHandlerAdapter.setPath("/WEB-INF/videoview/video_upload_view.jsp");
					return videoHandlerAdapter;
				} else {
					log.info("동영상 정보 저장 실패");
				}
			}
		} catch (IOException | ServletException e) {
			log.info("동영상 파일 업로드 실패: " + e.getMessage());
		}
		// 실패 시 업로드 페이지로 다시 포워드
		return new VideoHandlerAdapter();
	}

	// 파일을 업로드하고 파일명을 반환하는 메서드
	private String uploadFile(HttpServletRequest request, String VIDEO_DIRECTORY) throws IOException, ServletException {
		Part filePart = (Part) request.getPart("videoFile"); // 업로드된 동영상 파일
		String fileName = getFileName(filePart);
		if (fileName != null && !fileName.isEmpty()) {
			File uploadDir = new File(VIDEO_DIRECTORY);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			String filePath = VIDEO_DIRECTORY + File.separator + fileName;
			// 파일 저장
			try (InputStream inputStream = ((ServletRequest) filePart).getInputStream(); FileOutputStream outputStream = new FileOutputStream(filePath)) {
				byte[] buffer = new byte[4096];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				log.info("동영상 파일 저장 완료: " + filePath);
				return fileName;
			} catch (IOException e) {
				log.info("파일 저장 중 오류 발생: " + e.getMessage());
				throw e;
			}
		}
		return null;
	}

	// Part에서 파일명을 추출하는 메서드
	private String getFileName(Part part) {
		String contentDispositionHeader = ((HttpServletRequest) part).getHeader("content-disposition");
		for (String cd : contentDispositionHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				// 파일명이 빈 문자열이 아니면 반환합니다.
				if (!fileName.isEmpty()) {
					return fileName;
				}
			}
		}
		return null;
	}
}
