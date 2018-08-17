package cn.edu.jxufe.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by Administrator on 2018/8/16.
 */
//配置标签
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter{
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //指定拦截器要拦截的请求
        registry.addInterceptor(new CheckSession()).addPathPatterns("/page_**");
        super.addInterceptors(registry);
    }
}
/*
zouziqian
*/
