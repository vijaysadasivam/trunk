package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

import com.saturn.ph.form.AgendaForm;
import com.saturn.ph.form.p1.FV9_11AnlaufueberForm;
import com.saturn.ph.form.p1.FV9_11ProjectTerminForm;
import com.saturn.ph.form.p1.FV9_11VorserienTerForm;
import com.saturn.ph.form.p1.FV9_12AktionspunkteForm;
import com.saturn.ph.form.p1.FV9_13AnlauforganisationForm;
import com.saturn.ph.form.p1.FV9_14AnlaufkurveForm;
import com.saturn.ph.form.p1.FV9_15Bauprog0S;
import com.saturn.ph.form.p1.FV9_15BauprogPVS;
import com.saturn.ph.form.p1.FV9_15BauprogVFF;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP5Form;
import com.saturn.ph.form.p1.FV9_15FahrzeugaufZP8Form;
import com.saturn.ph.form.p1.FV9_15ProgrammpunkteForm;
import com.saturn.ph.form.p2.FV9_21BFAbarbueberscForm;
import com.saturn.ph.form.p2.FV9_21BFreigabeForm;
import com.saturn.ph.form.p2.FV9_21BMGAbarbuebersForm;
import com.saturn.ph.form.p2.FV9_21BMGForm;
import com.saturn.ph.form.p2.FV9_21PBFreigBMGForm;
import com.saturn.ph.form.p2.FV9_21PFAbarbueberscForm;
import com.saturn.ph.form.p2.FV9_21PFreigabeForm;
import com.saturn.ph.form.p2.FV9_22ErprobDauerForm;
import com.saturn.ph.form.p2.FV9_23FehlerabbausForm;
import com.saturn.ph.form.p2.FV9_24AEKOUmsetzForm;
import com.saturn.ph.form.p2.FV9_24StatusAEKOForm;
import com.saturn.ph.form.p3.FV9_31PrufMBCubForm;
import com.saturn.ph.form.p3.FV9_32FugenRadForm;
import com.saturn.ph.form.p3.FV9_33Baubarkeit1Form;
import com.saturn.ph.form.p3.FV9_33Baubarkeit2Form;
import com.saturn.ph.form.p3.FV9_33ProblemblattForm;
import com.saturn.ph.form.p3.FV9_34FuntAussTolForm;
import com.saturn.ph.form.p3.FV9_34FuntNachBautForm;
import com.saturn.ph.form.p3.FV9_34FuntionsmasseForm;
import com.saturn.ph.form.p3.FV9_34Stellblaetter;
import com.saturn.ph.form.p3.FV9_35AuditNoteZP8Form;
import com.saturn.ph.form.p3.FV9_35AuditZP8KarossForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8KaufForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8LackForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8MontForm;
import com.saturn.ph.form.p3.FV9_35AuditZP8PressForm;
import com.saturn.ph.form.p3.FV9_35FehlerDenGewForm;
import com.saturn.ph.form.p3.FV9_35GewerkenForm;
import com.saturn.ph.form.p3.FV9_35MassVerAudForm;
import com.saturn.ph.form.p3.FV9_35MassnAbarBFForm;
import com.saturn.ph.form.p3.FV9_35NachAbbausForm;
import com.saturn.ph.form.p3.FV9_35NachareitPunkForm;
import com.saturn.ph.form.p3.FV9_35ReduzierungsprognoseForm;
import com.saturn.ph.form.p3.FV9_36Vorch2TagForm;
import com.saturn.ph.form.p4.FV9_41NominLieferForm;
import com.saturn.ph.form.p4.FV9_42ProblemblattZP5HTForm;
import com.saturn.ph.form.p4.FV9_42ProblemblattZP5KTForm;
import com.saturn.ph.form.p4.FV9_42TeileStat0SHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStat0SKTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatPVSHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatPVSKTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatVFFHTForm;
import com.saturn.ph.form.p4.FV9_42TeileStatVFFKTForm;
import com.saturn.ph.form.p4.FV9_42TeilequalitaetZP5HTForm;
import com.saturn.ph.form.p4.FV9_42TeilequalitaetZP5KTForm;
import com.saturn.ph.form.p4.FV9_42TerminuebersichtZP5HTForm;
import com.saturn.ph.form.p4.FV9_42TerminuebersichtZP5KTForm;
import com.saturn.ph.form.p4.FV9_43ProblemblattZP7KTForm;
import com.saturn.ph.form.p4.FV9_43TeileStat0SKTForm;
import com.saturn.ph.form.p4.FV9_43TeileStatPVSKTForm;
import com.saturn.ph.form.p4.FV9_43TeileStatVFFKTForm;
import com.saturn.ph.form.p4.FV9_43TeilequalitaetZP7KTForm;
import com.saturn.ph.form.p4.FV9_43TerminuebersichtZP7KTForm;
import com.saturn.ph.form.p4.FV9_44AggregateverfForm;
import com.saturn.ph.form.p5.FV9_51KarosserStatForm;
import com.saturn.ph.form.p5.FV9_51PrKarLacMonForm;
import com.saturn.ph.form.p5.FV9_52LogistikkonzeptForm;
import com.saturn.ph.form.p6.FV9_61LaunchplanungForm;
import com.saturn.ph.form.p7.FV9_71ReifegradsForm;
import com.saturn.ph.form.p7.FV9_72BeschlussForm;
import com.saturn.ph.form.p7.FV9_72UebersichtForm;
import com.saturn.ph.form.pbackup.FV9BackUpDataset;
import com.saturn.tc.utils.WorkspaceUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class FormManager {

	private static Map<String, Form> forms = new HashMap<String, Form>();

	static {
		inital();
	}

	private FormManager() {
	}

	public static Map<String, Object> getFormValue(String uid, boolean refresh) {
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);

		if (object != null) {
			String type = object.getType().getName();
			if (type.equalsIgnoreCase(WorkspaceUtils.DatasetType) ||
					type.equalsIgnoreCase(WorkspaceUtils.BackUpType)) {
				try {
					if(object.getProperty(WorkspaceUtils.DatasetPageName) != null){
						type = object.getProperty(WorkspaceUtils.DatasetPageName)
						.getDisplayableValue();
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
			
			return getFormValue(type, uid, refresh);
		}
		
		return new HashMap<String, Object>();
	}
	
	public static String getFormType(String uid, boolean refresh) {
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);

		if (object != null) {
			String type = object.getType().getName();
			if (type.equalsIgnoreCase(WorkspaceUtils.DatasetType)) {
				try {
					if(object.getProperty(WorkspaceUtils.DatasetPageName) != null){
						type = object.getProperty(WorkspaceUtils.DatasetPageName)
						.getDisplayableValue();
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
			
			if (type.equalsIgnoreCase(WorkspaceUtils.BackUpType)) {
				type = "FV9PHBackup";
			}
			
			return type;
		}
		
		return null;
	}

	public static Map<String, Object> getFormValue(String type, String uid,
			boolean refresh) {
		if (forms.containsKey(type)) {
			return forms.get(type).getValue(uid, refresh);
		}

		return new HashMap<String, Object>();
	}

	public static String getJspPath(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getJspPath();
		}

		return "/app/pep/imageDataset.jsp";
	}

	public static String getFormTitle(String type) {
		if (forms.containsKey(type)) {
			return forms.get(type).getTitle();
		}

		return "";
	}

	public static void add(Form form) {
		forms.put(form.getType(), form);
	}

	private static void inital() {
		add(new AgendaForm());
		add(new FV9_11ProjectTerminForm());
		add(new FV9_11AnlaufueberForm());
		add(new FV9_11VorserienTerForm());
		add(new FV9_12AktionspunkteForm());
		add(new FV9_13AnlauforganisationForm());
		add(new FV9_14AnlaufkurveForm());
		add(new FV9_15BauprogVFF());
		add(new FV9_15BauprogPVS());
		add(new FV9_15Bauprog0S());
		add(new FV9_15FahrzeugaufZP5Form());
		add(new FV9_15FahrzeugaufZP8Form());
		add(new FV9_15ProgrammpunkteForm());

		add(new FV9_21PBFreigBMGForm());
		add(new FV9_21PFreigabeForm());
		add(new FV9_21PFAbarbueberscForm());
		add(new FV9_21BFreigabeForm());
		add(new FV9_21BFAbarbueberscForm());
		add(new FV9_21BMGForm());
		add(new FV9_21BMGAbarbuebersForm());
		add(new FV9_22ErprobDauerForm());
		add(new FV9_23FehlerabbausForm());
		add(new FV9_24StatusAEKOForm());
		add(new FV9_24AEKOUmsetzForm());

		add(new FV9_31PrufMBCubForm());
		add(new FV9_32FugenRadForm());
		add(new FV9_33Baubarkeit1Form());
		add(new FV9_33Baubarkeit2Form());
		add(new FV9_33ProblemblattForm());
		add(new FV9_34FuntionsmasseForm());
		add(new FV9_34FuntNachBautForm());
		add(new FV9_34FuntAussTolForm());
		add(new FV9_34Stellblaetter());
		add(new FV9_35AuditNoteZP8Form());
		add(new FV9_35FehlerDenGewForm());
		add(new FV9_35ReduzierungsprognoseForm());
		add(new FV9_35GewerkenForm());
		add(new FV9_35NachareitPunkForm());
		add(new FV9_35MassnAbarBFForm());
		add(new FV9_35MassVerAudForm());
		add(new FV9_35AuditZP8PressForm());
		add(new FV9_35AuditZP8KarossForm());
		add(new FV9_35AuditZP8LackForm());
		add(new FV9_35AuditZP8MontForm());
		add(new FV9_35AuditZP8KaufForm());
		add(new FV9_35NachAbbausForm());
		add(new FV9_36Vorch2TagForm());

		add(new FV9_41NominLieferForm());
		
		add(new FV9_42TeilequalitaetZP5HTForm());
		add(new FV9_42TeileStatVFFHTForm());
		add(new FV9_42TeileStatPVSHTForm());
		add(new FV9_42TeileStat0SHTForm());
		add(new FV9_42TerminuebersichtZP5HTForm());
		add(new FV9_42ProblemblattZP5HTForm());

		add(new FV9_42TeilequalitaetZP5KTForm());
		add(new FV9_42TeileStatVFFKTForm());
		add(new FV9_42TeileStatPVSKTForm());
		add(new FV9_42TeileStat0SKTForm());
		add(new FV9_42TerminuebersichtZP5KTForm());
		add(new FV9_42ProblemblattZP5KTForm());

		add(new FV9_43TeilequalitaetZP7KTForm());
		add(new FV9_43TeileStatVFFKTForm());
		add(new FV9_43TeileStatPVSKTForm());
		add(new FV9_43TeileStat0SKTForm());
		add(new FV9_43TerminuebersichtZP7KTForm());
		add(new FV9_43ProblemblattZP7KTForm());

		add(new FV9_44AggregateverfForm());

		add(new FV9_51KarosserStatForm());
		add(new FV9_51PrKarLacMonForm());
		add(new FV9_52LogistikkonzeptForm());

		add(new FV9_61LaunchplanungForm());

		add(new FV9_71ReifegradsForm());
		add(new FV9_72BeschlussForm());
		add(new FV9_72UebersichtForm());

		add(new FV9BackUpDataset());

	}
}
