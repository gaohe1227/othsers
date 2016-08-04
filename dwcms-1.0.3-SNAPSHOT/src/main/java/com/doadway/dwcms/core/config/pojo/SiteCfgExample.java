package com.doadway.dwcms.core.config.pojo;

import java.util.ArrayList;
import java.util.List;

public class SiteCfgExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SiteCfgExample() {
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

        public Criteria andCfgNameIsNull() {
            addCriterion("cfg_name is null");
            return (Criteria) this;
        }

        public Criteria andCfgNameIsNotNull() {
            addCriterion("cfg_name is not null");
            return (Criteria) this;
        }

        public Criteria andCfgNameEqualTo(String value) {
            addCriterion("cfg_name =", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameNotEqualTo(String value) {
            addCriterion("cfg_name <>", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameGreaterThan(String value) {
            addCriterion("cfg_name >", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameGreaterThanOrEqualTo(String value) {
            addCriterion("cfg_name >=", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameLessThan(String value) {
            addCriterion("cfg_name <", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameLessThanOrEqualTo(String value) {
            addCriterion("cfg_name <=", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameLike(String value) {
            addCriterion("cfg_name like", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameNotLike(String value) {
            addCriterion("cfg_name not like", value, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameIn(List<String> values) {
            addCriterion("cfg_name in", values, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameNotIn(List<String> values) {
            addCriterion("cfg_name not in", values, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameBetween(String value1, String value2) {
            addCriterion("cfg_name between", value1, value2, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgNameNotBetween(String value1, String value2) {
            addCriterion("cfg_name not between", value1, value2, "cfgName");
            return (Criteria) this;
        }

        public Criteria andCfgValueIsNull() {
            addCriterion("cfg_value is null");
            return (Criteria) this;
        }

        public Criteria andCfgValueIsNotNull() {
            addCriterion("cfg_value is not null");
            return (Criteria) this;
        }

        public Criteria andCfgValueEqualTo(String value) {
            addCriterion("cfg_value =", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueNotEqualTo(String value) {
            addCriterion("cfg_value <>", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueGreaterThan(String value) {
            addCriterion("cfg_value >", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueGreaterThanOrEqualTo(String value) {
            addCriterion("cfg_value >=", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueLessThan(String value) {
            addCriterion("cfg_value <", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueLessThanOrEqualTo(String value) {
            addCriterion("cfg_value <=", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueLike(String value) {
            addCriterion("cfg_value like", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueNotLike(String value) {
            addCriterion("cfg_value not like", value, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueIn(List<String> values) {
            addCriterion("cfg_value in", values, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueNotIn(List<String> values) {
            addCriterion("cfg_value not in", values, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueBetween(String value1, String value2) {
            addCriterion("cfg_value between", value1, value2, "cfgValue");
            return (Criteria) this;
        }

        public Criteria andCfgValueNotBetween(String value1, String value2) {
            addCriterion("cfg_value not between", value1, value2, "cfgValue");
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