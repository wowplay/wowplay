package com.xtkj.wowplay.service;

import com.xtkj.wowplay.entity.Sort;

import java.util.List;

/**
 * Created by Administrator on 2016/7/12 0012.
 */
public interface SortService {

    /**
     * 根据pid取出一级分类和二级分类
     */
    List<Sort> selectSortList(int pid);


}
