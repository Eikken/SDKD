package com.sdkd.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

//服务类注解
@Service
public class SpringTest {
    @Test
    public void testSpring(){
        //ApplicatonContet是spring中较高级容器，负责加载集中和分配bean
        //下面是实例化applicationContext.xml文件，new里面可以用数组
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        //获取SpringTest类
        SpringTest springTest = (SpringTest) applicationContext.getBean("springTest");
        //调用sayHello的方法
        springTest.sayHello();
    }

    private void sayHello() {
        System.out.println("Hello Celeste!");
    }
}
