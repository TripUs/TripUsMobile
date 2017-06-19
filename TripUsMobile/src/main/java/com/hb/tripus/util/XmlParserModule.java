package com.hb.tripus.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.hb.tripus.model.dto.TourAreaInterface;

public class XmlParserModule {
	private String[] value;
	private String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	private String serviceKey = "&ServiceKey=aBAaB1yK%2F7pFbW7tF9gKOjONRTvNPTJ8ggpIDYUyEltqfm2lkiB0uy1x1SrKGEnPiXfOXBRsBwn%2FBzuBsW1meA%3D%3D";
	private String className;
	
	public XmlParserModule(String url, String page, String className) {
		this.url += (url + serviceKey + page);
		this.className = className;
	}
	
	public int pageCntParse() {
		int pageCnt = 0;
		try {
			Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(this.url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("body");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;

					int numOfRows = Integer.parseInt(getTagValue("numOfRows", eElement).trim());
					int totalCount = Integer.parseInt(getTagValue("totalCount", eElement).trim());
					System.out.println("numOfRows : " + numOfRows + ", totalCount : " + totalCount);
					
					pageCnt = (totalCount / numOfRows);
					if((totalCount % numOfRows) != 0) pageCnt++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCnt;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<TourAreaInterface> allParse() {
		ArrayList<TourAreaInterface> parseList = null;
		String xml = null;
		try {
			URL url = new URL(this.url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			if (conn != null) {
				conn.setConnectTimeout(10000);
				conn.setUseCaches(false);
				StringBuilder sBuffer = new StringBuilder();

				if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
					InputStreamReader isr = new InputStreamReader(conn.getInputStream());
					BufferedReader br = new BufferedReader(isr);
					while (true) {
						String line = br.readLine();
						if (line == null) break;
						sBuffer.append(line.getBytes("UTF-8"));
					}
					br.close();
					conn.disconnect();
					xml = sBuffer.toString();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		try {
			InputStream is = new ByteArrayInputStream(xml.getBytes("UTF-8"));
			Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(this.url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			parseList = new ArrayList<TourAreaInterface>();

			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					
					Element eElement = (Element) nNode;
					Class<TourAreaInterface> cls = (Class<TourAreaInterface>) Class.forName("com.hb.tripus.model.dto." + this.className);
					TourAreaInterface dto = cls.newInstance();
					dto.getTags();
					this.value = new String[dto.getTags().length];
					
					for (int j = 0; j < dto.getTags().length; j++) {
//						System.out.println(dto.getTags() + " : " + getTagValue(dto.getTags()[j], eElement));
						value[j] = getTagValue(dto.getTags()[j], eElement);
					}
					dto.setTagValue(value);
					parseList.add(dto);
				}
				System.out.println("\n\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return parseList;
	}
	
	@SuppressWarnings("unchecked")
	public TourAreaInterface oneParse() {
		TourAreaInterface dto = null;
		String xml = null;
		try {
			URL url = new URL(this.url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			if (conn != null) {
				conn.setConnectTimeout(10000);
				conn.setUseCaches(false);
				StringBuilder sBuffer = new StringBuilder();

				if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
					InputStreamReader isr = new InputStreamReader(conn.getInputStream());
					BufferedReader br = new BufferedReader(isr);
					while (true) {
						String line = br.readLine();
						if (line == null) break;
						sBuffer.append(line.getBytes("UTF-8"));
					}
					br.close();
					conn.disconnect();
					xml = sBuffer.toString();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		try {
			InputStream is = new ByteArrayInputStream(xml.getBytes("UTF-8"));
			Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(this.url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					
					Element eElement = (Element) nNode;
					Class<TourAreaInterface> cls = (Class<TourAreaInterface>) Class.forName("com.hb.tripus.model.dto." + this.className);
					dto = cls.newInstance();
					dto.getTags();
					this.value = new String[dto.getTags().length];
					
					for (int j = 0; j < dto.getTags().length; j++) {
//						System.out.println(dto.getTags() + " : " + getTagValue(dto.getTags()[j], eElement));
						value[j] = getTagValue(dto.getTags()[j], eElement);
					}
					dto.setTagValue(value);
				}
				System.out.println("\n\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public String getTagValue(String tagName, Element eElement) {
		Node nValue = null;
		try {
			NodeList nlList = eElement.getElementsByTagName(tagName).item(0).getChildNodes();
			nValue = (Node) nlList.item(0);
		} catch (NullPointerException e) {
			return "";
		}
		return nValue.getNodeValue();
	}

}
