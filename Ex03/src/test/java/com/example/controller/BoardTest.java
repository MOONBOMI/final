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
	/*@Test
	public void list() {
		mapper.totalCount();
	}
	@Test
	public void list() { 
		mapper.list(); 
	}
	
	
	@Test
	public void read() {
		mapper.read(3);
	}
	
	@Test
	public void insert() {
		BoardVO vo=new BoardVO();
		vo.setTitle("새로운 글 추가22222");
		vo.setContent("새로운 내용 추가아22222");
		vo.setWriter("user01");
		mapper.insert(vo);
		mapper.list();
	}
	
	@Test
	public void update() {
		BoardVO vo=new BoardVO();
		vo.setTitle("새로운 글 추가 아니고 수정");
		vo.setContent("새로운 내용 추가아니고 수정");
		vo.setWriter("user01");
		vo.setBno(3);
		mapper.update(vo);
		mapper.read(3);
	}
	
	@Test
	public void delete() {
		mapper.delete(7);
	}
	*/
}
