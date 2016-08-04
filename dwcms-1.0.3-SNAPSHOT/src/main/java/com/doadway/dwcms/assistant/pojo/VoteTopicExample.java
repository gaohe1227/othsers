package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class VoteTopicExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public VoteTopicExample() {
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

        public Criteria andStartTimeIsNull() {
            addCriterion("start_time is null");
            return (Criteria) this;
        }

        public Criteria andStartTimeIsNotNull() {
            addCriterion("start_time is not null");
            return (Criteria) this;
        }

        public Criteria andStartTimeEqualTo(Date value) {
            addCriterion("start_time =", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotEqualTo(Date value) {
            addCriterion("start_time <>", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThan(Date value) {
            addCriterion("start_time >", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("start_time >=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThan(Date value) {
            addCriterion("start_time <", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThanOrEqualTo(Date value) {
            addCriterion("start_time <=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeIn(List<Date> values) {
            addCriterion("start_time in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotIn(List<Date> values) {
            addCriterion("start_time not in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeBetween(Date value1, Date value2) {
            addCriterion("start_time between", value1, value2, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotBetween(Date value1, Date value2) {
            addCriterion("start_time not between", value1, value2, "startTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeIsNull() {
            addCriterion("end_time is null");
            return (Criteria) this;
        }

        public Criteria andEndTimeIsNotNull() {
            addCriterion("end_time is not null");
            return (Criteria) this;
        }

        public Criteria andEndTimeEqualTo(Date value) {
            addCriterion("end_time =", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotEqualTo(Date value) {
            addCriterion("end_time <>", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeGreaterThan(Date value) {
            addCriterion("end_time >", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("end_time >=", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeLessThan(Date value) {
            addCriterion("end_time <", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeLessThanOrEqualTo(Date value) {
            addCriterion("end_time <=", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeIn(List<Date> values) {
            addCriterion("end_time in", values, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotIn(List<Date> values) {
            addCriterion("end_time not in", values, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeBetween(Date value1, Date value2) {
            addCriterion("end_time between", value1, value2, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotBetween(Date value1, Date value2) {
            addCriterion("end_time not between", value1, value2, "endTime");
            return (Criteria) this;
        }

        public Criteria andRepeateHourIsNull() {
            addCriterion("repeate_hour is null");
            return (Criteria) this;
        }

        public Criteria andRepeateHourIsNotNull() {
            addCriterion("repeate_hour is not null");
            return (Criteria) this;
        }

        public Criteria andRepeateHourEqualTo(Integer value) {
            addCriterion("repeate_hour =", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourNotEqualTo(Integer value) {
            addCriterion("repeate_hour <>", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourGreaterThan(Integer value) {
            addCriterion("repeate_hour >", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourGreaterThanOrEqualTo(Integer value) {
            addCriterion("repeate_hour >=", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourLessThan(Integer value) {
            addCriterion("repeate_hour <", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourLessThanOrEqualTo(Integer value) {
            addCriterion("repeate_hour <=", value, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourIn(List<Integer> values) {
            addCriterion("repeate_hour in", values, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourNotIn(List<Integer> values) {
            addCriterion("repeate_hour not in", values, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourBetween(Integer value1, Integer value2) {
            addCriterion("repeate_hour between", value1, value2, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andRepeateHourNotBetween(Integer value1, Integer value2) {
            addCriterion("repeate_hour not between", value1, value2, "repeateHour");
            return (Criteria) this;
        }

        public Criteria andTotalCountIsNull() {
            addCriterion("total_count is null");
            return (Criteria) this;
        }

        public Criteria andTotalCountIsNotNull() {
            addCriterion("total_count is not null");
            return (Criteria) this;
        }

        public Criteria andTotalCountEqualTo(Integer value) {
            addCriterion("total_count =", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountNotEqualTo(Integer value) {
            addCriterion("total_count <>", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountGreaterThan(Integer value) {
            addCriterion("total_count >", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("total_count >=", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountLessThan(Integer value) {
            addCriterion("total_count <", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountLessThanOrEqualTo(Integer value) {
            addCriterion("total_count <=", value, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountIn(List<Integer> values) {
            addCriterion("total_count in", values, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountNotIn(List<Integer> values) {
            addCriterion("total_count not in", values, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountBetween(Integer value1, Integer value2) {
            addCriterion("total_count between", value1, value2, "totalCount");
            return (Criteria) this;
        }

        public Criteria andTotalCountNotBetween(Integer value1, Integer value2) {
            addCriterion("total_count not between", value1, value2, "totalCount");
            return (Criteria) this;
        }

        public Criteria andMultiSelectIsNull() {
            addCriterion("multi_select is null");
            return (Criteria) this;
        }

        public Criteria andMultiSelectIsNotNull() {
            addCriterion("multi_select is not null");
            return (Criteria) this;
        }

        public Criteria andMultiSelectEqualTo(Integer value) {
            addCriterion("multi_select =", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectNotEqualTo(Integer value) {
            addCriterion("multi_select <>", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectGreaterThan(Integer value) {
            addCriterion("multi_select >", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectGreaterThanOrEqualTo(Integer value) {
            addCriterion("multi_select >=", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectLessThan(Integer value) {
            addCriterion("multi_select <", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectLessThanOrEqualTo(Integer value) {
            addCriterion("multi_select <=", value, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectIn(List<Integer> values) {
            addCriterion("multi_select in", values, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectNotIn(List<Integer> values) {
            addCriterion("multi_select not in", values, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectBetween(Integer value1, Integer value2) {
            addCriterion("multi_select between", value1, value2, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andMultiSelectNotBetween(Integer value1, Integer value2) {
            addCriterion("multi_select not between", value1, value2, "multiSelect");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberIsNull() {
            addCriterion("is_restrict_member is null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberIsNotNull() {
            addCriterion("is_restrict_member is not null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberEqualTo(Boolean value) {
            addCriterion("is_restrict_member =", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberNotEqualTo(Boolean value) {
            addCriterion("is_restrict_member <>", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberGreaterThan(Boolean value) {
            addCriterion("is_restrict_member >", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_member >=", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberLessThan(Boolean value) {
            addCriterion("is_restrict_member <", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberLessThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_member <=", value, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberIn(List<Boolean> values) {
            addCriterion("is_restrict_member in", values, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberNotIn(List<Boolean> values) {
            addCriterion("is_restrict_member not in", values, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_member between", value1, value2, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictMemberNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_member not between", value1, value2, "isRestrictMember");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpIsNull() {
            addCriterion("is_restrict_ip is null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpIsNotNull() {
            addCriterion("is_restrict_ip is not null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpEqualTo(Boolean value) {
            addCriterion("is_restrict_ip =", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpNotEqualTo(Boolean value) {
            addCriterion("is_restrict_ip <>", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpGreaterThan(Boolean value) {
            addCriterion("is_restrict_ip >", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_ip >=", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpLessThan(Boolean value) {
            addCriterion("is_restrict_ip <", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpLessThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_ip <=", value, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpIn(List<Boolean> values) {
            addCriterion("is_restrict_ip in", values, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpNotIn(List<Boolean> values) {
            addCriterion("is_restrict_ip not in", values, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_ip between", value1, value2, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictIpNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_ip not between", value1, value2, "isRestrictIp");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieIsNull() {
            addCriterion("is_restrict_cookie is null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieIsNotNull() {
            addCriterion("is_restrict_cookie is not null");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieEqualTo(Boolean value) {
            addCriterion("is_restrict_cookie =", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieNotEqualTo(Boolean value) {
            addCriterion("is_restrict_cookie <>", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieGreaterThan(Boolean value) {
            addCriterion("is_restrict_cookie >", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_cookie >=", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieLessThan(Boolean value) {
            addCriterion("is_restrict_cookie <", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieLessThanOrEqualTo(Boolean value) {
            addCriterion("is_restrict_cookie <=", value, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieIn(List<Boolean> values) {
            addCriterion("is_restrict_cookie in", values, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieNotIn(List<Boolean> values) {
            addCriterion("is_restrict_cookie not in", values, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_cookie between", value1, value2, "isRestrictCookie");
            return (Criteria) this;
        }

        public Criteria andIsRestrictCookieNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_restrict_cookie not between", value1, value2, "isRestrictCookie");
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