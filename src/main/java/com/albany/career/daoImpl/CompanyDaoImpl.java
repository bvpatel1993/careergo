package com.albany.career.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateAccessor;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.albany.career.dao.CompanyDao;
import com.albany.career.dto.CompanyDto;
import com.albany.career.dto.CounselorDto;
import com.albany.career.entity.CompanyDescription;
import com.albany.career.entity.CounsellorDescription;
import com.albany.career.utility.FunctionResponse;

@Repository
public class CompanyDaoImpl extends HibernateDaoSupport implements CompanyDao {
	
	@Autowired
	public void setDaoSessionFactory(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

	private HibernateTemplate getHibernate() {
		HibernateTemplate template = getHibernateTemplate();
		template.setAllowCreate(false);
		template.setFlushMode(HibernateAccessor.FLUSH_COMMIT);

		return template;
	}

	public CompanyDto getCompanyDescription(Long id) {
		String hql = "SELECT new com.albany.career.dto.CompanyDto(company.id,register.id,company.domain,company.website,company.description,company.status,company.logo,company.logoType) FROM CompanyDescription as company "
				+" left outer join company.register as register where register.id = :rId and company.status = "+true;
		Query query = getHibernate().getSessionFactory().getCurrentSession().createQuery(hql.toString());
		query.setParameter("rId", id);
		List results = query.list();
		if(results != null && results.size() > 0){
			return (CompanyDto) results.get(0);
		}
		return null;
	}
	
	public CompanyDescription getComDescription(Long id){
		CompanyDescription des = (CompanyDescription) getHibernateTemplate().getSessionFactory().getCurrentSession().get(CompanyDescription.class, id);
		return des;
	}
	
	public FunctionResponse updateCompanyDescription(CompanyDescription com) {
		FunctionResponse response = new FunctionResponse();
		try{
			getHibernateTemplate().saveOrUpdate(com);
			response.setFlag(true);
			response.setMessage("Updated Successfully");
		}catch(Exception e){
			e.printStackTrace();
			response.setFlag(false);
			response.setMessage("Updation Failed");
		}
		return response;
	}

}
