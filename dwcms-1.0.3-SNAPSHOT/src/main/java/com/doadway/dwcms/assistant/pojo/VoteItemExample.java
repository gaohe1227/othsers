package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.List;

public class VoteItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public VoteItemExample() {
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

        public Criteria andVoteitemIdIsNull() {
            addCriterion("voteitem_id is null");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdIsNotNull() {
            addCriterion("voteitem_id is not null");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdEqualTo(Integer value) {
            addCriterion("voteitem_id =", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdNotEqualTo(Integer value) {
            addCriterion("voteitem_id <>", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdGreaterThan(Integer value) {
            addCriterion("voteitem_id >", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("voteitem_id >=", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdLessThan(Integer value) {
            addCriterion("voteitem_id <", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdLessThanOrEqualTo(Integer value) {
            addCriterion("voteitem_id <=", value, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdIn(List<Integer> values) {
            addCriterion("voteitem_id in", values, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdNotIn(List<Integer> values) {
            addCriterion("voteitem_id not in", values, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdBetween(Integer value1, Integer value2) {
            addCriterion("voteitem_id between", value1, value2, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVoteitemIdNotBetween(Integer value1, Integer value2) {
            addCriterion("voteitem_id not between", value1, value2, "voteitemId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdIsNull() {
            addCriterion("votetopic_id is null");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdIsNotNull() {
            addCriterion("votetopic_id is not null");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdEqualTo(Integer value) {
            addCriterion("votetopic_id =", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdNotEqualTo(Integer value) {
            addCriterion("votetopic_id <>", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdGreaterThan(Integer value) {
            addCriterion("votetopic_id >", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("votetopic_id >=", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdLessThan(Integer value) {
            addCriterion("votetopic_id <", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdLessThanOrEqualTo(Integer value) {
            addCriterion("votetopic_id <=", value, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdIn(List<Integer> values) {
            addCriterion("votetopic_id in", values, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdNotIn(List<Integer> values) {
            addCriterion("votetopic_id not in", values, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdBetween(Integer value1, Integer value2) {
            addCriterion("votetopic_id between", value1, value2, "votetopicId");
            return (Criteria) this;
        }

        public Criteria andVotetopicIdNotBetween(Integer value1, Integer value2) {
            addCriterion("votetopic_id not between", value1, value2, "votetopicId");
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

        public Criteria andVoteCountIsNull() {
            addCriterion("vote_count is null");
            return (Criteria) this;
        }

        public Criteria andVoteCountIsNotNull() {
            addCriterion("vote_count is not null");
            return (Criteria) this;
        }

        public Criteria andVoteCountEqualTo(Integer value) {
            addCriterion("vote_count =", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotEqualTo(Integer value) {
            addCriterion("vote_count <>", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountGreaterThan(Integer value) {
            addCriterion("vote_count >", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("vote_count >=", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountLessThan(Integer value) {
            addCriterion("vote_count <", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountLessThanOrEqualTo(Integer value) {
            addCriterion("vote_count <=", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountIn(List<Integer> values) {
            addCriterion("vote_count in", values, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotIn(List<Integer> values) {
            addCriterion("vote_count not in", values, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountBetween(Integer value1, Integer value2) {
            addCriterion("vote_count between", value1, value2, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotBetween(Integer value1, Integer value2) {
            addCriterion("vote_count not between", value1, value2, "voteCount");
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