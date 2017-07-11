package com.hb.tripus.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
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
import com.hb.tripus.model.dto.TourAreaDto;
import com.hb.tripus.model.dto.TripNoteDto;

public class HomeDao implements DaoInterface {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<String> getAllImg(String contentid) throws SQLException {
		return sqlSession.selectList("home.getAllImg", contentid);
	}
	
	public void updateAreaLike(int areacode, int flag) throws SQLException {
		int likeflag = (Integer)sqlSession.selectOne("home.getAreaLike", areacode);
		if(flag == 0) likeflag++;
		else likeflag--;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("areacode", areacode);
		map.put("likeflag", likeflag);
		sqlSession.update("home.updateAreaLike", map);
	}
	
	public List<Object> getAreaContent(int areacode) throws SQLException {
		List<Object> list = new ArrayList<Object>();
		list.add(sqlSession.selectList("home.getAreaContent1", areacode));
		list.add(sqlSession.selectList("home.getAreaContent2", areacode));
		list.add(sqlSession.selectList("home.getAreaContent3", areacode));
		list.add(sqlSession.selectList("home.getAreaContent4", areacode));
		return list;
	}
	
	public AreaDto selectOneAreaInfo(int areacode) throws SQLException {
		return sqlSession.selectOne("home.selectOneAreaInfo", areacode);
	}
	
	public List<AreaDto> getTopArea() throws SQLException {
		return sqlSession.selectList("home.getTopArea");
	}
	
	public int getContentTable(String contentid) throws SQLException {
		return sqlSession.selectOne("home.getContentTable", contentid);
	}
	
	public void insertContentLike(TourAreaDto bean) throws SQLException {
		sqlSession.insert("home.insertContentLike", bean);
	}
	
	public void updateContentLike(TourAreaDto bean) throws SQLException {
		sqlSession.insert("home.updateContentLike", bean);
	}
	
	public List<TripNoteDto> getTopNote() throws SQLException {
		return sqlSession.selectList("home.getTopNote");
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
		int cnt = (Integer) sqlSession.selectOne("home.getAreaImgCnt", contentid);
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
		int likeCnt = 0;
		if(sqlSession.selectOne("home.likeflag", contentid) != null)
			return sqlSession.selectOne("home.likeflag", contentid);
		else return likeCnt; 
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
