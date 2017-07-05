package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
import com.hb.tripus.model.dto.TripNoteContentDto;
import com.hb.tripus.model.dto.TripNoteDto;
import com.hb.tripus.model.dto.TripNoteImgDto;

public class TripNoteDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<TripNoteDto> getAllNote() throws SQLException {
		return sqlSession.selectList("tripnote.getAllNote");
	}
	
	public List<TripNoteDto> getMyNote(String userid) throws SQLException {
		return sqlSession.selectList("tripnote.getMyNote", userid);
	}
	
	public MyTripDto getMyTripSelectOne(int code) throws SQLException {
		return sqlSession.selectOne("mytrip.getMyTripSelectOne", code);
	}
	
	public List<MyTripListDto> getMyTripList(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTripList", code);
	}
	
	public List<MyTripDetailDto> getMyTripDetail(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTripDetail", code);
	}
	
	public int insertShareTripNote(TripNoteDto bean) throws SQLException {
		sqlSession.insert("tripnote.insertShareTripNote", bean);
		return sqlSession.selectOne("tripnote.getTripNoteIdx", bean.getTripcode());
	}
	
	public void insertTripNoteContent(TripNoteContentDto bean) throws SQLException {
		sqlSession.insert("tripnote.insertTripNoteContent", bean);
	}
	
	public void insertTripNoteImg(TripNoteImgDto bean) throws SQLException {
		sqlSession.insert("tripnote.insertTripNoteImg", bean);
	}
	
	public void insertTripNoteThema(TripNoteDto bean) throws SQLException {
		sqlSession.insert("tripnote.insertTripNoteThema", bean);
	}
	
	public TripNoteDto getNoteOne(int idx) throws SQLException {
		return sqlSession.selectOne("tripnote.getNoteOne",idx);
	}
	
	public List<TripNoteContentDto> getNoteOneContent(int idx) throws SQLException {
		return sqlSession.selectList("tripnote.getNoteOneContent", idx);
	}
	
	public List<TripNoteImgDto> getNoteOneImg(int idx) throws SQLException {
		return sqlSession.selectList("tripnote.getNoteOneImg", idx);
	}
	
}
