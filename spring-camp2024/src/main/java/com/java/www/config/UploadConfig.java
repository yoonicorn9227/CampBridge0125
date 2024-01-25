package com.java.www.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class UploadConfig implements WebMvcConfigurer {

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///c:/upload/");
		registry.addResourceHandler("/movie/**").addResourceLocations("file:///c:/movie/");

		// upload로 들어오는것은 C드라이브 upload에서 찾아라/ 그외에는 static이나 views src/main/java에서 찾는다
	}// addResourceHandlers()
	
}//CLASS(UploadConfig)
