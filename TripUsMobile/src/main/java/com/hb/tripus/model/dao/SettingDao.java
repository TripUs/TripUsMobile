package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public UserDto getUserInfo(String id) throws SQLException {
		return sqlSession.selectOne("setting.getUserInfo", id);
	}
	
	public UserDto loginUser(UserDto bean) throws SQLException {
		return sqlSession.selectOne("setting.loginUser", bean);
	}
	
	public List<FriendListDto> getFriendList(String id) throws SQLException {
		return sqlSession.selectList("setting.getFriendList", id);
	}
	
	public List<UserDto> getSearchUserInfo(String userid, String name) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("name", name);
		return sqlSession.selectList("setting.getSearchUserInfo", map);
	}
	
	public void insertFriend(FriendListDto bean) throws SQLException {
		sqlSession.insert("setting.insertFriend", bean);
	}
	
	public void updateFriend(String userid, String friendid) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("friendid", friendid);
		sqlSession.update("setting.updateFriend", map);
	}
	
	public void deleteFriend(String userid, String friendid) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("friendid", friendid);
		sqlSession.delete("setting.deleteFriend", map);
	}
	
}
