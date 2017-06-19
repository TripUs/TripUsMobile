package com.hb.tripus.service;

import java.util.List;

import com.hb.tripus.model.dto.TourAreaInterface;
import com.hb.tripus.util.XmlParserModule;

public class MainService implements ServiceCommand {

	public List<TourAreaInterface> getAreaList() {
		String url = "areaBasedList?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		XmlParserModule parser = new XmlParserModule(url, "&pageNo=1", "TourAreaBasicDto");
				
		return parser.allParse();
	}
	
	public TourAreaInterface getAreaInfo(String contentid) {
		String url = "detailCommon?MobileOS=ETC&MobileApp=AppTesting&numOfRows=10";
		url += "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
		url += "&contentId=" + contentid;
		XmlParserModule parser = new XmlParserModule(url, "&pageNo=1", "TourAreaBasicDto");
		
		return parser.oneParse();
	}
	
}
