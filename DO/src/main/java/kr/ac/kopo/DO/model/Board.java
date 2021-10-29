package kr.ac.kopo.DO.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Board {
	private int bid;
	private int cid;
	private String id;
	private String subCname;
	private String title;
	private String content;
	private String image;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubCname() {
		return subCname;
	}
	public void setSubCname(String subCname) {
		this.subCname = subCname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getRegdate() {
		return regDate;
	}
	public void setRegdate(Date regDate) {
		this.regDate = regDate;
	}

	
}
