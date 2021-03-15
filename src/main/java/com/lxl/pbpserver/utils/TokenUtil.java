package com.lxl.pbpserver.utils;
/*
 * @author  Koaln
 * @date  2021/3/14 21:29
 */

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.lxl.pbpserver.service.JwtUserDetailsService;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.authentication.www.NonceExpiredException;

import java.util.Calendar;
import java.util.Date;

public class TokenUtil {

    public static final int TOKEN_GENERATE = 0;
    public static final int REFRESH_TOKEN_GENERATE = 1;

    private static final int TOKEN_EFFECT_SECONDS =1000 * 60 * 60 * 2;
    private static final int REFRESH_TOKEN_EFFECT_SECONDS =1000 * 60 * 60 * 24 * 14;

    private static final Date TOKEN_EXPIRES_TIME = new Date(System.currentTimeMillis() + TOKEN_EFFECT_SECONDS);      // token过期时间 2小时
    private static final Date REFRESH_TOKEN_EXPIRES_TIME = new Date(System.currentTimeMillis() + REFRESH_TOKEN_EFFECT_SECONDS);      // refreshToken过期时间 14天

    /**
     * 生成token
     * @param option
     * @param username
     * @return
     */
    public static String generateToken(int option, String username) {
        Date expiresTime = null;      //过期时间
        switch (option) {
            case 1:
                expiresTime=REFRESH_TOKEN_EXPIRES_TIME;
                break;
            default:
                expiresTime=TOKEN_EXPIRES_TIME;
                break;
        }

        //String salt = BCrypt.gensalt();
        String salt = "123456ef";
        Algorithm algorithm = Algorithm.HMAC256(salt);

        /**
         * @todo 将salt保存到数据库或者缓存中
         * redisTemplate.opsForValue().set("token:"+username, salt, 3600, TimeUnit.SECONDS);
         */

        return JWT.create()
                .withSubject(username)
                .withExpiresAt(expiresTime)
                .withIssuedAt(new Date())
                .sign(algorithm);
    }

    /**
     * token校验
     * @param token
     * @param jwtUserDetailsService
     */
    public static String tokenAuthenticate(String token, JwtUserDetailsService jwtUserDetailsService){
        DecodedJWT jwt = JWT.decode(token);          // 对token进行解密
        if (jwt.getExpiresAt().before(Calendar.getInstance().getTime()))         // 判断token是否过期
            throw new NonceExpiredException("Token expires");
        String username = jwt.getSubject();
        UserDetails user = jwtUserDetailsService.getUserLoginInfo(username);       // 校验该token的用户信息是否存在
        if (user == null || user.getPassword() == null)
            throw new NonceExpiredException("Token expires");
        String encryptSalt = user.getPassword();        // 获取salt值
        try {
            Algorithm algorithm = Algorithm.HMAC256(encryptSalt);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withSubject(username)
                    .build();
            verifier.verify(jwt.getToken());           // 进行校验
        } catch (Exception e) {
            throw new BadCredentialsException("JWT token verify fail", e);
        }
        return username;
    }
}
