package com.saturn.ph.form.p2;

import com.saturn.ph.Form;

public class FV9_24StatusAEKOForm extends Form {
	
	private static final String[] attr = {
		"fv9KWNo", "fv9AekoAbgesch", "fv9AekoSmall2Woch", "fv9AekoBig2Woch",
		"fv9PronoseAbgesch", "fv9PronoseSmall2Woch", "fv9PronoseBig2Woch",
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName", 
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type",
		"fv9DisplayRule","fv9SortNum"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/2/FV9_24StatusAEKO.jsp";
	}

	@Override
	public String getType() {
		return "FV9_24StatusAEKO";
	}

	@Override
	public String getTitle() {
		return "2.4 Status AEKO";
	}
}
