package com.lxl.pbpserver.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_role")
public class RoleDO {
    @TableId(type = IdType.AUTO)
    private Long id;

    private String sign;

    private String name;

    private String remark;

    private Date gmtCreate;

    private Date gmtModified;
}
