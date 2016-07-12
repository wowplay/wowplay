package com.xtkj.wowplay.entity;

import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2016/7/12 0012.
 */
public class Sort {


    private int id;
    private String name;
    private int pid;
    private String pname;
    private Set courses = new HashSet(0);

    /**
     * 一级标签对应的二级标签集合
     */
    private List<Sort> sortList;

    // Constructors

    /** default constructor */
    public Sort() {
    }

    /** minimal constructor */
    public Sort(int id, String name, int pid) {
        this.id = id;
        this.name = name;
        this.pid = pid;
    }

    /** full constructor */
    public Sort(int id, String name, int pid, Set courses) {
        this.id = id;
        this.name = name;
        this.pid = pid;
        this.courses = courses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Set getCourses() {
        return courses;
    }

    public void setCourses(Set courses) {
        this.courses = courses;
    }

    public List<Sort> getSortList() {
        return sortList;
    }

    public void setSortList(List<Sort> sortList) {
        this.sortList = sortList;
    }
}
