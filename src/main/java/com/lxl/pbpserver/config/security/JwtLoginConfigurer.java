package com.lxl.pbpserver.config.security;

import com.lxl.pbpserver.filter.JwtAuthenticationFilter;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.HttpSecurityBuilder;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.session.NullAuthenticatedSessionStrategy;


public class JwtLoginConfigurer<T extends JwtLoginConfigurer<T, B>, B extends HttpSecurityBuilder<B>> extends AbstractHttpConfigurer<T, B> {
    
	private JwtAuthenticationFilter authFilter;
	
	public JwtLoginConfigurer() {
		this.authFilter = new JwtAuthenticationFilter();
	}
	
	@Override
	public void configure(B http) throws Exception {
		//设置Filter使用的AuthenticationManager,这里取公共的即可
		authFilter.setAuthenticationManager(http.getSharedObject(AuthenticationManager.class));
		//设置失败的Handler
		authFilter.setAuthenticationFailureHandler(new HttpStatusLoginFailureHandler());

		//对手动new出来的authFilter对象进行后置处理，将对象注入到容器中
		JwtAuthenticationFilter filter = postProcess(authFilter);
		//指定Filter的位置
		http.addFilterBefore(filter, LogoutFilter.class);
	}
	
	public JwtLoginConfigurer<T, B> permissiveRequestUrls(String ... urls){
		authFilter.setPermissiveUrl(urls);
		return this;
	}

	//设置成功的Handler，这个handler定义成Bean，所以从外面set进来
	public JwtLoginConfigurer<T, B> tokenValidSuccessHandler(AuthenticationSuccessHandler successHandler){
		authFilter.setAuthenticationSuccessHandler(successHandler);
		return this;
	}
	
}
