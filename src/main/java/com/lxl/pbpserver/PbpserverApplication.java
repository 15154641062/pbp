package com.lxl.pbpserver;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.lxl.pbpserver"})
@MapperScan("com.lxl.pbpserver.mapper")
public class PbpserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(PbpserverApplication.class, args);
    }

}
