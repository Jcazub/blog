/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.app;

import com.amazonaws.auth.SystemPropertiesCredentialsProvider;
import org.springframework.cloud.aws.jdbc.config.annotation.EnableRdsInstance;
import org.springframework.cloud.aws.jdbc.config.annotation.RdsInstanceConfigurer;
import org.springframework.cloud.aws.jdbc.datasource.TomcatJdbcDataSourceFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author Jesse
 */
//@Configuration
//@EnableRdsInstance(
//    dbInstanceIdentifier = "ebdb",
//        password = "narutobestninja")
public class AppConfig {
    
    //SystemPropertiesCredentialsProvider provider = new SystemPropertiesCredentialsProvider();
    
//    @Bean
//     public RdsInstanceConfigurer instanceConfigurer() {
//        return () -> {
//            TomcatJdbcDataSourceFactory dataSourceFactory
//             = new TomcatJdbcDataSourceFactory();
//            dataSourceFactory.setInitialSize(10);
//            dataSourceFactory.setValidationQuery("SELECT 1");
//            //provider.getCredentials();
//            return dataSourceFactory;
//        };
//    }
     
     
     
     
     
}
