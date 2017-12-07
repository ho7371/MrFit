package org.kosta.MrFit.aop;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // 스프링 컨테이너에게 객체 생성을 명령함
@Aspect // AOP 객체임을 명시함
public class ReportAspect {

	private Log log = LogFactory.getLog(getClass());

	@Around("execution(public * org.kosta.MrFit.model.*ServiceImpl.*(..)) || execution(public * org.kosta.MrFit.controller.*Controller.*(..)) || execution(public * org.kosta.MrFit.model.*DAOImpl.*(..))")
	public Object keywordUpload(ProceedingJoinPoint point) throws Throwable {
		Object retValue=null;
		Object[] args=point.getArgs();	
		String className=point.getTarget().getClass().getName();
		String methodName=point.getSignature().getName();
		String cn[]=className.split("\\.");
		className=cn[4];
		try {

			if(className.contains("ServiceImpl")) {
				log.debug("            "+className+"/"+methodName+"/입력값:"+printArgs(args));
			}else if(className.contains("DAOImpl")) {
				log.debug("                  "+className+"/"+methodName+"/입력값:"+printArgs(args));
			}else {
				log.debug("      "+className+"/"+methodName+"/입력값:"+printArgs(args));
			}
			retValue=point.proceed();
		} finally {
			if (retValue!=null) {			
				if(className.contains("ServiceImpl")) {
					log.debug("            "+className+"/"+methodName+"/리턴값:"+retValue);
				}else if(className.contains("DAOImpl")) {
					log.debug("                  "+className+"/"+methodName+"/리턴값: "+retValue);
				}else {
					log.debug("      "+className+"/"+methodName+"/리턴값: "+retValue);
				}
			}
		}
		return retValue;
	}
	
	public String printArgs(Object[] args) {
		String argStr = "";
		if(args.length==0) {
			return argStr;
		}
		for(int i=0; i<args.length; i++) {
			argStr = argStr+args[i]+", ";
		}
		return argStr;
	}
}
