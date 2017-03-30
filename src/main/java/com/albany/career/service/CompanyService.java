package com.albany.career.service;

import com.albany.career.dto.CompanyDto;
import com.albany.career.dto.KeyValueDto;
import com.albany.career.entity.CompanyDescription;
import com.albany.career.utility.FunctionResponse;

public interface CompanyService {

	KeyValueDto getCompanyDetails(Long id, Long roleId);

	CompanyDto getCompanyDescription(Long id);

	CompanyDescription getComDescription(Long id);

	FunctionResponse updateCompanyDescription(CompanyDescription oldData);

}
