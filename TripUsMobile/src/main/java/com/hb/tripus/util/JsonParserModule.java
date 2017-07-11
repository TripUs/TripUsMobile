package com.hb.tripus.util;

import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.hb.tripus.model.dto.TourAreaInterface;

public class JsonParserModule {

	private String[] value;
	private String url;
	private String serviceKey;
	private String className;

	public JsonParserModule(String url, int lang) {
		if(lang == 0){
			this.url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			serviceKey = "&_type=json&ServiceKey=aBAaB1yK%2F7pFbW7tF9gKOjONRTvNPTJ8ggpIDYUyEltqfm2lkiB0uy1x1SrKGEnPiXfOXBRsBwn%2FBzuBsW1meA%3D%3D";
		} else {
			this.url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/";
			serviceKey = "&_type=json&ServiceKey=EcMXJ8m%2BSXdOi98cTdU1pI8zFtqv%2B5e79u2WOJ7kZf8IF8c9r%2FgUlgipI%2B69CBmz5uIruHVlArrpssnOaz9sKQ%3D%3D";
		}
		this.url += (url + serviceKey);
		System.out.println("json url : " + this.url);
	}

	public JsonParserModule(String url, int page, String className, int lang) {
		if(lang == 0){
			this.url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			serviceKey = "&_type=json&ServiceKey=aBAaB1yK%2F7pFbW7tF9gKOjONRTvNPTJ8ggpIDYUyEltqfm2lkiB0uy1x1SrKGEnPiXfOXBRsBwn%2FBzuBsW1meA%3D%3D";
		} else {
			this.url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/";
			serviceKey = "&_type=json&ServiceKey=EcMXJ8m%2BSXdOi98cTdU1pI8zFtqv%2B5e79u2WOJ7kZf8IF8c9r%2FgUlgipI%2B69CBmz5uIruHVlArrpssnOaz9sKQ%3D%3D";
		}
		String pageUrl = ("&pageNo=" + page);
		this.url += (url + serviceKey + pageUrl);
		this.className = className;
		System.out.println("json url : " + this.url);
	}

	public int pageCntParse() {
		int pageCnt = 0;
		try {
			URL url = new URL(this.url);
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);
			JSONObject responseObject = (JSONObject) jsonObject.get("response");
			JSONObject bodyObject = (JSONObject) responseObject.get("body");
			
//			System.out.println("jsonObject : " + jsonObject.toJSONString());
//			System.out.println("responseObject : " + responseObject.toJSONString());
//			System.out.println("bodyObject : " + bodyObject.toJSONString());
			
			int numOfRows = Integer.parseInt(bodyObject.get("numOfRows").toString());
			int totalCount = Integer.parseInt(bodyObject.get("totalCount").toString());
//			System.out.println("numOfRows : " + numOfRows + ", totalCount : " + totalCount);

			pageCnt = (totalCount / numOfRows);
			if ((totalCount % numOfRows) != 0) pageCnt++;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCnt;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<TourAreaInterface> allParse() {
		ArrayList<TourAreaInterface> parseList = null;
		try {
			URL url = new URL(this.url);
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);
			JSONObject responseObject = (JSONObject) jsonObject.get("response");
			JSONObject bodyObject = (JSONObject) responseObject.get("body");
			
			JSONObject itemsObject = (JSONObject) bodyObject.get("items");
			JSONArray itemArray = (JSONArray) itemsObject.get("item");
	
			parseList = new ArrayList<TourAreaInterface>();
			
			for(int i = 0 ; i < itemArray.size(); i++) {
				
				Class<TourAreaInterface> cls = (Class<TourAreaInterface>) Class.forName("com.hb.tripus.model.dto." + this.className);
				TourAreaInterface dto = cls.newInstance();
				dto.getTags();
				this.value = new String[dto.getTags().length];
				
				JSONObject data = (JSONObject) itemArray.get(i);        
				
				for (int j = 0; j < dto.getTags().length; j++) {
					if(data.get(dto.getTags()[j]) != null)
						value[j] = data.get(dto.getTags()[j]).toString();
					else {
						if(dto.getTags()[j].equals("firstimage")) value[j] = "http://localhost:8080/tripus/resources/imgs/no_img.jpg";
						else if(dto.getTags()[j].equals("firstimage2")) value[j] = "http://localhost:8080/tripus/resources/imgs/no_img.jpg";
						else value[j] = "데이터 없음";
					}
				}
				dto.setTagValue(value);
				parseList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return parseList;
	}
	
	@SuppressWarnings("unchecked")
	public TourAreaInterface oneParse() {
		TourAreaInterface dto = null;
		try {
			URL url = new URL(this.url);
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);
			JSONObject responseObject = (JSONObject) jsonObject.get("response");
			JSONObject bodyObject = (JSONObject) responseObject.get("body");
			
			JSONObject itemsObject = (JSONObject) bodyObject.get("items");
			JSONObject itemObject = (JSONObject) itemsObject.get("item");
			
			Class<TourAreaInterface> cls = (Class<TourAreaInterface>) Class.forName("com.hb.tripus.model.dto." + this.className);
			dto = cls.newInstance();
			dto.getTags();
			this.value = new String[dto.getTags().length];
				
			for (int j = 0; j < dto.getTags().length; j++) {
				if(itemObject.get(dto.getTags()[j]) != null) {
//					System.out.println("data : " +itemObject.get(dto.getTags()[j]).toString());
					value[j] = itemObject.get(dto.getTags()[j]).toString();
				}
				else value[j] = "데이터 없음";
			}
			dto.setTagValue(value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public String contentTypeParse() {
		String contetntypeid = null;
		try {
			URL url = new URL(this.url);
			InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);
			JSONObject responseObject = (JSONObject) jsonObject.get("response");
			JSONObject bodyObject = (JSONObject) responseObject.get("body");
			
			JSONObject itemsObject = (JSONObject) bodyObject.get("items");
			JSONObject itemObject = (JSONObject) itemsObject.get("item");
			
			contetntypeid = itemObject.get("contenttypeid").toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return contetntypeid;
	}
	
}
