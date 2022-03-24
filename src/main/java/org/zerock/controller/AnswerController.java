package org.zerock.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.AnswerVO;
import org.zerock.service.AnswerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/answers/")
@RestController
@Log4j
@AllArgsConstructor
public class AnswerController {

	private AnswerService service;
	
	@GetMapping(value = "/{ano}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<AnswerVO> get(@PathVariable("ano") Long ano) {
		
		log.info("get: " + ano);
		
		return new ResponseEntity<>(service.get(ano), HttpStatus.OK);
	}	
}