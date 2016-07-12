package com.xtkj.wowplay.service.impl;

import com.xtkj.wowplay.dao.SortDao;
import com.xtkj.wowplay.entity.Sort;
import com.xtkj.wowplay.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/7/12 0012.
 */
@Service
public class SortServiceImpl implements SortService {


    private SortDao sortDao;


    @Override
    public List<Sort> selectSortList(int pid) {
        return null;
    }

    public SortDao getSortDao() {
        return sortDao;
    }

    @Resource
    public void setSortDao(SortDao sortDao) {
        this.sortDao = sortDao;
    }
}
