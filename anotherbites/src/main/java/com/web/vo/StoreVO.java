package com.web.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreVO {
	
	private String storeCode;
	private String storeName; 
	private String storeCategory; 
	private Date storeInsertdate; 
	private String storeAddr; 
	private String storeTel; 
	private String storeOne; 
	private String spCode; 
	private String spUrl;  
	private String rcCode; 
	private String rcCategory; 
}
