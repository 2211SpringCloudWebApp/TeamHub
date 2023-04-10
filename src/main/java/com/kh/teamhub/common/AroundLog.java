package com.kh.teamhub.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class AroundLog {

	@Pointcut("execution(* com.kh.marchpring..*Impl.*(..))")
	public void serviceImplPointCut(){ }
	
	@Around("serviceImplPointCut()")
	public Object checkTimeMethod(ProceedingJoinPoint pjp) throws Throwable {
		
		StopWatch stopWatch = new StopWatch();
		Object obj = null;
		stopWatch.start();
		
		 //  메소드(대상)
		obj = pjp.proceed();   // pointcut 적용 시점의 메소드       

		
		stopWatch.stop();
		String methodName = pjp.getSignature().getName();   // 메소드 이름을 구할 수 있음.
		
		System.out.println(methodName + " 메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)");
		return obj;
	}
	
	
}
