package com.doadway.dwcms.assistant.biz;

import java.util.List;
import java.util.Map;

import com.doadway.common.page.Page;
import com.doadway.dwcms.assistant.pojo.dto.CommentDTO;

public interface CommentBiz {
	public boolean saveOrUpdateComment(CommentDTO commentDto);
	
	public boolean batchDeleteComment(String[] commentIds);
	
	
	public List<CommentDTO> findCommentByPage(Page page,Map<String,Object> params);
	
	public CommentDTO  findCommentById(Integer commentId);
}
