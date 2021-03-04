package com.lxl.pbpserver.test;

import com.lxl.pbpserver.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;


public class MapperTest {
    @Autowired
    private RoleMapper roleMapper;

//    @Test
//    public void test(){
//        List<RoleDO> roleList = roleMapper.selectList(null);
//        roleList.forEach(System.out::println);
//    }
}
