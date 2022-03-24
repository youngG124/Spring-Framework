package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AnswerVO;
import org.zerock.mapper.AnswerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AnswerServiceImpl implements AnswerService{

	@Setter(onMethod_ = @Autowired)
	private AnswerMapper mapper;
	
	@Override
	public AnswerVO get(Long ano) {
		
		log.info("get......" + ano);
		
		return mapper.read(ano);
	}
}
