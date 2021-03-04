package com.lxl.pbpserver.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lxl.pbpserver.pojo.RoleDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface RoleMapper extends BaseMapper<RoleDO> {
}
