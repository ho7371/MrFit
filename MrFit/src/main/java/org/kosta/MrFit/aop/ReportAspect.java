package org.kosta.MrFit.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // 스프링 컨테이너에게 객체 생성을 명령함
@Aspect // AOP 객체임을 명시함
public class ReportAspect {

	//private Log log = LogFactory.getLog(getClass());

	@Around("execution(public * org.kosta.MrFit..*.*(..))")
	//@Around("execution(public * org.kosta.MrFit.*Controller.*(..)) or execution(public * org.kosta.MrFit.*Service*.*(..)) or execution(public * org.kosta.MrFit.*DAO*.*(..))")
	public Object keywordUpload(ProceedingJoinPoint point) throws Throwable {
		Object retValue=null;
		//Object arg[]=point.getArgs();	
		String className=point.getTarget().getClass().getName();
		String methodName=point.getSignature().getName();
		
		try {
			System.out.println("*aop proceed: "+className+" "+methodName+" "+retValue);
			retValue=point.proceed();
		} finally {
			if (retValue!=null)
			System.out.println("*aop fianally: "+className+" "+methodName+" "+retValue);
		}
		return retValue;
	}
}
