package org.example.fileControl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.example.fileControl.dao.mapper")
public class FileControlApplication {

    public static void main(String[] args) {
        SpringApplication.run(FileControlApplication.class, args);
    }

}
