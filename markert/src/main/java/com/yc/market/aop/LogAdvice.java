package com.yc.market.aop;

import java.lang.reflect.Field;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import com.yc.market.dao.BaseDao;
import com.yc.market.util.MyBatisUtils;


//@Component
//@Aspect
public class LogAdvice {
   /**
    * 环绕增强
    * @param pjp
    * @return
    * @throws IllegalArgumentException
    * @throws IllegalAccessException
    */
	
	
	@Around("execution(* com.yc.market.biz.*.*(..))")
	public Object around(ProceedingJoinPoint pjp) throws IllegalArgumentException, IllegalAccessException{
		//1、获取当前getTarget 被 代理的对象 
		Object biz=pjp.getTarget();
		
		SqlSession session=MyBatisUtils.openSession();
		//JAVA 黑科技----反射  获取所有的属性 
		for(Field f:biz.getClass().getDeclaredFields()){
			//判断当前的字段类型是BaseDao 子类
			if(BaseDao.class.isAssignableFrom(f.getType())){
				//设置访问权限为public
				f.setAccessible(true);
				//获取dao 对象
				BaseDao dao=(BaseDao) f.get(biz);
				dao.setSession(session);
			}
		}
		
		
            Object ret =null;
        	try {
				ret=pjp.proceed();
				session.commit();
			} catch (Throwable e) {
				
				e.printStackTrace();
				session.rollback();
			}finally{
				session.close();
			}
    		
            return ret;
        
	}
}
