// default package
package com.xtkj.wowplay.entity;

import java.io.File;
import java.util.HashSet;
import java.util.Set;


/**
 * Course entity. @author MyEclipse Persistence Tools
 */

public class Course implements java.io.Serializable {


    // Fields    

     private int id;
     private Sort sort;
     private String coursename;
     private String picpath;
     private String author;
    /**
     * 课程描述
     */
     private String CDesc;
    /**
     * 课程对应的标签
     */
    private Set<Tag> courseTags = new HashSet<>();

    /**
     * 课程对应的文件
     */
     private File upload;

     private int loadCount;
     private int haveStudent;
    // Constructors

    /** default constructor */
    public Course() {
    }

	/** minimal constructor */
    public Course(int id, Sort sort, String coursename, String picpath, String author, String CDesc) {
        this.id = id;
        this.sort = sort;
        this.coursename = coursename;
        this.picpath = picpath;
        this.author = author;
        this.CDesc = CDesc;
    }


    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Sort getSort() {
        return sort;
    }

    public void setSort(Sort sort) {
        this.sort = sort;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCDesc() {
        return CDesc;
    }

    public void setCDesc(String CDesc) {
        this.CDesc = CDesc;
    }

    public Set<Tag> getCourseTags() {
        return courseTags;
    }

    public void setCourseTags(Set<Tag> courseTags) {
        this.courseTags = courseTags;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public int getLoadCount() {
        return loadCount;
    }

    public void setLoadCount(int loadCount) {
        this.loadCount = loadCount;
    }

    public int getHaveStudent() {
        return haveStudent;
    }

    public void setHaveStudent(int haveStudent) {
        this.haveStudent = haveStudent;
    }
}