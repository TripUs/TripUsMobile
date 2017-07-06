package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
import com.hb.tripus.model.dto.TripNoteBbsDto;
import com.hb.tripus.model.dto.TripNoteContentDto;
import com.hb.tripus.model.dto.TripNoteDto;
import com.hb.tripus.model.dto.TripNoteImgDto;

public class TripNoteDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int getNoteLike(String userid, int idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("idx", idx);
		return sqlSession.selectOne("tripnote.getNoteLike", map);
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

	public void getNoteLikeUp(int idx, int likeflag, String id, int likeCnt) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);		map.put("likeflag", likeflag);
		map.put("userid", id);		map.put("likeCnt", likeCnt+1);
		sqlSession.insert("tripnote.noteLikeUp", map);
		sqlSession.update("tripnote.updateNoteLike", map);
	}

	public void getNoteLikeDown(int idx, int likeflag, String id, int likeCnt) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);		map.put("likeflag", likeflag);
		map.put("userid", id);		map.put("likeCnt", likeCnt-1);
		sqlSession.delete("tripnote.noteLikeDown", map);
		sqlSession.update("tripnote.updateNoteLike", map);
	}
	
	public void insertNoteComment(TripNoteBbsDto bean) throws SQLException {
		sqlSession.insert("tripnote.insertNoteComment", bean);
	}
	
	public List<TripNoteBbsDto> getNoteComment(int idx) throws SQLException {
		return sqlSession.selectList("tripnote.getNoteComment", idx);
	}

	public int getNoteGrpCnt() throws SQLException {
		if(sqlSession.selectOne("tripnote.getNoteGrpCnt") == null) return 0;
		return sqlSession.selectOne("tripnote.getNoteGrpCnt");
	}
	
}
