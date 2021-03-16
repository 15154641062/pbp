package com.lxl.pbpserver.handler;

import com.alibaba.fastjson.JSON;
import com.lxl.pbpserver.base.BaseResponse;
import com.lxl.pbpserver.common.StatusCode;
import com.lxl.pbpserver.service.JwtUserDetailsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JsonLoginSuccessHandler implements AuthenticationSuccessHandler {
    private JwtUserDetailsService jwtUserDetailsService;

    public JsonLoginSuccessHandler(JwtUserDetailsService jwtUserService) {
        this.jwtUserDetailsService = jwtUserService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        // 生成token，并把token加密相关信息缓存，具体请看实现类
        String token = jwtUserDetailsService.saveUserLoginInfo((UserDetails) authentication.getPrincipal());
        response.setHeader("Authorization", token);
        response.setHeader("Refresh-Token", jwtUserDetailsService.getRefreshToken());
        response.getWriter().print(JSON.toJSONString(new BaseResponse(StatusCode.SUCCESS, null)));
    }
}
