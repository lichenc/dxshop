package com.daxiao.bean;

public class MessageBean {
	private String id ;
	private String type;
	private String color;
	private Integer num;
	private String username;
	private String phone;
	private String province;
	private String city;
	private String region;
	private String detailAddress;
	private String payType;
	private String leaveMessage;
	private String createTime;
	private String modifyTime;
	private String status;
	private Integer price;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getLeaveMessage() {
		return leaveMessage;
	}
	public void setLeaveMessage(String leaveMessage) {
		this.leaveMessage = leaveMessage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "MessageBean [id=" + id + ", type=" + type + ", color=" + color
				+ ", num=" + num + ", username=" + username + ", phone="
				+ phone + ", province=" + province + ", city=" + city
				+ ", region=" + region + ", detailAddress=" + detailAddress
				+ ", payType=" + payType + ", leaveMessage=" + leaveMessage
				+ ", createTime=" + createTime + ", modifyTime=" + modifyTime
				+ ", status=" + status + ", price=" + price + "]";
	}
	
	
	
}
