package com.doadway.dwcms.core.channel.pojo;

import java.util.ArrayList;
import java.util.List;

public class ChannelExtExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ChannelExtExample() {
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

        public Criteria andChannelNameIsNull() {
            addCriterion("channel_name is null");
            return (Criteria) this;
        }

        public Criteria andChannelNameIsNotNull() {
            addCriterion("channel_name is not null");
            return (Criteria) this;
        }

        public Criteria andChannelNameEqualTo(String value) {
            addCriterion("channel_name =", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotEqualTo(String value) {
            addCriterion("channel_name <>", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameGreaterThan(String value) {
            addCriterion("channel_name >", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameGreaterThanOrEqualTo(String value) {
            addCriterion("channel_name >=", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLessThan(String value) {
            addCriterion("channel_name <", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLessThanOrEqualTo(String value) {
            addCriterion("channel_name <=", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameLike(String value) {
            addCriterion("channel_name like", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotLike(String value) {
            addCriterion("channel_name not like", value, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameIn(List<String> values) {
            addCriterion("channel_name in", values, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotIn(List<String> values) {
            addCriterion("channel_name not in", values, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameBetween(String value1, String value2) {
            addCriterion("channel_name between", value1, value2, "channelName");
            return (Criteria) this;
        }

        public Criteria andChannelNameNotBetween(String value1, String value2) {
            addCriterion("channel_name not between", value1, value2, "channelName");
            return (Criteria) this;
        }

        public Criteria andFinalStepIsNull() {
            addCriterion("final_step is null");
            return (Criteria) this;
        }

        public Criteria andFinalStepIsNotNull() {
            addCriterion("final_step is not null");
            return (Criteria) this;
        }

        public Criteria andFinalStepEqualTo(Byte value) {
            addCriterion("final_step =", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotEqualTo(Byte value) {
            addCriterion("final_step <>", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepGreaterThan(Byte value) {
            addCriterion("final_step >", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepGreaterThanOrEqualTo(Byte value) {
            addCriterion("final_step >=", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepLessThan(Byte value) {
            addCriterion("final_step <", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepLessThanOrEqualTo(Byte value) {
            addCriterion("final_step <=", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepIn(List<Byte> values) {
            addCriterion("final_step in", values, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotIn(List<Byte> values) {
            addCriterion("final_step not in", values, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepBetween(Byte value1, Byte value2) {
            addCriterion("final_step between", value1, value2, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotBetween(Byte value1, Byte value2) {
            addCriterion("final_step not between", value1, value2, "finalStep");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIsNull() {
            addCriterion("after_check is null");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIsNotNull() {
            addCriterion("after_check is not null");
            return (Criteria) this;
        }

        public Criteria andAfterCheckEqualTo(Byte value) {
            addCriterion("after_check =", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotEqualTo(Byte value) {
            addCriterion("after_check <>", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckGreaterThan(Byte value) {
            addCriterion("after_check >", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckGreaterThanOrEqualTo(Byte value) {
            addCriterion("after_check >=", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckLessThan(Byte value) {
            addCriterion("after_check <", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckLessThanOrEqualTo(Byte value) {
            addCriterion("after_check <=", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIn(List<Byte> values) {
            addCriterion("after_check in", values, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotIn(List<Byte> values) {
            addCriterion("after_check not in", values, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckBetween(Byte value1, Byte value2) {
            addCriterion("after_check between", value1, value2, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotBetween(Byte value1, Byte value2) {
            addCriterion("after_check not between", value1, value2, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelIsNull() {
            addCriterion("is_static_channel is null");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelIsNotNull() {
            addCriterion("is_static_channel is not null");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelEqualTo(String value) {
            addCriterion("is_static_channel =", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelNotEqualTo(String value) {
            addCriterion("is_static_channel <>", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelGreaterThan(String value) {
            addCriterion("is_static_channel >", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelGreaterThanOrEqualTo(String value) {
            addCriterion("is_static_channel >=", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelLessThan(String value) {
            addCriterion("is_static_channel <", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelLessThanOrEqualTo(String value) {
            addCriterion("is_static_channel <=", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelLike(String value) {
            addCriterion("is_static_channel like", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelNotLike(String value) {
            addCriterion("is_static_channel not like", value, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelIn(List<String> values) {
            addCriterion("is_static_channel in", values, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelNotIn(List<String> values) {
            addCriterion("is_static_channel not in", values, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelBetween(String value1, String value2) {
            addCriterion("is_static_channel between", value1, value2, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticChannelNotBetween(String value1, String value2) {
            addCriterion("is_static_channel not between", value1, value2, "isStaticChannel");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentIsNull() {
            addCriterion("is_static_content is null");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentIsNotNull() {
            addCriterion("is_static_content is not null");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentEqualTo(String value) {
            addCriterion("is_static_content =", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentNotEqualTo(String value) {
            addCriterion("is_static_content <>", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentGreaterThan(String value) {
            addCriterion("is_static_content >", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentGreaterThanOrEqualTo(String value) {
            addCriterion("is_static_content >=", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentLessThan(String value) {
            addCriterion("is_static_content <", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentLessThanOrEqualTo(String value) {
            addCriterion("is_static_content <=", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentLike(String value) {
            addCriterion("is_static_content like", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentNotLike(String value) {
            addCriterion("is_static_content not like", value, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentIn(List<String> values) {
            addCriterion("is_static_content in", values, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentNotIn(List<String> values) {
            addCriterion("is_static_content not in", values, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentBetween(String value1, String value2) {
            addCriterion("is_static_content between", value1, value2, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsStaticContentNotBetween(String value1, String value2) {
            addCriterion("is_static_content not between", value1, value2, "isStaticContent");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirIsNull() {
            addCriterion("is_access_by_dir is null");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirIsNotNull() {
            addCriterion("is_access_by_dir is not null");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirEqualTo(String value) {
            addCriterion("is_access_by_dir =", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirNotEqualTo(String value) {
            addCriterion("is_access_by_dir <>", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirGreaterThan(String value) {
            addCriterion("is_access_by_dir >", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirGreaterThanOrEqualTo(String value) {
            addCriterion("is_access_by_dir >=", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirLessThan(String value) {
            addCriterion("is_access_by_dir <", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirLessThanOrEqualTo(String value) {
            addCriterion("is_access_by_dir <=", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirLike(String value) {
            addCriterion("is_access_by_dir like", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirNotLike(String value) {
            addCriterion("is_access_by_dir not like", value, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirIn(List<String> values) {
            addCriterion("is_access_by_dir in", values, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirNotIn(List<String> values) {
            addCriterion("is_access_by_dir not in", values, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirBetween(String value1, String value2) {
            addCriterion("is_access_by_dir between", value1, value2, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsAccessByDirNotBetween(String value1, String value2) {
            addCriterion("is_access_by_dir not between", value1, value2, "isAccessByDir");
            return (Criteria) this;
        }

        public Criteria andIsListChildIsNull() {
            addCriterion("is_list_child is null");
            return (Criteria) this;
        }

        public Criteria andIsListChildIsNotNull() {
            addCriterion("is_list_child is not null");
            return (Criteria) this;
        }

        public Criteria andIsListChildEqualTo(String value) {
            addCriterion("is_list_child =", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildNotEqualTo(String value) {
            addCriterion("is_list_child <>", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildGreaterThan(String value) {
            addCriterion("is_list_child >", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildGreaterThanOrEqualTo(String value) {
            addCriterion("is_list_child >=", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildLessThan(String value) {
            addCriterion("is_list_child <", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildLessThanOrEqualTo(String value) {
            addCriterion("is_list_child <=", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildLike(String value) {
            addCriterion("is_list_child like", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildNotLike(String value) {
            addCriterion("is_list_child not like", value, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildIn(List<String> values) {
            addCriterion("is_list_child in", values, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildNotIn(List<String> values) {
            addCriterion("is_list_child not in", values, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildBetween(String value1, String value2) {
            addCriterion("is_list_child between", value1, value2, "isListChild");
            return (Criteria) this;
        }

        public Criteria andIsListChildNotBetween(String value1, String value2) {
            addCriterion("is_list_child not between", value1, value2, "isListChild");
            return (Criteria) this;
        }

        public Criteria andPageSizeIsNull() {
            addCriterion("page_size is null");
            return (Criteria) this;
        }

        public Criteria andPageSizeIsNotNull() {
            addCriterion("page_size is not null");
            return (Criteria) this;
        }

        public Criteria andPageSizeEqualTo(Integer value) {
            addCriterion("page_size =", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeNotEqualTo(Integer value) {
            addCriterion("page_size <>", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeGreaterThan(Integer value) {
            addCriterion("page_size >", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeGreaterThanOrEqualTo(Integer value) {
            addCriterion("page_size >=", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeLessThan(Integer value) {
            addCriterion("page_size <", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeLessThanOrEqualTo(Integer value) {
            addCriterion("page_size <=", value, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeIn(List<Integer> values) {
            addCriterion("page_size in", values, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeNotIn(List<Integer> values) {
            addCriterion("page_size not in", values, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeBetween(Integer value1, Integer value2) {
            addCriterion("page_size between", value1, value2, "pageSize");
            return (Criteria) this;
        }

        public Criteria andPageSizeNotBetween(Integer value1, Integer value2) {
            addCriterion("page_size not between", value1, value2, "pageSize");
            return (Criteria) this;
        }

        public Criteria andChannelRuleIsNull() {
            addCriterion("channel_rule is null");
            return (Criteria) this;
        }

        public Criteria andChannelRuleIsNotNull() {
            addCriterion("channel_rule is not null");
            return (Criteria) this;
        }

        public Criteria andChannelRuleEqualTo(String value) {
            addCriterion("channel_rule =", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleNotEqualTo(String value) {
            addCriterion("channel_rule <>", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleGreaterThan(String value) {
            addCriterion("channel_rule >", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleGreaterThanOrEqualTo(String value) {
            addCriterion("channel_rule >=", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleLessThan(String value) {
            addCriterion("channel_rule <", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleLessThanOrEqualTo(String value) {
            addCriterion("channel_rule <=", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleLike(String value) {
            addCriterion("channel_rule like", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleNotLike(String value) {
            addCriterion("channel_rule not like", value, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleIn(List<String> values) {
            addCriterion("channel_rule in", values, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleNotIn(List<String> values) {
            addCriterion("channel_rule not in", values, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleBetween(String value1, String value2) {
            addCriterion("channel_rule between", value1, value2, "channelRule");
            return (Criteria) this;
        }

        public Criteria andChannelRuleNotBetween(String value1, String value2) {
            addCriterion("channel_rule not between", value1, value2, "channelRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleIsNull() {
            addCriterion("content_rule is null");
            return (Criteria) this;
        }

        public Criteria andContentRuleIsNotNull() {
            addCriterion("content_rule is not null");
            return (Criteria) this;
        }

        public Criteria andContentRuleEqualTo(String value) {
            addCriterion("content_rule =", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleNotEqualTo(String value) {
            addCriterion("content_rule <>", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleGreaterThan(String value) {
            addCriterion("content_rule >", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleGreaterThanOrEqualTo(String value) {
            addCriterion("content_rule >=", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleLessThan(String value) {
            addCriterion("content_rule <", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleLessThanOrEqualTo(String value) {
            addCriterion("content_rule <=", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleLike(String value) {
            addCriterion("content_rule like", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleNotLike(String value) {
            addCriterion("content_rule not like", value, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleIn(List<String> values) {
            addCriterion("content_rule in", values, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleNotIn(List<String> values) {
            addCriterion("content_rule not in", values, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleBetween(String value1, String value2) {
            addCriterion("content_rule between", value1, value2, "contentRule");
            return (Criteria) this;
        }

        public Criteria andContentRuleNotBetween(String value1, String value2) {
            addCriterion("content_rule not between", value1, value2, "contentRule");
            return (Criteria) this;
        }

        public Criteria andLinkIsNull() {
            addCriterion("link is null");
            return (Criteria) this;
        }

        public Criteria andLinkIsNotNull() {
            addCriterion("link is not null");
            return (Criteria) this;
        }

        public Criteria andLinkEqualTo(String value) {
            addCriterion("link =", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotEqualTo(String value) {
            addCriterion("link <>", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkGreaterThan(String value) {
            addCriterion("link >", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkGreaterThanOrEqualTo(String value) {
            addCriterion("link >=", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLessThan(String value) {
            addCriterion("link <", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLessThanOrEqualTo(String value) {
            addCriterion("link <=", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLike(String value) {
            addCriterion("link like", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotLike(String value) {
            addCriterion("link not like", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkIn(List<String> values) {
            addCriterion("link in", values, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotIn(List<String> values) {
            addCriterion("link not in", values, "link");
            return (Criteria) this;
        }

        public Criteria andLinkBetween(String value1, String value2) {
            addCriterion("link between", value1, value2, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotBetween(String value1, String value2) {
            addCriterion("link not between", value1, value2, "link");
            return (Criteria) this;
        }

        public Criteria andTplChannelIsNull() {
            addCriterion("tpl_channel is null");
            return (Criteria) this;
        }

        public Criteria andTplChannelIsNotNull() {
            addCriterion("tpl_channel is not null");
            return (Criteria) this;
        }

        public Criteria andTplChannelEqualTo(String value) {
            addCriterion("tpl_channel =", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelNotEqualTo(String value) {
            addCriterion("tpl_channel <>", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelGreaterThan(String value) {
            addCriterion("tpl_channel >", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_channel >=", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelLessThan(String value) {
            addCriterion("tpl_channel <", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelLessThanOrEqualTo(String value) {
            addCriterion("tpl_channel <=", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelLike(String value) {
            addCriterion("tpl_channel like", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelNotLike(String value) {
            addCriterion("tpl_channel not like", value, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelIn(List<String> values) {
            addCriterion("tpl_channel in", values, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelNotIn(List<String> values) {
            addCriterion("tpl_channel not in", values, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelBetween(String value1, String value2) {
            addCriterion("tpl_channel between", value1, value2, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplChannelNotBetween(String value1, String value2) {
            addCriterion("tpl_channel not between", value1, value2, "tplChannel");
            return (Criteria) this;
        }

        public Criteria andTplContentIsNull() {
            addCriterion("tpl_content is null");
            return (Criteria) this;
        }

        public Criteria andTplContentIsNotNull() {
            addCriterion("tpl_content is not null");
            return (Criteria) this;
        }

        public Criteria andTplContentEqualTo(String value) {
            addCriterion("tpl_content =", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotEqualTo(String value) {
            addCriterion("tpl_content <>", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentGreaterThan(String value) {
            addCriterion("tpl_content >", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_content >=", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLessThan(String value) {
            addCriterion("tpl_content <", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLessThanOrEqualTo(String value) {
            addCriterion("tpl_content <=", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLike(String value) {
            addCriterion("tpl_content like", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotLike(String value) {
            addCriterion("tpl_content not like", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentIn(List<String> values) {
            addCriterion("tpl_content in", values, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotIn(List<String> values) {
            addCriterion("tpl_content not in", values, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentBetween(String value1, String value2) {
            addCriterion("tpl_content between", value1, value2, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotBetween(String value1, String value2) {
            addCriterion("tpl_content not between", value1, value2, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTitleImgIsNull() {
            addCriterion("title_img is null");
            return (Criteria) this;
        }

        public Criteria andTitleImgIsNotNull() {
            addCriterion("title_img is not null");
            return (Criteria) this;
        }

        public Criteria andTitleImgEqualTo(String value) {
            addCriterion("title_img =", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotEqualTo(String value) {
            addCriterion("title_img <>", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgGreaterThan(String value) {
            addCriterion("title_img >", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgGreaterThanOrEqualTo(String value) {
            addCriterion("title_img >=", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLessThan(String value) {
            addCriterion("title_img <", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLessThanOrEqualTo(String value) {
            addCriterion("title_img <=", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLike(String value) {
            addCriterion("title_img like", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotLike(String value) {
            addCriterion("title_img not like", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgIn(List<String> values) {
            addCriterion("title_img in", values, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotIn(List<String> values) {
            addCriterion("title_img not in", values, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgBetween(String value1, String value2) {
            addCriterion("title_img between", value1, value2, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotBetween(String value1, String value2) {
            addCriterion("title_img not between", value1, value2, "titleImg");
            return (Criteria) this;
        }

        public Criteria andContentImgIsNull() {
            addCriterion("content_img is null");
            return (Criteria) this;
        }

        public Criteria andContentImgIsNotNull() {
            addCriterion("content_img is not null");
            return (Criteria) this;
        }

        public Criteria andContentImgEqualTo(String value) {
            addCriterion("content_img =", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotEqualTo(String value) {
            addCriterion("content_img <>", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgGreaterThan(String value) {
            addCriterion("content_img >", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgGreaterThanOrEqualTo(String value) {
            addCriterion("content_img >=", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLessThan(String value) {
            addCriterion("content_img <", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLessThanOrEqualTo(String value) {
            addCriterion("content_img <=", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLike(String value) {
            addCriterion("content_img like", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotLike(String value) {
            addCriterion("content_img not like", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgIn(List<String> values) {
            addCriterion("content_img in", values, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotIn(List<String> values) {
            addCriterion("content_img not in", values, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgBetween(String value1, String value2) {
            addCriterion("content_img between", value1, value2, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotBetween(String value1, String value2) {
            addCriterion("content_img not between", value1, value2, "contentImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIsNull() {
            addCriterion("has_title_img is null");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIsNotNull() {
            addCriterion("has_title_img is not null");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgEqualTo(Boolean value) {
            addCriterion("has_title_img =", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotEqualTo(Boolean value) {
            addCriterion("has_title_img <>", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgGreaterThan(Boolean value) {
            addCriterion("has_title_img >", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgGreaterThanOrEqualTo(Boolean value) {
            addCriterion("has_title_img >=", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgLessThan(Boolean value) {
            addCriterion("has_title_img <", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgLessThanOrEqualTo(Boolean value) {
            addCriterion("has_title_img <=", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIn(List<Boolean> values) {
            addCriterion("has_title_img in", values, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotIn(List<Boolean> values) {
            addCriterion("has_title_img not in", values, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgBetween(Boolean value1, Boolean value2) {
            addCriterion("has_title_img between", value1, value2, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotBetween(Boolean value1, Boolean value2) {
            addCriterion("has_title_img not between", value1, value2, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgIsNull() {
            addCriterion("has_content_img is null");
            return (Criteria) this;
        }

        public Criteria andHasContentImgIsNotNull() {
            addCriterion("has_content_img is not null");
            return (Criteria) this;
        }

        public Criteria andHasContentImgEqualTo(Boolean value) {
            addCriterion("has_content_img =", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgNotEqualTo(Boolean value) {
            addCriterion("has_content_img <>", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgGreaterThan(Boolean value) {
            addCriterion("has_content_img >", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgGreaterThanOrEqualTo(Boolean value) {
            addCriterion("has_content_img >=", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgLessThan(Boolean value) {
            addCriterion("has_content_img <", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgLessThanOrEqualTo(Boolean value) {
            addCriterion("has_content_img <=", value, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgIn(List<Boolean> values) {
            addCriterion("has_content_img in", values, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgNotIn(List<Boolean> values) {
            addCriterion("has_content_img not in", values, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgBetween(Boolean value1, Boolean value2) {
            addCriterion("has_content_img between", value1, value2, "hasContentImg");
            return (Criteria) this;
        }

        public Criteria andHasContentImgNotBetween(Boolean value1, Boolean value2) {
            addCriterion("has_content_img not between", value1, value2, "hasContentImg");
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

        public Criteria andCommentControlIsNull() {
            addCriterion("comment_control is null");
            return (Criteria) this;
        }

        public Criteria andCommentControlIsNotNull() {
            addCriterion("comment_control is not null");
            return (Criteria) this;
        }

        public Criteria andCommentControlEqualTo(Integer value) {
            addCriterion("comment_control =", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlNotEqualTo(Integer value) {
            addCriterion("comment_control <>", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlGreaterThan(Integer value) {
            addCriterion("comment_control >", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_control >=", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlLessThan(Integer value) {
            addCriterion("comment_control <", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlLessThanOrEqualTo(Integer value) {
            addCriterion("comment_control <=", value, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlIn(List<Integer> values) {
            addCriterion("comment_control in", values, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlNotIn(List<Integer> values) {
            addCriterion("comment_control not in", values, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlBetween(Integer value1, Integer value2) {
            addCriterion("comment_control between", value1, value2, "commentControl");
            return (Criteria) this;
        }

        public Criteria andCommentControlNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_control not between", value1, value2, "commentControl");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownIsNull() {
            addCriterion("allow_updown is null");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownIsNotNull() {
            addCriterion("allow_updown is not null");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownEqualTo(Boolean value) {
            addCriterion("allow_updown =", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownNotEqualTo(Boolean value) {
            addCriterion("allow_updown <>", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownGreaterThan(Boolean value) {
            addCriterion("allow_updown >", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownGreaterThanOrEqualTo(Boolean value) {
            addCriterion("allow_updown >=", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownLessThan(Boolean value) {
            addCriterion("allow_updown <", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownLessThanOrEqualTo(Boolean value) {
            addCriterion("allow_updown <=", value, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownIn(List<Boolean> values) {
            addCriterion("allow_updown in", values, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownNotIn(List<Boolean> values) {
            addCriterion("allow_updown not in", values, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownBetween(Boolean value1, Boolean value2) {
            addCriterion("allow_updown between", value1, value2, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andAllowUpdownNotBetween(Boolean value1, Boolean value2) {
            addCriterion("allow_updown not between", value1, value2, "allowUpdown");
            return (Criteria) this;
        }

        public Criteria andIsBlankIsNull() {
            addCriterion("is_blank is null");
            return (Criteria) this;
        }

        public Criteria andIsBlankIsNotNull() {
            addCriterion("is_blank is not null");
            return (Criteria) this;
        }

        public Criteria andIsBlankEqualTo(Boolean value) {
            addCriterion("is_blank =", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankNotEqualTo(Boolean value) {
            addCriterion("is_blank <>", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankGreaterThan(Boolean value) {
            addCriterion("is_blank >", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_blank >=", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankLessThan(Boolean value) {
            addCriterion("is_blank <", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankLessThanOrEqualTo(Boolean value) {
            addCriterion("is_blank <=", value, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankIn(List<Boolean> values) {
            addCriterion("is_blank in", values, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankNotIn(List<Boolean> values) {
            addCriterion("is_blank not in", values, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankBetween(Boolean value1, Boolean value2) {
            addCriterion("is_blank between", value1, value2, "isBlank");
            return (Criteria) this;
        }

        public Criteria andIsBlankNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_blank not between", value1, value2, "isBlank");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNull() {
            addCriterion("keywords is null");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNotNull() {
            addCriterion("keywords is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordsEqualTo(String value) {
            addCriterion("keywords =", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotEqualTo(String value) {
            addCriterion("keywords <>", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThan(String value) {
            addCriterion("keywords >", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThanOrEqualTo(String value) {
            addCriterion("keywords >=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThan(String value) {
            addCriterion("keywords <", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThanOrEqualTo(String value) {
            addCriterion("keywords <=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLike(String value) {
            addCriterion("keywords like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotLike(String value) {
            addCriterion("keywords not like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsIn(List<String> values) {
            addCriterion("keywords in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotIn(List<String> values) {
            addCriterion("keywords not in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsBetween(String value1, String value2) {
            addCriterion("keywords between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotBetween(String value1, String value2) {
            addCriterion("keywords not between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNull() {
            addCriterion("description is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNotNull() {
            addCriterion("description is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEqualTo(String value) {
            addCriterion("description =", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotEqualTo(String value) {
            addCriterion("description <>", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThan(String value) {
            addCriterion("description >", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("description >=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThan(String value) {
            addCriterion("description <", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThanOrEqualTo(String value) {
            addCriterion("description <=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLike(String value) {
            addCriterion("description like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotLike(String value) {
            addCriterion("description not like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionIn(List<String> values) {
            addCriterion("description in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotIn(List<String> values) {
            addCriterion("description not in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionBetween(String value1, String value2) {
            addCriterion("description between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotBetween(String value1, String value2) {
            addCriterion("description not between", value1, value2, "description");
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