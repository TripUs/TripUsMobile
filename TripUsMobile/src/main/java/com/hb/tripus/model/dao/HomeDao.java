package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.AreaDto;

public class HomeDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<AreaDto> searchArea(String keyword) throws SQLException {
		return sqlSession.selectList("home.searchArea", keyword);
	}
}
