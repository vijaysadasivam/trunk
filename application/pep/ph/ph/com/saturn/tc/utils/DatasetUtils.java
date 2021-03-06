package com.saturn.tc.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.saturn.ph.PH;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.saturn.tc.utils.server.EasyFileManagementService;
import com.saturn.web.Web;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class DatasetUtils {
	
	public static String getDatasetByUid(String uid, HttpServletRequest request){
		
		String src = "/ph/app/pep/images/default.jpg";
		Object userUid = request.getSession().getAttribute("TC_USER_UID");
		System.out.println("userUid = " + userUid);
		System.out.println("	uid = " + uid);
		if(userUid == null){
			userUid = request.getSession().getAttribute("TC_DEFAULT_USER_UID");
		}
		if(!"".equals(uid)){
			Dataset dataset = (Dataset)PH.getDataService().loadModelObject(uid);
			String datasetpath = "";
			if (userUid != null && !"".equals((String)userUid)) {
				datasetpath = "attachment" + File.separator +  DateUtils.getSysTime() + File.separator + userUid.toString() + File.separator;
			} else {
				datasetpath = "attachment" + File.separator +  DateUtils.getSysTime() + File.separator + "tempUser" + File.separator;
			}
			
			String path = request.getRealPath("/") ;
			//判断realPath后有没有 “/”没有就加上
			if(Web.getObjectYesOrNo(path)){
				if(path.split("ph")[1]!= File.separator){
					path = path + File.separator;
				}
			}
			path = path + datasetpath;
			String downloadDatasetName = downloadDatasetFromTc(dataset ,path);
			if(!downloadDatasetName.equals("")){
				src =  request.getContextPath()+ File.separator + datasetpath + downloadDatasetName;
			}
		}
		System.out.println("src = " + src);
		return src ;
	}

	public static String downloadDatasetFromTc( Dataset dataset, String directory) {
		EasyDataManagementService dms = PH.getDataService();
		EasyFileManagementService fms = PH.getFileService();
		FileManagementUtility fileUtility = fms.newUtility();
		String result = "";
		
		try {
			dms.getProperties(dataset, "ref_list");
			ModelObject refs[] = dataset.get_ref_list();
			
			if (refs.length > 0) {
				dms.getProperties(refs, "file_name", "original_file_name");
				
				ImanFile file = null;
				for (int i = 0; i < refs.length; ++i) {
					if (refs[i] instanceof ImanFile) {
						file = (ImanFile)refs[i];
						break;
					}
				}
				
				if (file != null) {
					String location = directory + File.separator + file.get_original_file_name();
					File f = new File(location);
					if(!f.exists()){
						fileUtility.getFileToLocation(file, location, null, null);
					}
					result = file.get_original_file_name();
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	
}
