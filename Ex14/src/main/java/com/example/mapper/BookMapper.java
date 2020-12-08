package com.example.mapper;

import java.util.List;

import com.example.domain.BookVO;
import com.example.domain.Criteria;

public interface BookMapper {

	public void insert(BookVO vo);
	public List<BookVO> list(Criteria cri);
	
}
