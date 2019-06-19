package com.dz.domain;

public class Pic {
	private Integer pic_id;
	private String pic_author;
	private String pic_content;
	private Integer pic_sort;
	private String pic_path;
	private String pic_publishStatus;
	private String pic_publishTime;
	private String pic_title;
	private Integer category_id;
	private Category category;
	
    public Pic() {
    	
    }
	
	@Override
	public String toString() {
		return "Pic [pic_id=" + pic_id + ", pic_author=" + pic_author + ", pic_content=" + pic_content + ", pic_sort="
				+ pic_sort + ", pic_path=" + pic_path + ", pic_publishStatus=" + pic_publishStatus
				+ ", pic_publishTime=" + pic_publishTime + ", pic_title=" + pic_title + ", category_id=" + category_id
				+ ", category=" + category + "]";
	}
	
	public Integer getPic_id() {
		return pic_id;
	}
	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}
	public String getPic_author() {
		return pic_author;
	}
	public void setPic_author(String pic_author) {
		this.pic_author = pic_author;
	}
	public String getPic_content() {
		return pic_content;
	}
	public void setPic_content(String pic_content) {
		this.pic_content = pic_content;
	}
	public Integer getPic_sort() {
		return pic_sort;
	}
	public void setPic_sort(Integer pic_sort) {
		this.pic_sort = pic_sort;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_publishStatus() {
		return pic_publishStatus;
	}
	public void setPic_publishStatus(String pic_publishStatus) {
		this.pic_publishStatus = pic_publishStatus;
	}
	public String getPic_publishTime() {
		return pic_publishTime;
	}
	public void setPic_publishTime(String pic_publishTime) {
		this.pic_publishTime = pic_publishTime;
	}
	public String getPic_title() {
		return pic_title;
	}
	public void setPic_title(String pic_title) {
		this.pic_title = pic_title;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

}
