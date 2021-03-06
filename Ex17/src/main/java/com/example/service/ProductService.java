package com.example.service;

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
	public void insert(ProductVO vo) {
		mapper.insert(vo);
		for(String image: vo.getImages()) {
			mapper.insertImage(image, vo.getPcode());
		}
	}
}
