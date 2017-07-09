package com.hb.tripus.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hb.tripus.model.dto.TourAreaBasicDto;
import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.util.JsonParserModule;
import com.hb.tripus.util.XmlParserModule;

public class MainService implements ServiceCommand {

	private JsonParserModule jparser;

	public List<Object> getAreaContent(int areacode, int lang) {
		List<Object> list = new ArrayList<Object>();
		String url = "areaBasedList?areaCode=" + areacode + "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=7";
		url += "&contentTypeId=12";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		
		url = "areaBasedList?areaCode=" + areacode + "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=7";
		url += "&contentTypeId=32";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		
		url = "areaBasedList?areaCode=" + areacode + "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=7";
		url += "&contentTypeId=39";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		
		url = "areaBasedList?areaCode=" + areacode + "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=7";
		url += "&contentTypeId=25";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		return list;
	}
	
	public List<Object> searchAreaTypeContent(int areacode, int page, int lang, int contenttypeid) {
		List<Object> list = new ArrayList<Object>();
		String url = "areaBasedList?areaCode=" + areacode + "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=20";
		if(contenttypeid != 0) {
			if(contenttypeid == 12) url += "&contenttypeidArray=12&contenttypeidArray=14&contenttypeidArray=15&contenttypeidArray=28&contenttypeidArray=38";
			else if(contenttypeid == 32) url += "&contentTypeId=32";
			else if(contenttypeid == 39) url += "&contentTypeId=39";
			else if(contenttypeid == 25) url += "&contentTypeId=25";
		}
		jparser = new JsonParserModule(url, page, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		jparser = new JsonParserModule(url, lang);
		list.add(jparser.pageCntParse());
		return list;
	}
	
	public List<Object> searchKeyword(String keyword, int page, int lang, int contenttypeid) {
		List<Object> list = new ArrayList<Object>();
		try {
			String url = "searchKeyword?keyword=" + URLEncoder.encode(keyword, "UTF-8")
					+ "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=20";
			if(contenttypeid != 0) {
				if(contenttypeid == 12) url += "&contentTypeId=12";
				else if(contenttypeid == 28) url += "&contentTypeId=28";
				else if(contenttypeid == 39) url += "&contentTypeId=39";
				else if(contenttypeid == 32) url += "&contentTypeId=32";
				else if(contenttypeid == 25) url += "&contentTypeId=25";
			}
			jparser = new JsonParserModule(url, page, "TourAreaBasicDto", lang);
			list.add(jparser.allParse());
			jparser = new JsonParserModule(url, lang);
			list.add(jparser.pageCntParse());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Object> getGpsAreaList(String lat, String lng, int page, int lang, int contenttypeid) {
		List<Object> list = new ArrayList<Object>();
		String url = "locationBasedList?mapX=" + lng + "&mapY=" + lat + "&radius=2000&numOfRows=10&listYN=Y&arrange=E&MobileOS=ETC&MobileApp=AppTesting";
		if(contenttypeid != 0) {
			if(contenttypeid == 12) url += "&contentTypeId=12";
			else if(contenttypeid == 28) url += "&contentTypeId=28";
			else if(contenttypeid == 39) url += "&contentTypeId=39";
			else if(contenttypeid == 32) url += "&contentTypeId=32";
			else if(contenttypeid == 25) url += "&contentTypeId=25";
		}
		jparser = new JsonParserModule(url, page, "TourAreaBasicDto", lang);
		list.add(jparser.allParse());
		jparser = new JsonParserModule(url, lang);
		list.add(jparser.pageCntParse());
		return list;
	}
	
	public List<TourAreaInterface> getAreaList(int lang) {
		String url = "areaBasedList?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10&arrange=B&contentTypeId=25";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		return jparser.allParse();
	}

	public List<TourAreaInterface> getAreaList(int areacode, int sigungucode, int lang) {
		String url = "areaBasedList?MobileOS=ETC&MobileApp=AppTesting&numOfRows=20";
		if(areacode != 0) url += "&areaCode=" + areacode;
		if(sigungucode != 0) url += "&sigunguCode=" + sigungucode;

		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		return jparser.allParse();
	}

	public TourAreaInterface getAreaInfo(String contentid, int lang) {
		String url = "detailCommon?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		url += "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
		url += "&contentId=" + contentid;
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto", lang);
		return jparser.oneParse();
	}

	public String getContentTypeInfo(String contentid, int lang) {
		String url = "detailCommon?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		url += "&contentId=" + contentid;
		jparser = new JsonParserModule(url, lang);
		return jparser.contentTypeParse();
	}
	
	public TourAreaInterface getAreaDetailInfo(String contentid, String contenttypeid, String DtoClassName, int lang) {
		String url = "detailIntro?MobileOS=ETC&MobileApp=AppTesting&";
		url += "&contentId=" + contentid;
		url += "&contentTypeId=" + contenttypeid;
		jparser = new JsonParserModule(url, 1, DtoClassName, lang);
		return jparser.oneParse();
	}

	// 추천코스, 숙박리스트 - Sub Detail
	public List<TourAreaInterface> getSubDetailList(String contentid,  String contenttypeid, String DtoClassName, int lang) {
		String url = "detailInfo?MobileOS=ETC&MobileApp=AppTesting&numOfRows=20&introYN=Y";
		url += "&contentId=" + contentid;
		url += "&contentTypeId=" + contenttypeid;
		jparser = new JsonParserModule(url, 1, DtoClassName, lang);
		return jparser.allParse();
	}
	
}

