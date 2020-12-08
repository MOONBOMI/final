package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper_oracle.GraphMapper;

@Controller
public class GraphController {

	@Autowired
	GraphMapper mapper;
	
	@RequestMapping("cavg.json")
	@ResponseBody
	public List<ArrayList<Object>> cavgJson(){
		List<HashMap<String, Object>> array=mapper.cavg();
		List<ArrayList<Object>> listArr=new ArrayList<>();
		ArrayList<Object> arr=new ArrayList<>();
		arr.add("과목명");
		arr.add("점수");
		listArr.add(arr);
		
		for(HashMap<String, Object> map:array) {
			arr=new ArrayList<>();
			arr.add(map.get("LNAME"));
			arr.add(map.get("AVG"));
			listArr.add(arr);
		}
		return listArr;
	}
	
	@RequestMapping("graph")
	public void graph(){
		
	}
	
	@RequestMapping("savg.json")
	@ResponseBody
	public List<ArrayList<Object>> savgJson(){
		List<HashMap<String, Object>> array=mapper.savg();
		List<ArrayList<Object>> listArr=new ArrayList<>();
		ArrayList<Object> arr=new ArrayList<>();
		arr.add("학생명");
		arr.add("점수");
		listArr.add(arr);
		
		for(HashMap<String, Object> map:array) {
			arr=new ArrayList<>();
			arr.add(map.get("SNAME"));
			arr.add(map.get("AVG"));
			listArr.add(arr);
		}
		return listArr;
	}
	
	@RequestMapping("dcount.json")
	@ResponseBody
	public List<ArrayList<Object>> dcountJson(){
		List<HashMap<String, Object>> array=mapper.dcount();
		List<ArrayList<Object>> listArr=new ArrayList<>();
		ArrayList<Object> arr=new ArrayList<>();
		arr.add("학과");
		arr.add("학생수");
		listArr.add(arr);
		
		for(HashMap<String, Object> map:array) {
			arr=new ArrayList<>();
			arr.add(map.get("DEPT"));
			arr.add(map.get("CNT"));
			listArr.add(arr);
		}
		return listArr;
	}

}
