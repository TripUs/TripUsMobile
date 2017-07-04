package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.FriendListDto;
import com.hb.tripus.model.dto.MyTripBbsDto;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;

public class MyTripDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int getCodeCnt() throws SQLException {
		return sqlSession.selectOne("mytrip.getCodeCnt");
	}
	
	public void insertTripGroup(int code, String userid) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("userid", userid);
		sqlSession.insert("mytrip.insertTripGroup", map);
	}
	
	public List<MyTripDto> getMyTrip(String id) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTrip", id);
	}
	
	public MyTripDto getMyTripSelectOne(int code) throws SQLException {
		return sqlSession.selectOne("mytrip.getMyTripSelectOne", code);
	}
	
	public void deleteMyTripList(int code, String contentid) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("contentid", contentid);
		sqlSession.delete("mytrip.deleteMyTripList", code);
	}
	
	public void insertMyTrip(MyTripDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertMyTrip", bean);
	}
	
	public List<MyTripListDto> getMyTripList(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTripList", code);
	}
	
	public void insertMyTripList(MyTripListDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertMyTripList", bean);
	}
	
	public List<MyTripDetailDto> getMyTripDetail(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTripDetail", code);
	}
	
	public void insertMyTripDetail(MyTripDetailDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertMyTripDetail", bean);
	}
	
	public void insertStoryReple(MyTripBbsDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertStoryReple", bean);
	}
	
	public void insertTripStory(MyTripBbsDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertTripStory", bean);
	}
	
	public List<MyTripBbsDto> getTripStory(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getTripStory", code);
	}
	
	public int getGrpCnt() throws SQLException {
		if(sqlSession.selectOne("mytrip.getGrpCnt") == null) return 0;
		return sqlSession.selectOne("mytrip.getGrpCnt");
	}
	
	public void updateStorySeqLvl(int seq, int grp) throws SQLException {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq1", seq+1);
		map.put("seq2", seq);
		map.put("grp", grp);
		sqlSession.update("mytrip.updateStorySeqLvl", map);
	}
	
	public MyTripBbsDto getOneTripStory(int idx) throws SQLException {
		return sqlSession.selectOne("mytrip.getOneTripStory", idx);
	}

	public List<FriendListDto> getFriendList(String id) throws SQLException {
		return sqlSession.selectList("mytrip.getFriendList", id);
	}
	
	public void updateTripUserNum(int code) throws SQLException {
		sqlSession.update("mytrip.updateTripUserNum", code);
	}
	
}
