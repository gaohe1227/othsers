package com.doadway.dwcom.crm.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PersonnelExtExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PersonnelExtExample() {
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

        public Criteria andPersonnelIdIsNull() {
            addCriterion("personnel_id is null");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdIsNotNull() {
            addCriterion("personnel_id is not null");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdEqualTo(Integer value) {
            addCriterion("personnel_id =", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdNotEqualTo(Integer value) {
            addCriterion("personnel_id <>", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdGreaterThan(Integer value) {
            addCriterion("personnel_id >", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("personnel_id >=", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdLessThan(Integer value) {
            addCriterion("personnel_id <", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdLessThanOrEqualTo(Integer value) {
            addCriterion("personnel_id <=", value, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdIn(List<Integer> values) {
            addCriterion("personnel_id in", values, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdNotIn(List<Integer> values) {
            addCriterion("personnel_id not in", values, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdBetween(Integer value1, Integer value2) {
            addCriterion("personnel_id between", value1, value2, "personnelId");
            return (Criteria) this;
        }

        public Criteria andPersonnelIdNotBetween(Integer value1, Integer value2) {
            addCriterion("personnel_id not between", value1, value2, "personnelId");
            return (Criteria) this;
        }

        public Criteria andRealnameIsNull() {
            addCriterion("realname is null");
            return (Criteria) this;
        }

        public Criteria andRealnameIsNotNull() {
            addCriterion("realname is not null");
            return (Criteria) this;
        }

        public Criteria andRealnameEqualTo(String value) {
            addCriterion("realname =", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameNotEqualTo(String value) {
            addCriterion("realname <>", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameGreaterThan(String value) {
            addCriterion("realname >", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameGreaterThanOrEqualTo(String value) {
            addCriterion("realname >=", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameLessThan(String value) {
            addCriterion("realname <", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameLessThanOrEqualTo(String value) {
            addCriterion("realname <=", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameLike(String value) {
            addCriterion("realname like", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameNotLike(String value) {
            addCriterion("realname not like", value, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameIn(List<String> values) {
            addCriterion("realname in", values, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameNotIn(List<String> values) {
            addCriterion("realname not in", values, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameBetween(String value1, String value2) {
            addCriterion("realname between", value1, value2, "realname");
            return (Criteria) this;
        }

        public Criteria andRealnameNotBetween(String value1, String value2) {
            addCriterion("realname not between", value1, value2, "realname");
            return (Criteria) this;
        }

        public Criteria andGenderIsNull() {
            addCriterion("gender is null");
            return (Criteria) this;
        }

        public Criteria andGenderIsNotNull() {
            addCriterion("gender is not null");
            return (Criteria) this;
        }

        public Criteria andGenderEqualTo(Boolean value) {
            addCriterion("gender =", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotEqualTo(Boolean value) {
            addCriterion("gender <>", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThan(Boolean value) {
            addCriterion("gender >", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderGreaterThanOrEqualTo(Boolean value) {
            addCriterion("gender >=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThan(Boolean value) {
            addCriterion("gender <", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderLessThanOrEqualTo(Boolean value) {
            addCriterion("gender <=", value, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderIn(List<Boolean> values) {
            addCriterion("gender in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotIn(List<Boolean> values) {
            addCriterion("gender not in", values, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderBetween(Boolean value1, Boolean value2) {
            addCriterion("gender between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andGenderNotBetween(Boolean value1, Boolean value2) {
            addCriterion("gender not between", value1, value2, "gender");
            return (Criteria) this;
        }

        public Criteria andJobPositionIsNull() {
            addCriterion("job_position is null");
            return (Criteria) this;
        }

        public Criteria andJobPositionIsNotNull() {
            addCriterion("job_position is not null");
            return (Criteria) this;
        }

        public Criteria andJobPositionEqualTo(String value) {
            addCriterion("job_position =", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionNotEqualTo(String value) {
            addCriterion("job_position <>", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionGreaterThan(String value) {
            addCriterion("job_position >", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionGreaterThanOrEqualTo(String value) {
            addCriterion("job_position >=", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionLessThan(String value) {
            addCriterion("job_position <", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionLessThanOrEqualTo(String value) {
            addCriterion("job_position <=", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionLike(String value) {
            addCriterion("job_position like", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionNotLike(String value) {
            addCriterion("job_position not like", value, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionIn(List<String> values) {
            addCriterion("job_position in", values, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionNotIn(List<String> values) {
            addCriterion("job_position not in", values, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionBetween(String value1, String value2) {
            addCriterion("job_position between", value1, value2, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andJobPositionNotBetween(String value1, String value2) {
            addCriterion("job_position not between", value1, value2, "jobPosition");
            return (Criteria) this;
        }

        public Criteria andWorkYearsIsNull() {
            addCriterion("work_years is null");
            return (Criteria) this;
        }

        public Criteria andWorkYearsIsNotNull() {
            addCriterion("work_years is not null");
            return (Criteria) this;
        }

        public Criteria andWorkYearsEqualTo(String value) {
            addCriterion("work_years =", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsNotEqualTo(String value) {
            addCriterion("work_years <>", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsGreaterThan(String value) {
            addCriterion("work_years >", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsGreaterThanOrEqualTo(String value) {
            addCriterion("work_years >=", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsLessThan(String value) {
            addCriterion("work_years <", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsLessThanOrEqualTo(String value) {
            addCriterion("work_years <=", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsLike(String value) {
            addCriterion("work_years like", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsNotLike(String value) {
            addCriterion("work_years not like", value, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsIn(List<String> values) {
            addCriterion("work_years in", values, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsNotIn(List<String> values) {
            addCriterion("work_years not in", values, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsBetween(String value1, String value2) {
            addCriterion("work_years between", value1, value2, "workYears");
            return (Criteria) this;
        }

        public Criteria andWorkYearsNotBetween(String value1, String value2) {
            addCriterion("work_years not between", value1, value2, "workYears");
            return (Criteria) this;
        }

        public Criteria andPresentAddressIsNull() {
            addCriterion("present_address is null");
            return (Criteria) this;
        }

        public Criteria andPresentAddressIsNotNull() {
            addCriterion("present_address is not null");
            return (Criteria) this;
        }

        public Criteria andPresentAddressEqualTo(String value) {
            addCriterion("present_address =", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressNotEqualTo(String value) {
            addCriterion("present_address <>", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressGreaterThan(String value) {
            addCriterion("present_address >", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressGreaterThanOrEqualTo(String value) {
            addCriterion("present_address >=", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressLessThan(String value) {
            addCriterion("present_address <", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressLessThanOrEqualTo(String value) {
            addCriterion("present_address <=", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressLike(String value) {
            addCriterion("present_address like", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressNotLike(String value) {
            addCriterion("present_address not like", value, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressIn(List<String> values) {
            addCriterion("present_address in", values, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressNotIn(List<String> values) {
            addCriterion("present_address not in", values, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressBetween(String value1, String value2) {
            addCriterion("present_address between", value1, value2, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andPresentAddressNotBetween(String value1, String value2) {
            addCriterion("present_address not between", value1, value2, "presentAddress");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeIsNull() {
            addCriterion("onboard_time is null");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeIsNotNull() {
            addCriterion("onboard_time is not null");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeEqualTo(Date value) {
            addCriterion("onboard_time =", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeNotEqualTo(Date value) {
            addCriterion("onboard_time <>", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeGreaterThan(Date value) {
            addCriterion("onboard_time >", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("onboard_time >=", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeLessThan(Date value) {
            addCriterion("onboard_time <", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeLessThanOrEqualTo(Date value) {
            addCriterion("onboard_time <=", value, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeIn(List<Date> values) {
            addCriterion("onboard_time in", values, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeNotIn(List<Date> values) {
            addCriterion("onboard_time not in", values, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeBetween(Date value1, Date value2) {
            addCriterion("onboard_time between", value1, value2, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andOnboardTimeNotBetween(Date value1, Date value2) {
            addCriterion("onboard_time not between", value1, value2, "onboardTime");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNull() {
            addCriterion("birthday is null");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNotNull() {
            addCriterion("birthday is not null");
            return (Criteria) this;
        }

        public Criteria andBirthdayEqualTo(Date value) {
            addCriterion("birthday =", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotEqualTo(Date value) {
            addCriterion("birthday <>", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThan(Date value) {
            addCriterion("birthday >", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThanOrEqualTo(Date value) {
            addCriterion("birthday >=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThan(Date value) {
            addCriterion("birthday <", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThanOrEqualTo(Date value) {
            addCriterion("birthday <=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayIn(List<Date> values) {
            addCriterion("birthday in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotIn(List<Date> values) {
            addCriterion("birthday not in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayBetween(Date value1, Date value2) {
            addCriterion("birthday between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotBetween(Date value1, Date value2) {
            addCriterion("birthday not between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andIntroIsNull() {
            addCriterion("intro is null");
            return (Criteria) this;
        }

        public Criteria andIntroIsNotNull() {
            addCriterion("intro is not null");
            return (Criteria) this;
        }

        public Criteria andIntroEqualTo(String value) {
            addCriterion("intro =", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroNotEqualTo(String value) {
            addCriterion("intro <>", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroGreaterThan(String value) {
            addCriterion("intro >", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroGreaterThanOrEqualTo(String value) {
            addCriterion("intro >=", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroLessThan(String value) {
            addCriterion("intro <", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroLessThanOrEqualTo(String value) {
            addCriterion("intro <=", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroLike(String value) {
            addCriterion("intro like", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroNotLike(String value) {
            addCriterion("intro not like", value, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroIn(List<String> values) {
            addCriterion("intro in", values, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroNotIn(List<String> values) {
            addCriterion("intro not in", values, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroBetween(String value1, String value2) {
            addCriterion("intro between", value1, value2, "intro");
            return (Criteria) this;
        }

        public Criteria andIntroNotBetween(String value1, String value2) {
            addCriterion("intro not between", value1, value2, "intro");
            return (Criteria) this;
        }

        public Criteria andComefromIsNull() {
            addCriterion("comefrom is null");
            return (Criteria) this;
        }

        public Criteria andComefromIsNotNull() {
            addCriterion("comefrom is not null");
            return (Criteria) this;
        }

        public Criteria andComefromEqualTo(String value) {
            addCriterion("comefrom =", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromNotEqualTo(String value) {
            addCriterion("comefrom <>", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromGreaterThan(String value) {
            addCriterion("comefrom >", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromGreaterThanOrEqualTo(String value) {
            addCriterion("comefrom >=", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromLessThan(String value) {
            addCriterion("comefrom <", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromLessThanOrEqualTo(String value) {
            addCriterion("comefrom <=", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromLike(String value) {
            addCriterion("comefrom like", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromNotLike(String value) {
            addCriterion("comefrom not like", value, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromIn(List<String> values) {
            addCriterion("comefrom in", values, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromNotIn(List<String> values) {
            addCriterion("comefrom not in", values, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromBetween(String value1, String value2) {
            addCriterion("comefrom between", value1, value2, "comefrom");
            return (Criteria) this;
        }

        public Criteria andComefromNotBetween(String value1, String value2) {
            addCriterion("comefrom not between", value1, value2, "comefrom");
            return (Criteria) this;
        }

        public Criteria andQqIsNull() {
            addCriterion("qq is null");
            return (Criteria) this;
        }

        public Criteria andQqIsNotNull() {
            addCriterion("qq is not null");
            return (Criteria) this;
        }

        public Criteria andQqEqualTo(String value) {
            addCriterion("qq =", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqNotEqualTo(String value) {
            addCriterion("qq <>", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqGreaterThan(String value) {
            addCriterion("qq >", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqGreaterThanOrEqualTo(String value) {
            addCriterion("qq >=", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqLessThan(String value) {
            addCriterion("qq <", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqLessThanOrEqualTo(String value) {
            addCriterion("qq <=", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqLike(String value) {
            addCriterion("qq like", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqNotLike(String value) {
            addCriterion("qq not like", value, "qq");
            return (Criteria) this;
        }

        public Criteria andQqIn(List<String> values) {
            addCriterion("qq in", values, "qq");
            return (Criteria) this;
        }

        public Criteria andQqNotIn(List<String> values) {
            addCriterion("qq not in", values, "qq");
            return (Criteria) this;
        }

        public Criteria andQqBetween(String value1, String value2) {
            addCriterion("qq between", value1, value2, "qq");
            return (Criteria) this;
        }

        public Criteria andQqNotBetween(String value1, String value2) {
            addCriterion("qq not between", value1, value2, "qq");
            return (Criteria) this;
        }

        public Criteria andMsnIsNull() {
            addCriterion("msn is null");
            return (Criteria) this;
        }

        public Criteria andMsnIsNotNull() {
            addCriterion("msn is not null");
            return (Criteria) this;
        }

        public Criteria andMsnEqualTo(String value) {
            addCriterion("msn =", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnNotEqualTo(String value) {
            addCriterion("msn <>", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnGreaterThan(String value) {
            addCriterion("msn >", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnGreaterThanOrEqualTo(String value) {
            addCriterion("msn >=", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnLessThan(String value) {
            addCriterion("msn <", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnLessThanOrEqualTo(String value) {
            addCriterion("msn <=", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnLike(String value) {
            addCriterion("msn like", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnNotLike(String value) {
            addCriterion("msn not like", value, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnIn(List<String> values) {
            addCriterion("msn in", values, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnNotIn(List<String> values) {
            addCriterion("msn not in", values, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnBetween(String value1, String value2) {
            addCriterion("msn between", value1, value2, "msn");
            return (Criteria) this;
        }

        public Criteria andMsnNotBetween(String value1, String value2) {
            addCriterion("msn not between", value1, value2, "msn");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
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

        public Criteria andMobileIsNull() {
            addCriterion("mobile is null");
            return (Criteria) this;
        }

        public Criteria andMobileIsNotNull() {
            addCriterion("mobile is not null");
            return (Criteria) this;
        }

        public Criteria andMobileEqualTo(String value) {
            addCriterion("mobile =", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotEqualTo(String value) {
            addCriterion("mobile <>", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThan(String value) {
            addCriterion("mobile >", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThanOrEqualTo(String value) {
            addCriterion("mobile >=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThan(String value) {
            addCriterion("mobile <", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThanOrEqualTo(String value) {
            addCriterion("mobile <=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLike(String value) {
            addCriterion("mobile like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotLike(String value) {
            addCriterion("mobile not like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileIn(List<String> values) {
            addCriterion("mobile in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotIn(List<String> values) {
            addCriterion("mobile not in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileBetween(String value1, String value2) {
            addCriterion("mobile between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotBetween(String value1, String value2) {
            addCriterion("mobile not between", value1, value2, "mobile");
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