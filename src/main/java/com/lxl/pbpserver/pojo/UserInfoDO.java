package com.lxl.pbpserver.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_user_info")
public class UserInfoDO {
    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField(value = "login_name")
    private String loginName;

    @TableField(value = "login_pwd")
    private String loginPwd;

    @TableField(value = "pet_name")
    private String petName;

    @TableField(value = "image_url")
    private String imageUrl;

    @TableField(value = "phone")
    private Integer phone;

    @TableField(value = "birthday")
    private Date birthday;

    @TableField(value = "email")
    private String email;

    @TableField(value = "remark")
    private String remark;

    @TableLogic
    @TableField(value = "is_deleted")
    private Integer deleted;

    @TableField(value = "gmt_create")
    private Date gmtCreate;

    @TableField(value = "gmt_modified")
    private Date gmtModified;

}
