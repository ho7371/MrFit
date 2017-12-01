package org.kosta.MrFit.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // 스프링 컨테이너에게 객체 생성을 명령함
@Aspect // AOP 객체임을 명시함
public class ReportAspect {

	//private Log log = LogFactory.getLog(getClass());

	@Around("execution(public * org.kosta.MrFit.model.*ServiceImpl.*(..)) || execution(public * org.kosta.MrFit.controller.*Controller.*(..)) || execution(public * org.kosta.MrFit.model.*DAOImpl.*(..))")
	public Object keywordUpload(ProceedingJoinPoint point) throws Throwable {
		Object retValue=null;
		//Object arg[]=point.getArgs();	
		String className=point.getTarget().getClass().getName();
		String methodName=point.getSignature().getName();
		
		try {
			if(className.contains("ServiceImpl")) {
				System.out.println("					"+className+" //"+methodName+" //리턴값:"+retValue);
			}else if(className.contains("DAOImpl")) {
				System.out.println("								"+className+" //"+methodName+" //리턴값: "+retValue);
			}else {
				System.out.println("		"+className+" //"+methodName+" //리턴값: "+retValue);
			}
			retValue=point.proceed();
		} finally {
			if (retValue!=null) {			
				if(className.contains("ServiceImpl")) {
					System.out.println("					"+className+" //"+methodName+" //리턴값:"+retValue);
				}else if(className.contains("DAOImpl")) {
					System.out.println("								"+className+" //"+methodName+" //리턴값: "+retValue);
				}else {
					System.out.println("		"+className+" //"+methodName+" //리턴값: "+retValue);
				}
			}
		}
		return retValue;
}
}
