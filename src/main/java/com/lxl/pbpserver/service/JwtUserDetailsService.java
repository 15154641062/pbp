package com.lxl.pbpserver.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lxl.pbpserver.mapper.UserInfoMapper;
import com.lxl.pbpserver.mapper.UserRoleMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import com.lxl.pbpserver.pojo.UserInfoDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.*;

@Component
public class JwtUserDetailsService implements UserDetailsService {

    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    public static JwtUserDetailsService jwtUserDetailsService;

    @PostConstruct
    public void init() {
        jwtUserDetailsService = this;
        jwtUserDetailsService.userRoleMapper = this.userRoleMapper;
        jwtUserDetailsService.userInfoMapper = this.userInfoMapper;
    }

    public JwtUserDetailsService() {
        this.passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();  //默认使用 bcrypt， strength=10
    }

    public UserDetails getUserLoginInfo(String username) {
        String salt = "123456ef";
        /**
         * @todo 从数据库或者缓存中取出jwt token生成时用的salt
         * salt = redisTemplate.opsForValue().get("token:"+username);
         */
        UserDetails user = loadUserByUsername(username);
        //将salt放到password字段返回
        return User.builder().username(user.getUsername()).password(salt).authorities(user.getAuthorities()).build();
    }

    public String saveUserLoginInfo(UserDetails user) {
        String salt = "123456ef"; //BCrypt.gensalt();  正式开发时可以调用该方法实时生成加密的salt
        /**
         * @todo 将salt保存到数据库或者缓存中
         * redisTemplate.opsForValue().set("token:"+username, salt, 3600, TimeUnit.SECONDS);
         */
        //BCrypt.gensalt();
        Algorithm algorithm = Algorithm.HMAC256(salt);
        Date date = new Date(System.currentTimeMillis() + 3600 * 1000);  //设置1小时后过期
        return JWT.create()
                .withSubject(user.getUsername())
                .withExpiresAt(date)
                .withIssuedAt(new Date())
                .sign(algorithm);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 创建查询条件
        QueryWrapper wrapper = new QueryWrapper<>().eq("login_name", username);
        // 若查不到对应用户名的用户则直接抛出异常
        if (jwtUserDetailsService.userInfoMapper.selectList(wrapper).isEmpty()) {
            throw new UsernameNotFoundException("用户名不存在！");
        }
        // 从数据库取出用户信息
        UserInfoDO userInfo =jwtUserDetailsService.userInfoMapper.selectOne(wrapper);
        // 从数据库取出该用户对应的角色信息
        List<RoleDO> roleList = jwtUserDetailsService.userRoleMapper.getRolesByUsername(username);
        String[] roles= new String[roleList.size()];
        for (int i=0;i<roleList.size();i++) {
            roles[i]=roleList.get(i).getSign();
        }
        // 将角色的所有信息保存在创建出的UserDetails对象中
        return User.builder().username(userInfo.getLoginName()).password(passwordEncoder.encode(userInfo.getLoginPwd())).roles(roles).build();
    }

    public void createUser(String username, String password) {
        String encryptPwd = passwordEncoder.encode(password);      //对密码进行加密
        /**
         * @todo 保存用户名和加密后密码到数据库
         */
    }

    public void deleteUserLoginInfo(String username) {
        /**
         * @todo 清除数据库或者缓存中登录salt
         */
    }
}
