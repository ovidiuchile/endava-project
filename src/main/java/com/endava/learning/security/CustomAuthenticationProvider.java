package com.endava.learning.security;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import com.endava.learning.model.User;
import com.endava.learning.service.UserService;

@SuppressWarnings("serial")
public class CustomAuthenticationProvider implements AuthenticationProvider,Serializable {

	@Autowired
	private UserService userService;

	@Override
	public Authentication authenticate(Authentication authentication) {
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		
		User authenticatedUser;
		if ((authenticatedUser = userService.loginUser(username, password)) != null) {
			Authentication confirmedAuthentication;
			List<GrantedAuthority> roles = new ArrayList<>();
			roles.add(new GrantedAuthority() {
				@Override
				public String getAuthority() {
					return authenticatedUser.getUser_type();
				}
			});
			confirmedAuthentication = new UsernamePasswordAuthenticationToken(authenticatedUser, password,
					roles);
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
