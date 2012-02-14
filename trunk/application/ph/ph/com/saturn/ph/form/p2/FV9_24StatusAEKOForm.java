package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_24StatusAEKOForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9AekoAbgesch", "fv9AekoSmall2Woch", "fv9AekoBig2Woch"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/p4_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_24StatusAEKO";
	}

	@Override
	public String getTitle() {
		return "2.4 Status ÄKO";
	}
}