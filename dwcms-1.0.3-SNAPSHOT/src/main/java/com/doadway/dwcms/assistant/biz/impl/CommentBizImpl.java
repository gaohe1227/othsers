package com.doadway.dwcms.assistant.biz.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.biz.CommentBiz;
import com.doadway.dwcms.assistant.dao.CommentExtMapper;
import com.doadway.dwcms.assistant.dao.CommentMapper;
import com.doadway.dwcms.assistant.pojo.Comment;
import com.doadway.dwcms.assistant.pojo.CommentExtExample;
import com.doadway.dwcms.assistant.pojo.CommentExtWithBLOBs;
import com.doadway.dwcms.assistant.pojo.dto.CommentDTO;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.user.biz.UserBiz;
@Service
public class CommentBizImpl implements CommentBiz {
	@Resource
	CommentMapper commentDAO;
	@Resource
	CommentExtMapper commentExtDAO;
	@Resource
	ContentBiz     contentBiz;
	@Resource
	UserBiz     userBiz;
	public boolean batchDeleteComment(String[] commentIds) {
		Integer flag=0;
		for(String id:commentIds){
			CommentExtExample example=new CommentExtExample();
			CommentExtExample.Criteria commentExtCri = example.createCriteria();
			commentExtCri.andCommentIdEqualTo(Integer.parseInt(id));
			commentExtDAO.deleteByExample(example);
			
			commentDAO.deleteByPrimaryKey(Integer.parseInt(id));
			
			flag++;
		}
		if(flag==commentIds.length){
			return true;
		}
		return false;
	}

	public CommentDTO findCommentById(Integer commentId) {
		CommentDTO commentDto = new CommentDTO();
		Comment comment=commentDAO.selectByPrimaryKey(commentId);
		if(comment!=null){
			BeanUtils.copyProperties(comment, commentDto);
			commentDto.setContentTitle(contentBiz.findContentById(comment.getContentId()+"").getTitle());
			commentDto.setCommentUsername(userBiz.findUserById(comment.getCommentUserId()).getUsername());
		}
		CommentExtExample example=new CommentExtExample();
		CommentExtExample.Criteria commentExtCri = example.createCriteria();
		commentExtCri.andCommentIdEqualTo(commentId);
		List<CommentExtWithBLOBs> commentExtWithBLOBsList=commentExtDAO.selectByExampleWithBLOBs(example);

		commentDto.setCommentExtWithBLOBsList(commentExtWithBLOBsList);
		if(commentExtWithBLOBsList.size()>0){
			BeanUtils.copyProperties(commentExtWithBLOBsList.get(0), commentDto);
		}		
		return commentDto;
	}

	public List<CommentDTO> findCommentByPage(Page page, Map<String, Object> params) {
		List<CommentDTO> commentDtoList = new ArrayList<CommentDTO>();
		List<Comment> commentList=commentDAO.selectByPage(page,params);
		if(commentList!=null){
			for(Comment c:commentList){
				CommentDTO cDto  = new CommentDTO();
				BeanUtils.copyProperties(c, cDto);
				cDto.setContentTitle(contentBiz.findContentById(c.getContentId()+"").getTitle());
				cDto.setCommentUsername(userBiz.findUserById(c.getCommentUserId()).getUsername());
				
				CommentExtExample example=new CommentExtExample();
				CommentExtExample.Criteria commentExtCri = example.createCriteria();
				commentExtCri.andCommentIdEqualTo(c.getCommentId());
				List<CommentExtWithBLOBs> commentExtWithBLOBsList=commentExtDAO.selectByExampleWithBLOBs(example);				
				cDto.setCommentExtWithBLOBsList(commentExtWithBLOBsList);
				
				if(commentExtWithBLOBsList.size()>0){
					BeanUtils.copyProperties(commentExtWithBLOBsList.get(0), cDto);
				}
				commentDtoList.add(cDto);
			}
		}
		return commentDtoList;
	}

	public boolean saveOrUpdateComment(CommentDTO commentDto) {
		if(commentDto==null){return false;}
		if(findCommentById(commentDto.getCommentId())!=null){
			Comment comment = new Comment();
			BeanUtils.copyProperties(commentDto, comment);
			commentDAO.updateByPrimaryKeySelective(comment);
				
			if(commentDto.getText()!=null||commentDto.getReply()!=null){
				CommentExtWithBLOBs commentExtWithBLOBs=new CommentExtWithBLOBs();
				BeanUtils.copyProperties(commentDto, commentExtWithBLOBs);

				CommentExtExample example=new CommentExtExample();
				CommentExtExample.Criteria commentExtCri = example.createCriteria();
				commentExtCri.andCommentIdEqualTo(commentDto.getCommentId());
				commentExtDAO.updateByExampleSelective(commentExtWithBLOBs, example);
			}
			return true;
		}else{
			Comment comment = new Comment();
			BeanUtils.copyProperties(commentDto, comment);
			commentDAO.insert(comment);
				
			if(commentDto.getText()!=null||commentDto.getReply()!=null){
				CommentExtWithBLOBs commentExtWithBLOBs=new CommentExtWithBLOBs();
				BeanUtils.copyProperties(commentDto, commentExtWithBLOBs);

				CommentExtExample example=new CommentExtExample();
				CommentExtExample.Criteria commentExtCri = example.createCriteria();
				commentExtCri.andCommentIdEqualTo(commentDto.getCommentId());
				commentExtDAO.insert(commentExtWithBLOBs);
			}
			return true;
		}
	}

}
