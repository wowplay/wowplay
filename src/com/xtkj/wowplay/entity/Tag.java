package com.xtkj.wowplay.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/7/12 0012.
 */
@Entity
@Table(name="tb_Tag")
public class Tag {
    /**
     * 标签 id
     */
    private int id;
    /**
     * 标签名字
     */
    private String name;
    /**
     * 类别id
     */
    private int sortId;


    public Tag() {
    }

    public Tag(int id, String name, int sortId) {
        this.id = id;
        this.name = name;
        this.sortId = sortId;
    }

    @Id
//    @GeneratedValue(strategy= GenerationType.SEQUENCE)
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

    @Column(name="sid")
    public int getSortId() {
        return sortId;
    }

    public void setSortId(int sortId) {
        this.sortId = sortId;
    }
}
