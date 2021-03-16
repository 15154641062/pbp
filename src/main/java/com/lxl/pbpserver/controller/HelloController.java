package com.lxl.pbpserver.controller;

import com.alibaba.fastjson.JSON;
import com.lxl.pbpserver.base.BaseResponse;
import com.lxl.pbpserver.common.StatusCode;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/article")
public class HelloController {

    @RequestMapping("/hello")
    public String hello(){
        return JSON.toJSONString(new BaseResponse(StatusCode.SUCCESS,null,"hello!!"));
    }
}
