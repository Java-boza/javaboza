package wuk.dto.video;

import java.util.Arrays;
import java.util.Date;

public class VideoDTO {
	private int VIDEO_NUM;
	private String VIDEO_TITLE;
	private String VIDEO_DESCRIPTION;
	private String THUMBNAILPATH;
	private String UPLOAD_DIRECTORY;
	 private byte[] VIDEO_DATA; // BLOB 타입으로 변경된 필드
	
	public byte[] getVIDEO_DATA() {
		return VIDEO_DATA;
	}
	public void setVIDEO_DATA(byte[] vIDEO_DATA) {
		VIDEO_DATA = vIDEO_DATA;
	}
	public String getUPLOAD_DIRECTORY() {
		return UPLOAD_DIRECTORY;
	}
	public void setUPLOAD_DIRECTORY(String uPLOAD_DIRECTORY) {
		UPLOAD_DIRECTORY = uPLOAD_DIRECTORY;
	}
	private Date VIDEO_DATE;
	private int VIDEO_LIKES;
	public int getVIDEO_NUM() {
		return VIDEO_NUM;
	}
	public void setVIDEO_NUM(int vIDEO_NUM) {
		VIDEO_NUM = vIDEO_NUM;
	}
	public String getVIDEO_TITLE() {
		return VIDEO_TITLE;
	}
	public void setVIDEO_TITLE(String vIDEO_TITLE) {
		VIDEO_TITLE = vIDEO_TITLE;
	}
	public String getVIDEO_DESCRIPTION() {
		return VIDEO_DESCRIPTION;
	}
	public void setVIDEO_DESCRIPTION(String vIDEO_DESCRIPTION) {
		VIDEO_DESCRIPTION = vIDEO_DESCRIPTION;
	}
	public String getTHUMBNAILPATH() {
		return THUMBNAILPATH;
	}
	public void setTHUMBNAILPATH(String tHUMBNAILPATH) {
		THUMBNAILPATH = tHUMBNAILPATH;
	}
	public Date getVIDEO_DATE() {
		return VIDEO_DATE;
	}
	public void setVIDEO_DATE(Date vIDEO_DATE) {
		VIDEO_DATE = vIDEO_DATE;
	}
	public int getVIDEO_LIKES() {
		return VIDEO_LIKES;
	}
	public void setVIDEO_LIKES(int vIDEO_LIKES) {
		VIDEO_LIKES = vIDEO_LIKES;
	}
	@Override
	public String toString() {
		return "VideoDTO [VIDEO_NUM=" + VIDEO_NUM + ", VIDEO_TITLE=" + VIDEO_TITLE + ", VIDEO_DESCRIPTION=" + VIDEO_DESCRIPTION + ", THUMBNAILPATH="
				+ THUMBNAILPATH + ", UPLOAD_DIRECTORY=" + UPLOAD_DIRECTORY + ", VIDEO_DATA=" + Arrays.toString(VIDEO_DATA) + ", VIDEO_DATE=" + VIDEO_DATE
				+ ", VIDEO_LIKES=" + VIDEO_LIKES + "]";
	}
	
}
