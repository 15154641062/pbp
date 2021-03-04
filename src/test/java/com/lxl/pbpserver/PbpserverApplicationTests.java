package com.lxl.pbpserver;

import com.lxl.pbpserver.mapper.RoleMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class PbpserverApplicationTests {
    @Autowired
    private RoleMapper roleMapper;

    @Test
    void contextLoads() {
        List<RoleDO> roleList = roleMapper.selectList(null);
        roleList.forEach(System.out::println);
    }

}
