package com.lxl.pbpserver.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.lxl.pbpserver.base.BaseResponse;
import com.lxl.pbpserver.common.StatusCode;
import com.lxl.pbpserver.config.security.JwtAuthenticationToken;
import com.lxl.pbpserver.service.JwtUserDetailsService;
import com.lxl.pbpserver.utils.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.www.NonceExpiredException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;
import java.util.HashMap;

@RestController
public class AuthenticateController {

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    /**
     * 根据refreshToken刷新token
     *
     * @param refreshToken
     * @return
     */
    @PostMapping("/updateToken")
    public String updateTokenByRefreshToken(String refreshToken) {
        HashMap<String, String> tokenMap = new HashMap<>();       // 存放生成的token

        String username = TokenUtil.tokenAuthenticate(refreshToken, jwtUserDetailsService);

        if (!StringUtils.isEmpty(username)) {
            tokenMap.put("token", TokenUtil.generateToken(TokenUtil.TOKEN_GENERATE, username));
            tokenMap.put("refreshToken", TokenUtil.generateToken(TokenUtil.REFRESH_TOKEN_GENERATE, username));
            return JSON.toJSONString(new BaseResponse(StatusCode.SUCCESS, "success", tokenMap));
        }
        return JSON.toJSONString(new BaseResponse(StatusCode.FAIL, "校验失败！"));
    }
}
