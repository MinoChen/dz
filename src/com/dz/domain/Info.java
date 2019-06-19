package com.dz.domain;

public class Info {
	private Integer info_id;// 信息编号
	private String info_author;// 作者（来源）
	private String info_title;// 标题（用于列表页面）
	private String info_content;// 信息内容
	private String info_picPath;// 预览图片路径
	private String info_publishTime;// 发布时间
	private String info_publishStatus;// 是否发布
	private Integer info_sort;// 排序
	private Integer category_id;// 所属类别编号
	private Category category;//类别
	
	public Info() {
		
	}
	
	public Integer getInfo_id() {
		return info_id;
	}


	public void setInfo_id(Integer info_id) {
		this.info_id = info_id;
	}


	public String getInfo_author() {
		return info_author;
	}


	public void setInfo_author(String info_author) {
		this.info_author = info_author;
	}


	public String getInfo_title() {
		return info_title;
	}


	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}


	public String getInfo_content() {
		return info_content;
	}


	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}


	public String getInfo_picPath() {
		return info_picPath;
	}


	public void setInfo_picPath(String info_picPath) {
		this.info_picPath = info_picPath;
	}


	public String getInfo_publishTime() {
		return info_publishTime;
	}


	public void setInfo_publishTime(String info_publishTime) {
		this.info_publishTime = info_publishTime;
	}


	public String getInfo_publishStatus() {
		return info_publishStatus;
	}


	public void setInfo_publishStatus(String info_publishStatus) {
		this.info_publishStatus = info_publishStatus;
	}


	public Integer getInfo_sort() {
		return info_sort;
	}


	public void setInfo_sort(Integer info_sort) {
		this.info_sort = info_sort;
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


	@Override
	public String toString() {
		return "Info [info_id=" + info_id + ", info_author=" + info_author + ", info_title=" + info_title
				+ ", info_content=" + info_content + ", info_picPath=" + info_picPath + ", info_publishTime="
				+ info_publishTime + ", info_publishStatus=" + info_publishStatus + ", info_sort=" + info_sort
				+ ", category_id=" + category_id + ", category=" + category + "]";
	}
	
}
