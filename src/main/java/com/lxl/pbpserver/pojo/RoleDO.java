package com.lxl.pbpserver.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_role")
public class RoleDO {
    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField(value = "sign")
    private String sign;

    @TableField(value = "name")
    private String name;

    @TableField(value = "remark")
    private String remark;

    @TableField(value = "gmt_create")
    private Date gmtCreate;

    @TableField(value = "gmt_modified")
    private Date gmtModified;
}
