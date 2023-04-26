package com.web.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	
	private String revCode; 
	private String revContent;
	private Date revInsertDate;
	private int revService;
	private int revTaste; 
	private int revClean; 
	private int revRevisit; 
	private int revOverall; 
	private String rpCode; 
	private String rpUrl; 

}
