package com.lxl.pbpserver.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_user_info")
public class UserInfoDO {
    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField(value = "login_name")
    private String loginName;

    private String loginPwd;

    private String petName;

    private String imageUrl;

    private Integer phone;

    private Date birthday;

    private String email;

    private String remark;

    private Integer deleted;

    private Date gmtCreate;

    private Date gmtModified;

}
