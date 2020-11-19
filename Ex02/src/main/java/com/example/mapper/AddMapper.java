package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.AddVO;

public interface AddMapper {
	public List<AddVO> list();
	public void insert(AddVO vo);
	public AddVO read(int ano);
	public void update(AddVO vo);
	public void delete(int ano);
}
