package org.zerock.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.QuestionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QuestionMapperTests {

	@Setter(onMethod_ = @Autowired)
	private QuestionMapper mapper;
	
	//@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			QuestionVO vo = new QuestionVO();
			
			vo.setQuestion("질문 input 테스트 " + i);
			
			mapper.insert(vo);
		});
	}	
}
