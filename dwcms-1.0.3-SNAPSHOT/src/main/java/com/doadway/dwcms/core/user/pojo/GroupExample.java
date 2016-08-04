package com.doadway.dwcms.core.user.pojo;

import java.util.ArrayList;
import java.util.List;

public class GroupExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GroupExample() {
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

        public Criteria andGroupIdIsNull() {
            addCriterion("group_id is null");
            return (Criteria) this;
        }

        public Criteria andGroupIdIsNotNull() {
            addCriterion("group_id is not null");
            return (Criteria) this;
        }

        public Criteria andGroupIdEqualTo(Integer value) {
            addCriterion("group_id =", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotEqualTo(Integer value) {
            addCriterion("group_id <>", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThan(Integer value) {
            addCriterion("group_id >", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("group_id >=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThan(Integer value) {
            addCriterion("group_id <", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThanOrEqualTo(Integer value) {
            addCriterion("group_id <=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdIn(List<Integer> values) {
            addCriterion("group_id in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotIn(List<Integer> values) {
            addCriterion("group_id not in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdBetween(Integer value1, Integer value2) {
            addCriterion("group_id between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotBetween(Integer value1, Integer value2) {
            addCriterion("group_id not between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupNameIsNull() {
            addCriterion("group_name is null");
            return (Criteria) this;
        }

        public Criteria andGroupNameIsNotNull() {
            addCriterion("group_name is not null");
            return (Criteria) this;
        }

        public Criteria andGroupNameEqualTo(String value) {
            addCriterion("group_name =", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameNotEqualTo(String value) {
            addCriterion("group_name <>", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameGreaterThan(String value) {
            addCriterion("group_name >", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameGreaterThanOrEqualTo(String value) {
            addCriterion("group_name >=", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameLessThan(String value) {
            addCriterion("group_name <", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameLessThanOrEqualTo(String value) {
            addCriterion("group_name <=", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameLike(String value) {
            addCriterion("group_name like", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameNotLike(String value) {
            addCriterion("group_name not like", value, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameIn(List<String> values) {
            addCriterion("group_name in", values, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameNotIn(List<String> values) {
            addCriterion("group_name not in", values, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameBetween(String value1, String value2) {
            addCriterion("group_name between", value1, value2, "groupName");
            return (Criteria) this;
        }

        public Criteria andGroupNameNotBetween(String value1, String value2) {
            addCriterion("group_name not between", value1, value2, "groupName");
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

        public Criteria andNeedCaptchaIsNull() {
            addCriterion("need_captcha is null");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaIsNotNull() {
            addCriterion("need_captcha is not null");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaEqualTo(Boolean value) {
            addCriterion("need_captcha =", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaNotEqualTo(Boolean value) {
            addCriterion("need_captcha <>", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaGreaterThan(Boolean value) {
            addCriterion("need_captcha >", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaGreaterThanOrEqualTo(Boolean value) {
            addCriterion("need_captcha >=", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaLessThan(Boolean value) {
            addCriterion("need_captcha <", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaLessThanOrEqualTo(Boolean value) {
            addCriterion("need_captcha <=", value, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaIn(List<Boolean> values) {
            addCriterion("need_captcha in", values, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaNotIn(List<Boolean> values) {
            addCriterion("need_captcha not in", values, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaBetween(Boolean value1, Boolean value2) {
            addCriterion("need_captcha between", value1, value2, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCaptchaNotBetween(Boolean value1, Boolean value2) {
            addCriterion("need_captcha not between", value1, value2, "needCaptcha");
            return (Criteria) this;
        }

        public Criteria andNeedCheckIsNull() {
            addCriterion("need_check is null");
            return (Criteria) this;
        }

        public Criteria andNeedCheckIsNotNull() {
            addCriterion("need_check is not null");
            return (Criteria) this;
        }

        public Criteria andNeedCheckEqualTo(Boolean value) {
            addCriterion("need_check =", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckNotEqualTo(Boolean value) {
            addCriterion("need_check <>", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckGreaterThan(Boolean value) {
            addCriterion("need_check >", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckGreaterThanOrEqualTo(Boolean value) {
            addCriterion("need_check >=", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckLessThan(Boolean value) {
            addCriterion("need_check <", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckLessThanOrEqualTo(Boolean value) {
            addCriterion("need_check <=", value, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckIn(List<Boolean> values) {
            addCriterion("need_check in", values, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckNotIn(List<Boolean> values) {
            addCriterion("need_check not in", values, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckBetween(Boolean value1, Boolean value2) {
            addCriterion("need_check between", value1, value2, "needCheck");
            return (Criteria) this;
        }

        public Criteria andNeedCheckNotBetween(Boolean value1, Boolean value2) {
            addCriterion("need_check not between", value1, value2, "needCheck");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayIsNull() {
            addCriterion("allow_per_day is null");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayIsNotNull() {
            addCriterion("allow_per_day is not null");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayEqualTo(Integer value) {
            addCriterion("allow_per_day =", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayNotEqualTo(Integer value) {
            addCriterion("allow_per_day <>", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayGreaterThan(Integer value) {
            addCriterion("allow_per_day >", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayGreaterThanOrEqualTo(Integer value) {
            addCriterion("allow_per_day >=", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayLessThan(Integer value) {
            addCriterion("allow_per_day <", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayLessThanOrEqualTo(Integer value) {
            addCriterion("allow_per_day <=", value, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayIn(List<Integer> values) {
            addCriterion("allow_per_day in", values, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayNotIn(List<Integer> values) {
            addCriterion("allow_per_day not in", values, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayBetween(Integer value1, Integer value2) {
            addCriterion("allow_per_day between", value1, value2, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowPerDayNotBetween(Integer value1, Integer value2) {
            addCriterion("allow_per_day not between", value1, value2, "allowPerDay");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileIsNull() {
            addCriterion("allow_max_file is null");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileIsNotNull() {
            addCriterion("allow_max_file is not null");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileEqualTo(Integer value) {
            addCriterion("allow_max_file =", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileNotEqualTo(Integer value) {
            addCriterion("allow_max_file <>", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileGreaterThan(Integer value) {
            addCriterion("allow_max_file >", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileGreaterThanOrEqualTo(Integer value) {
            addCriterion("allow_max_file >=", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileLessThan(Integer value) {
            addCriterion("allow_max_file <", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileLessThanOrEqualTo(Integer value) {
            addCriterion("allow_max_file <=", value, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileIn(List<Integer> values) {
            addCriterion("allow_max_file in", values, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileNotIn(List<Integer> values) {
            addCriterion("allow_max_file not in", values, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileBetween(Integer value1, Integer value2) {
            addCriterion("allow_max_file between", value1, value2, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowMaxFileNotBetween(Integer value1, Integer value2) {
            addCriterion("allow_max_file not between", value1, value2, "allowMaxFile");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixIsNull() {
            addCriterion("allow_suffix is null");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixIsNotNull() {
            addCriterion("allow_suffix is not null");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixEqualTo(String value) {
            addCriterion("allow_suffix =", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixNotEqualTo(String value) {
            addCriterion("allow_suffix <>", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixGreaterThan(String value) {
            addCriterion("allow_suffix >", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixGreaterThanOrEqualTo(String value) {
            addCriterion("allow_suffix >=", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixLessThan(String value) {
            addCriterion("allow_suffix <", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixLessThanOrEqualTo(String value) {
            addCriterion("allow_suffix <=", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixLike(String value) {
            addCriterion("allow_suffix like", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixNotLike(String value) {
            addCriterion("allow_suffix not like", value, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixIn(List<String> values) {
            addCriterion("allow_suffix in", values, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixNotIn(List<String> values) {
            addCriterion("allow_suffix not in", values, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixBetween(String value1, String value2) {
            addCriterion("allow_suffix between", value1, value2, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andAllowSuffixNotBetween(String value1, String value2) {
            addCriterion("allow_suffix not between", value1, value2, "allowSuffix");
            return (Criteria) this;
        }

        public Criteria andIsRegDefIsNull() {
            addCriterion("is_reg_def is null");
            return (Criteria) this;
        }

        public Criteria andIsRegDefIsNotNull() {
            addCriterion("is_reg_def is not null");
            return (Criteria) this;
        }

        public Criteria andIsRegDefEqualTo(Boolean value) {
            addCriterion("is_reg_def =", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefNotEqualTo(Boolean value) {
            addCriterion("is_reg_def <>", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefGreaterThan(Boolean value) {
            addCriterion("is_reg_def >", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_reg_def >=", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefLessThan(Boolean value) {
            addCriterion("is_reg_def <", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefLessThanOrEqualTo(Boolean value) {
            addCriterion("is_reg_def <=", value, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefIn(List<Boolean> values) {
            addCriterion("is_reg_def in", values, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefNotIn(List<Boolean> values) {
            addCriterion("is_reg_def not in", values, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefBetween(Boolean value1, Boolean value2) {
            addCriterion("is_reg_def between", value1, value2, "isRegDef");
            return (Criteria) this;
        }

        public Criteria andIsRegDefNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_reg_def not between", value1, value2, "isRegDef");
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