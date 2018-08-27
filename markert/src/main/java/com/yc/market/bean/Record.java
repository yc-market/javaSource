package com.yc.market.bean;

import java.sql.Timestamp;

public class Record {
	private Integer rid;
	private Integer uid;
	private Timestamp modtime;
	private Integer account;
	private String changes;
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Timestamp getModtime() {
		return modtime;
	}
	public void setModtime(Timestamp modtime) {
		this.modtime = modtime;
	}
	public Integer getAccount() {
		return account;
	}
	public void setAccount(Integer account) {
		this.account = account;
	}
	
	public String getChanges() {
		return changes;
	}
	public void setChanges(String changes) {
		this.changes = changes;
	}
	@Override
	public String toString() {
		return "Record [rid=" + rid + ", uid=" + uid + ", modtime=" + modtime + ", account=" + account + ", changes="
				+ changes + "]";
	}
}
