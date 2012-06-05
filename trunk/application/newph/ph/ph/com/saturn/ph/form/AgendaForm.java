package com.saturn.ph.form;

import com.saturn.ph.Form;

public class AgendaForm extends Form {
	
	private static final String[] attr = {
		"fv9PreRelesed", "fv9Oraganization", "release_status_list", "fv9PageName",
		"fv9PlatformType","fv9otherUid", "fv9IsBackup", "object_type","fv9SortNum"
	};
	
	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/imageDataset.jsp";
	}

	@Override
	public String getType() {
		return "Agenda";
	}

	@Override
	public String getTitle() {
		return "Agenda";
	}

}
