package wuk.dao.video;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import wuk.dto.video.VideoDTO;
import wuk.video.service.VideoService;

public class VideoDAO implements VideoService {
	private static Log log = LogFactory.getLog(VideoDAO.class);
	//private static final String INSERT_VIDEO_SQL = "INSERT INTO VIDEO (VIDEO_NUM, VIDEO_TITLE, VIDEO_DESCRIPTION, VIDEO_DATA) VALUES (VIDEO_NUM_seq.NEXTVAL, ?, ?, ?)";

	@Override
	public List<VideoDTO> videoSelectAll() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		List<VideoDTO> list = new ArrayList<VideoDTO>();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select VIDEO_NUM, VIDEO_TITLE, VIDEO_DESCRIPTION from video";
			log.info("SQL 확인 : " + sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				VideoDTO videoDTO = new VideoDTO();
				videoDTO.setVIDEO_NUM(resultSet.getInt("VIDEO_NUM"));
				videoDTO.setVIDEO_TITLE(resultSet.getString("VIDEO_TITLE"));
				videoDTO.setVIDEO_DESCRIPTION(resultSet.getString("VIDEO_DESCRIPTION"));
				list.add(videoDTO);
			}
			resultSet.getRow();
			if (resultSet.getRow() == 0) {
				log.info("video not found");
			}
		} catch (Exception e) {
			log.info("File faild  : " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public VideoDTO videoSelect(int VIDEO_NUM) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		VideoDTO videoDTO = new VideoDTO();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();

			String sql = "select VIDEO_TITLE, VIDEO_DESCRIPTION from video where VIDEO_NUM=?";
			log.info("SQL 확인 : " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, VIDEO_NUM);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
			//	videoDTO.setVIDEO_NUM(resultSet.getInt("VIDEO_NUM"));
				videoDTO.setVIDEO_TITLE(resultSet.getString("VIDEO_TITLE"));
				videoDTO.setVIDEO_DESCRIPTION(resultSet.getString("VIDEO_DESCRIPTION"));
			}
		} catch (Exception e) {
			log.info("동영상 조회 불가" + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return videoDTO;
	}
	

	@Override
	public VideoDTO videoUpload(VideoDTO videoDTO) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();

			String sql = " Insert into video (VIDEO_NUM, VIDEO_TITLE, VIDEO_DATE, VIDEO_DESCRIPTION, VIDEO_DATA)";
			sql += "values(VIDEO_NUM.nextval, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), ?, ?) ";
			log.info("SQL확인 : " + sql);
			preparedStatement = connection.prepareStatement(sql, new String[] { "VIDEO_NUM" });
			preparedStatement.setString(1, videoDTO.getVIDEO_TITLE());
			preparedStatement.setString(2, videoDTO.getVIDEO_DESCRIPTION());
			preparedStatement.setBytes(3, videoDTO.getVIDEO_DATA()); // 이 부분이 추가되었습니다.
			
			
			
			
			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				log.info("동영상 정보가 성공적으로 저장되었습니다.");

				resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) {
					int videoNum = resultSet.getInt(1);
					videoDTO.setVIDEO_NUM(videoNum);
				}
			} else {
				log.error("동영상 정보를 저장하는 데 실패했습니다.");
			}
		} catch (NamingException | SQLException e) {
			log.error("동영상 정보를 저장하는 데 실패했습니다: " + e.getMessage());
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				log.error("리소스 해제 중 오류가 발생했습니다: " + e.getMessage());
			}
		}

		return videoDTO;
	}

	@Override
	public VideoDTO videoUpdate(VideoDTO videoDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "update video set VIDEO_TITLE=?, VIDEO_DESCRIPTION=?";
			sql += " where VIDEO_NUM= ?";
			log.info("SQL 확인 : " + sql);

			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, videoDTO.getVIDEO_TITLE());
			preparedStatement.setString(2, videoDTO.getVIDEO_DESCRIPTION());
			preparedStatement.setInt(3, videoDTO.getVIDEO_NUM());

			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				connection.commit();
				log.info("동영상 수정 성공");
			} else {
				connection.rollback();
				log.info("동영상 수정 실패");
			}
		} catch (Exception e) {
			log.info("동영상 수정 실패 : " + e);
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return videoDTO;
	}

	@Override
	public VideoDTO videoDelete(int VIDEO_NUM) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "DELETE FROM video WHERE VIDEO_NUM=?";
			log.info("SQL 확인 : " + sql);

			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, VIDEO_NUM);

			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				connection.commit();
				log.info("동영상 삭제 성공");
			} else {
				connection.rollback();
				log.info("동영상 삭제 실패");
			}
		} catch (Exception e) {
			log.info("동영상 삭제 실패 : " + e);
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
