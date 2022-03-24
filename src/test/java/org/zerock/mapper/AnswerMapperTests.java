package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.AnswerVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AnswerMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AnswerMapper mapper;
	
	//@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test
	public void testRead() {
		
		Long targetAno = 4L;
		
		AnswerVO vo = mapper.read(targetAno);
		
		log.info(vo);
	}
}
