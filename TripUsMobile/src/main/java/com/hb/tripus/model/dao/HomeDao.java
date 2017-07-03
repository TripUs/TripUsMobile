package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hb.tripus.model.dto.AreaDto;
import com.hb.tripus.model.dto.LikeFlagDto;
import com.hb.tripus.model.dto.MyTripDetailDto;
import com.hb.tripus.model.dto.MyTripDto;
import com.hb.tripus.model.dto.MyTripListDto;
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
	
	public int checkRecentSearch(String userid, String contentid) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("contentid", contentid);
		return sqlSession.selectOne("home.checkRecentSearch", map);
	}
	
	public void insertRecentSearch(Map<String, String> map) throws SQLException {
		sqlSession.insert("home.insertRecentSearch", map);
	}
	
	public List<RecentSearchDto> getRecentSearch(String userid) throws SQLException {
		return sqlSession.selectList("home.getRecentSearch", userid);
	}
	
	public List<String> getAreaImg(String contentid) throws SQLException {
		System.out.println("이미지 다오 호출");
		int cnt = (Integer) sqlSession.selectOne("home.getAreaImgCnt", contentid);
		System.out.println("cnt : " + cnt);
		if(cnt == 0) return null;
		else return sqlSession.selectList("home.getAreaImg", contentid);
	}
	
	public void insertAreaImg(String contentid, String imgname) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("contentid", contentid);
		map.put("imgname", imgname);
		sqlSession.insert("home.insertAreaImg", map);
	}
	
	public int getLikeFlag(String contentid) throws SQLException{
		int count = sqlSession.selectOne("home.likeflag", contentid);
		return count; 
	}
	
	public int getUserLikeFlag(LikeFlagDto bean) throws SQLException{
		return sqlSession.selectOne("home.userlikeflag", bean);
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
	
	public List<ReviewDto> getReview(String contentid) throws SQLException{
		List<ReviewDto> list = sqlSession.selectList("home.reveiw", contentid);
		return list;
		
	}
	
	public List<MyTripDto> getMyTrip(String id) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTrip", id);
	}
	
	public MyTripDto getMyTripSelectOne(int code) throws SQLException {
		return sqlSession.selectOne("mytrip.getMyTripSelectOne", code);
	}
	
	public List<MyTripListDto> getMyTripList(int code) throws SQLException {
		return sqlSession.selectList("mytrip.getMyTripList", code);
	}
	
	public void insertMyTripDetail(MyTripDetailDto bean) throws SQLException {
		sqlSession.insert("mytrip.insertMyTripDetail", bean);
	}
	
}
