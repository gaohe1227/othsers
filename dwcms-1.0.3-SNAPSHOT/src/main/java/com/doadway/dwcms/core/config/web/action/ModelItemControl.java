package com.doadway.dwcms.core.config.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.ModelItemBiz;
import com.doadway.dwcms.core.config.pojo.ModelItem;

@Controller
@RequestMapping("/admin/core/config/modelItem")
public class ModelItemControl {
	@Resource
	private ModelItemBiz modelItemBiz;
	
	private ModelItem modelItem;
	
	@RequestMapping("v_list")
	public String findModelItemList(HttpServletRequest request,Map<String, Object> model){
		Integer modelId = request.getParameter("modelId")!=null?Integer.parseInt(request.getParameter("modelId")):1;
		String  isChannel = request.getParameter("isChannel");
		if(isChannel.equals("")||isChannel==null){isChannel="false";}
		model.put("modelItemList", modelItemBiz.findItemsByModelId(modelId, isChannel));
		return "item/model_item_list";
	}	
	@RequestMapping("v_add")
	public String addModelItem(Map<String, Object> model){
		return "item/model_item_edit";
	}	
	@RequestMapping("v_edit")
	public String findModelItem(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("modelItemId")!=null?Integer.parseInt(request.getParameter("modelItemId")):1;
		modelItem=modelItemBiz.findItemById(id);
		model.put("modelItemInfo", modelItem);
		return "item/model_item_edit";
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateModelItem(ModelItem newModelItem,Map<String, Object> model){
		boolean flag =false;
		if(newModelItem.getModelitemId()!=null&&!"".equals(newModelItem.getModelitemId())){
			ModelItem tModelItem =modelItemBiz.findItemById(newModelItem.getModelitemId());
			if(tModelItem!=null){
				flag = modelItemBiz.updateModeItem(newModelItem);
				model.put("modelItemInfo", newModelItem);
			}else{
				flag = modelItemBiz.saveModelItem(newModelItem);
			}
			model.put("status",flag);
		}else{
			newModelItem.setModelitemId(modelItemBiz.findMaxId()+1);
			flag = modelItemBiz.saveModelItem(newModelItem);
			model.put("status",flag);
		}
		return "item/model_item_edit";
	}
	
	@RequestMapping("o_save_list")
	public String batchSaveModelItem(HttpServletRequest request,Map<String, Object> model){
		String modelId = request.getParameter("modelId");
		String isChannel= request.getParameter("isChannel");
		String[] wids = request.getParameterValues("wids");
		String[] displays= request.getParameterValues("display");
		modelItemBiz.batchSaveDisplay(wids, displays);
		String[] singles= request.getParameterValues("single");
		modelItemBiz.batchSaveSingle(wids, singles);
		String[] prioritys= request.getParameterValues("priority");
		modelItemBiz.batchSavePrioritys(wids, prioritys);
		String[] itemLabels= request.getParameterValues("itemLabel");
		modelItemBiz.batchSaveItemsLabel(wids, itemLabels);
		return "redirect:/admin/core/config/modelItem/v_list.do?modelId="+modelId+"&isChannel="+isChannel+"";
	}
	@RequestMapping("o_del")
	public String delModelItem(HttpServletRequest request){
		String ids[] = request.getParameterValues("ids");
		String modelId = request.getParameter("modelId");
		String isChannel= request.getParameter("isChannel");

		modelItemBiz.batchRemoveItem(ids);
		return "redirect:/admin/core/config/modelItem/v_list.do?modelId="+modelId+"&isChannel="+isChannel+"";
	}		
}
