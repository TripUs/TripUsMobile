package com.hb.tripus.model.dao;

import org.apache.ibatis.session.SqlSession;

public class HomeDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
