package com.doadway.dwcms.core.content.pojo;

import java.util.ArrayList;
import java.util.List;

public class ContentCheckExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContentCheckExample() {
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

        public Criteria andContentIdIsNull() {
            addCriterion("content_id is null");
            return (Criteria) this;
        }

        public Criteria andContentIdIsNotNull() {
            addCriterion("content_id is not null");
            return (Criteria) this;
        }

        public Criteria andContentIdEqualTo(Integer value) {
            addCriterion("content_id =", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotEqualTo(Integer value) {
            addCriterion("content_id <>", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThan(Integer value) {
            addCriterion("content_id >", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("content_id >=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThan(Integer value) {
            addCriterion("content_id <", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThanOrEqualTo(Integer value) {
            addCriterion("content_id <=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdIn(List<Integer> values) {
            addCriterion("content_id in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotIn(List<Integer> values) {
            addCriterion("content_id not in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdBetween(Integer value1, Integer value2) {
            addCriterion("content_id between", value1, value2, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("content_id not between", value1, value2, "contentId");
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

        public Criteria andCheckOpinionIsNull() {
            addCriterion("check_opinion is null");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionIsNotNull() {
            addCriterion("check_opinion is not null");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionEqualTo(String value) {
            addCriterion("check_opinion =", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionNotEqualTo(String value) {
            addCriterion("check_opinion <>", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionGreaterThan(String value) {
            addCriterion("check_opinion >", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionGreaterThanOrEqualTo(String value) {
            addCriterion("check_opinion >=", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionLessThan(String value) {
            addCriterion("check_opinion <", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionLessThanOrEqualTo(String value) {
            addCriterion("check_opinion <=", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionLike(String value) {
            addCriterion("check_opinion like", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionNotLike(String value) {
            addCriterion("check_opinion not like", value, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionIn(List<String> values) {
            addCriterion("check_opinion in", values, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionNotIn(List<String> values) {
            addCriterion("check_opinion not in", values, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionBetween(String value1, String value2) {
            addCriterion("check_opinion between", value1, value2, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andCheckOpinionNotBetween(String value1, String value2) {
            addCriterion("check_opinion not between", value1, value2, "checkOpinion");
            return (Criteria) this;
        }

        public Criteria andIsRejectedIsNull() {
            addCriterion("is_rejected is null");
            return (Criteria) this;
        }

        public Criteria andIsRejectedIsNotNull() {
            addCriterion("is_rejected is not null");
            return (Criteria) this;
        }

        public Criteria andIsRejectedEqualTo(Boolean value) {
            addCriterion("is_rejected =", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedNotEqualTo(Boolean value) {
            addCriterion("is_rejected <>", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedGreaterThan(Boolean value) {
            addCriterion("is_rejected >", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_rejected >=", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedLessThan(Boolean value) {
            addCriterion("is_rejected <", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedLessThanOrEqualTo(Boolean value) {
            addCriterion("is_rejected <=", value, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedIn(List<Boolean> values) {
            addCriterion("is_rejected in", values, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedNotIn(List<Boolean> values) {
            addCriterion("is_rejected not in", values, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedBetween(Boolean value1, Boolean value2) {
            addCriterion("is_rejected between", value1, value2, "isRejected");
            return (Criteria) this;
        }

        public Criteria andIsRejectedNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_rejected not between", value1, value2, "isRejected");
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