package com.xtkj.wowplay.dao.impl;

import com.xtkj.wowplay.dao.BaseDao;
import com.xtkj.wowplay.dao.SortDao;
import com.xtkj.wowplay.entity.Sort;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/7/12 0012.
 */
@Component("sortDao")
public class SortDaoImpl implements SortDao {


    private BaseDao baseDao;

    @Override
    public Sort queryById(Sort sort) {

        return null;
    }

    @Override
    public void deleteSort(Sort sort) {

    }

    @Override
    public Sort queryByName(Sort sort) {
        return null;
    }

    @Override
    public void addSort(Sort sort) {

    }

    @Override
    public List<Sort> querySortByPId(Sort sort) {
        return null;
    }

    @Override
    public void updateSort(Sort sort) {

    }

    @Override
    public List<Sort> queryByPid(Sort sort) {
        return null;
    }

    @Override
    public List<Sort> queryAllSort() {
        return null;
    }

    @Override
    public List<Sort> queryAllFistSort() {
        return null;
    }

    @Override
    public List<Sort> quertChdSort(Sort sort) {
        return null;
    }

    public BaseDao getBaseDao() {
        return baseDao;
    }

    @Resource(name="baseDao")
    public void setBaseDao(BaseDao baseDao) {
        this.baseDao = baseDao;
    }
}
