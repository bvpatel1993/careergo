package com.albany.career.dao;

import com.albany.career.dto.CompanyDto;
import com.albany.career.entity.CompanyDescription;
import com.albany.career.utility.FunctionResponse;

public interface CompanyDao {

	CompanyDto getCompanyDescription(Long id);

	CompanyDescription getComDescription(Long id);

	FunctionResponse updateCompanyDescription(CompanyDescription oldData);

}
