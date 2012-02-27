package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_23SoftwarefehlerentwicklungDataset extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p3_1.jsp";
	}

	@Override
	public String getType() {
		return "2.3 Softwarefehlerentwicklung";
	}

	@Override
	public String getTitle() {
		return "2.3 Softwarefehlerentwicklung";
	}
}