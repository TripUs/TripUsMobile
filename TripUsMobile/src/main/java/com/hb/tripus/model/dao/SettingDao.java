package com.hb.tripus.model.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.UserDto;

public class SettingDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insertUser(UserDto bean) throws SQLException {
		sqlSession.insert("setting.insertUser", bean);
	}
	
	public int searchUser(String id) throws SQLException {
		return sqlSession.selectOne("setting.searchUser", id);
	}
	
	public UserDto loginUser(UserDto bean) throws SQLException {
		return sqlSession.selectOne("setting.loginUser", bean);
	}
	
}