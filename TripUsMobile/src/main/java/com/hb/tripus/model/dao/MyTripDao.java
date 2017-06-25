package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;

public class MyTripDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MyTripDto> getMyTrip(String id) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTrip", id);
	}
	
	public MyTripDto getMyTripSelectOne(int code) throws SQLException {
		return sqlSession.selectOne("mytrip.getMyTripSelectOne", code);
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
}
