package com.doadway.dwcms.core.channel.pojo;

import java.util.ArrayList;
import java.util.List;

public class ChannelExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ChannelExample() {
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

        public Criteria andChannelIdIsNull() {
            addCriterion("channel_id is null");
            return (Criteria) this;
        }

        public Criteria andChannelIdIsNotNull() {
            addCriterion("channel_id is not null");
            return (Criteria) this;
        }

        public Criteria andChannelIdEqualTo(Integer value) {
            addCriterion("channel_id =", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotEqualTo(Integer value) {
            addCriterion("channel_id <>", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdGreaterThan(Integer value) {
            addCriterion("channel_id >", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("channel_id >=", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdLessThan(Integer value) {
            addCriterion("channel_id <", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdLessThanOrEqualTo(Integer value) {
            addCriterion("channel_id <=", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdIn(List<Integer> values) {
            addCriterion("channel_id in", values, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotIn(List<Integer> values) {
            addCriterion("channel_id not in", values, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdBetween(Integer value1, Integer value2) {
            addCriterion("channel_id between", value1, value2, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotBetween(Integer value1, Integer value2) {
            addCriterion("channel_id not between", value1, value2, "channelId");
            return (Criteria) this;
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

        public Criteria andSiteIdIsNull() {
            addCriterion("site_id is null");
            return (Criteria) this;
        }

        public Criteria andSiteIdIsNotNull() {
            addCriterion("site_id is not null");
            return (Criteria) this;
        }

        public Criteria andSiteIdEqualTo(Integer value) {
            addCriterion("site_id =", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdNotEqualTo(Integer value) {
            addCriterion("site_id <>", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdGreaterThan(Integer value) {
            addCriterion("site_id >", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("site_id >=", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdLessThan(Integer value) {
            addCriterion("site_id <", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdLessThanOrEqualTo(Integer value) {
            addCriterion("site_id <=", value, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdIn(List<Integer> values) {
            addCriterion("site_id in", values, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdNotIn(List<Integer> values) {
            addCriterion("site_id not in", values, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdBetween(Integer value1, Integer value2) {
            addCriterion("site_id between", value1, value2, "siteId");
            return (Criteria) this;
        }

        public Criteria andSiteIdNotBetween(Integer value1, Integer value2) {
            addCriterion("site_id not between", value1, value2, "siteId");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNull() {
            addCriterion("parent_id is null");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNotNull() {
            addCriterion("parent_id is not null");
            return (Criteria) this;
        }

        public Criteria andParentIdEqualTo(Integer value) {
            addCriterion("parent_id =", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotEqualTo(Integer value) {
            addCriterion("parent_id <>", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThan(Integer value) {
            addCriterion("parent_id >", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("parent_id >=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThan(Integer value) {
            addCriterion("parent_id <", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThanOrEqualTo(Integer value) {
            addCriterion("parent_id <=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdIn(List<Integer> values) {
            addCriterion("parent_id in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotIn(List<Integer> values) {
            addCriterion("parent_id not in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdBetween(Integer value1, Integer value2) {
            addCriterion("parent_id between", value1, value2, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("parent_id not between", value1, value2, "parentId");
            return (Criteria) this;
        }

        public Criteria andChannelPathIsNull() {
            addCriterion("channel_path is null");
            return (Criteria) this;
        }

        public Criteria andChannelPathIsNotNull() {
            addCriterion("channel_path is not null");
            return (Criteria) this;
        }

        public Criteria andChannelPathEqualTo(String value) {
            addCriterion("channel_path =", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathNotEqualTo(String value) {
            addCriterion("channel_path <>", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathGreaterThan(String value) {
            addCriterion("channel_path >", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathGreaterThanOrEqualTo(String value) {
            addCriterion("channel_path >=", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathLessThan(String value) {
            addCriterion("channel_path <", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathLessThanOrEqualTo(String value) {
            addCriterion("channel_path <=", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathLike(String value) {
            addCriterion("channel_path like", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathNotLike(String value) {
            addCriterion("channel_path not like", value, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathIn(List<String> values) {
            addCriterion("channel_path in", values, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathNotIn(List<String> values) {
            addCriterion("channel_path not in", values, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathBetween(String value1, String value2) {
            addCriterion("channel_path between", value1, value2, "channelPath");
            return (Criteria) this;
        }

        public Criteria andChannelPathNotBetween(String value1, String value2) {
            addCriterion("channel_path not between", value1, value2, "channelPath");
            return (Criteria) this;
        }

        public Criteria andLftIsNull() {
            addCriterion("lft is null");
            return (Criteria) this;
        }

        public Criteria andLftIsNotNull() {
            addCriterion("lft is not null");
            return (Criteria) this;
        }

        public Criteria andLftEqualTo(Integer value) {
            addCriterion("lft =", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftNotEqualTo(Integer value) {
            addCriterion("lft <>", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftGreaterThan(Integer value) {
            addCriterion("lft >", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftGreaterThanOrEqualTo(Integer value) {
            addCriterion("lft >=", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftLessThan(Integer value) {
            addCriterion("lft <", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftLessThanOrEqualTo(Integer value) {
            addCriterion("lft <=", value, "lft");
            return (Criteria) this;
        }

        public Criteria andLftIn(List<Integer> values) {
            addCriterion("lft in", values, "lft");
            return (Criteria) this;
        }

        public Criteria andLftNotIn(List<Integer> values) {
            addCriterion("lft not in", values, "lft");
            return (Criteria) this;
        }

        public Criteria andLftBetween(Integer value1, Integer value2) {
            addCriterion("lft between", value1, value2, "lft");
            return (Criteria) this;
        }

        public Criteria andLftNotBetween(Integer value1, Integer value2) {
            addCriterion("lft not between", value1, value2, "lft");
            return (Criteria) this;
        }

        public Criteria andRgtIsNull() {
            addCriterion("rgt is null");
            return (Criteria) this;
        }

        public Criteria andRgtIsNotNull() {
            addCriterion("rgt is not null");
            return (Criteria) this;
        }

        public Criteria andRgtEqualTo(Integer value) {
            addCriterion("rgt =", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtNotEqualTo(Integer value) {
            addCriterion("rgt <>", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtGreaterThan(Integer value) {
            addCriterion("rgt >", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtGreaterThanOrEqualTo(Integer value) {
            addCriterion("rgt >=", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtLessThan(Integer value) {
            addCriterion("rgt <", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtLessThanOrEqualTo(Integer value) {
            addCriterion("rgt <=", value, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtIn(List<Integer> values) {
            addCriterion("rgt in", values, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtNotIn(List<Integer> values) {
            addCriterion("rgt not in", values, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtBetween(Integer value1, Integer value2) {
            addCriterion("rgt between", value1, value2, "rgt");
            return (Criteria) this;
        }

        public Criteria andRgtNotBetween(Integer value1, Integer value2) {
            addCriterion("rgt not between", value1, value2, "rgt");
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

        public Criteria andIsDisplayIsNull() {
            addCriterion("is_display is null");
            return (Criteria) this;
        }

        public Criteria andIsDisplayIsNotNull() {
            addCriterion("is_display is not null");
            return (Criteria) this;
        }

        public Criteria andIsDisplayEqualTo(Boolean value) {
            addCriterion("is_display =", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotEqualTo(Boolean value) {
            addCriterion("is_display <>", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayGreaterThan(Boolean value) {
            addCriterion("is_display >", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_display >=", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayLessThan(Boolean value) {
            addCriterion("is_display <", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayLessThanOrEqualTo(Boolean value) {
            addCriterion("is_display <=", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayIn(List<Boolean> values) {
            addCriterion("is_display in", values, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotIn(List<Boolean> values) {
            addCriterion("is_display not in", values, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayBetween(Boolean value1, Boolean value2) {
            addCriterion("is_display between", value1, value2, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_display not between", value1, value2, "isDisplay");
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