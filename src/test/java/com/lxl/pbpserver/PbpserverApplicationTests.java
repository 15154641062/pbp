package com.lxl.pbpserver;

import com.lxl.pbpserver.mapper.RoleMapper;
import com.lxl.pbpserver.mapper.UserRoleMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import lombok.val;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class PbpserverApplicationTests {
    @Autowired
    private UserRoleMapper userRoleMapper;

    @Test
    void contextLoads() {
//        List<RoleDO> roles = userRoleMapper.getRolesByUsername("admin");
//        roles.forEach(System.out::println);
        List<RoleDO> roleList = userRoleMapper.getRolesByUsername("admin");
        ArrayList<String> roles=new ArrayList<>();
        roleList.forEach(role -> roles.add(role.getSign()));
        System.out.println(roles.toString());
    }

}
