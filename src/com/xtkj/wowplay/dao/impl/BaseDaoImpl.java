package com.xtkj.wowplay.dao.impl;

import java.io.Serializable;
import java.util.List;

import com.xtkj.wowplay.dao.BaseDao;
import com.xtkj.wowplay.entity.Tag;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 数据访问bean
 * @author Wangyan
 *
 */
@Component("baseDao")
public class BaseDaoImpl implements BaseDao {
	private SessionFactory sessionFactory;
	
	/**获取session*/
	@Override
	public Session querySession(){
		return sessionFactory.getCurrentSession();
	}
	
///////////////////////////////添加、更新///////////////////////////////////////////	
	/** 保存指定的持久化对象 */
	@Override
	public void save(Object obj){
		this.querySession().save(obj);
	}
	
	/** 保存或更新指定的持久化对象 */
	@Override
	public void saveOrUpdate(Object obj){
		this.querySession().saveOrUpdate(obj);
	}
	
///////////////////////////////删除///////////////////////////////////////////	
	/** 删除指定ID的持久化对象 */
	@Override
	public  void deleteById(Class clazz, Serializable id){
		this.querySession().delete(this.querySession().load(clazz, id));
	}


	/** 删除指定的持久化对象 */
	@Override
	public void delete(Object obj){
		this.querySession().delete(obj);
	}

///////////////////////////////查询///////////////////////////////////////////	
	/** 装载指定类的精确查询结果 */
	@Override
	public <T> List<T> findByProperty(String clazz, String propertyName, Object value){
		String hql="from "+clazz+" as model where model."+propertyName+"=?";
		return this.querySession().createQuery(hql).setParameter(0, value).list();
	}
	
	/** 装载指定类的模糊查询结果 */
	@Override
	public <T> List<T> findLikeProperty(String clazz, String propertyName, String value){
		String hql="from "+clazz+" as model where model."+propertyName+" like ?";
		return this.querySession().createQuery(hql).setParameter(0, value).list();
	}
	
	/** 装载指定类的多项条件查询查询结果 */
	@Override
	public <T> List<T> findByProperty(String clazz, String[] propertyName, Object[] value){
		String hql="from "+clazz+" as model where 1=1";
		for(int i=0;i<propertyName.length;i++){
			hql+=" and model."+propertyName[i]+"=?";
		}
		Query query=this.querySession().createQuery(hql);
		for(int j=0;j<value.length;j++){
			query.setParameter(j, value[j]);
		}
		return query.list();
	}
	
	/** 装载指定类的所有持久化对象 */
	@Override
	public List listAll(String clazz){
		String hql="from "+clazz;
		return this.querySession().createQuery(hql).list();
	}
		
///////////////////////////////统计///////////////////////////////////////////	
	/** 使用类统计指定类的所有持久化对象个数 */
	@Override
	public int countAll(String clazz){
		String hql="select count(*) from "+clazz;
		Query query=this.querySession().createQuery(hql);
		String num=(String)query.uniqueResult();
		return Integer.parseInt(num);
	}

	/** 使用hql语句统计指定类的查询结果 */
	@Override
	public int countQuery(String hql){
		Query query=this.querySession().createQuery(hql);
		List<Object> list=query.list();
		if(list!=null){
			return list.size();
		}
		return 0;
	}
	
	
////////////////////////////分页//////////////////////////////////////////
	/** 使用hql分页查询指定类的满足条件的持久化对象 */
	@Override
	public <T> List<T> findByHql(String hql, int start, int limit){
		return this.querySession().createQuery(hql).setFirstResult(start).setMaxResults(limit).list();
	}
	
	/** 分页装载指定类的指定属性的模糊查询结果 */
	@Override
	public <T> List<T> findLikeProperty(String clazz, String propertyName, String value, int start, int limit){
		String hql="from "+clazz+" as model where model."+propertyName+" like '%"+value+"%'";
		return this.findByHql(hql, start, limit);
	}
	
	/** 分页装载指定类指定属性的精确查询结果 */
	@Override
	public <T> List<T> findByProperty(String clazz, String propertyName, String value, int start, int limit){
		String hql="from "+clazz+" as model where model."+propertyName+"='"+value+"'";
		return this.findByHql(hql, start, limit);
	}
	
	/** 分页装载指定类多个指定属性的查询结果 */
	@Override
	public <T> List<T> findByProperty(String clazz, String[] propertyName, Object[] value, int start, int limit){
		String hql="from "+clazz+" as model where 1=1";
		for(int i=0;i<propertyName.length;i++){
			hql+=" and model."+propertyName[i]+"=?";
		}
		Query query=this.querySession().createQuery(hql);
		for(int j=0;j<value.length;j++){
			query.setParameter(j, value[j]);
		}
		return this.findByHql(hql, start, limit);
	}

	/** 分页装载指定类的所有持久化对象 */
	@Override
	public List listAll(String clazz, int start, int limit){
		String hql="from "+clazz;
		return this.findByHql(hql, start, limit);
	}


	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
