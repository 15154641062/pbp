package com.lxl.pbpserver.handler;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lxl.pbpserver.config.security.JwtAuthenticationToken;
import com.lxl.pbpserver.service.JwtUserDetailsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.auth0.jwt.interfaces.DecodedJWT;

public class JwtRefreshSuccessHandler implements AuthenticationSuccessHandler{
	
	private static final int tokenRefreshInterval = 300;  //刷新间隔5分钟
	
	private JwtUserDetailsService jwtUserDetailsService;
	
	public JwtRefreshSuccessHandler(JwtUserDetailsService jwtUserService) {
		this.jwtUserDetailsService = jwtUserDetailsService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		/*DecodedJWT jwt = ((JwtAuthenticationToken)authentication).getToken();
		boolean shouldRefresh = shouldTokenRefresh(jwt.getIssuedAt());
		if(shouldRefresh) {
            String newToken = jwtUserDetailsService.saveUserLoginInfo((UserDetails)authentication.getPrincipal());
            response.setHeader("Authorization", newToken);
        }	*/
	}
	
	protected boolean shouldTokenRefresh(Date issueAt){
        LocalDateTime issueTime = LocalDateTime.ofInstant(issueAt.toInstant(), ZoneId.systemDefault());
        return LocalDateTime.now().minusSeconds(tokenRefreshInterval).isAfter(issueTime);
    }

}
