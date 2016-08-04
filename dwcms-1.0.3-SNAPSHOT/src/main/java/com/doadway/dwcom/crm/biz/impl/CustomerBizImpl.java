package com.doadway.dwcom.crm.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcom.crm.biz.CustomerBiz;
import com.doadway.dwcom.crm.dao.CustomerMapper;
import com.doadway.dwcom.crm.pojo.Customer;
@Service
public class CustomerBizImpl implements CustomerBiz {
	@Resource
	CustomerMapper customerDAO;
	@Override
	public boolean saveOrUpdateCustomer(Customer customer) {
		if(customer==null){return false;}
		if(customer.getCustomerId()!=null&&findCustomerById(customer.getCustomerId())!=null){
			return customerDAO.updateByPrimaryKeySelective(customer)>0;
		}else{
			return customerDAO.insert(customer)>0;
		}
	}

	@Override
	public boolean batchDeleteCustomer(String[] customerIds) {
		Integer flag=0;
		for(String id:customerIds){
			customerDAO.deleteByPrimaryKey(Integer.parseInt(id));
			flag++;
		}
		if(flag==customerIds.length){
			return true;
		}
		return false;
	}

	@Override
	public List<Customer> findCustomerByPage(Page page,
			Map<String, String> params) {
		return customerDAO.selectByPage(page, params);
	}

	@Override
	public Customer findCustomerById(Integer customerId) {
		return customerDAO.selectByPrimaryKey(customerId);
	}

}
