package com.doadway.dwcms.core.config.pojo;

import java.util.ArrayList;
import java.util.List;

public class ModelExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ModelExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andModelIdIsNull() {
            addCriterion("model_id is null");
            return (Criteria) this;
        }

        public Criteria andModelIdIsNotNull() {
            addCriterion("model_id is not null");
            return (Criteria) this;
        }

        public Criteria andModelIdEqualTo(Integer value) {
            addCriterion("model_id =", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotEqualTo(Integer value) {
            addCriterion("model_id <>", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdGreaterThan(Integer value) {
            addCriterion("model_id >", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("model_id >=", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdLessThan(Integer value) {
            addCriterion("model_id <", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdLessThanOrEqualTo(Integer value) {
            addCriterion("model_id <=", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdIn(List<Integer> values) {
            addCriterion("model_id in", values, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotIn(List<Integer> values) {
            addCriterion("model_id not in", values, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdBetween(Integer value1, Integer value2) {
            addCriterion("model_id between", value1, value2, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotBetween(Integer value1, Integer value2) {
            addCriterion("model_id not between", value1, value2, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelNameIsNull() {
            addCriterion("model_name is null");
            return (Criteria) this;
        }

        public Criteria andModelNameIsNotNull() {
            addCriterion("model_name is not null");
            return (Criteria) this;
        }

        public Criteria andModelNameEqualTo(String value) {
            addCriterion("model_name =", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameNotEqualTo(String value) {
            addCriterion("model_name <>", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameGreaterThan(String value) {
            addCriterion("model_name >", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameGreaterThanOrEqualTo(String value) {
            addCriterion("model_name >=", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameLessThan(String value) {
            addCriterion("model_name <", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameLessThanOrEqualTo(String value) {
            addCriterion("model_name <=", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameLike(String value) {
            addCriterion("model_name like", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameNotLike(String value) {
            addCriterion("model_name not like", value, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameIn(List<String> values) {
            addCriterion("model_name in", values, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameNotIn(List<String> values) {
            addCriterion("model_name not in", values, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameBetween(String value1, String value2) {
            addCriterion("model_name between", value1, value2, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelNameNotBetween(String value1, String value2) {
            addCriterion("model_name not between", value1, value2, "modelName");
            return (Criteria) this;
        }

        public Criteria andModelPathIsNull() {
            addCriterion("model_path is null");
            return (Criteria) this;
        }

        public Criteria andModelPathIsNotNull() {
            addCriterion("model_path is not null");
            return (Criteria) this;
        }

        public Criteria andModelPathEqualTo(String value) {
            addCriterion("model_path =", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathNotEqualTo(String value) {
            addCriterion("model_path <>", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathGreaterThan(String value) {
            addCriterion("model_path >", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathGreaterThanOrEqualTo(String value) {
            addCriterion("model_path >=", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathLessThan(String value) {
            addCriterion("model_path <", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathLessThanOrEqualTo(String value) {
            addCriterion("model_path <=", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathLike(String value) {
            addCriterion("model_path like", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathNotLike(String value) {
            addCriterion("model_path not like", value, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathIn(List<String> values) {
            addCriterion("model_path in", values, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathNotIn(List<String> values) {
            addCriterion("model_path not in", values, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathBetween(String value1, String value2) {
            addCriterion("model_path between", value1, value2, "modelPath");
            return (Criteria) this;
        }

        public Criteria andModelPathNotBetween(String value1, String value2) {
            addCriterion("model_path not between", value1, value2, "modelPath");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixIsNull() {
            addCriterion("tpl_channel_prefix is null");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixIsNotNull() {
            addCriterion("tpl_channel_prefix is not null");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixEqualTo(String value) {
            addCriterion("tpl_channel_prefix =", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixNotEqualTo(String value) {
            addCriterion("tpl_channel_prefix <>", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixGreaterThan(String value) {
            addCriterion("tpl_channel_prefix >", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_channel_prefix >=", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixLessThan(String value) {
            addCriterion("tpl_channel_prefix <", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixLessThanOrEqualTo(String value) {
            addCriterion("tpl_channel_prefix <=", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixLike(String value) {
            addCriterion("tpl_channel_prefix like", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixNotLike(String value) {
            addCriterion("tpl_channel_prefix not like", value, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixIn(List<String> values) {
            addCriterion("tpl_channel_prefix in", values, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixNotIn(List<String> values) {
            addCriterion("tpl_channel_prefix not in", values, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixBetween(String value1, String value2) {
            addCriterion("tpl_channel_prefix between", value1, value2, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplChannelPrefixNotBetween(String value1, String value2) {
            addCriterion("tpl_channel_prefix not between", value1, value2, "tplChannelPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixIsNull() {
            addCriterion("tpl_content_prefix is null");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixIsNotNull() {
            addCriterion("tpl_content_prefix is not null");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixEqualTo(String value) {
            addCriterion("tpl_content_prefix =", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixNotEqualTo(String value) {
            addCriterion("tpl_content_prefix <>", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixGreaterThan(String value) {
            addCriterion("tpl_content_prefix >", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_content_prefix >=", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixLessThan(String value) {
            addCriterion("tpl_content_prefix <", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixLessThanOrEqualTo(String value) {
            addCriterion("tpl_content_prefix <=", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixLike(String value) {
            addCriterion("tpl_content_prefix like", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixNotLike(String value) {
            addCriterion("tpl_content_prefix not like", value, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixIn(List<String> values) {
            addCriterion("tpl_content_prefix in", values, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixNotIn(List<String> values) {
            addCriterion("tpl_content_prefix not in", values, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixBetween(String value1, String value2) {
            addCriterion("tpl_content_prefix between", value1, value2, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTplContentPrefixNotBetween(String value1, String value2) {
            addCriterion("tpl_content_prefix not between", value1, value2, "tplContentPrefix");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthIsNull() {
            addCriterion("title_img_width is null");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthIsNotNull() {
            addCriterion("title_img_width is not null");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthEqualTo(Integer value) {
            addCriterion("title_img_width =", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthNotEqualTo(Integer value) {
            addCriterion("title_img_width <>", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthGreaterThan(Integer value) {
            addCriterion("title_img_width >", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthGreaterThanOrEqualTo(Integer value) {
            addCriterion("title_img_width >=", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthLessThan(Integer value) {
            addCriterion("title_img_width <", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthLessThanOrEqualTo(Integer value) {
            addCriterion("title_img_width <=", value, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthIn(List<Integer> values) {
            addCriterion("title_img_width in", values, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthNotIn(List<Integer> values) {
            addCriterion("title_img_width not in", values, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthBetween(Integer value1, Integer value2) {
            addCriterion("title_img_width between", value1, value2, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgWidthNotBetween(Integer value1, Integer value2) {
            addCriterion("title_img_width not between", value1, value2, "titleImgWidth");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightIsNull() {
            addCriterion("title_img_height is null");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightIsNotNull() {
            addCriterion("title_img_height is not null");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightEqualTo(Integer value) {
            addCriterion("title_img_height =", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightNotEqualTo(Integer value) {
            addCriterion("title_img_height <>", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightGreaterThan(Integer value) {
            addCriterion("title_img_height >", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("title_img_height >=", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightLessThan(Integer value) {
            addCriterion("title_img_height <", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightLessThanOrEqualTo(Integer value) {
            addCriterion("title_img_height <=", value, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightIn(List<Integer> values) {
            addCriterion("title_img_height in", values, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightNotIn(List<Integer> values) {
            addCriterion("title_img_height not in", values, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightBetween(Integer value1, Integer value2) {
            addCriterion("title_img_height between", value1, value2, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andTitleImgHeightNotBetween(Integer value1, Integer value2) {
            addCriterion("title_img_height not between", value1, value2, "titleImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthIsNull() {
            addCriterion("content_img_width is null");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthIsNotNull() {
            addCriterion("content_img_width is not null");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthEqualTo(Integer value) {
            addCriterion("content_img_width =", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthNotEqualTo(Integer value) {
            addCriterion("content_img_width <>", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthGreaterThan(Integer value) {
            addCriterion("content_img_width >", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthGreaterThanOrEqualTo(Integer value) {
            addCriterion("content_img_width >=", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthLessThan(Integer value) {
            addCriterion("content_img_width <", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthLessThanOrEqualTo(Integer value) {
            addCriterion("content_img_width <=", value, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthIn(List<Integer> values) {
            addCriterion("content_img_width in", values, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthNotIn(List<Integer> values) {
            addCriterion("content_img_width not in", values, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthBetween(Integer value1, Integer value2) {
            addCriterion("content_img_width between", value1, value2, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgWidthNotBetween(Integer value1, Integer value2) {
            addCriterion("content_img_width not between", value1, value2, "contentImgWidth");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightIsNull() {
            addCriterion("content_img_height is null");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightIsNotNull() {
            addCriterion("content_img_height is not null");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightEqualTo(Integer value) {
            addCriterion("content_img_height =", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightNotEqualTo(Integer value) {
            addCriterion("content_img_height <>", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightGreaterThan(Integer value) {
            addCriterion("content_img_height >", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("content_img_height >=", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightLessThan(Integer value) {
            addCriterion("content_img_height <", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightLessThanOrEqualTo(Integer value) {
            addCriterion("content_img_height <=", value, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightIn(List<Integer> values) {
            addCriterion("content_img_height in", values, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightNotIn(List<Integer> values) {
            addCriterion("content_img_height not in", values, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightBetween(Integer value1, Integer value2) {
            addCriterion("content_img_height between", value1, value2, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andContentImgHeightNotBetween(Integer value1, Integer value2) {
            addCriterion("content_img_height not between", value1, value2, "contentImgHeight");
            return (Criteria) this;
        }

        public Criteria andPriorityIsNull() {
            addCriterion("priority is null");
            return (Criteria) this;
        }

        public Criteria andPriorityIsNotNull() {
            addCriterion("priority is not null");
            return (Criteria) this;
        }

        public Criteria andPriorityEqualTo(Integer value) {
            addCriterion("priority =", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityNotEqualTo(Integer value) {
            addCriterion("priority <>", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityGreaterThan(Integer value) {
            addCriterion("priority >", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityGreaterThanOrEqualTo(Integer value) {
            addCriterion("priority >=", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityLessThan(Integer value) {
            addCriterion("priority <", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityLessThanOrEqualTo(Integer value) {
            addCriterion("priority <=", value, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityIn(List<Integer> values) {
            addCriterion("priority in", values, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityNotIn(List<Integer> values) {
            addCriterion("priority not in", values, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityBetween(Integer value1, Integer value2) {
            addCriterion("priority between", value1, value2, "priority");
            return (Criteria) this;
        }

        public Criteria andPriorityNotBetween(Integer value1, Integer value2) {
            addCriterion("priority not between", value1, value2, "priority");
            return (Criteria) this;
        }

        public Criteria andHasContentIsNull() {
            addCriterion("has_content is null");
            return (Criteria) this;
        }

        public Criteria andHasContentIsNotNull() {
            addCriterion("has_content is not null");
            return (Criteria) this;
        }

        public Criteria andHasContentEqualTo(Boolean value) {
            addCriterion("has_content =", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentNotEqualTo(Boolean value) {
            addCriterion("has_content <>", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentGreaterThan(Boolean value) {
            addCriterion("has_content >", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentGreaterThanOrEqualTo(Boolean value) {
            addCriterion("has_content >=", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentLessThan(Boolean value) {
            addCriterion("has_content <", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentLessThanOrEqualTo(Boolean value) {
            addCriterion("has_content <=", value, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentIn(List<Boolean> values) {
            addCriterion("has_content in", values, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentNotIn(List<Boolean> values) {
            addCriterion("has_content not in", values, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentBetween(Boolean value1, Boolean value2) {
            addCriterion("has_content between", value1, value2, "hasContent");
            return (Criteria) this;
        }

        public Criteria andHasContentNotBetween(Boolean value1, Boolean value2) {
            addCriterion("has_content not between", value1, value2, "hasContent");
            return (Criteria) this;
        }

        public Criteria andIsDisabledIsNull() {
            addCriterion("is_disabled is null");
            return (Criteria) this;
        }

        public Criteria andIsDisabledIsNotNull() {
            addCriterion("is_disabled is not null");
            return (Criteria) this;
        }

        public Criteria andIsDisabledEqualTo(Boolean value) {
            addCriterion("is_disabled =", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledNotEqualTo(Boolean value) {
            addCriterion("is_disabled <>", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledGreaterThan(Boolean value) {
            addCriterion("is_disabled >", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_disabled >=", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledLessThan(Boolean value) {
            addCriterion("is_disabled <", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledLessThanOrEqualTo(Boolean value) {
            addCriterion("is_disabled <=", value, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledIn(List<Boolean> values) {
            addCriterion("is_disabled in", values, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledNotIn(List<Boolean> values) {
            addCriterion("is_disabled not in", values, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledBetween(Boolean value1, Boolean value2) {
            addCriterion("is_disabled between", value1, value2, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDisabledNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_disabled not between", value1, value2, "isDisabled");
            return (Criteria) this;
        }

        public Criteria andIsDefIsNull() {
            addCriterion("is_def is null");
            return (Criteria) this;
        }

        public Criteria andIsDefIsNotNull() {
            addCriterion("is_def is not null");
            return (Criteria) this;
        }

        public Criteria andIsDefEqualTo(Boolean value) {
            addCriterion("is_def =", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefNotEqualTo(Boolean value) {
            addCriterion("is_def <>", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefGreaterThan(Boolean value) {
            addCriterion("is_def >", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_def >=", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefLessThan(Boolean value) {
            addCriterion("is_def <", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefLessThanOrEqualTo(Boolean value) {
            addCriterion("is_def <=", value, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefIn(List<Boolean> values) {
            addCriterion("is_def in", values, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefNotIn(List<Boolean> values) {
            addCriterion("is_def not in", values, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefBetween(Boolean value1, Boolean value2) {
            addCriterion("is_def between", value1, value2, "isDef");
            return (Criteria) this;
        }

        public Criteria andIsDefNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_def not between", value1, value2, "isDef");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}