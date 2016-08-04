package com.doadway.dwcms.core.config.pojo;

import java.util.ArrayList;
import java.util.List;

public class ModelItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ModelItemExample() {
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

        public Criteria andModelitemIdIsNull() {
            addCriterion("modelitem_id is null");
            return (Criteria) this;
        }

        public Criteria andModelitemIdIsNotNull() {
            addCriterion("modelitem_id is not null");
            return (Criteria) this;
        }

        public Criteria andModelitemIdEqualTo(Integer value) {
            addCriterion("modelitem_id =", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdNotEqualTo(Integer value) {
            addCriterion("modelitem_id <>", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdGreaterThan(Integer value) {
            addCriterion("modelitem_id >", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("modelitem_id >=", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdLessThan(Integer value) {
            addCriterion("modelitem_id <", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdLessThanOrEqualTo(Integer value) {
            addCriterion("modelitem_id <=", value, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdIn(List<Integer> values) {
            addCriterion("modelitem_id in", values, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdNotIn(List<Integer> values) {
            addCriterion("modelitem_id not in", values, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdBetween(Integer value1, Integer value2) {
            addCriterion("modelitem_id between", value1, value2, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelitemIdNotBetween(Integer value1, Integer value2) {
            addCriterion("modelitem_id not between", value1, value2, "modelitemId");
            return (Criteria) this;
        }

        public Criteria andModelIdIsNull() {
            addCriterion("model_id is null");
            return (Criteria) this;
        }

        public Criteria andModelIdIsNotNull() {
            addCriterion("model_id is not null");
            return (Criteria) this;
        }

        public Criteria andModelIdEqualTo(Integer value) {
            addCriterion("model_id =", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotEqualTo(Integer value) {
            addCriterion("model_id <>", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdGreaterThan(Integer value) {
            addCriterion("model_id >", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("model_id >=", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdLessThan(Integer value) {
            addCriterion("model_id <", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdLessThanOrEqualTo(Integer value) {
            addCriterion("model_id <=", value, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdIn(List<Integer> values) {
            addCriterion("model_id in", values, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotIn(List<Integer> values) {
            addCriterion("model_id not in", values, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdBetween(Integer value1, Integer value2) {
            addCriterion("model_id between", value1, value2, "modelId");
            return (Criteria) this;
        }

        public Criteria andModelIdNotBetween(Integer value1, Integer value2) {
            addCriterion("model_id not between", value1, value2, "modelId");
            return (Criteria) this;
        }

        public Criteria andFieldIsNull() {
            addCriterion("field is null");
            return (Criteria) this;
        }

        public Criteria andFieldIsNotNull() {
            addCriterion("field is not null");
            return (Criteria) this;
        }

        public Criteria andFieldEqualTo(String value) {
            addCriterion("field =", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotEqualTo(String value) {
            addCriterion("field <>", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldGreaterThan(String value) {
            addCriterion("field >", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldGreaterThanOrEqualTo(String value) {
            addCriterion("field >=", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLessThan(String value) {
            addCriterion("field <", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLessThanOrEqualTo(String value) {
            addCriterion("field <=", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldLike(String value) {
            addCriterion("field like", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotLike(String value) {
            addCriterion("field not like", value, "field");
            return (Criteria) this;
        }

        public Criteria andFieldIn(List<String> values) {
            addCriterion("field in", values, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotIn(List<String> values) {
            addCriterion("field not in", values, "field");
            return (Criteria) this;
        }

        public Criteria andFieldBetween(String value1, String value2) {
            addCriterion("field between", value1, value2, "field");
            return (Criteria) this;
        }

        public Criteria andFieldNotBetween(String value1, String value2) {
            addCriterion("field not between", value1, value2, "field");
            return (Criteria) this;
        }

        public Criteria andItemLabelIsNull() {
            addCriterion("item_label is null");
            return (Criteria) this;
        }

        public Criteria andItemLabelIsNotNull() {
            addCriterion("item_label is not null");
            return (Criteria) this;
        }

        public Criteria andItemLabelEqualTo(String value) {
            addCriterion("item_label =", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelNotEqualTo(String value) {
            addCriterion("item_label <>", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelGreaterThan(String value) {
            addCriterion("item_label >", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelGreaterThanOrEqualTo(String value) {
            addCriterion("item_label >=", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelLessThan(String value) {
            addCriterion("item_label <", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelLessThanOrEqualTo(String value) {
            addCriterion("item_label <=", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelLike(String value) {
            addCriterion("item_label like", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelNotLike(String value) {
            addCriterion("item_label not like", value, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelIn(List<String> values) {
            addCriterion("item_label in", values, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelNotIn(List<String> values) {
            addCriterion("item_label not in", values, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelBetween(String value1, String value2) {
            addCriterion("item_label between", value1, value2, "itemLabel");
            return (Criteria) this;
        }

        public Criteria andItemLabelNotBetween(String value1, String value2) {
            addCriterion("item_label not between", value1, value2, "itemLabel");
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

        public Criteria andDefValueIsNull() {
            addCriterion("def_value is null");
            return (Criteria) this;
        }

        public Criteria andDefValueIsNotNull() {
            addCriterion("def_value is not null");
            return (Criteria) this;
        }

        public Criteria andDefValueEqualTo(String value) {
            addCriterion("def_value =", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueNotEqualTo(String value) {
            addCriterion("def_value <>", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueGreaterThan(String value) {
            addCriterion("def_value >", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueGreaterThanOrEqualTo(String value) {
            addCriterion("def_value >=", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueLessThan(String value) {
            addCriterion("def_value <", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueLessThanOrEqualTo(String value) {
            addCriterion("def_value <=", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueLike(String value) {
            addCriterion("def_value like", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueNotLike(String value) {
            addCriterion("def_value not like", value, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueIn(List<String> values) {
            addCriterion("def_value in", values, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueNotIn(List<String> values) {
            addCriterion("def_value not in", values, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueBetween(String value1, String value2) {
            addCriterion("def_value between", value1, value2, "defValue");
            return (Criteria) this;
        }

        public Criteria andDefValueNotBetween(String value1, String value2) {
            addCriterion("def_value not between", value1, value2, "defValue");
            return (Criteria) this;
        }

        public Criteria andOptValueIsNull() {
            addCriterion("opt_value is null");
            return (Criteria) this;
        }

        public Criteria andOptValueIsNotNull() {
            addCriterion("opt_value is not null");
            return (Criteria) this;
        }

        public Criteria andOptValueEqualTo(String value) {
            addCriterion("opt_value =", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueNotEqualTo(String value) {
            addCriterion("opt_value <>", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueGreaterThan(String value) {
            addCriterion("opt_value >", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueGreaterThanOrEqualTo(String value) {
            addCriterion("opt_value >=", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueLessThan(String value) {
            addCriterion("opt_value <", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueLessThanOrEqualTo(String value) {
            addCriterion("opt_value <=", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueLike(String value) {
            addCriterion("opt_value like", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueNotLike(String value) {
            addCriterion("opt_value not like", value, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueIn(List<String> values) {
            addCriterion("opt_value in", values, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueNotIn(List<String> values) {
            addCriterion("opt_value not in", values, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueBetween(String value1, String value2) {
            addCriterion("opt_value between", value1, value2, "optValue");
            return (Criteria) this;
        }

        public Criteria andOptValueNotBetween(String value1, String value2) {
            addCriterion("opt_value not between", value1, value2, "optValue");
            return (Criteria) this;
        }

        public Criteria andTextSizeIsNull() {
            addCriterion("text_size is null");
            return (Criteria) this;
        }

        public Criteria andTextSizeIsNotNull() {
            addCriterion("text_size is not null");
            return (Criteria) this;
        }

        public Criteria andTextSizeEqualTo(String value) {
            addCriterion("text_size =", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeNotEqualTo(String value) {
            addCriterion("text_size <>", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeGreaterThan(String value) {
            addCriterion("text_size >", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeGreaterThanOrEqualTo(String value) {
            addCriterion("text_size >=", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeLessThan(String value) {
            addCriterion("text_size <", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeLessThanOrEqualTo(String value) {
            addCriterion("text_size <=", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeLike(String value) {
            addCriterion("text_size like", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeNotLike(String value) {
            addCriterion("text_size not like", value, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeIn(List<String> values) {
            addCriterion("text_size in", values, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeNotIn(List<String> values) {
            addCriterion("text_size not in", values, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeBetween(String value1, String value2) {
            addCriterion("text_size between", value1, value2, "textSize");
            return (Criteria) this;
        }

        public Criteria andTextSizeNotBetween(String value1, String value2) {
            addCriterion("text_size not between", value1, value2, "textSize");
            return (Criteria) this;
        }

        public Criteria andAreaRowsIsNull() {
            addCriterion("area_rows is null");
            return (Criteria) this;
        }

        public Criteria andAreaRowsIsNotNull() {
            addCriterion("area_rows is not null");
            return (Criteria) this;
        }

        public Criteria andAreaRowsEqualTo(String value) {
            addCriterion("area_rows =", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsNotEqualTo(String value) {
            addCriterion("area_rows <>", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsGreaterThan(String value) {
            addCriterion("area_rows >", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsGreaterThanOrEqualTo(String value) {
            addCriterion("area_rows >=", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsLessThan(String value) {
            addCriterion("area_rows <", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsLessThanOrEqualTo(String value) {
            addCriterion("area_rows <=", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsLike(String value) {
            addCriterion("area_rows like", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsNotLike(String value) {
            addCriterion("area_rows not like", value, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsIn(List<String> values) {
            addCriterion("area_rows in", values, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsNotIn(List<String> values) {
            addCriterion("area_rows not in", values, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsBetween(String value1, String value2) {
            addCriterion("area_rows between", value1, value2, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaRowsNotBetween(String value1, String value2) {
            addCriterion("area_rows not between", value1, value2, "areaRows");
            return (Criteria) this;
        }

        public Criteria andAreaColsIsNull() {
            addCriterion("area_cols is null");
            return (Criteria) this;
        }

        public Criteria andAreaColsIsNotNull() {
            addCriterion("area_cols is not null");
            return (Criteria) this;
        }

        public Criteria andAreaColsEqualTo(String value) {
            addCriterion("area_cols =", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsNotEqualTo(String value) {
            addCriterion("area_cols <>", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsGreaterThan(String value) {
            addCriterion("area_cols >", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsGreaterThanOrEqualTo(String value) {
            addCriterion("area_cols >=", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsLessThan(String value) {
            addCriterion("area_cols <", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsLessThanOrEqualTo(String value) {
            addCriterion("area_cols <=", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsLike(String value) {
            addCriterion("area_cols like", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsNotLike(String value) {
            addCriterion("area_cols not like", value, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsIn(List<String> values) {
            addCriterion("area_cols in", values, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsNotIn(List<String> values) {
            addCriterion("area_cols not in", values, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsBetween(String value1, String value2) {
            addCriterion("area_cols between", value1, value2, "areaCols");
            return (Criteria) this;
        }

        public Criteria andAreaColsNotBetween(String value1, String value2) {
            addCriterion("area_cols not between", value1, value2, "areaCols");
            return (Criteria) this;
        }

        public Criteria andHelpIsNull() {
            addCriterion("help is null");
            return (Criteria) this;
        }

        public Criteria andHelpIsNotNull() {
            addCriterion("help is not null");
            return (Criteria) this;
        }

        public Criteria andHelpEqualTo(String value) {
            addCriterion("help =", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpNotEqualTo(String value) {
            addCriterion("help <>", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpGreaterThan(String value) {
            addCriterion("help >", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpGreaterThanOrEqualTo(String value) {
            addCriterion("help >=", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpLessThan(String value) {
            addCriterion("help <", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpLessThanOrEqualTo(String value) {
            addCriterion("help <=", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpLike(String value) {
            addCriterion("help like", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpNotLike(String value) {
            addCriterion("help not like", value, "help");
            return (Criteria) this;
        }

        public Criteria andHelpIn(List<String> values) {
            addCriterion("help in", values, "help");
            return (Criteria) this;
        }

        public Criteria andHelpNotIn(List<String> values) {
            addCriterion("help not in", values, "help");
            return (Criteria) this;
        }

        public Criteria andHelpBetween(String value1, String value2) {
            addCriterion("help between", value1, value2, "help");
            return (Criteria) this;
        }

        public Criteria andHelpNotBetween(String value1, String value2) {
            addCriterion("help not between", value1, value2, "help");
            return (Criteria) this;
        }

        public Criteria andHelpPositionIsNull() {
            addCriterion("help_position is null");
            return (Criteria) this;
        }

        public Criteria andHelpPositionIsNotNull() {
            addCriterion("help_position is not null");
            return (Criteria) this;
        }

        public Criteria andHelpPositionEqualTo(String value) {
            addCriterion("help_position =", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionNotEqualTo(String value) {
            addCriterion("help_position <>", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionGreaterThan(String value) {
            addCriterion("help_position >", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionGreaterThanOrEqualTo(String value) {
            addCriterion("help_position >=", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionLessThan(String value) {
            addCriterion("help_position <", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionLessThanOrEqualTo(String value) {
            addCriterion("help_position <=", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionLike(String value) {
            addCriterion("help_position like", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionNotLike(String value) {
            addCriterion("help_position not like", value, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionIn(List<String> values) {
            addCriterion("help_position in", values, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionNotIn(List<String> values) {
            addCriterion("help_position not in", values, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionBetween(String value1, String value2) {
            addCriterion("help_position between", value1, value2, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andHelpPositionNotBetween(String value1, String value2) {
            addCriterion("help_position not between", value1, value2, "helpPosition");
            return (Criteria) this;
        }

        public Criteria andDataTypeIsNull() {
            addCriterion("data_type is null");
            return (Criteria) this;
        }

        public Criteria andDataTypeIsNotNull() {
            addCriterion("data_type is not null");
            return (Criteria) this;
        }

        public Criteria andDataTypeEqualTo(Integer value) {
            addCriterion("data_type =", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeNotEqualTo(Integer value) {
            addCriterion("data_type <>", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeGreaterThan(Integer value) {
            addCriterion("data_type >", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("data_type >=", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeLessThan(Integer value) {
            addCriterion("data_type <", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeLessThanOrEqualTo(Integer value) {
            addCriterion("data_type <=", value, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeIn(List<Integer> values) {
            addCriterion("data_type in", values, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeNotIn(List<Integer> values) {
            addCriterion("data_type not in", values, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeBetween(Integer value1, Integer value2) {
            addCriterion("data_type between", value1, value2, "dataType");
            return (Criteria) this;
        }

        public Criteria andDataTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("data_type not between", value1, value2, "dataType");
            return (Criteria) this;
        }

        public Criteria andIsSingleIsNull() {
            addCriterion("is_single is null");
            return (Criteria) this;
        }

        public Criteria andIsSingleIsNotNull() {
            addCriterion("is_single is not null");
            return (Criteria) this;
        }

        public Criteria andIsSingleEqualTo(Boolean value) {
            addCriterion("is_single =", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleNotEqualTo(Boolean value) {
            addCriterion("is_single <>", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleGreaterThan(Boolean value) {
            addCriterion("is_single >", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_single >=", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleLessThan(Boolean value) {
            addCriterion("is_single <", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleLessThanOrEqualTo(Boolean value) {
            addCriterion("is_single <=", value, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleIn(List<Boolean> values) {
            addCriterion("is_single in", values, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleNotIn(List<Boolean> values) {
            addCriterion("is_single not in", values, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleBetween(Boolean value1, Boolean value2) {
            addCriterion("is_single between", value1, value2, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsSingleNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_single not between", value1, value2, "isSingle");
            return (Criteria) this;
        }

        public Criteria andIsChannelIsNull() {
            addCriterion("is_channel is null");
            return (Criteria) this;
        }

        public Criteria andIsChannelIsNotNull() {
            addCriterion("is_channel is not null");
            return (Criteria) this;
        }

        public Criteria andIsChannelEqualTo(Boolean value) {
            addCriterion("is_channel =", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelNotEqualTo(Boolean value) {
            addCriterion("is_channel <>", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelGreaterThan(Boolean value) {
            addCriterion("is_channel >", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_channel >=", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelLessThan(Boolean value) {
            addCriterion("is_channel <", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelLessThanOrEqualTo(Boolean value) {
            addCriterion("is_channel <=", value, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelIn(List<Boolean> values) {
            addCriterion("is_channel in", values, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelNotIn(List<Boolean> values) {
            addCriterion("is_channel not in", values, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelBetween(Boolean value1, Boolean value2) {
            addCriterion("is_channel between", value1, value2, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsChannelNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_channel not between", value1, value2, "isChannel");
            return (Criteria) this;
        }

        public Criteria andIsCustomIsNull() {
            addCriterion("is_custom is null");
            return (Criteria) this;
        }

        public Criteria andIsCustomIsNotNull() {
            addCriterion("is_custom is not null");
            return (Criteria) this;
        }

        public Criteria andIsCustomEqualTo(Boolean value) {
            addCriterion("is_custom =", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomNotEqualTo(Boolean value) {
            addCriterion("is_custom <>", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomGreaterThan(Boolean value) {
            addCriterion("is_custom >", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_custom >=", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomLessThan(Boolean value) {
            addCriterion("is_custom <", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomLessThanOrEqualTo(Boolean value) {
            addCriterion("is_custom <=", value, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomIn(List<Boolean> values) {
            addCriterion("is_custom in", values, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomNotIn(List<Boolean> values) {
            addCriterion("is_custom not in", values, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomBetween(Boolean value1, Boolean value2) {
            addCriterion("is_custom between", value1, value2, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsCustomNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_custom not between", value1, value2, "isCustom");
            return (Criteria) this;
        }

        public Criteria andIsDisplayIsNull() {
            addCriterion("is_display is null");
            return (Criteria) this;
        }

        public Criteria andIsDisplayIsNotNull() {
            addCriterion("is_display is not null");
            return (Criteria) this;
        }

        public Criteria andIsDisplayEqualTo(Boolean value) {
            addCriterion("is_display =", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotEqualTo(Boolean value) {
            addCriterion("is_display <>", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayGreaterThan(Boolean value) {
            addCriterion("is_display >", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_display >=", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayLessThan(Boolean value) {
            addCriterion("is_display <", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayLessThanOrEqualTo(Boolean value) {
            addCriterion("is_display <=", value, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayIn(List<Boolean> values) {
            addCriterion("is_display in", values, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotIn(List<Boolean> values) {
            addCriterion("is_display not in", values, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayBetween(Boolean value1, Boolean value2) {
            addCriterion("is_display between", value1, value2, "isDisplay");
            return (Criteria) this;
        }

        public Criteria andIsDisplayNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_display not between", value1, value2, "isDisplay");
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