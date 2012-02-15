package com.saturn.ph.form.p3;

import com.saturn.ph.Form;

public class FV9_31PrufMBCubForm extends Form {
	
	private static final String[] attr = {
		"fv9PrMSBCubStyle", "fv9PrMSBCubStatus", "fv9PrMSBCubStCom_CN", "fv9PrMSBCubStCom_GM"
		,"fv9PrMSBCubMabnh_CN","fv9PrMSBCubMabnh_GM"
	};

	public String[] getAttributes() {
		return attr;
	}

	public String getJspPath() {
		return "/app/pep/3/p1_1.jsp";
	}

	@Override
	public String getType() {
		return "FV9_31PrufMBCub";
	}

	@Override
	public String getTitle() {
		return "3.1 Pruefmittel, Meisterbock/Cubing";
	}
}
	
	

	
	
	
	
