package org.kosta.MrFit.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // 스프링 컨테이너에게 객체 생성을 명령함
@Aspect // AOP 객체임을 명시함
public class ReportAspect {

	private Log log = LogFactory.getLog(getClass());

	@SuppressWarnings("rawtypes")
	@Around("execution(public java.util.List org.kosta.springmvc10.model.*Service.find*List*(..))")
	public Object keywordUpload(ProceedingJoinPoint point) throws Throwable {

		try {
			point.proceed();
		} finally {
			
		}
		return null;
	}
}
