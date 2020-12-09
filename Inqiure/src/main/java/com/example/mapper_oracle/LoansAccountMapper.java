package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import com.example.domain.LoansAccountVO;

public interface LoansAccountMapper {

	public void loansaccountinsert(LoansAccountVO lvo);
	public List<HashMap<String, Object>> loansaccountlist();
}
