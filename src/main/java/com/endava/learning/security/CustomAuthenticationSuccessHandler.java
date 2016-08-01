package com.endava.learning.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.endava.learning.model.User;


public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    private final RequestCache requestCache = new HttpSessionRequestCache();
    
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        User loggedUser = (User) authentication.getPrincipal();
        
        request.getSession().setAttribute("user", loggedUser);
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        if(savedRequest != null) {
        	redirectStrategy.sendRedirect(request, response, savedRequest.getRedirectUrl());
        } else {
        	redirectStrategy.sendRedirect(request, response, "/");
        }
    }
}
