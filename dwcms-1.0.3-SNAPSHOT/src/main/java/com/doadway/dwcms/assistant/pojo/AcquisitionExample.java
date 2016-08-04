package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AcquisitionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AcquisitionExample() {
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

        public Criteria andAcquisitionIdIsNull() {
            addCriterion("acquisition_id is null");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdIsNotNull() {
            addCriterion("acquisition_id is not null");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdEqualTo(Integer value) {
            addCriterion("acquisition_id =", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdNotEqualTo(Integer value) {
            addCriterion("acquisition_id <>", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdGreaterThan(Integer value) {
            addCriterion("acquisition_id >", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("acquisition_id >=", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdLessThan(Integer value) {
            addCriterion("acquisition_id <", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdLessThanOrEqualTo(Integer value) {
            addCriterion("acquisition_id <=", value, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdIn(List<Integer> values) {
            addCriterion("acquisition_id in", values, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdNotIn(List<Integer> values) {
            addCriterion("acquisition_id not in", values, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdBetween(Integer value1, Integer value2) {
            addCriterion("acquisition_id between", value1, value2, "acquisitionId");
            return (Criteria) this;
        }

        public Criteria andAcquisitionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("acquisition_id not between", value1, value2, "acquisitionId");
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

        public Criteria andTypeIdIsNull() {
            addCriterion("type_id is null");
            return (Criteria) this;
        }

        public Criteria andTypeIdIsNotNull() {
            addCriterion("type_id is not null");
            return (Criteria) this;
        }

        public Criteria andTypeIdEqualTo(Integer value) {
            addCriterion("type_id =", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotEqualTo(Integer value) {
            addCriterion("type_id <>", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThan(Integer value) {
            addCriterion("type_id >", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("type_id >=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThan(Integer value) {
            addCriterion("type_id <", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("type_id <=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdIn(List<Integer> values) {
            addCriterion("type_id in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotIn(List<Integer> values) {
            addCriterion("type_id not in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("type_id between", value1, value2, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("type_id not between", value1, value2, "typeId");
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

        public Criteria andAcqNameIsNull() {
            addCriterion("acq_name is null");
            return (Criteria) this;
        }

        public Criteria andAcqNameIsNotNull() {
            addCriterion("acq_name is not null");
            return (Criteria) this;
        }

        public Criteria andAcqNameEqualTo(String value) {
            addCriterion("acq_name =", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameNotEqualTo(String value) {
            addCriterion("acq_name <>", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameGreaterThan(String value) {
            addCriterion("acq_name >", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameGreaterThanOrEqualTo(String value) {
            addCriterion("acq_name >=", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameLessThan(String value) {
            addCriterion("acq_name <", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameLessThanOrEqualTo(String value) {
            addCriterion("acq_name <=", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameLike(String value) {
            addCriterion("acq_name like", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameNotLike(String value) {
            addCriterion("acq_name not like", value, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameIn(List<String> values) {
            addCriterion("acq_name in", values, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameNotIn(List<String> values) {
            addCriterion("acq_name not in", values, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameBetween(String value1, String value2) {
            addCriterion("acq_name between", value1, value2, "acqName");
            return (Criteria) this;
        }

        public Criteria andAcqNameNotBetween(String value1, String value2) {
            addCriterion("acq_name not between", value1, value2, "acqName");
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

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCurrNumIsNull() {
            addCriterion("curr_num is null");
            return (Criteria) this;
        }

        public Criteria andCurrNumIsNotNull() {
            addCriterion("curr_num is not null");
            return (Criteria) this;
        }

        public Criteria andCurrNumEqualTo(Integer value) {
            addCriterion("curr_num =", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumNotEqualTo(Integer value) {
            addCriterion("curr_num <>", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumGreaterThan(Integer value) {
            addCriterion("curr_num >", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("curr_num >=", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumLessThan(Integer value) {
            addCriterion("curr_num <", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumLessThanOrEqualTo(Integer value) {
            addCriterion("curr_num <=", value, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumIn(List<Integer> values) {
            addCriterion("curr_num in", values, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumNotIn(List<Integer> values) {
            addCriterion("curr_num not in", values, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumBetween(Integer value1, Integer value2) {
            addCriterion("curr_num between", value1, value2, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrNumNotBetween(Integer value1, Integer value2) {
            addCriterion("curr_num not between", value1, value2, "currNum");
            return (Criteria) this;
        }

        public Criteria andCurrItemIsNull() {
            addCriterion("curr_item is null");
            return (Criteria) this;
        }

        public Criteria andCurrItemIsNotNull() {
            addCriterion("curr_item is not null");
            return (Criteria) this;
        }

        public Criteria andCurrItemEqualTo(Integer value) {
            addCriterion("curr_item =", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemNotEqualTo(Integer value) {
            addCriterion("curr_item <>", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemGreaterThan(Integer value) {
            addCriterion("curr_item >", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemGreaterThanOrEqualTo(Integer value) {
            addCriterion("curr_item >=", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemLessThan(Integer value) {
            addCriterion("curr_item <", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemLessThanOrEqualTo(Integer value) {
            addCriterion("curr_item <=", value, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemIn(List<Integer> values) {
            addCriterion("curr_item in", values, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemNotIn(List<Integer> values) {
            addCriterion("curr_item not in", values, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemBetween(Integer value1, Integer value2) {
            addCriterion("curr_item between", value1, value2, "currItem");
            return (Criteria) this;
        }

        public Criteria andCurrItemNotBetween(Integer value1, Integer value2) {
            addCriterion("curr_item not between", value1, value2, "currItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemIsNull() {
            addCriterion("total_item is null");
            return (Criteria) this;
        }

        public Criteria andTotalItemIsNotNull() {
            addCriterion("total_item is not null");
            return (Criteria) this;
        }

        public Criteria andTotalItemEqualTo(Integer value) {
            addCriterion("total_item =", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemNotEqualTo(Integer value) {
            addCriterion("total_item <>", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemGreaterThan(Integer value) {
            addCriterion("total_item >", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemGreaterThanOrEqualTo(Integer value) {
            addCriterion("total_item >=", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemLessThan(Integer value) {
            addCriterion("total_item <", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemLessThanOrEqualTo(Integer value) {
            addCriterion("total_item <=", value, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemIn(List<Integer> values) {
            addCriterion("total_item in", values, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemNotIn(List<Integer> values) {
            addCriterion("total_item not in", values, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemBetween(Integer value1, Integer value2) {
            addCriterion("total_item between", value1, value2, "totalItem");
            return (Criteria) this;
        }

        public Criteria andTotalItemNotBetween(Integer value1, Integer value2) {
            addCriterion("total_item not between", value1, value2, "totalItem");
            return (Criteria) this;
        }

        public Criteria andPauseTimeIsNull() {
            addCriterion("pause_time is null");
            return (Criteria) this;
        }

        public Criteria andPauseTimeIsNotNull() {
            addCriterion("pause_time is not null");
            return (Criteria) this;
        }

        public Criteria andPauseTimeEqualTo(Integer value) {
            addCriterion("pause_time =", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeNotEqualTo(Integer value) {
            addCriterion("pause_time <>", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeGreaterThan(Integer value) {
            addCriterion("pause_time >", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("pause_time >=", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeLessThan(Integer value) {
            addCriterion("pause_time <", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeLessThanOrEqualTo(Integer value) {
            addCriterion("pause_time <=", value, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeIn(List<Integer> values) {
            addCriterion("pause_time in", values, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeNotIn(List<Integer> values) {
            addCriterion("pause_time not in", values, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeBetween(Integer value1, Integer value2) {
            addCriterion("pause_time between", value1, value2, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPauseTimeNotBetween(Integer value1, Integer value2) {
            addCriterion("pause_time not between", value1, value2, "pauseTime");
            return (Criteria) this;
        }

        public Criteria andPageEncodingIsNull() {
            addCriterion("page_encoding is null");
            return (Criteria) this;
        }

        public Criteria andPageEncodingIsNotNull() {
            addCriterion("page_encoding is not null");
            return (Criteria) this;
        }

        public Criteria andPageEncodingEqualTo(String value) {
            addCriterion("page_encoding =", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingNotEqualTo(String value) {
            addCriterion("page_encoding <>", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingGreaterThan(String value) {
            addCriterion("page_encoding >", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingGreaterThanOrEqualTo(String value) {
            addCriterion("page_encoding >=", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingLessThan(String value) {
            addCriterion("page_encoding <", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingLessThanOrEqualTo(String value) {
            addCriterion("page_encoding <=", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingLike(String value) {
            addCriterion("page_encoding like", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingNotLike(String value) {
            addCriterion("page_encoding not like", value, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingIn(List<String> values) {
            addCriterion("page_encoding in", values, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingNotIn(List<String> values) {
            addCriterion("page_encoding not in", values, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingBetween(String value1, String value2) {
            addCriterion("page_encoding between", value1, value2, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andPageEncodingNotBetween(String value1, String value2) {
            addCriterion("page_encoding not between", value1, value2, "pageEncoding");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrIsNull() {
            addCriterion("dynamic_addr is null");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrIsNotNull() {
            addCriterion("dynamic_addr is not null");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrEqualTo(String value) {
            addCriterion("dynamic_addr =", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrNotEqualTo(String value) {
            addCriterion("dynamic_addr <>", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrGreaterThan(String value) {
            addCriterion("dynamic_addr >", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrGreaterThanOrEqualTo(String value) {
            addCriterion("dynamic_addr >=", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrLessThan(String value) {
            addCriterion("dynamic_addr <", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrLessThanOrEqualTo(String value) {
            addCriterion("dynamic_addr <=", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrLike(String value) {
            addCriterion("dynamic_addr like", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrNotLike(String value) {
            addCriterion("dynamic_addr not like", value, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrIn(List<String> values) {
            addCriterion("dynamic_addr in", values, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrNotIn(List<String> values) {
            addCriterion("dynamic_addr not in", values, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrBetween(String value1, String value2) {
            addCriterion("dynamic_addr between", value1, value2, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicAddrNotBetween(String value1, String value2) {
            addCriterion("dynamic_addr not between", value1, value2, "dynamicAddr");
            return (Criteria) this;
        }

        public Criteria andDynamicStartIsNull() {
            addCriterion("dynamic_start is null");
            return (Criteria) this;
        }

        public Criteria andDynamicStartIsNotNull() {
            addCriterion("dynamic_start is not null");
            return (Criteria) this;
        }

        public Criteria andDynamicStartEqualTo(Integer value) {
            addCriterion("dynamic_start =", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartNotEqualTo(Integer value) {
            addCriterion("dynamic_start <>", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartGreaterThan(Integer value) {
            addCriterion("dynamic_start >", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartGreaterThanOrEqualTo(Integer value) {
            addCriterion("dynamic_start >=", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartLessThan(Integer value) {
            addCriterion("dynamic_start <", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartLessThanOrEqualTo(Integer value) {
            addCriterion("dynamic_start <=", value, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartIn(List<Integer> values) {
            addCriterion("dynamic_start in", values, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartNotIn(List<Integer> values) {
            addCriterion("dynamic_start not in", values, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartBetween(Integer value1, Integer value2) {
            addCriterion("dynamic_start between", value1, value2, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicStartNotBetween(Integer value1, Integer value2) {
            addCriterion("dynamic_start not between", value1, value2, "dynamicStart");
            return (Criteria) this;
        }

        public Criteria andDynamicEndIsNull() {
            addCriterion("dynamic_end is null");
            return (Criteria) this;
        }

        public Criteria andDynamicEndIsNotNull() {
            addCriterion("dynamic_end is not null");
            return (Criteria) this;
        }

        public Criteria andDynamicEndEqualTo(Integer value) {
            addCriterion("dynamic_end =", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndNotEqualTo(Integer value) {
            addCriterion("dynamic_end <>", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndGreaterThan(Integer value) {
            addCriterion("dynamic_end >", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndGreaterThanOrEqualTo(Integer value) {
            addCriterion("dynamic_end >=", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndLessThan(Integer value) {
            addCriterion("dynamic_end <", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndLessThanOrEqualTo(Integer value) {
            addCriterion("dynamic_end <=", value, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndIn(List<Integer> values) {
            addCriterion("dynamic_end in", values, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndNotIn(List<Integer> values) {
            addCriterion("dynamic_end not in", values, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndBetween(Integer value1, Integer value2) {
            addCriterion("dynamic_end between", value1, value2, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andDynamicEndNotBetween(Integer value1, Integer value2) {
            addCriterion("dynamic_end not between", value1, value2, "dynamicEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetStartIsNull() {
            addCriterion("linkset_start is null");
            return (Criteria) this;
        }

        public Criteria andLinksetStartIsNotNull() {
            addCriterion("linkset_start is not null");
            return (Criteria) this;
        }

        public Criteria andLinksetStartEqualTo(String value) {
            addCriterion("linkset_start =", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartNotEqualTo(String value) {
            addCriterion("linkset_start <>", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartGreaterThan(String value) {
            addCriterion("linkset_start >", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartGreaterThanOrEqualTo(String value) {
            addCriterion("linkset_start >=", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartLessThan(String value) {
            addCriterion("linkset_start <", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartLessThanOrEqualTo(String value) {
            addCriterion("linkset_start <=", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartLike(String value) {
            addCriterion("linkset_start like", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartNotLike(String value) {
            addCriterion("linkset_start not like", value, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartIn(List<String> values) {
            addCriterion("linkset_start in", values, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartNotIn(List<String> values) {
            addCriterion("linkset_start not in", values, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartBetween(String value1, String value2) {
            addCriterion("linkset_start between", value1, value2, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetStartNotBetween(String value1, String value2) {
            addCriterion("linkset_start not between", value1, value2, "linksetStart");
            return (Criteria) this;
        }

        public Criteria andLinksetEndIsNull() {
            addCriterion("linkset_end is null");
            return (Criteria) this;
        }

        public Criteria andLinksetEndIsNotNull() {
            addCriterion("linkset_end is not null");
            return (Criteria) this;
        }

        public Criteria andLinksetEndEqualTo(String value) {
            addCriterion("linkset_end =", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndNotEqualTo(String value) {
            addCriterion("linkset_end <>", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndGreaterThan(String value) {
            addCriterion("linkset_end >", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndGreaterThanOrEqualTo(String value) {
            addCriterion("linkset_end >=", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndLessThan(String value) {
            addCriterion("linkset_end <", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndLessThanOrEqualTo(String value) {
            addCriterion("linkset_end <=", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndLike(String value) {
            addCriterion("linkset_end like", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndNotLike(String value) {
            addCriterion("linkset_end not like", value, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndIn(List<String> values) {
            addCriterion("linkset_end in", values, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndNotIn(List<String> values) {
            addCriterion("linkset_end not in", values, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndBetween(String value1, String value2) {
            addCriterion("linkset_end between", value1, value2, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinksetEndNotBetween(String value1, String value2) {
            addCriterion("linkset_end not between", value1, value2, "linksetEnd");
            return (Criteria) this;
        }

        public Criteria andLinkStartIsNull() {
            addCriterion("link_start is null");
            return (Criteria) this;
        }

        public Criteria andLinkStartIsNotNull() {
            addCriterion("link_start is not null");
            return (Criteria) this;
        }

        public Criteria andLinkStartEqualTo(String value) {
            addCriterion("link_start =", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartNotEqualTo(String value) {
            addCriterion("link_start <>", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartGreaterThan(String value) {
            addCriterion("link_start >", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartGreaterThanOrEqualTo(String value) {
            addCriterion("link_start >=", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartLessThan(String value) {
            addCriterion("link_start <", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartLessThanOrEqualTo(String value) {
            addCriterion("link_start <=", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartLike(String value) {
            addCriterion("link_start like", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartNotLike(String value) {
            addCriterion("link_start not like", value, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartIn(List<String> values) {
            addCriterion("link_start in", values, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartNotIn(List<String> values) {
            addCriterion("link_start not in", values, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartBetween(String value1, String value2) {
            addCriterion("link_start between", value1, value2, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkStartNotBetween(String value1, String value2) {
            addCriterion("link_start not between", value1, value2, "linkStart");
            return (Criteria) this;
        }

        public Criteria andLinkEndIsNull() {
            addCriterion("link_end is null");
            return (Criteria) this;
        }

        public Criteria andLinkEndIsNotNull() {
            addCriterion("link_end is not null");
            return (Criteria) this;
        }

        public Criteria andLinkEndEqualTo(String value) {
            addCriterion("link_end =", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndNotEqualTo(String value) {
            addCriterion("link_end <>", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndGreaterThan(String value) {
            addCriterion("link_end >", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndGreaterThanOrEqualTo(String value) {
            addCriterion("link_end >=", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndLessThan(String value) {
            addCriterion("link_end <", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndLessThanOrEqualTo(String value) {
            addCriterion("link_end <=", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndLike(String value) {
            addCriterion("link_end like", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndNotLike(String value) {
            addCriterion("link_end not like", value, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndIn(List<String> values) {
            addCriterion("link_end in", values, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndNotIn(List<String> values) {
            addCriterion("link_end not in", values, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndBetween(String value1, String value2) {
            addCriterion("link_end between", value1, value2, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andLinkEndNotBetween(String value1, String value2) {
            addCriterion("link_end not between", value1, value2, "linkEnd");
            return (Criteria) this;
        }

        public Criteria andTitleStartIsNull() {
            addCriterion("title_start is null");
            return (Criteria) this;
        }

        public Criteria andTitleStartIsNotNull() {
            addCriterion("title_start is not null");
            return (Criteria) this;
        }

        public Criteria andTitleStartEqualTo(String value) {
            addCriterion("title_start =", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartNotEqualTo(String value) {
            addCriterion("title_start <>", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartGreaterThan(String value) {
            addCriterion("title_start >", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartGreaterThanOrEqualTo(String value) {
            addCriterion("title_start >=", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartLessThan(String value) {
            addCriterion("title_start <", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartLessThanOrEqualTo(String value) {
            addCriterion("title_start <=", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartLike(String value) {
            addCriterion("title_start like", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartNotLike(String value) {
            addCriterion("title_start not like", value, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartIn(List<String> values) {
            addCriterion("title_start in", values, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartNotIn(List<String> values) {
            addCriterion("title_start not in", values, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartBetween(String value1, String value2) {
            addCriterion("title_start between", value1, value2, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleStartNotBetween(String value1, String value2) {
            addCriterion("title_start not between", value1, value2, "titleStart");
            return (Criteria) this;
        }

        public Criteria andTitleEndIsNull() {
            addCriterion("title_end is null");
            return (Criteria) this;
        }

        public Criteria andTitleEndIsNotNull() {
            addCriterion("title_end is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEndEqualTo(String value) {
            addCriterion("title_end =", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndNotEqualTo(String value) {
            addCriterion("title_end <>", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndGreaterThan(String value) {
            addCriterion("title_end >", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndGreaterThanOrEqualTo(String value) {
            addCriterion("title_end >=", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndLessThan(String value) {
            addCriterion("title_end <", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndLessThanOrEqualTo(String value) {
            addCriterion("title_end <=", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndLike(String value) {
            addCriterion("title_end like", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndNotLike(String value) {
            addCriterion("title_end not like", value, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndIn(List<String> values) {
            addCriterion("title_end in", values, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndNotIn(List<String> values) {
            addCriterion("title_end not in", values, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndBetween(String value1, String value2) {
            addCriterion("title_end between", value1, value2, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andTitleEndNotBetween(String value1, String value2) {
            addCriterion("title_end not between", value1, value2, "titleEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartIsNull() {
            addCriterion("keywords_start is null");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartIsNotNull() {
            addCriterion("keywords_start is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartEqualTo(String value) {
            addCriterion("keywords_start =", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartNotEqualTo(String value) {
            addCriterion("keywords_start <>", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartGreaterThan(String value) {
            addCriterion("keywords_start >", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartGreaterThanOrEqualTo(String value) {
            addCriterion("keywords_start >=", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartLessThan(String value) {
            addCriterion("keywords_start <", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartLessThanOrEqualTo(String value) {
            addCriterion("keywords_start <=", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartLike(String value) {
            addCriterion("keywords_start like", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartNotLike(String value) {
            addCriterion("keywords_start not like", value, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartIn(List<String> values) {
            addCriterion("keywords_start in", values, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartNotIn(List<String> values) {
            addCriterion("keywords_start not in", values, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartBetween(String value1, String value2) {
            addCriterion("keywords_start between", value1, value2, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsStartNotBetween(String value1, String value2) {
            addCriterion("keywords_start not between", value1, value2, "keywordsStart");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndIsNull() {
            addCriterion("keywords_end is null");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndIsNotNull() {
            addCriterion("keywords_end is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndEqualTo(String value) {
            addCriterion("keywords_end =", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndNotEqualTo(String value) {
            addCriterion("keywords_end <>", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndGreaterThan(String value) {
            addCriterion("keywords_end >", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndGreaterThanOrEqualTo(String value) {
            addCriterion("keywords_end >=", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndLessThan(String value) {
            addCriterion("keywords_end <", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndLessThanOrEqualTo(String value) {
            addCriterion("keywords_end <=", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndLike(String value) {
            addCriterion("keywords_end like", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndNotLike(String value) {
            addCriterion("keywords_end not like", value, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndIn(List<String> values) {
            addCriterion("keywords_end in", values, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndNotIn(List<String> values) {
            addCriterion("keywords_end not in", values, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndBetween(String value1, String value2) {
            addCriterion("keywords_end between", value1, value2, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andKeywordsEndNotBetween(String value1, String value2) {
            addCriterion("keywords_end not between", value1, value2, "keywordsEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartIsNull() {
            addCriterion("description_start is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartIsNotNull() {
            addCriterion("description_start is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartEqualTo(String value) {
            addCriterion("description_start =", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartNotEqualTo(String value) {
            addCriterion("description_start <>", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartGreaterThan(String value) {
            addCriterion("description_start >", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartGreaterThanOrEqualTo(String value) {
            addCriterion("description_start >=", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartLessThan(String value) {
            addCriterion("description_start <", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartLessThanOrEqualTo(String value) {
            addCriterion("description_start <=", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartLike(String value) {
            addCriterion("description_start like", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartNotLike(String value) {
            addCriterion("description_start not like", value, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartIn(List<String> values) {
            addCriterion("description_start in", values, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartNotIn(List<String> values) {
            addCriterion("description_start not in", values, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartBetween(String value1, String value2) {
            addCriterion("description_start between", value1, value2, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionStartNotBetween(String value1, String value2) {
            addCriterion("description_start not between", value1, value2, "descriptionStart");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndIsNull() {
            addCriterion("description_end is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndIsNotNull() {
            addCriterion("description_end is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndEqualTo(String value) {
            addCriterion("description_end =", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndNotEqualTo(String value) {
            addCriterion("description_end <>", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndGreaterThan(String value) {
            addCriterion("description_end >", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndGreaterThanOrEqualTo(String value) {
            addCriterion("description_end >=", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndLessThan(String value) {
            addCriterion("description_end <", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndLessThanOrEqualTo(String value) {
            addCriterion("description_end <=", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndLike(String value) {
            addCriterion("description_end like", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndNotLike(String value) {
            addCriterion("description_end not like", value, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndIn(List<String> values) {
            addCriterion("description_end in", values, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndNotIn(List<String> values) {
            addCriterion("description_end not in", values, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndBetween(String value1, String value2) {
            addCriterion("description_end between", value1, value2, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andDescriptionEndNotBetween(String value1, String value2) {
            addCriterion("description_end not between", value1, value2, "descriptionEnd");
            return (Criteria) this;
        }

        public Criteria andContentStartIsNull() {
            addCriterion("content_start is null");
            return (Criteria) this;
        }

        public Criteria andContentStartIsNotNull() {
            addCriterion("content_start is not null");
            return (Criteria) this;
        }

        public Criteria andContentStartEqualTo(String value) {
            addCriterion("content_start =", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartNotEqualTo(String value) {
            addCriterion("content_start <>", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartGreaterThan(String value) {
            addCriterion("content_start >", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartGreaterThanOrEqualTo(String value) {
            addCriterion("content_start >=", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartLessThan(String value) {
            addCriterion("content_start <", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartLessThanOrEqualTo(String value) {
            addCriterion("content_start <=", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartLike(String value) {
            addCriterion("content_start like", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartNotLike(String value) {
            addCriterion("content_start not like", value, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartIn(List<String> values) {
            addCriterion("content_start in", values, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartNotIn(List<String> values) {
            addCriterion("content_start not in", values, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartBetween(String value1, String value2) {
            addCriterion("content_start between", value1, value2, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentStartNotBetween(String value1, String value2) {
            addCriterion("content_start not between", value1, value2, "contentStart");
            return (Criteria) this;
        }

        public Criteria andContentEndIsNull() {
            addCriterion("content_end is null");
            return (Criteria) this;
        }

        public Criteria andContentEndIsNotNull() {
            addCriterion("content_end is not null");
            return (Criteria) this;
        }

        public Criteria andContentEndEqualTo(String value) {
            addCriterion("content_end =", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndNotEqualTo(String value) {
            addCriterion("content_end <>", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndGreaterThan(String value) {
            addCriterion("content_end >", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndGreaterThanOrEqualTo(String value) {
            addCriterion("content_end >=", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndLessThan(String value) {
            addCriterion("content_end <", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndLessThanOrEqualTo(String value) {
            addCriterion("content_end <=", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndLike(String value) {
            addCriterion("content_end like", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndNotLike(String value) {
            addCriterion("content_end not like", value, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndIn(List<String> values) {
            addCriterion("content_end in", values, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndNotIn(List<String> values) {
            addCriterion("content_end not in", values, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndBetween(String value1, String value2) {
            addCriterion("content_end between", value1, value2, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andContentEndNotBetween(String value1, String value2) {
            addCriterion("content_end not between", value1, value2, "contentEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationStartIsNull() {
            addCriterion("pagination_start is null");
            return (Criteria) this;
        }

        public Criteria andPaginationStartIsNotNull() {
            addCriterion("pagination_start is not null");
            return (Criteria) this;
        }

        public Criteria andPaginationStartEqualTo(String value) {
            addCriterion("pagination_start =", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartNotEqualTo(String value) {
            addCriterion("pagination_start <>", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartGreaterThan(String value) {
            addCriterion("pagination_start >", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartGreaterThanOrEqualTo(String value) {
            addCriterion("pagination_start >=", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartLessThan(String value) {
            addCriterion("pagination_start <", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartLessThanOrEqualTo(String value) {
            addCriterion("pagination_start <=", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartLike(String value) {
            addCriterion("pagination_start like", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartNotLike(String value) {
            addCriterion("pagination_start not like", value, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartIn(List<String> values) {
            addCriterion("pagination_start in", values, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartNotIn(List<String> values) {
            addCriterion("pagination_start not in", values, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartBetween(String value1, String value2) {
            addCriterion("pagination_start between", value1, value2, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationStartNotBetween(String value1, String value2) {
            addCriterion("pagination_start not between", value1, value2, "paginationStart");
            return (Criteria) this;
        }

        public Criteria andPaginationEndIsNull() {
            addCriterion("pagination_end is null");
            return (Criteria) this;
        }

        public Criteria andPaginationEndIsNotNull() {
            addCriterion("pagination_end is not null");
            return (Criteria) this;
        }

        public Criteria andPaginationEndEqualTo(String value) {
            addCriterion("pagination_end =", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndNotEqualTo(String value) {
            addCriterion("pagination_end <>", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndGreaterThan(String value) {
            addCriterion("pagination_end >", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndGreaterThanOrEqualTo(String value) {
            addCriterion("pagination_end >=", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndLessThan(String value) {
            addCriterion("pagination_end <", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndLessThanOrEqualTo(String value) {
            addCriterion("pagination_end <=", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndLike(String value) {
            addCriterion("pagination_end like", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndNotLike(String value) {
            addCriterion("pagination_end not like", value, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndIn(List<String> values) {
            addCriterion("pagination_end in", values, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndNotIn(List<String> values) {
            addCriterion("pagination_end not in", values, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndBetween(String value1, String value2) {
            addCriterion("pagination_end between", value1, value2, "paginationEnd");
            return (Criteria) this;
        }

        public Criteria andPaginationEndNotBetween(String value1, String value2) {
            addCriterion("pagination_end not between", value1, value2, "paginationEnd");
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