package com.albany.career.serviceImpl;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.albany.career.dao.AdminDao;
import com.albany.career.dao.ApplicantDao;
import com.albany.career.dao.CompanyDao;
import com.albany.career.dao.CounsellorDao;
import com.albany.career.dao.LoginDao;
import com.albany.career.dto.CompanyDto;
import com.albany.career.dto.KeyValueDto;
import com.albany.career.entity.CompanyDescription;
import com.albany.career.service.CompanyService;
import com.albany.career.utility.FunctionResponse;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	LoginDao loginDao;
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	ApplicantDao applicantDao;
	
	@Autowired
	CompanyDao companyDao;
	
	@Autowired
	CounsellorDao counsellorDao;

	@Transactional
	public KeyValueDto getCompanyDetails(Long id, Long roleId) {
		KeyValueDto register = adminDao.getRegistrationDetails(id,roleId);
		SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		register.setsDate(df.format(register.getDate()));
		if(register.getfName() == null){
			register.setfName(" ");
		}
		register.setFullname(register.getfName()+" "+register.getlName());
		if(register.getVerified()){
			register.setvStatus("Verified");
		}else{
			register.setvStatus("Not-Verified");
		}
		return register;
	}

	@Transactional
	public CompanyDto getCompanyDescription(Long id) {
		// TODO Auto-generated method stub
		return companyDao.getCompanyDescription(id);
	}

	@Transactional
	public CompanyDescription getComDescription(Long id) {
		// TODO Auto-generated method stub
		return companyDao.getComDescription(id);
	}

	@Transactional
	public FunctionResponse updateCompanyDescription(CompanyDescription oldData) {
		// TODO Auto-generated method stub
		return companyDao.updateCompanyDescription(oldData);
	}

}
