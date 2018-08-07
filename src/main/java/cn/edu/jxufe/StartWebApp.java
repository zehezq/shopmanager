package cn.edu.jxufe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by Administrator on 2018/8/2.
 */
@SpringBootApplication
@MapperScan("cn.edu.jxufe.dao")
public class StartWebApp {
    public static void main(String[] args) {
        System.out.println("服务器启动！");
        SpringApplication.run(StartWebApp.class);
    }
}
/*
zouziqian
*/
