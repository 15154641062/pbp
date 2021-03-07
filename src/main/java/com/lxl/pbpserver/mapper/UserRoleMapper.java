package com.lxl.pbpserver.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import com.lxl.pbpserver.pojo.UserRoleDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRoleMapper extends BaseMapper<UserRoleDO> {
    List<RoleDO> getRolesByUsername(@Param("username") String username);
}
