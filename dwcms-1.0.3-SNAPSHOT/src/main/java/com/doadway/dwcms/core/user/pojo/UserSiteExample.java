package com.doadway.dwcms.core.user.pojo;

import java.util.ArrayList;
import java.util.List;

public class UserSiteExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserSiteExample() {
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

        public Criteria andUsersiteIdIsNull() {
            addCriterion("usersite_id is null");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdIsNotNull() {
            addCriterion("usersite_id is not null");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdEqualTo(Integer value) {
            addCriterion("usersite_id =", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdNotEqualTo(Integer value) {
            addCriterion("usersite_id <>", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdGreaterThan(Integer value) {
            addCriterion("usersite_id >", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("usersite_id >=", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdLessThan(Integer value) {
            addCriterion("usersite_id <", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdLessThanOrEqualTo(Integer value) {
            addCriterion("usersite_id <=", value, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdIn(List<Integer> values) {
            addCriterion("usersite_id in", values, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdNotIn(List<Integer> values) {
            addCriterion("usersite_id not in", values, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdBetween(Integer value1, Integer value2) {
            addCriterion("usersite_id between", value1, value2, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUsersiteIdNotBetween(Integer value1, Integer value2) {
            addCriterion("usersite_id not between", value1, value2, "usersiteId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
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

        public Criteria andCheckStepIsNull() {
            addCriterion("check_step is null");
            return (Criteria) this;
        }

        public Criteria andCheckStepIsNotNull() {
            addCriterion("check_step is not null");
            return (Criteria) this;
        }

        public Criteria andCheckStepEqualTo(Byte value) {
            addCriterion("check_step =", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepNotEqualTo(Byte value) {
            addCriterion("check_step <>", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepGreaterThan(Byte value) {
            addCriterion("check_step >", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepGreaterThanOrEqualTo(Byte value) {
            addCriterion("check_step >=", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepLessThan(Byte value) {
            addCriterion("check_step <", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepLessThanOrEqualTo(Byte value) {
            addCriterion("check_step <=", value, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepIn(List<Byte> values) {
            addCriterion("check_step in", values, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepNotIn(List<Byte> values) {
            addCriterion("check_step not in", values, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepBetween(Byte value1, Byte value2) {
            addCriterion("check_step between", value1, value2, "checkStep");
            return (Criteria) this;
        }

        public Criteria andCheckStepNotBetween(Byte value1, Byte value2) {
            addCriterion("check_step not between", value1, value2, "checkStep");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelIsNull() {
            addCriterion("is_all_channel is null");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelIsNotNull() {
            addCriterion("is_all_channel is not null");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelEqualTo(Boolean value) {
            addCriterion("is_all_channel =", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelNotEqualTo(Boolean value) {
            addCriterion("is_all_channel <>", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelGreaterThan(Boolean value) {
            addCriterion("is_all_channel >", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_all_channel >=", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelLessThan(Boolean value) {
            addCriterion("is_all_channel <", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelLessThanOrEqualTo(Boolean value) {
            addCriterion("is_all_channel <=", value, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelIn(List<Boolean> values) {
            addCriterion("is_all_channel in", values, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelNotIn(List<Boolean> values) {
            addCriterion("is_all_channel not in", values, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelBetween(Boolean value1, Boolean value2) {
            addCriterion("is_all_channel between", value1, value2, "isAllChannel");
            return (Criteria) this;
        }

        public Criteria andIsAllChannelNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_all_channel not between", value1, value2, "isAllChannel");
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