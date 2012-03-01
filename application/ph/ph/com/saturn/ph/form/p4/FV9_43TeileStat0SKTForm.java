package com.saturn.ph.form.p4;

import com.saturn.ph.Form;

public class FV9_43TeileStat0SKTForm extends Form {
	
	private static final String[] attr = {
		"fv9TotalNum", "fv9CKDCOPNum", 
		"fv9TeilestName","fv9TeileAusSerien", "fv9TeileNote6",
		"fv9TeileFehlend", "fv9TeileNote3","fv9TeileNote1",
		"fv9TopKrisUmf", "fv9TopEinNum", "fv9TopVSIN3", "fv9TopVSIN1",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9OtherUid"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/4/p3_4.jsp";
	}

	@Override
	public String getType() {
		return "FV9_43TeileStat0SKT";
	}

	@Override
	public String getTitle() {
		return "4.3 Teilestatus zu 0S ZP7 (KT)";
	}
}