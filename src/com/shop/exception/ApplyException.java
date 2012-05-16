package com.shop.exception;

import org.springframework.dao.DataAccessException;

public class ApplyException extends DataAccessException {
	private static final long serialVersionUID = 6596385261286232441L;

	public ApplyException(String message) {
		super(message);
	}

	public ApplyException(String message, Throwable cause) {
		super(message, cause);
	}

	

}
