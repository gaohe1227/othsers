package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class VoteRecordExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public VoteRecordExample() {
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

        public Criteria andVoterecoredIdIsNull() {
            addCriterion("voterecored_id is null");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdIsNotNull() {
            addCriterion("voterecored_id is not null");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdEqualTo(Integer value) {
            addCriterion("voterecored_id =", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdNotEqualTo(Integer value) {
            addCriterion("voterecored_id <>", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdGreaterThan(Integer value) {
            addCriterion("voterecored_id >", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("voterecored_id >=", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdLessThan(Integer value) {
            addCriterion("voterecored_id <", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdLessThanOrEqualTo(Integer value) {
            addCriterion("voterecored_id <=", value, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdIn(List<Integer> values) {
            addCriterion("voterecored_id in", values, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdNotIn(List<Integer> values) {
            addCriterion("voterecored_id not in", values, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdBetween(Integer value1, Integer value2) {
            addCriterion("voterecored_id between", value1, value2, "voterecoredId");
            return (Criteria) this;
        }

        public Criteria andVoterecoredIdNotBetween(Integer value1, Integer value2) {
            addCriterion("voterecored_id not between", value1, value2, "voterecoredId");
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

        public Criteria andVoteTimeIsNull() {
            addCriterion("vote_time is null");
            return (Criteria) this;
        }

        public Criteria andVoteTimeIsNotNull() {
            addCriterion("vote_time is not null");
            return (Criteria) this;
        }

        public Criteria andVoteTimeEqualTo(Date value) {
            addCriterion("vote_time =", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeNotEqualTo(Date value) {
            addCriterion("vote_time <>", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeGreaterThan(Date value) {
            addCriterion("vote_time >", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("vote_time >=", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeLessThan(Date value) {
            addCriterion("vote_time <", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeLessThanOrEqualTo(Date value) {
            addCriterion("vote_time <=", value, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeIn(List<Date> values) {
            addCriterion("vote_time in", values, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeNotIn(List<Date> values) {
            addCriterion("vote_time not in", values, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeBetween(Date value1, Date value2) {
            addCriterion("vote_time between", value1, value2, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteTimeNotBetween(Date value1, Date value2) {
            addCriterion("vote_time not between", value1, value2, "voteTime");
            return (Criteria) this;
        }

        public Criteria andVoteIpIsNull() {
            addCriterion("vote_ip is null");
            return (Criteria) this;
        }

        public Criteria andVoteIpIsNotNull() {
            addCriterion("vote_ip is not null");
            return (Criteria) this;
        }

        public Criteria andVoteIpEqualTo(String value) {
            addCriterion("vote_ip =", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpNotEqualTo(String value) {
            addCriterion("vote_ip <>", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpGreaterThan(String value) {
            addCriterion("vote_ip >", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpGreaterThanOrEqualTo(String value) {
            addCriterion("vote_ip >=", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpLessThan(String value) {
            addCriterion("vote_ip <", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpLessThanOrEqualTo(String value) {
            addCriterion("vote_ip <=", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpLike(String value) {
            addCriterion("vote_ip like", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpNotLike(String value) {
            addCriterion("vote_ip not like", value, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpIn(List<String> values) {
            addCriterion("vote_ip in", values, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpNotIn(List<String> values) {
            addCriterion("vote_ip not in", values, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpBetween(String value1, String value2) {
            addCriterion("vote_ip between", value1, value2, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteIpNotBetween(String value1, String value2) {
            addCriterion("vote_ip not between", value1, value2, "voteIp");
            return (Criteria) this;
        }

        public Criteria andVoteCookieIsNull() {
            addCriterion("vote_cookie is null");
            return (Criteria) this;
        }

        public Criteria andVoteCookieIsNotNull() {
            addCriterion("vote_cookie is not null");
            return (Criteria) this;
        }

        public Criteria andVoteCookieEqualTo(String value) {
            addCriterion("vote_cookie =", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieNotEqualTo(String value) {
            addCriterion("vote_cookie <>", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieGreaterThan(String value) {
            addCriterion("vote_cookie >", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieGreaterThanOrEqualTo(String value) {
            addCriterion("vote_cookie >=", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieLessThan(String value) {
            addCriterion("vote_cookie <", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieLessThanOrEqualTo(String value) {
            addCriterion("vote_cookie <=", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieLike(String value) {
            addCriterion("vote_cookie like", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieNotLike(String value) {
            addCriterion("vote_cookie not like", value, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieIn(List<String> values) {
            addCriterion("vote_cookie in", values, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieNotIn(List<String> values) {
            addCriterion("vote_cookie not in", values, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieBetween(String value1, String value2) {
            addCriterion("vote_cookie between", value1, value2, "voteCookie");
            return (Criteria) this;
        }

        public Criteria andVoteCookieNotBetween(String value1, String value2) {
            addCriterion("vote_cookie not between", value1, value2, "voteCookie");
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