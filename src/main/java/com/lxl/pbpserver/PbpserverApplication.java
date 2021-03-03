package com.lxl.pbpserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication()
public class PbpserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(PbpserverApplication.class, args);
    }

}
