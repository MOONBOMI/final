package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.DepositAccountVO;

public interface DepositAccountMapper {

	public void depositaccountinsert(DepositAccountVO vo);
	public List<HashMap<String,Object>> depositaccountlist();
	
}
