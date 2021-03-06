package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;

@Service
public class ProductService {
	@Autowired
	ProductMapper mapper;
	
	@Transactional
	public void insert(ProductVO vo){
		mapper.insert(vo);
		ArrayList<String> files=vo.getImages();
		if(files.size()>0) {
			for(String image:files){
				mapper.insertImage(image);
			}
		}
	}
	
	
	@Transactional
	public void delete(int pcode) {
		mapper.deleteImage(pcode);
		mapper.delete(pcode);
	}
	
	@Transactional
	public void update(ProductVO vo){
		mapper.deleteImage(vo.getPcode());
		ArrayList<String> images=vo.getImages();
		if(images.size()>0) {
			mapper.deleteImage(vo.getPcode());
			for(String image:images) {
				mapper.updateImage(vo.getPcode(), image);
			}
		}
		mapper.update(vo);
	}
}
