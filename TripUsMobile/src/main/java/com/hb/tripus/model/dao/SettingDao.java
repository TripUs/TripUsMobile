package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.FriendListDto;
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
	
	public List<FriendListDto> getFriendList(String id) throws SQLException {
		return sqlSession.selectList("setting.getFriendList", id);
	}
	
	public UserDto getSearchUserInfo(String name) throws SQLException {
		return sqlSession.selectOne("setting.getSearchUserInfo", name);
	}
	
}
