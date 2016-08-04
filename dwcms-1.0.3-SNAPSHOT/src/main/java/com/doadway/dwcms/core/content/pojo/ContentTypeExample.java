package com.doadway.dwcms.core.content.pojo;

import java.util.ArrayList;
import java.util.List;

public class ContentTypeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContentTypeExample() {
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

        public Criteria andTypeNameIsNull() {
            addCriterion("type_name is null");
            return (Criteria) this;
        }

        public Criteria andTypeNameIsNotNull() {
            addCriterion("type_name is not null");
            return (Criteria) this;
        }

        public Criteria andTypeNameEqualTo(String value) {
            addCriterion("type_name =", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameNotEqualTo(String value) {
            addCriterion("type_name <>", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameGreaterThan(String value) {
            addCriterion("type_name >", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameGreaterThanOrEqualTo(String value) {
            addCriterion("type_name >=", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameLessThan(String value) {
            addCriterion("type_name <", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameLessThanOrEqualTo(String value) {
            addCriterion("type_name <=", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameLike(String value) {
            addCriterion("type_name like", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameNotLike(String value) {
            addCriterion("type_name not like", value, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameIn(List<String> values) {
            addCriterion("type_name in", values, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameNotIn(List<String> values) {
            addCriterion("type_name not in", values, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameBetween(String value1, String value2) {
            addCriterion("type_name between", value1, value2, "typeName");
            return (Criteria) this;
        }

        public Criteria andTypeNameNotBetween(String value1, String value2) {
            addCriterion("type_name not between", value1, value2, "typeName");
            return (Criteria) this;
        }

        public Criteria andImgWidthIsNull() {
            addCriterion("img_width is null");
            return (Criteria) this;
        }

        public Criteria andImgWidthIsNotNull() {
            addCriterion("img_width is not null");
            return (Criteria) this;
        }

        public Criteria andImgWidthEqualTo(Integer value) {
            addCriterion("img_width =", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthNotEqualTo(Integer value) {
            addCriterion("img_width <>", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthGreaterThan(Integer value) {
            addCriterion("img_width >", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthGreaterThanOrEqualTo(Integer value) {
            addCriterion("img_width >=", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthLessThan(Integer value) {
            addCriterion("img_width <", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthLessThanOrEqualTo(Integer value) {
            addCriterion("img_width <=", value, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthIn(List<Integer> values) {
            addCriterion("img_width in", values, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthNotIn(List<Integer> values) {
            addCriterion("img_width not in", values, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthBetween(Integer value1, Integer value2) {
            addCriterion("img_width between", value1, value2, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgWidthNotBetween(Integer value1, Integer value2) {
            addCriterion("img_width not between", value1, value2, "imgWidth");
            return (Criteria) this;
        }

        public Criteria andImgHeightIsNull() {
            addCriterion("img_height is null");
            return (Criteria) this;
        }

        public Criteria andImgHeightIsNotNull() {
            addCriterion("img_height is not null");
            return (Criteria) this;
        }

        public Criteria andImgHeightEqualTo(Integer value) {
            addCriterion("img_height =", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightNotEqualTo(Integer value) {
            addCriterion("img_height <>", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightGreaterThan(Integer value) {
            addCriterion("img_height >", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("img_height >=", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightLessThan(Integer value) {
            addCriterion("img_height <", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightLessThanOrEqualTo(Integer value) {
            addCriterion("img_height <=", value, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightIn(List<Integer> values) {
            addCriterion("img_height in", values, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightNotIn(List<Integer> values) {
            addCriterion("img_height not in", values, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightBetween(Integer value1, Integer value2) {
            addCriterion("img_height between", value1, value2, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andImgHeightNotBetween(Integer value1, Integer value2) {
            addCriterion("img_height not between", value1, value2, "imgHeight");
            return (Criteria) this;
        }

        public Criteria andHasImageIsNull() {
            addCriterion("has_image is null");
            return (Criteria) this;
        }

        public Criteria andHasImageIsNotNull() {
            addCriterion("has_image is not null");
            return (Criteria) this;
        }

        public Criteria andHasImageEqualTo(Boolean value) {
            addCriterion("has_image =", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageNotEqualTo(Boolean value) {
            addCriterion("has_image <>", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageGreaterThan(Boolean value) {
            addCriterion("has_image >", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageGreaterThanOrEqualTo(Boolean value) {
            addCriterion("has_image >=", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageLessThan(Boolean value) {
            addCriterion("has_image <", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageLessThanOrEqualTo(Boolean value) {
            addCriterion("has_image <=", value, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageIn(List<Boolean> values) {
            addCriterion("has_image in", values, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageNotIn(List<Boolean> values) {
            addCriterion("has_image not in", values, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageBetween(Boolean value1, Boolean value2) {
            addCriterion("has_image between", value1, value2, "hasImage");
            return (Criteria) this;
        }

        public Criteria andHasImageNotBetween(Boolean value1, Boolean value2) {
            addCriterion("has_image not between", value1, value2, "hasImage");
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