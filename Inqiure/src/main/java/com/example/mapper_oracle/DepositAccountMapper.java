package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.DepositAccountVO;
import com.example.domain.DepositVO;

public interface DepositAccountMapper {

	public void depositaccountinsert(DepositAccountVO vo);
	public List<HashMap<String,Object>> depositaccountlist();
	public void depositinsert(DepositVO vo);
	public void depositaccountupdate(@Param("depositaccountamount")String depositaccountamount, @Param("depositaccountcode")String depositaccountcode);
}
