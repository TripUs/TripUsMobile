package com.hb.tripus.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.util.JsonParserModule;
import com.hb.tripus.util.XmlParserModule;

public class MainService implements ServiceCommand {

	private JsonParserModule jparser;

	public int pageParser(String url) {
		jparser = new JsonParserModule(url);
		return jparser.pageCntParse();
	}
	
	public List<TourAreaInterface> getAreaList() {
		String url = "areaBasedList?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto");
		return jparser.allParse();
	}

	public List<TourAreaInterface> getAreaList(int areacode, int sigungucode) {
		String url = "areaBasedList?MobileOS=ETC&MobileApp=AppTesting";
		if(areacode != 0) url += "&areaCode=" + areacode;
		if(sigungucode != 0) url += "&sigunguCode=" + sigungucode;

		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto");
		return jparser.allParse();
	}

	public TourAreaInterface getAreaInfo(String contentid) {
		String url = "detailCommon?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		url += "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
		url += "&contentId=" + contentid;
		jparser = new JsonParserModule(url, 1, "TourAreaBasicDto");
		return jparser.oneParse();
	}

	public String getContentTypeInfo(String contentid) {
		String url = "detailCommon?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		url += "&contentId=" + contentid;
		jparser = new JsonParserModule(url);
		return jparser.contentTypeParse();
	}
	
	public List<TourAreaInterface> searchKeyword(String keyword, int page) {
		try {
			String url = "searchKeyword?keyword=" + URLEncoder.encode(keyword, "UTF-8")
					+ "&MobileOS=ETC&MobileApp=AppTesting&numOfRows=20";
			jparser = new JsonParserModule(url, page, "TourAreaBasicDto");
			return jparser.allParse();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public TourAreaInterface getAreaDetailInfo(String contentid, String contenttypeid, String DtoClassName) {
		String url = "detailIntro?MobileOS=ETC&MobileApp=AppTesting&";
		url += "&contentId=" + contentid;
		url += "&contentTypeId=" + contenttypeid;
		jparser = new JsonParserModule(url, 1, DtoClassName);
		return jparser.oneParse();
	}

	// 추천코스, 숙박리스트 - Sub Detail
	public List<TourAreaInterface> getSubDetailList(String contentid,  String contenttypeid, String DtoClassName) {
		String url = "detailInfo?MobileOS=ETC&MobileApp=AppTesting&numOfRows=20&introYN=Y";
		url += "&contentId=" + contentid;
		url += "&contentTypeId=" + contenttypeid;
		jparser = new JsonParserModule(url, 1, DtoClassName);
		return jparser.allParse();
	}
	
}
