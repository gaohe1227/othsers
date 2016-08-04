package com.doadway.dwcms.assistant.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class AdvertisingExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdvertisingExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andAdvertisingIdIsNull() {
            addCriterion("advertising_id is null");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdIsNotNull() {
            addCriterion("advertising_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdEqualTo(Integer value) {
            addCriterion("advertising_id =", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdNotEqualTo(Integer value) {
            addCriterion("advertising_id <>", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdGreaterThan(Integer value) {
            addCriterion("advertising_id >", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("advertising_id >=", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdLessThan(Integer value) {
            addCriterion("advertising_id <", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdLessThanOrEqualTo(Integer value) {
            addCriterion("advertising_id <=", value, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdIn(List<Integer> values) {
            addCriterion("advertising_id in", values, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdNotIn(List<Integer> values) {
            addCriterion("advertising_id not in", values, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdBetween(Integer value1, Integer value2) {
            addCriterion("advertising_id between", value1, value2, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdvertisingIdNotBetween(Integer value1, Integer value2) {
            addCriterion("advertising_id not between", value1, value2, "advertisingId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdIsNull() {
            addCriterion("adspace_id is null");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdIsNotNull() {
            addCriterion("adspace_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdEqualTo(Integer value) {
            addCriterion("adspace_id =", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdNotEqualTo(Integer value) {
            addCriterion("adspace_id <>", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdGreaterThan(Integer value) {
            addCriterion("adspace_id >", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("adspace_id >=", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdLessThan(Integer value) {
            addCriterion("adspace_id <", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdLessThanOrEqualTo(Integer value) {
            addCriterion("adspace_id <=", value, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdIn(List<Integer> values) {
            addCriterion("adspace_id in", values, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdNotIn(List<Integer> values) {
            addCriterion("adspace_id not in", values, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdBetween(Integer value1, Integer value2) {
            addCriterion("adspace_id between", value1, value2, "adspaceId");
            return (Criteria) this;
        }

        public Criteria andAdspaceIdNotBetween(Integer value1, Integer value2) {
            addCriterion("adspace_id not between", value1, value2, "adspaceId");
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

        public Criteria andAdNameIsNull() {
            addCriterion("ad_name is null");
            return (Criteria) this;
        }

        public Criteria andAdNameIsNotNull() {
            addCriterion("ad_name is not null");
            return (Criteria) this;
        }

        public Criteria andAdNameEqualTo(String value) {
            addCriterion("ad_name =", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotEqualTo(String value) {
            addCriterion("ad_name <>", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameGreaterThan(String value) {
            addCriterion("ad_name >", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameGreaterThanOrEqualTo(String value) {
            addCriterion("ad_name >=", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLessThan(String value) {
            addCriterion("ad_name <", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLessThanOrEqualTo(String value) {
            addCriterion("ad_name <=", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameLike(String value) {
            addCriterion("ad_name like", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotLike(String value) {
            addCriterion("ad_name not like", value, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameIn(List<String> values) {
            addCriterion("ad_name in", values, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotIn(List<String> values) {
            addCriterion("ad_name not in", values, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameBetween(String value1, String value2) {
            addCriterion("ad_name between", value1, value2, "adName");
            return (Criteria) this;
        }

        public Criteria andAdNameNotBetween(String value1, String value2) {
            addCriterion("ad_name not between", value1, value2, "adName");
            return (Criteria) this;
        }

        public Criteria andCategoryIsNull() {
            addCriterion("category is null");
            return (Criteria) this;
        }

        public Criteria andCategoryIsNotNull() {
            addCriterion("category is not null");
            return (Criteria) this;
        }

        public Criteria andCategoryEqualTo(String value) {
            addCriterion("category =", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotEqualTo(String value) {
            addCriterion("category <>", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryGreaterThan(String value) {
            addCriterion("category >", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryGreaterThanOrEqualTo(String value) {
            addCriterion("category >=", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLessThan(String value) {
            addCriterion("category <", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLessThanOrEqualTo(String value) {
            addCriterion("category <=", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryLike(String value) {
            addCriterion("category like", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotLike(String value) {
            addCriterion("category not like", value, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryIn(List<String> values) {
            addCriterion("category in", values, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotIn(List<String> values) {
            addCriterion("category not in", values, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryBetween(String value1, String value2) {
            addCriterion("category between", value1, value2, "category");
            return (Criteria) this;
        }

        public Criteria andCategoryNotBetween(String value1, String value2) {
            addCriterion("category not between", value1, value2, "category");
            return (Criteria) this;
        }

        public Criteria andAdWeightIsNull() {
            addCriterion("ad_weight is null");
            return (Criteria) this;
        }

        public Criteria andAdWeightIsNotNull() {
            addCriterion("ad_weight is not null");
            return (Criteria) this;
        }

        public Criteria andAdWeightEqualTo(Integer value) {
            addCriterion("ad_weight =", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightNotEqualTo(Integer value) {
            addCriterion("ad_weight <>", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightGreaterThan(Integer value) {
            addCriterion("ad_weight >", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("ad_weight >=", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightLessThan(Integer value) {
            addCriterion("ad_weight <", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightLessThanOrEqualTo(Integer value) {
            addCriterion("ad_weight <=", value, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightIn(List<Integer> values) {
            addCriterion("ad_weight in", values, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightNotIn(List<Integer> values) {
            addCriterion("ad_weight not in", values, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightBetween(Integer value1, Integer value2) {
            addCriterion("ad_weight between", value1, value2, "adWeight");
            return (Criteria) this;
        }

        public Criteria andAdWeightNotBetween(Integer value1, Integer value2) {
            addCriterion("ad_weight not between", value1, value2, "adWeight");
            return (Criteria) this;
        }

        public Criteria andDisplayCountIsNull() {
            addCriterion("display_count is null");
            return (Criteria) this;
        }

        public Criteria andDisplayCountIsNotNull() {
            addCriterion("display_count is not null");
            return (Criteria) this;
        }

        public Criteria andDisplayCountEqualTo(Long value) {
            addCriterion("display_count =", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountNotEqualTo(Long value) {
            addCriterion("display_count <>", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountGreaterThan(Long value) {
            addCriterion("display_count >", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountGreaterThanOrEqualTo(Long value) {
            addCriterion("display_count >=", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountLessThan(Long value) {
            addCriterion("display_count <", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountLessThanOrEqualTo(Long value) {
            addCriterion("display_count <=", value, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountIn(List<Long> values) {
            addCriterion("display_count in", values, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountNotIn(List<Long> values) {
            addCriterion("display_count not in", values, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountBetween(Long value1, Long value2) {
            addCriterion("display_count between", value1, value2, "displayCount");
            return (Criteria) this;
        }

        public Criteria andDisplayCountNotBetween(Long value1, Long value2) {
            addCriterion("display_count not between", value1, value2, "displayCount");
            return (Criteria) this;
        }

        public Criteria andClickCountIsNull() {
            addCriterion("click_count is null");
            return (Criteria) this;
        }

        public Criteria andClickCountIsNotNull() {
            addCriterion("click_count is not null");
            return (Criteria) this;
        }

        public Criteria andClickCountEqualTo(Long value) {
            addCriterion("click_count =", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountNotEqualTo(Long value) {
            addCriterion("click_count <>", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountGreaterThan(Long value) {
            addCriterion("click_count >", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountGreaterThanOrEqualTo(Long value) {
            addCriterion("click_count >=", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountLessThan(Long value) {
            addCriterion("click_count <", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountLessThanOrEqualTo(Long value) {
            addCriterion("click_count <=", value, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountIn(List<Long> values) {
            addCriterion("click_count in", values, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountNotIn(List<Long> values) {
            addCriterion("click_count not in", values, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountBetween(Long value1, Long value2) {
            addCriterion("click_count between", value1, value2, "clickCount");
            return (Criteria) this;
        }

        public Criteria andClickCountNotBetween(Long value1, Long value2) {
            addCriterion("click_count not between", value1, value2, "clickCount");
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
            addCriterionForJDBCDate("start_time =", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("start_time <>", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("start_time >", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("start_time >=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThan(Date value) {
            addCriterionForJDBCDate("start_time <", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("start_time <=", value, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeIn(List<Date> values) {
            addCriterionForJDBCDate("start_time in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("start_time not in", values, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("start_time between", value1, value2, "startTime");
            return (Criteria) this;
        }

        public Criteria andStartTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("start_time not between", value1, value2, "startTime");
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
            addCriterionForJDBCDate("end_time =", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("end_time <>", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("end_time >", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("end_time >=", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeLessThan(Date value) {
            addCriterionForJDBCDate("end_time <", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("end_time <=", value, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeIn(List<Date> values) {
            addCriterionForJDBCDate("end_time in", values, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("end_time not in", values, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("end_time between", value1, value2, "endTime");
            return (Criteria) this;
        }

        public Criteria andEndTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("end_time not between", value1, value2, "endTime");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIsNull() {
            addCriterion("is_enabled is null");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIsNotNull() {
            addCriterion("is_enabled is not null");
            return (Criteria) this;
        }

        public Criteria andIsEnabledEqualTo(String value) {
            addCriterion("is_enabled =", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotEqualTo(String value) {
            addCriterion("is_enabled <>", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledGreaterThan(String value) {
            addCriterion("is_enabled >", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledGreaterThanOrEqualTo(String value) {
            addCriterion("is_enabled >=", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledLessThan(String value) {
            addCriterion("is_enabled <", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledLessThanOrEqualTo(String value) {
            addCriterion("is_enabled <=", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledLike(String value) {
            addCriterion("is_enabled like", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotLike(String value) {
            addCriterion("is_enabled not like", value, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledIn(List<String> values) {
            addCriterion("is_enabled in", values, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotIn(List<String> values) {
            addCriterion("is_enabled not in", values, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledBetween(String value1, String value2) {
            addCriterion("is_enabled between", value1, value2, "isEnabled");
            return (Criteria) this;
        }

        public Criteria andIsEnabledNotBetween(String value1, String value2) {
            addCriterion("is_enabled not between", value1, value2, "isEnabled");
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