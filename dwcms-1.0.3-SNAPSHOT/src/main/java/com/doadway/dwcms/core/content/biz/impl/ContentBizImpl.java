package com.doadway.dwcms.core.content.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.core.channel.dao.ChannelExtMapper;
import com.doadway.dwcms.core.channel.pojo.ChannelExt;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.dao.ContentAttachmentMapper;
import com.doadway.dwcms.core.content.dao.ContentAttrMapper;
import com.doadway.dwcms.core.content.dao.ContentChannelMapper;
import com.doadway.dwcms.core.content.dao.ContentCheckMapper;
import com.doadway.dwcms.core.content.dao.ContentCountMapper;
import com.doadway.dwcms.core.content.dao.ContentExtMapper;
import com.doadway.dwcms.core.content.dao.ContentGroupViewMapper;
import com.doadway.dwcms.core.content.dao.ContentMapper;
import com.doadway.dwcms.core.content.dao.ContentPictureMapper;
import com.doadway.dwcms.core.content.dao.ContentTagMapper;
import com.doadway.dwcms.core.content.dao.ContentTagRelateMapper;
import com.doadway.dwcms.core.content.dao.ContentTopicMapper;
import com.doadway.dwcms.core.content.dao.ContentTxtMapper;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.pojo.Content;
import com.doadway.dwcms.core.content.pojo.ContentAttachment;
import com.doadway.dwcms.core.content.pojo.ContentAttachmentExample;
import com.doadway.dwcms.core.content.pojo.ContentAttr;
import com.doadway.dwcms.core.content.pojo.ContentAttrExample;
import com.doadway.dwcms.core.content.pojo.ContentChannelKey;
import com.doadway.dwcms.core.content.pojo.ContentCheck;
import com.doadway.dwcms.core.content.pojo.ContentCount;
import com.doadway.dwcms.core.content.pojo.ContentExt;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewExample;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewKey;
import com.doadway.dwcms.core.content.pojo.ContentPicture;
import com.doadway.dwcms.core.content.pojo.ContentPictureExample;
import com.doadway.dwcms.core.content.pojo.ContentTag;
import com.doadway.dwcms.core.content.pojo.ContentTagExample;
import com.doadway.dwcms.core.content.pojo.ContentTagRelate;
import com.doadway.dwcms.core.content.pojo.ContentTagRelateExample;
import com.doadway.dwcms.core.content.pojo.ContentTopicExample;
import com.doadway.dwcms.core.content.pojo.ContentTopicKey;
import com.doadway.dwcms.core.content.pojo.ContentTxt;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
@Service
public class ContentBizImpl implements ContentBiz {
	@Resource
	private ContentMapper contentDAO;
	@Resource
	private ContentCountMapper contentCountDAO;	
	@Resource
	private ChannelExtMapper channelExtDAO;	
	@Resource
	private ContentExtMapper contentExtDAO;	
	@Resource
	private ContentCheckMapper contentCheckDAO;	
	@Resource
	private ContentAttachmentMapper contentAttachmentDAO;	
	@Resource
	private ContentAttrMapper contentAttrDAO;	
	@Resource
	private ContentChannelMapper contentChannelDAO;	
	@Resource
	private ContentGroupViewMapper contentGroupViewDAO;	
	@Resource
	private ContentPictureMapper contentPictureDAO;	
	@Resource
	private ContentTagMapper contentTagDAO;	
	@Resource
	private ContentTagRelateMapper contentTagRelateDAO;	
	@Resource
	private ContentTopicMapper contentTopicDAO;	
	@Resource
	private ContentTxtMapper contentTxtDAO;	
	public List<ContentDTO> findContentByPage(Page page,
			Map<String, Object> params) {
		List<ContentDTO> contentDtoList = new ArrayList<ContentDTO>();
		List<Content> contentList=contentDAO.selectByPage(page, params);
		for(Content content:contentList){
			ContentDTO contentDto = new ContentDTO();
			try {
				BeanUtils.copyProperties(contentDto,content);
				BeanUtils.copyProperties(contentDto,content.getContentExt());
				
				ContentCount contentCount = contentCountDAO.selectByPrimaryKey(content.getContentId());
				BeanUtils.copyProperties(contentDto,contentCount);
				ChannelExt channelExt= channelExtDAO.selectByPrimaryKey(content.getChannelId());
				contentDto.setChannelName(channelExt.getChannelName());
				contentDtoList.add(contentDto);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return contentDtoList;
	}

	@Override
	public List<ContentDTO> findListForIndex(Integer siteId, Integer channelId,
			Date startDate, Date endDate, Integer startId, Integer max) {
		List<ContentDTO> contentDtoList = new ArrayList<ContentDTO>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Content> contentList=contentDAO.selectListForIndex(siteId, channelId, df.format(startDate), df.format(endDate), startId, max);
		for(Content content:contentList){
			ContentDTO contentDto = new ContentDTO();
			try {
				BeanUtils.copyProperties(contentDto,content);
				BeanUtils.copyProperties(contentDto,content.getContentExt());
				
				ContentCount contentCount = contentCountDAO.selectByPrimaryKey(content.getContentId());
				BeanUtils.copyProperties(contentDto,contentCount);
				ChannelExt channelExt= channelExtDAO.selectByPrimaryKey(content.getChannelId());
				contentDto.setChannelName(channelExt.getChannelName());
				contentDtoList.add(contentDto);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}		
		return contentDtoList;
	}

	public ContentDTO findContentById(String contentId) {
		ContentDTO contentDto = new ContentDTO();
		try {
			Content content = contentDAO.selectByPrimaryKey(Integer.parseInt(contentId));
			if(content!=null){
				BeanUtils.copyProperties(contentDto,content);
				ChannelExt channelExt= channelExtDAO.selectByPrimaryKey(content.getChannelId());
				contentDto.setChannelName(channelExt.getChannelName());
				
				ContentAttachmentExample example =new ContentAttachmentExample();
				ContentAttachmentExample.Criteria cAttachCri=example.createCriteria();
				cAttachCri.andContentIdEqualTo(content.getContentId());
				List<ContentAttachment> attachmentList=contentAttachmentDAO.selectByExample(example);
				contentDto.setAttachmentList(attachmentList);
				
				ContentAttrExample attrExample=new ContentAttrExample();
				ContentAttrExample.Criteria attrCri = attrExample.createCriteria();
				attrCri.andContentIdEqualTo(content.getContentId());
				List<ContentAttr> attrList=contentAttrDAO.selectByExample(attrExample);
				contentDto.setAttrList(attrList);
				
				ContentGroupViewExample groupViewExample=new ContentGroupViewExample();
				ContentGroupViewExample.Criteria groupViewCri = groupViewExample.createCriteria();
				groupViewCri.andContentIdEqualTo(content.getContentId());
				List<ContentGroupViewKey> groupViewList=contentGroupViewDAO.selectByExample(groupViewExample);
				contentDto.setGroupViewList(groupViewList);
				
				ContentPictureExample picExample=new ContentPictureExample();
				ContentPictureExample.Criteria picCri =picExample.createCriteria();
				picCri.andContentIdEqualTo(content.getContentId());
				List<ContentPicture> picList=contentPictureDAO.selectByExample(picExample);
				contentDto.setPictureList(picList);
				
				ContentTagRelateExample tagRelateExample=new ContentTagRelateExample();
				ContentTagRelateExample.Criteria tagRelateCri=tagRelateExample.createCriteria();
				tagRelateCri.andContentIdEqualTo(content.getContentId());
				List<ContentTagRelate> tagRelateList=contentTagRelateDAO.selectByExample(tagRelateExample);
				contentDto.setTagRelateList(tagRelateList);
				
				ContentTopicExample topicExample = new ContentTopicExample();
				ContentTopicExample.Criteria topicExampleCri=topicExample.createCriteria();
				topicExampleCri.andContentIdEqualTo(content.getContentId());
				List<ContentTopicKey>  topicList=contentTopicDAO.selectByExample(topicExample);
				contentDto.setTopicList(topicList);
				
				ContentTxt contentTxt=contentTxtDAO.selectByPrimaryKey(content.getContentId());
				if(contentTxt!=null){
					BeanUtils.copyProperties(contentDto,contentTxt);
				}
				
				ContentCheck contentCheck=contentCheckDAO.selectByPrimaryKey(content.getChannelId());
				if(contentCheck!=null){
					BeanUtils.copyProperties(contentDto,contentCheck);
				}
				
				ContentExt contentExt = contentExtDAO.selectByPrimaryKey(content.getContentId());
				if(contentExt!=null){
					BeanUtils.copyProperties(contentDto,contentExt);
				}			
				ContentCount contentCount = contentCountDAO.selectByPrimaryKey(content.getContentId());
				BeanUtils.copyProperties(contentDto,contentCount);
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return contentDto;
	}

	public boolean batchUpdateContentStatus(String[] contentIds,
			ContentStatusEnum statusEnum) {
		Integer flag = 0;
		for(String cId:contentIds){
			Content c=contentDAO.selectByPrimaryKey(Integer.parseInt(cId));
			c.setStatus(statusEnum.getValue().byteValue());
			contentDAO.updateByPrimaryKeySelective(c);
			if(flag==contentIds.length){
				return true;
			}
			flag++;
		}
		return false;
	}

	public boolean batchDeleteContents(String[] contentIds) {
		Integer flag = 0;
		for(String cid:contentIds){
			Integer contentId = Integer.parseInt(cid);
			
			ContentChannelKey key=new ContentChannelKey();
			key.setContentId(contentId);
			Content c=contentDAO.selectByPrimaryKey(contentId);
			key.setChannelId(c!=null?c.getChannelId():0);
			contentChannelDAO.deleteByPrimaryKey(key);			
			
			ContentAttachmentExample example =new ContentAttachmentExample();
			ContentAttachmentExample.Criteria cAttachCri=example.createCriteria();
			cAttachCri.andContentIdEqualTo(contentId);
			contentAttachmentDAO.deleteByExample(example);
			
			ContentAttrExample attrExample=new ContentAttrExample();
			ContentAttrExample.Criteria attrCri = attrExample.createCriteria();
			attrCri.andContentIdEqualTo(contentId);
			contentAttrDAO.deleteByExample(attrExample);
			
			ContentGroupViewExample groupViewExample=new ContentGroupViewExample();
			ContentGroupViewExample.Criteria groupViewCri = groupViewExample.createCriteria();
			groupViewCri.andContentIdEqualTo(contentId);
			contentGroupViewDAO.deleteByExample(groupViewExample);
			
			ContentPictureExample picExample=new ContentPictureExample();
			ContentPictureExample.Criteria picCri =picExample.createCriteria();
			picCri.andContentIdEqualTo(contentId);
			contentPictureDAO.deleteByExample(picExample);
			
			ContentTagRelateExample tagRelateExample=new ContentTagRelateExample();
			ContentTagRelateExample.Criteria tagRelateCri=tagRelateExample.createCriteria();
			tagRelateCri.andContentIdEqualTo(contentId);
			List<ContentTagRelate> tagRelateList=contentTagRelateDAO.selectByExample(tagRelateExample);
			for(ContentTagRelate tagRelate:tagRelateList){
				ContentTag tag=contentTagDAO.selectByPrimaryKey(tagRelate.getTagId());
				tag.setRefCounter(tag.getRefCounter()-1);
				if(tag.getRefCounter()<0){
					tag.setRefCounter(0);
				}
				contentTagDAO.updateByPrimaryKey(tag);
			}
			contentTagRelateDAO.deleteByExample(tagRelateExample);
			
			ContentTopicExample topicExample = new ContentTopicExample();
			ContentTopicExample.Criteria topicExampleCri=topicExample.createCriteria();
			topicExampleCri.andContentIdEqualTo(contentId);
			contentTopicDAO.deleteByExample(topicExample);
			
			contentTxtDAO.deleteByPrimaryKey(contentId);
			
			contentCheckDAO.deleteByPrimaryKey(contentId);
			contentExtDAO.deleteByPrimaryKey(contentId);
			contentCountDAO.deleteByPrimaryKey(contentId);
			contentDAO.deleteByPrimaryKey(contentId);
			
			if(flag==contentIds.length){
				return true;
			}
			flag++;			
		}
		return false;
	}

	public boolean batchReject(String[] contentIds, Integer isReject) {
		Integer flag = 0;
		for(String cId:contentIds){
			ContentCheck cc=contentCheckDAO.selectByPrimaryKey(Integer.parseInt(cId));
			if(isReject==0){
				cc.setIsRejected(false);
			}else if(isReject==1){
				cc.setIsRejected(true);
			}
			contentCheckDAO.updateByPrimaryKeySelective(cc);
			if(flag==contentIds.length){
				return true;
			}
			flag++;
		}
		return false;
	}

	public boolean saveOrUpdateContents(ContentDTO contentDto) {
		try {
			Content content = new Content();
			BeanUtils.copyProperties(content, contentDto);
			
			ContentExt contentExt = new ContentExt();
			BeanUtils.copyProperties(contentExt, contentDto);
			
			ContentTxt contentTxt = new ContentTxt();
			BeanUtils.copyProperties(contentTxt, contentDto);
			
			ContentCheck contentCheck  = new ContentCheck();
			BeanUtils.copyProperties(contentCheck, contentDto);
			
			ContentCount contentCount=new ContentCount();
			BeanUtils.copyProperties(contentCount,contentDto);
			if(contentDAO.selectByPrimaryKey(contentDto.getContentId())!=null){
				//存在就更新;
				contentDAO.updateByPrimaryKey(content);
				contentExtDAO.updateByPrimaryKey(contentExt);
				contentCheckDAO.updateByPrimaryKey(contentCheck);
				contentCountDAO.updateByPrimaryKey(contentCount);
				if(contentDto.getTxt()!=null&&!"".equals(contentDto.getTxt())){
					contentTxtDAO.updateByPrimaryKeySelective(contentTxt);
				}				
				
				if(contentDto.getAttachmentList()!=null){
					ContentAttachmentExample example=new ContentAttachmentExample();
					ContentAttachmentExample.Criteria attachCri=example.createCriteria();
					attachCri.andContentIdEqualTo(contentDto.getContentId());
					contentAttachmentDAO.deleteByExample(example);
					for(ContentAttachment cAttachment:contentDto.getAttachmentList()){
						contentAttachmentDAO.insert(cAttachment);
					}
				}

				if(contentDto.getGroupViewList()!=null){
					ContentGroupViewExample example=new ContentGroupViewExample();
					ContentGroupViewExample.Criteria groupViewExample=example.createCriteria();
					groupViewExample.andContentIdEqualTo(contentDto.getContentId());
					contentGroupViewDAO.deleteByExample(example);
					
					for(ContentGroupViewKey cGroupView:contentDto.getGroupViewList()){
						contentGroupViewDAO.insert(cGroupView);
					}
				}
				
				if(contentDto.getPictureList()!=null){
					ContentPictureExample example=new ContentPictureExample();
					ContentPictureExample.Criteria picCri=example.createCriteria();
					picCri.andContentIdEqualTo(contentDto.getContentId());
					contentPictureDAO.deleteByExample(example);
					for(ContentPicture pic:contentDto.getPictureList()){
						pic.setPriority(contentPictureDAO.selectMaxPriority()+1);
						contentPictureDAO.insert(pic);
					}
				}else{
					ContentPictureExample example=new ContentPictureExample();
					ContentPictureExample.Criteria picCri=example.createCriteria();
					picCri.andContentIdEqualTo(contentDto.getContentId());
					contentPictureDAO.deleteByExample(example);
				}
				
				if(contentDto.getAttrList()!=null){
					ContentAttrExample example=new ContentAttrExample();
					ContentAttrExample.Criteria attrCri=example.createCriteria();
					attrCri.andContentIdEqualTo(contentDto.getContentId());
					contentAttrDAO.deleteByExample(example);
					for(ContentAttr cAttr:contentDto.getAttrList()){
						contentAttrDAO.insert(cAttr);
					}
				}
				if(contentDto.getTopicList()!=null){
					ContentTopicExample example=new ContentTopicExample();
					ContentTopicExample.Criteria topicCri=example.createCriteria();
					topicCri.andContentIdEqualTo(contentDto.getContentId());
					contentTopicDAO.deleteByExample(example);
					for(ContentTopicKey cTopic:contentDto.getTopicList()){
						contentTopicDAO.insert(cTopic);
					}
				}

				if(contentDto.getTagStr()!=null){
					String[] tags=contentDto.getTagStr().split(",");
					ContentTagRelateExample tagRelateExample=new ContentTagRelateExample();
					ContentTagRelateExample.Criteria tagRelateCri=tagRelateExample.createCriteria();
					tagRelateCri.andContentIdEqualTo(contentDto.getContentId());
					contentTagRelateDAO.deleteByExample(tagRelateExample);
					for(String t:tags){
						ContentTagExample example=new ContentTagExample();
						example.createCriteria().andTagNameEqualTo(t);
						ContentTag contentTag=new ContentTag();
						if(contentTagDAO.selectByExample(example).size()>0){
							contentTag=contentTagDAO.selectByExample(example).get(0);
							contentTagDAO.updateByPrimaryKey(contentTag);
							
						}else{
							
							contentTag.setRefCounter(1);
							contentTag.setTagName(t);
							contentTag.setTagId(contentTagDAO.selectMaxId()+1);
							contentTagDAO.insert(contentTag);
							
						}
						ContentTagRelate cTagRelate=new ContentTagRelate();
						cTagRelate.setContentId(contentDto.getContentId());
						cTagRelate.setTagId(contentTag.getTagId());
						cTagRelate.setPriority(new Random().nextInt(3));
						contentTagRelateDAO.insert(cTagRelate);
					}
				}
				return true;
			}else{
				//添加新的内容;
				contentDAO.insert(content);
				contentExtDAO.insert(contentExt);
				contentCheckDAO.insert(contentCheck);
				contentCountDAO.insert(contentCount);
				if(contentDto.getTxt()!=null&&!"".equals(contentDto.getTxt())){
					contentTxtDAO.insert(contentTxt);
				}
				if(contentDto.getAttachmentList()!=null){
					for(ContentAttachment cAttachment:contentDto.getAttachmentList()){
						contentAttachmentDAO.insert(cAttachment);
					}
				}
				
				if(contentDto.getGroupViewList()!=null){
					for(ContentGroupViewKey cGroupView:contentDto.getGroupViewList()){
						contentGroupViewDAO.insert(cGroupView);
					}
				}
				
				if(contentDto.getPictureList()!=null){
					for(ContentPicture pic:contentDto.getPictureList()){
						contentPictureDAO.insert(pic);
					}
				}
				
				if(contentDto.getAttrList()!=null){
					for(ContentAttr cAttr:contentDto.getAttrList()){
						contentAttrDAO.insert(cAttr);
					}
				}
				
				if(contentDto.getTopicList()!=null){
					for(ContentTopicKey cTopic:contentDto.getTopicList()){
						contentTopicDAO.insert(cTopic);
					}
				}
				
				if(contentDto.getTagStr()!=null){
					String[] tags=contentDto.getTagStr().split(",");
					for(String t:tags){
						ContentTagExample example=new ContentTagExample();
						example.createCriteria().andTagNameEqualTo(t);
						ContentTag contentTag=new ContentTag();
						if(contentTagDAO.selectByExample(example).size()>0){
							contentTag=contentTagDAO.selectByExample(example).get(0);
							contentTag.setRefCounter(contentTag.getRefCounter()+1);
							contentTagDAO.updateByPrimaryKey(contentTag);
							
						}else{
							
							contentTag.setRefCounter(1);
							contentTag.setTagName(t);
							contentTag.setTagId(contentTagDAO.selectMaxId()+1);
							contentTagDAO.insert(contentTag);
							
						}
						ContentTagRelate cTagRelate=new ContentTagRelate();
						cTagRelate.setContentId(contentDto.getContentId());
						cTagRelate.setTagId(contentTag.getTagId());
						cTagRelate.setPriority(new Random().nextInt(3));
						contentTagRelateDAO.insert(cTagRelate);
					}
				}
				return true;
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Integer findMaxId() {
		return contentDAO.selectMaxId();
	}

	public Integer findMaxPriorityForPic() {
		return contentPictureDAO.selectMaxPriority();
	}

	public String findTagString(String contentId) {
		String tagString="";
		ContentTagRelateExample tagRelateExample=new ContentTagRelateExample();
		ContentTagRelateExample.Criteria tagRelateCri=tagRelateExample.createCriteria();
		tagRelateCri.andContentIdEqualTo(Integer.parseInt(contentId));
		List<ContentTagRelate> tagRelateList=contentTagRelateDAO.selectByExample(tagRelateExample);
		if(tagRelateList.size()>0){
			for(ContentTagRelate tagRelate:tagRelateList){
				ContentTag contentTag=new ContentTag();
				contentTag=contentTagDAO.selectByPrimaryKey(tagRelate.getTagId());
				tagString+=contentTag.getTagName()+",";
			}
			tagString=tagString.substring(0, tagString.length()-1);
		}
		return tagString;
	}

	public List<ContentGroupViewKey> findContentGroupView(Integer contentId) {
		ContentGroupViewExample example=new ContentGroupViewExample();
		ContentGroupViewExample.Criteria cGroupViewCri=example.createCriteria();
		cGroupViewCri.andContentIdEqualTo(contentId);
		return contentGroupViewDAO.selectByExample(example);
	}

	public List<ContentTopicKey> findContentTopicKey(Integer contentId) {
		ContentTopicExample example=new ContentTopicExample();
		ContentTopicExample.Criteria cTopicCri=example.createCriteria();
		cTopicCri.andContentIdEqualTo(contentId);
		return contentTopicDAO.selectByExample(example);
	}

	
}
