package com.example.mapper_oracle;

import java.util.List;

import com.example.domain.LcategoryVO;

public interface LcategoryMapper {

	public void insert(LcategoryVO vo);
	public List<LcategoryVO> list();
	public LcategoryVO read(String lcategorycode);
	public void update(LcategoryVO vo);
	public void delete(String lcategorycode);
}
