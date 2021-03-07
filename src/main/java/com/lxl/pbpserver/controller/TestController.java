package com.lxl.pbpserver.controller;
/*
 * @author  Koaln
 * @date  2021/3/7 13:19
 */

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lxl.pbpserver.mapper.UserInfoMapper;
import com.lxl.pbpserver.mapper.UserRoleMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import com.lxl.pbpserver.pojo.UserInfoDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/test")
public class TestController {
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;

    @RequestMapping("/mappertest")
    public String mapperTest(String username){
        // 创建查询条件
        QueryWrapper wrapper = new QueryWrapper<>().eq("login_name", username);
        // 若查不到对应用户名的用户则直接抛出异常
        if (userInfoMapper.selectList(wrapper).isEmpty()) {
            throw new UsernameNotFoundException("用户名不存在！");
        }
        // 从数据库取出用户信息
        UserInfoDO userInfo =userInfoMapper.selectOne(wrapper);
        // 从数据库取出该用户对应的角色信息
        List<RoleDO> roleList = userRoleMapper.getRolesByUsername(username);
        String[] roles= (String[]) roleList.toArray();
        return "test!";
    }
}
