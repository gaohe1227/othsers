package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.List;

public class GuestbookCtgExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GuestbookCtgExample() {
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

        public Criteria andGuestbookctgIdIsNull() {
            addCriterion("guestbookctg_id is null");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdIsNotNull() {
            addCriterion("guestbookctg_id is not null");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdEqualTo(Integer value) {
            addCriterion("guestbookctg_id =", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdNotEqualTo(Integer value) {
            addCriterion("guestbookctg_id <>", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdGreaterThan(Integer value) {
            addCriterion("guestbookctg_id >", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("guestbookctg_id >=", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdLessThan(Integer value) {
            addCriterion("guestbookctg_id <", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdLessThanOrEqualTo(Integer value) {
            addCriterion("guestbookctg_id <=", value, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdIn(List<Integer> values) {
            addCriterion("guestbookctg_id in", values, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdNotIn(List<Integer> values) {
            addCriterion("guestbookctg_id not in", values, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdBetween(Integer value1, Integer value2) {
            addCriterion("guestbookctg_id between", value1, value2, "guestbookctgId");
            return (Criteria) this;
        }

        public Criteria andGuestbookctgIdNotBetween(Integer value1, Integer value2) {
            addCriterion("guestbookctg_id not between", value1, value2, "guestbookctgId");
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

        public Criteria andCtgNameIsNull() {
            addCriterion("ctg_name is null");
            return (Criteria) this;
        }

        public Criteria andCtgNameIsNotNull() {
            addCriterion("ctg_name is not null");
            return (Criteria) this;
        }

        public Criteria andCtgNameEqualTo(String value) {
            addCriterion("ctg_name =", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameNotEqualTo(String value) {
            addCriterion("ctg_name <>", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameGreaterThan(String value) {
            addCriterion("ctg_name >", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameGreaterThanOrEqualTo(String value) {
            addCriterion("ctg_name >=", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameLessThan(String value) {
            addCriterion("ctg_name <", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameLessThanOrEqualTo(String value) {
            addCriterion("ctg_name <=", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameLike(String value) {
            addCriterion("ctg_name like", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameNotLike(String value) {
            addCriterion("ctg_name not like", value, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameIn(List<String> values) {
            addCriterion("ctg_name in", values, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameNotIn(List<String> values) {
            addCriterion("ctg_name not in", values, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameBetween(String value1, String value2) {
            addCriterion("ctg_name between", value1, value2, "ctgName");
            return (Criteria) this;
        }

        public Criteria andCtgNameNotBetween(String value1, String value2) {
            addCriterion("ctg_name not between", value1, value2, "ctgName");
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