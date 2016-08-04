package com.doadway.dwcom.crm.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcom.crm.pojo.Customer;

public interface CustomerBiz {
			public boolean saveOrUpdateCustomer(Customer customer);
			
			public boolean batchDeleteCustomer(String[] customerIds);
			
			public List<Customer>  findCustomerByPage(Page page,Map<String,String> params);
			
			public Customer  findCustomerById(Integer customerId);
}
