package org.example.fileControl.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@Aspect
public class AspectConfig {

    @Pointcut("execution(* org.example.fileControl.service.*.*(..))")
    public void ServiceTimeCalculation(){
    }

    // 定义环绕通知，计算方法执行时间
    @Around("ServiceTimeCalculation()")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object proceed = joinPoint.proceed();
        long endTime = System.currentTimeMillis();
        log.info("方法调用消耗时间为: {} executed in {} ms", joinPoint.getSignature(), (endTime - startTime));
        return proceed;
    }
}
