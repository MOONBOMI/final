package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddVO;
import com.example.mapper.AddMapper;
import com.example.mapper.MysqlMapper;

@RunWith(SpringJUnit4ClassRunner.class) //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class AddlTest {
	@Autowired
	private AddMapper mapper;
	
	@Test
	public void list() { mapper.list(); }
	
	@Test
	public void read() {
		mapper.read(6);
	}
	
	@Test
	public void insert() {
		AddVO vo=new AddVO();
		vo.setName("�̼���");
		vo.setTel("010-1111-1111");
		vo.setAddr("���� �߱�");
		mapper.insert(vo);
	}
	
	@Test
	public void update() {
		AddVO vo=new AddVO();
		vo.setName("�̼��� ����");
		vo.setTel("010-1111-2222");
		vo.setAddr("���� ��걸");
		vo.setAno(3);
		mapper.update(vo);
	}
	
	@Test
	public void delete() {
		mapper.delete(6);
	}
	
}
