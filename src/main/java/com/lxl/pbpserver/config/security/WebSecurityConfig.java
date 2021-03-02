package com.lxl.pbpserver.config.security;

import java.util.Arrays;

import com.lxl.pbpserver.filter.OptionsRequestFilter;
import com.lxl.pbpserver.service.JwtUserDetailsService;

import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;
import org.springframework.security.web.header.Header;
import org.springframework.security.web.header.writers.StaticHeadersWriter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;



@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		        .antMatchers("/image/**").permitAll()	//静态资源访问无需认证
		        .antMatchers("/admin/**").hasAnyRole("ADMIN")		//admin开头的请求，需要admin角色权限
		        .antMatchers("/article/**").hasRole("USER")		//需登陆才能访问的url
		        .anyRequest().authenticated()		//默认其它的请求都需要认证
		        .and()
		    .csrf().disable()		 //CSRF禁用，因为不使用session
			.sessionManagement().disable()		//禁用session
		    .formLogin().disable()		//禁用form登录
		    .cors()		 //支持跨域
		    .and()
				//添加header设置，支持跨域和ajax请求
		    .headers().addHeaderWriter(new StaticHeadersWriter(Arrays.asList(
		    		new Header("Access-control-Allow-Origin","*"),
		    		new Header("Access-Control-Expose-Headers","Authorization"))))
		    .and()
				//拦截OPTIONS请求，直接返回header
		    .addFilterAfter(new OptionsRequestFilter(), CorsFilter.class)
				//添加登录filter
		    .apply(new JsonLoginConfigurer<>()).loginSuccessHandler(jsonLoginSuccessHandler())
		    .and()
				//添加token的filter
		    .apply(new JwtLoginConfigurer<>()).tokenValidSuccessHandler(jwtRefreshSuccessHandler()).permissiveRequestUrls("/logout")
		    .and()
				//使用默认的logoutFilter
		    .logout()
//		        .logoutUrl("/logout")   //默认就是"/logout"
		        .addLogoutHandler(tokenClearLogoutHandler())		 //logout时清除token
		        .logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler())		//logout成功后返回200
		    .and()
		    .sessionManagement().disable();
	}

	/**
	 * 配置provider
	 * @param auth
	 * @throws Exception
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(daoAuthenticationProvider()).authenticationProvider(jwtAuthenticationProvider());
	}
	
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
	    return super.authenticationManagerBean();
	}
	
	@Bean("jwtAuthenticationProvider")
	protected AuthenticationProvider jwtAuthenticationProvider() {
		return new JwtAuthenticationProvider(jwtUserService());
	}
	
	@Bean("daoAuthenticationProvider")
	protected AuthenticationProvider daoAuthenticationProvider() throws Exception{
		//这里会默认使用BCryptPasswordEncoder比对加密后的密码，注意要跟createUser时保持一致
		DaoAuthenticationProvider daoProvider = new DaoAuthenticationProvider();
		daoProvider.setUserDetailsService(userDetailsService());
		return daoProvider;
	}

	@Override
	protected UserDetailsService userDetailsService() {
		return new JwtUserDetailsService();
	}
	
	@Bean("jwtUserService")
	protected JwtUserDetailsService jwtUserService() {
		return new JwtUserDetailsService();
	}
	
	@Bean
	protected JsonLoginSuccessHandler jsonLoginSuccessHandler() {
		return new JsonLoginSuccessHandler(jwtUserService());
	}
	
	@Bean
	protected JwtRefreshSuccessHandler jwtRefreshSuccessHandler() {
		return new JwtRefreshSuccessHandler(jwtUserService());
	}
	
	@Bean
	protected TokenClearLogoutHandler tokenClearLogoutHandler() {
		return new TokenClearLogoutHandler(jwtUserService());
	}

	/**
	 * 前后端分离的项目需要支持跨域请求，需要在HttpSecurity配置中启用cors支持
	 * 在配置中开启http.cors()后
	 * spring security就会从CorsConfigurationSource中取跨域配置，所以我们需要定义如下这样一个Bean
	 * @return
	 */
	@Bean
	protected CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOrigins(Arrays.asList("*"));
		configuration.setAllowedMethods(Arrays.asList("GET","POST","HEAD", "OPTION"));
		configuration.setAllowedHeaders(Arrays.asList("*"));
		configuration.addExposedHeader("Authorization");
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
	}

}
