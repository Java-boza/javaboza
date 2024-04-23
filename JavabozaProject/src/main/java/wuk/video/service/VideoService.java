package wuk.video.service;

import java.util.List;

import wuk.dto.video.VideoDTO;

public interface VideoService {
	
	public List<VideoDTO> videoSelectAll();
	public VideoDTO videoSelect(int VIDEO_NUM);
	public VideoDTO videoUpload(VideoDTO videoDTO);
	public VideoDTO videoUpdate(VideoDTO videoDTO);
	public VideoDTO videoDelete(int VIDEO_NUM);
}
