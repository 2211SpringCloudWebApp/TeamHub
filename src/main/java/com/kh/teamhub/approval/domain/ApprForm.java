package com.kh.teamhub.approval.domain;

public class ApprForm {
	private int formNo;
	private String formTitle;
	private String formContent;
	
	public ApprForm() {}

	public int getFormNo() {
		return formNo;
	}

	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}

	public String getFormTitle() {
		return formTitle;
	}

	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}

	public String getFormContent() {
		return formContent;
	}

	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}

	@Override
	public String toString() {
		return "ApprForm [formNo=" + formNo + ", formTitle=" + formTitle + ", formContent=" + formContent
				+ ", getFormNo()=" + getFormNo() + ", getFormTitle()=" + getFormTitle() + ", getFormContent()="
				+ getFormContent() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
