package com.example.mapper;

import org.apache.ibatis.annotations.Param;

import com.example.domain.ProductVO;

public interface ProductMapper {

	public void insert(ProductVO vo);
	public void insertImage(@Param("image") String image, @Param("pcode") String pcode);
}
