package com.doadway.dwcms.maintain.pojo;

import java.util.ArrayList;
import java.util.List;

public class SensitivityExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SensitivityExample() {
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

        public Criteria andSensitivityIdIsNull() {
            addCriterion("sensitivity_id is null");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdIsNotNull() {
            addCriterion("sensitivity_id is not null");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdEqualTo(Integer value) {
            addCriterion("sensitivity_id =", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdNotEqualTo(Integer value) {
            addCriterion("sensitivity_id <>", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdGreaterThan(Integer value) {
            addCriterion("sensitivity_id >", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("sensitivity_id >=", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdLessThan(Integer value) {
            addCriterion("sensitivity_id <", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdLessThanOrEqualTo(Integer value) {
            addCriterion("sensitivity_id <=", value, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdIn(List<Integer> values) {
            addCriterion("sensitivity_id in", values, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdNotIn(List<Integer> values) {
            addCriterion("sensitivity_id not in", values, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdBetween(Integer value1, Integer value2) {
            addCriterion("sensitivity_id between", value1, value2, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSensitivityIdNotBetween(Integer value1, Integer value2) {
            addCriterion("sensitivity_id not between", value1, value2, "sensitivityId");
            return (Criteria) this;
        }

        public Criteria andSearchIsNull() {
            addCriterion("search is null");
            return (Criteria) this;
        }

        public Criteria andSearchIsNotNull() {
            addCriterion("search is not null");
            return (Criteria) this;
        }

        public Criteria andSearchEqualTo(String value) {
            addCriterion("search =", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchNotEqualTo(String value) {
            addCriterion("search <>", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchGreaterThan(String value) {
            addCriterion("search >", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchGreaterThanOrEqualTo(String value) {
            addCriterion("search >=", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchLessThan(String value) {
            addCriterion("search <", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchLessThanOrEqualTo(String value) {
            addCriterion("search <=", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchLike(String value) {
            addCriterion("search like", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchNotLike(String value) {
            addCriterion("search not like", value, "search");
            return (Criteria) this;
        }

        public Criteria andSearchIn(List<String> values) {
            addCriterion("search in", values, "search");
            return (Criteria) this;
        }

        public Criteria andSearchNotIn(List<String> values) {
            addCriterion("search not in", values, "search");
            return (Criteria) this;
        }

        public Criteria andSearchBetween(String value1, String value2) {
            addCriterion("search between", value1, value2, "search");
            return (Criteria) this;
        }

        public Criteria andSearchNotBetween(String value1, String value2) {
            addCriterion("search not between", value1, value2, "search");
            return (Criteria) this;
        }

        public Criteria andReplacementIsNull() {
            addCriterion("replacement is null");
            return (Criteria) this;
        }

        public Criteria andReplacementIsNotNull() {
            addCriterion("replacement is not null");
            return (Criteria) this;
        }

        public Criteria andReplacementEqualTo(String value) {
            addCriterion("replacement =", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementNotEqualTo(String value) {
            addCriterion("replacement <>", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementGreaterThan(String value) {
            addCriterion("replacement >", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementGreaterThanOrEqualTo(String value) {
            addCriterion("replacement >=", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementLessThan(String value) {
            addCriterion("replacement <", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementLessThanOrEqualTo(String value) {
            addCriterion("replacement <=", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementLike(String value) {
            addCriterion("replacement like", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementNotLike(String value) {
            addCriterion("replacement not like", value, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementIn(List<String> values) {
            addCriterion("replacement in", values, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementNotIn(List<String> values) {
            addCriterion("replacement not in", values, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementBetween(String value1, String value2) {
            addCriterion("replacement between", value1, value2, "replacement");
            return (Criteria) this;
        }

        public Criteria andReplacementNotBetween(String value1, String value2) {
            addCriterion("replacement not between", value1, value2, "replacement");
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