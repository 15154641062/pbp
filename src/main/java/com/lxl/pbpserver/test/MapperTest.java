package com.lxl.pbpserver.test;

import com.lxl.pbpserver.mapper.RoleMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MapperTest {
    @Autowired
    private RoleMapper roleMapper;

    @Test
    public void test(){
        List<RoleDO> roleList = roleMapper.selectList(null);
        roleList.forEach(System.out::println);
    }
}
