package com.smhrd.domain;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Visit {
	
	private Date v_date;
		
	public Visit(Date v_date) {
		super();
		this.v_date = v_date;
	}
	
}
