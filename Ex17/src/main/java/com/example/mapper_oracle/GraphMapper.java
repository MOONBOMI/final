package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

public interface GraphMapper {

	public List<HashMap<String, Object>> cavg(); //���º� ��� ����
	public List<HashMap<String, Object>> savg();//�л��� ��� ����
	public List<HashMap<String, Object>> dcount();//�а��� �л���
	
}
