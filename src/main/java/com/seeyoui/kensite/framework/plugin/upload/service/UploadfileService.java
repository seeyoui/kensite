/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.upload.service;  
 
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.FileUtils;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;
import com.seeyoui.kensite.framework.plugin.upload.domain.Uploadfile;
import com.seeyoui.kensite.framework.plugin.upload.persistence.UploadfileMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class UploadfileService extends BaseService {
	
	@Autowired
	private UploadfileMapper uploadfileMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Uploadfile findUploadfileById(String id) throws CRUDException{
		return uploadfileMapper.findUploadfileById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param uploadfile
	 * @return
	 * @throws CRUDException
	 */
	public List<Uploadfile> findUploadfileList(Uploadfile uploadfile) throws CRUDException {
		return uploadfileMapper.findUploadfileList(uploadfile);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findUploadfileListTotal(Uploadfile uploadfile) throws CRUDException {
		return uploadfileMapper.findUploadfileListTotal(uploadfile);
	}
	
	/**
	 * 数据新增
	 * @param uploadfile
	 * @throws CRUDException
	 */
	public String uploadfile(Uploadfile uploadfile, HttpServletRequest request) throws CRUDException{
		String ctxPath = request.getSession().getServletContext().getRealPath("/"); 
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		if (!ctxPath.endsWith(File.separator)) {
			ctxPath = ctxPath + File.separator;
		}
		FileUtils.createDirectory(ctxPath);
		String url = uploadfile.getUrl();
		if(url==null || "".equals(url)) {
			url = "temp";
		}
		ctxPath = ctxPath + StringConstant.UPLOAD_FILE_URL + url;
		if (!ctxPath.endsWith(File.separator)) {
			ctxPath = ctxPath + File.separator;
		}
		FileUtils.createDirectory(ctxPath);
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {    
            // 上传文件名 
			Uploadfile uploadFile = new Uploadfile();
            MultipartFile mf = entity.getValue();    
            String fileName = mf.getOriginalFilename();
//            String fName = fileName.indexOf(".") != -1 ? fileName.substring(0, fileName.lastIndexOf(".")) : fileName;
            String suffix = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf("."), fileName.length()) : null;
            String UUID = GeneratorUUID.getId();
            String newFileName = UUID + suffix;// 构成新文件名。
            File realFile = new File(ctxPath + newFileName);    
            try {
            	uploadFile.setId(UUID);
                uploadFile.setViewname(fileName);
                uploadFile.setRealname(newFileName);
                String fileUrl = StringConstant.UPLOAD_FILE_URL + (uploadfile.getUrl()==null?"":uploadfile.getUrl());
                uploadFile.setUrl(fileUrl.replaceAll("\\\\", "/"));
                uploadFile.setRealurl(ctxPath.replaceAll("\\\\", "/"));
                uploadFile.setSuffix(suffix);
                uploadFile.setFilesize(mf.getSize()+"");
            	if(!(uploadfile.getUrl()==null?"":uploadfile.getUrl()).startsWith("temp")) {
            		uploadfile.preInsert();
            		uploadfileMapper.saveUploadfile(uploadFile);
            	} else {
            		UUID = "";
            	}
                FileCopyUtils.copy(mf.getBytes(), realFile);
                return UUID;
//                JSONObject jsonObject = JSONObject.fromObject(uploadFile);
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }
		}
        return "";
		
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteUploadfile(List<String> listId) throws CRUDException {
		for(String id : listId) {
			Uploadfile uploadfile = uploadfileMapper.findUploadfileById(id);
			FileUtils.deleteFile(uploadfile.getRealurl()+uploadfile.getRealname());
			uploadfileMapper.deleteUploadfile(listId);
		}
	}
	
}