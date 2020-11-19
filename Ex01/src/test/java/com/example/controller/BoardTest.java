package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.MysqlMapper;

@RunWith(SpringJUnit4ClassRunner.class) //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class BoardTest {
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void list() { mapper.list(); }
	
	@Test
	public void insert() {
		BoardVO vo=new BoardVO();
		vo.setTitle("게시글 추가");
		vo.setContent("게시물 내용 추가");
		vo.setWriter("user03");
		mapper.insert(vo);
	}
	
	@Test
	public void read() {
		mapper.read(9);
	}
	
	@Test
	public void update() {
		BoardVO vo=new BoardVO();
		vo.setTitle("게시글 변경");
		vo.setContent("게시물 내용 변경");
		vo.setWriter("user03");
		vo.setBno(8);
		mapper.update(vo);
	}
	
	@Test
	public void delete() {
		mapper.delete(9);
	}
}
