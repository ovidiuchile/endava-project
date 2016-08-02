package com.endava.learning.security;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import com.endava.learning.model.User;
import com.endava.learning.service.UserService;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserService userService;

	@Override
	public Authentication authenticate(Authentication authentication) {
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		
		User authenticatedUser;
		if ((authenticatedUser = userService.loginUser(username, password)) != null) {
			Authentication confirmedAuthentication;
			confirmedAuthentication = new UsernamePasswordAuthenticationToken(authenticatedUser, password,
					new ArrayList<GrantedAuthority>());
			return confirmedAuthentication;
		} else {
			throw new AuthenticationCredentialsNotFoundException("wrong credentials.");
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
