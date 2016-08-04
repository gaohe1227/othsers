package com.doadway.dwcms.core.config.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.biz.ModelItemBiz;
import com.doadway.dwcms.core.config.pojo.Model;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/config/model")
public class ModelControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private ModelBiz modelBiz;
	@Resource
	private ModelItemBiz modelItemBiz;
	
	private Model contentModel;
	
	@RequestMapping("v_list")
	public String findModelList(HttpServletRequest request,Map<String, Object> model){
		model.put("modelList", modelBiz.findAllModel());
		return "model/model_list";
	}	
	@RequestMapping("v_add")
	public String addModel(Map<String, Object> model){
		return "model/model_edit";
	}	
	@RequestMapping("v_edit")
	public String findModel(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("modelId")!=null?Integer.parseInt(request.getParameter("modelId")):1;
		contentModel=modelBiz.findModelById(id);
		model.put("modelInfo", contentModel);
		return "model/model_edit";
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateModel(HttpServletRequest request,Model newModel,Map<String, Object> model){
		boolean flag =false;
		if(newModel.getModelId()!=null&&!"".equals(newModel.getModelId())){
			Model tModel =modelBiz.findModelById(newModel.getModelId());
			if(tModel!=null){
				flag = modelBiz.updateModel(newModel);
				model.put("modelInfo", newModel);
				logBiz.operating(request, "修改栏目模型", "id="+newModel.getModelId()+";modelname="+newModel.getModelName());
			}else{
				flag = modelBiz.saveModel(newModel);
				logBiz.operating(request, "添加栏目模型", "id="+newModel.getModelId()+";modelname="+newModel.getModelName());
			}
			model.put("status",flag);
		}
		return "model/model_edit";
	}

	@RequestMapping("o_del")
	public String delModel(HttpServletRequest request,Map<String, Object> model){
		String[]  ids = request.getParameterValues("ids");
		for(String id:ids){
			if(modelItemBiz.findItemsByModelId(Integer.parseInt(id)).size()>0){
				return "redirect:/admin/core/config/model/v_list.do?dstatus=true";
			}
		}
		modelBiz.batchDeleteModelByIds(ids);
		return "redirect:/admin/core/config/model/v_list.do";
	}		
	
	@RequestMapping("o_priority")
	public String savePrioritys(HttpServletRequest request, Map<String, Object> model){
		String[] wids = request.getParameterValues("wids");
		String[] prioritys = request.getParameterValues("priority");
		
		String 	 defId = request.getParameter("defId");
		boolean sFlag = modelBiz.setupDefaultModel(Integer.parseInt(defId));
		
		String[]   disabled = request.getParameterValues("disabled");
		boolean dFlag = modelBiz.batchSaveDisabled(wids, disabled);
		
		boolean flag = modelBiz.batchSavePrioritys(wids, prioritys);
		if(flag&&sFlag&&dFlag){
			model.put("status",flag);
		}
		return "redirect:/admin/core/config/model/v_list.do";
	}
}
