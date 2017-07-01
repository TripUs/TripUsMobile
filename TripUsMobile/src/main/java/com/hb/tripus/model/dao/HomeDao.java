package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.AreaDto;
import com.hb.tripus.model.dto.LikeFlagDto;
import com.hb.tripus.model.dto.RecentSearchDto;
import com.hb.tripus.model.dto.ReviewDto;

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
	
	public int getLikeFlag(String contentid) throws SQLException{
		int count = sqlSession.selectOne("home.likeflag", contentid);
		return count; 
	}
	
	public int getLikeFlag_Test(LikeFlagDto bean) throws SQLException{
		
		int count = sqlSession.selectOne("home.likeflag_test",bean);
		
		return count;
	}   
	
	public void getLikeUp(LikeFlagDto bean) throws SQLException{
		
		sqlSession.insert("home.likeflag_up",bean);
	}
	
	public void getLikeDown(LikeFlagDto bean) throws SQLException{
		
		sqlSession.delete("home.likeflag_down", bean);
	}
	
	public void getReview_add(ReviewDto bean) throws SQLException{
		
		sqlSession.insert("home.review_add", bean);
	}
	
	public List<ReviewDto>  getReview(String contentid) throws SQLException{
		List<ReviewDto> list = sqlSession.selectList("home.reveiw", contentid);
		return list;
		
	}
}
