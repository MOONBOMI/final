package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.DateVO;

public interface StudentMapper {
	public List<HashMap<String, Object>> list(Criteria cri);
	
}
