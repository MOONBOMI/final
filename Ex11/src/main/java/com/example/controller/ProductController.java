package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;
import com.example.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductMapper mapper;
	
	@Autowired
	ProductService service;
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping("insert")
	public void insert(){
		
	}
	
	@RequestMapping("read")
	public void read(int pcode, Model model){
		model.addAttribute("vo", mapper.read(pcode));
		model.addAttribute("images", mapper.getImage(pcode));
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(ProductVO vo){
		if(!vo.getImage().equals("")) {
			new File(path+"/"+vo.getImage()).delete();
		}
		List<String> oldImages= mapper.getImage(vo.getPcode());
		for(String image:oldImages){
			new File(path+"/attach/"+image).delete();
		}
		service.delete(vo.getPcode());
		return "redirect:list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updatePost(ProductVO vo, MultipartHttpServletRequest multi)throws Exception{
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()) {
			if(!vo.getImage().equals("")) {
				new File(path+"/"+vo.getImage()).delete();
			}
			UUID uid=UUID.randomUUID();
			String savedName=uid.toString()+"_"+file.getOriginalFilename();
			System.out.println(savedName);
			
			File target=new File(path, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
			vo.setImage(savedName);
		}
		List<MultipartFile> files=multi.getFiles("files");
		
			//기존이미지 있으면 삭제
			
			//새로운 이미지 업로드
			ArrayList<String> images=new ArrayList<>();
			for(MultipartFile image:files) {
				if(!image.isEmpty()){
					if(images.size()==0){
						List<String> oldimages=mapper.getImage(vo.getPcode());
						if(oldimages.size()>0){
							for(String oldimage:oldimages) {
								new File(path+"/attach/"+image).delete();
							}
						}
					}
					UUID uid=UUID.randomUUID();
					String savedName=uid.toString()+"_"+image.getOriginalFilename();
					System.out.println(savedName);
					
					File target=new File(path+"/attach", savedName);
					FileCopyUtils.copy(image.getBytes(), target);
					images.add(savedName);
				}
			}
			vo.setImages(images);
		
		service.update(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertPost(ProductVO vo, MultipartHttpServletRequest multi)throws Exception{
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			UUID uid=UUID.randomUUID();
			String savedName=uid.toString()+"_"+file.getOriginalFilename();
			System.out.println(savedName);
			
			File target=new File(path, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
			vo.setImage(savedName);
		}
		List<MultipartFile> files=multi.getFiles("files");
		if(files.size()>0) {
			File mkPath= new File(path + "/attach");
			if(!mkPath.exists()) mkPath.mkdir();
		}
		ArrayList<String> images=new ArrayList<String>();
		
		for(MultipartFile attfile:files) {
			if(!attfile.isEmpty()){
				UUID uid=UUID.randomUUID();
				String savedName=uid.toString()+"_"+attfile.getOriginalFilename();
				System.out.println(savedName);
				
				File target=new File(path+"/attach", savedName);
				FileCopyUtils.copy(attfile.getBytes(), target);
				images.add(savedName);
			}
		}
		vo.setImages(images);
		service.insert(vo);
		return "redirect:list";
	}
	
	//이미지출력
	@RequestMapping("display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName)throws Exception{
	    ResponseEntity<byte[]> result=null;
	    //display fileName이 있는 경우
	    if(!fileName.equals("")) {
	        File file=new File(path + File.separator + fileName);
	        HttpHeaders header=new HttpHeaders();
	        header.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	    }
	    return result;
	}
	
	@RequestMapping("list")
	public String list(Criteria cri, Model model, HttpServletRequest request, HttpSession session){
		//쿠키에 로그인 정보 있으면 로그인상태 유지
		Cookie cookie=WebUtils.getCookie(request, "uid");
		if(cookie !=null) {
			request.getSession().setAttribute("uid", cookie.getValue());
		}
		
		String dest=(String)session.getAttribute("dest");
		if(dest != null) {
			session.removeAttribute("dest");
			return "redirect:"+dest;
		}
		if(cri.getPerPageNum()==10){
			cri.setPerPageNum(4);
		}
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("list",mapper.list(cri));
		model.addAttribute("pm",pm);
		return "list";
	}
}
