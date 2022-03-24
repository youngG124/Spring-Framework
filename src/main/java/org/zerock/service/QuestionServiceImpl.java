package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.QuestionVO;
import org.zerock.mapper.QuestionMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QuestionServiceImpl implements QuestionService {
	
	@Setter(onMethod_ = @Autowired)
	private QuestionMapper mapper;
	
	@Override
	public int register(QuestionVO vo) {
		
		log.info("register.........." + vo);
		
		return mapper.insert(vo);
	}

}
