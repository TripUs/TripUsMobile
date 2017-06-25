package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.AreaDto;
import com.hb.tripus.model.dto.RecentSearchDto;

public class HomeDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<AreaDto> searchArea(String keyword) throws SQLException {
		return sqlSession.selectList("home.searchArea", keyword);
	}
	
	public void insertRecentSearch(Map<String, String> map) throws SQLException {
		sqlSession.insert("home.insertRecentSearch", map);
	}
	
	public List<RecentSearchDto> getRecentSearch(String userid) throws SQLException {
		return sqlSession.selectList("home.getRecentSearch", userid);
	}
	
}
