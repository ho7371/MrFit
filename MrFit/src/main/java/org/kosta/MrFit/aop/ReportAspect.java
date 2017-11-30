package org.kosta.MrFit.aop;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // 스프링 컨테이너에게 객체 생성을 명령함
@Aspect // AOP 객체임을 명시함
public class ReportAspect {

	//private Log log = LogFactory.getLog(getClass());

	@SuppressWarnings("rawtypes")
	@Around("execution(public * org.kosta.MrFit.model.*ServiceImpl.*(..))")
	//@Around("execution(public * org.kosta.MrFit.*Controller.*(..)) or execution(public * org.kosta.MrFit.*Service*.*(..)) or execution(public * org.kosta.MrFit.*DAO*.*(..))")
	public Object keywordUpload(ProceedingJoinPoint point) throws Throwable {
		Object retValue=null;
		//Object arg[]=point.getArgs();	
		String className=point.getTarget().getClass().getName();
		String methodName=point.getSignature().getName();
		
		try {
			retValue=point.proceed();
			
			System.out.println("*aop: "+className+" "+methodName);
		} finally {
			if (retValue!=null&&retValue instanceof List&&!((List)retValue).isEmpty())
			System.out.println("*aop: "+className+" "+methodName);
		}
		return retValue;
	}
}
