package com.example.springcrudservice;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 정적 파일들이 저장된 디렉토리 경로를 등록합니다.
        registry.addResourceHandler("/CSS/**")
                .addResourceLocations("classpath:/static/CSS/");

        registry.addResourceHandler("/JS/**")
                .addResourceLocations("classpath:/static/JS/");
    }
}
