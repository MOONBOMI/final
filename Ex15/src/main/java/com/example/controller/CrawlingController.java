package com.example.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CgvVO;
import com.example.mapper.CgvMapper;

@Controller
public class CrawlingController {
	
	@Autowired
	CgvMapper mapper;
	
	@RequestMapping("weather.json")
	@ResponseBody
	public ArrayList<HashMap<String,Object>> weatherjsoup(){
		ArrayList<HashMap<String,Object>> array=new ArrayList<>();
		try{
			Document doc=Jsoup.connect("https://www.daum.net/").get();
			Elements es=doc.select(".list_weather");
			for(Element e:es.select("li")){
					HashMap<String, Object> map=new HashMap<>();
					map.put("part", e.select(".txt_part").text());
					map.put("temper", e.select(".screen_out").text());
					map.put("wa", e.select(".ico_ws").text());
					array.add(map);
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return array;
	}
	@RequestMapping("cgv.json")
	@ResponseBody
	public ArrayList<HashMap<String,Object>> cgvjsoup(){
		ArrayList<HashMap<String,Object>> array=new ArrayList<>();
		try{
			Document doc=Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			Elements es=doc.select(".sect-movie-chart");
			for(Element e:es.select("li")){
				if(!e.select(".rank").text().equals("")){
					HashMap<String, Object> map=new HashMap<>();
					map.put("rank", e.select(".rank").text());
					map.put("img", e.select("img").attr("src"));
					map.put("title", e.select(".title").text());
					array.add(map);
				}
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return array;
	}
	
	@RequestMapping("cgv")
	public void cgv(){
		
	}
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping("insert")
	@ResponseBody
	public void insert(CgvVO vo, String fullImage){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date cdate=new Date();
		vo.setCdate(sdf.format(cdate));
		//이미지 다운로드
		try{
			URL url=new URL(fullImage);
			InputStream in=url.openStream();
			OutputStream out=new FileOutputStream(path+"/"+vo.getImage());
			FileCopyUtils.copy(in, out);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		mapper.insert(vo);
	}
}
