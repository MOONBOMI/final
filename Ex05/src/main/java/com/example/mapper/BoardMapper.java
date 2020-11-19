package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> list(Criteria cri);
	public BoardVO read(int bno);
	public int totalCount(Criteria cri);
}
