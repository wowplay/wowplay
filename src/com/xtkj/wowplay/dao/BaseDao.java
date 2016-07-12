package com.xtkj.wowplay.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

/**
 * 数据访问接口
 * @author Wangyan
 *
 */
public interface BaseDao {
	/**获取session*/
	public Session querySession();
	
	/** 保存指定的持久化对象 */
	public void save(Object obj);
	
	/** 保存或更新指定的持久化对象 */
	public void saveOrUpdate(Object obj);
	
	/** 删除指定ID的持久化对象 */
	public void deleteById(Class clazz, Serializable id);
	
	/** 删除指定的持久化对象 */
	public void delete(Object obj);
	
	/** 装载指定类的模糊查询结果 */
	public <T> List<T> findLikeProperty(String clazz, String propertyName, String value);
	
	/** 装载指定类的查询结果 */
	public <T> List<T> findByProperty(String clazz, String propertyName, Object value);
	
	/** 装载指定类的查询结果 */
	public <T> List<T> findByProperty(String clazz, String[] propertyName, Object[] value);
	
	/** 装载指定类的所有持久化对象 */
	public <T> List<T> listAll(String clazz);
	
	/** 统计指定类的所有持久化对象 */
	public int countAll(String clazz);

	/** 统计指定类的查询结果 */
	public int countQuery(String hql);
	
	/** 分页装载指定类的查询结果 */
	public <T> List<T> findLikeProperty(String clazz, String propertyName, String value, int start, int limit);
	
	/** 分页装载指定类的查询结果 */
	public <T> List<T> findByProperty(String clazz, String propertyName, String value, int start, int limit);
	
	/** 分页装载指定类的查询结果 */
	public <T> List<T> findByProperty(String clazz, String[] propertyName, Object[] value, int start, int limit);

	/** 分页装载指定类的所有持久化对象 */
	public <T> List<T> listAll(String clazz, int start, int limit);
	
	/** 分页查询指定类的满足条件的持久化对象 */
	public <T> List<T> findByHql(String hql, int start, int limit);
}
