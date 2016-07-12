package com.xtkj.wowplay.dao;

import com.xtkj.wowplay.entity.Sort;

import java.util.List;

/**
 * Created by Administrator on 2016/7/12 0012.
 */

public interface SortDao {

    /**根据类别的id查询类别信息*/
    public Sort queryById(Sort sort);
    /**删除类别*/
    public void deleteSort(Sort sort);
    /**根据类别的名字查询类别*/
    public Sort queryByName(Sort sort);
    /**添加类别*/
    public void addSort(Sort sort);
    /**查询某个类别的所有子类别（sort.pid）*/
    public List<Sort> querySortByPId(Sort sort);
    /**修改类别信息*/
    public void updateSort(Sort sort);
    /**查询某个类别的所有子类别（sort.id）*/
    public List<Sort> queryByPid(Sort sort);
    /**查询所有的类别*/
    public List<Sort> queryAllSort();
    /**查询所有的一级类别*/
    public List<Sort> queryAllFistSort();
    /**查询某个类别的子类别*/
    public List<Sort> quertChdSort(Sort sort);
}
