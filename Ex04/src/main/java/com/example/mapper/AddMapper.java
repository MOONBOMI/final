package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.AddVO;
import com.example.domain.Criteria;

public interface AddMapper {
	public List<AddVO> list(Criteria cri);
	public int totalCount(Criteria cri);
	
}
