package com.doadway.dwcms.core.config.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ConfigExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ConfigExample() {
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

        public Criteria andConfigIdIsNull() {
            addCriterion("config_id is null");
            return (Criteria) this;
        }

        public Criteria andConfigIdIsNotNull() {
            addCriterion("config_id is not null");
            return (Criteria) this;
        }

        public Criteria andConfigIdEqualTo(Integer value) {
            addCriterion("config_id =", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdNotEqualTo(Integer value) {
            addCriterion("config_id <>", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdGreaterThan(Integer value) {
            addCriterion("config_id >", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("config_id >=", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdLessThan(Integer value) {
            addCriterion("config_id <", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdLessThanOrEqualTo(Integer value) {
            addCriterion("config_id <=", value, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdIn(List<Integer> values) {
            addCriterion("config_id in", values, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdNotIn(List<Integer> values) {
            addCriterion("config_id not in", values, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdBetween(Integer value1, Integer value2) {
            addCriterion("config_id between", value1, value2, "configId");
            return (Criteria) this;
        }

        public Criteria andConfigIdNotBetween(Integer value1, Integer value2) {
            addCriterion("config_id not between", value1, value2, "configId");
            return (Criteria) this;
        }

        public Criteria andContextPathIsNull() {
            addCriterion("context_path is null");
            return (Criteria) this;
        }

        public Criteria andContextPathIsNotNull() {
            addCriterion("context_path is not null");
            return (Criteria) this;
        }

        public Criteria andContextPathEqualTo(String value) {
            addCriterion("context_path =", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathNotEqualTo(String value) {
            addCriterion("context_path <>", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathGreaterThan(String value) {
            addCriterion("context_path >", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathGreaterThanOrEqualTo(String value) {
            addCriterion("context_path >=", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathLessThan(String value) {
            addCriterion("context_path <", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathLessThanOrEqualTo(String value) {
            addCriterion("context_path <=", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathLike(String value) {
            addCriterion("context_path like", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathNotLike(String value) {
            addCriterion("context_path not like", value, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathIn(List<String> values) {
            addCriterion("context_path in", values, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathNotIn(List<String> values) {
            addCriterion("context_path not in", values, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathBetween(String value1, String value2) {
            addCriterion("context_path between", value1, value2, "contextPath");
            return (Criteria) this;
        }

        public Criteria andContextPathNotBetween(String value1, String value2) {
            addCriterion("context_path not between", value1, value2, "contextPath");
            return (Criteria) this;
        }

        public Criteria andServletPointIsNull() {
            addCriterion("servlet_point is null");
            return (Criteria) this;
        }

        public Criteria andServletPointIsNotNull() {
            addCriterion("servlet_point is not null");
            return (Criteria) this;
        }

        public Criteria andServletPointEqualTo(String value) {
            addCriterion("servlet_point =", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointNotEqualTo(String value) {
            addCriterion("servlet_point <>", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointGreaterThan(String value) {
            addCriterion("servlet_point >", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointGreaterThanOrEqualTo(String value) {
            addCriterion("servlet_point >=", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointLessThan(String value) {
            addCriterion("servlet_point <", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointLessThanOrEqualTo(String value) {
            addCriterion("servlet_point <=", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointLike(String value) {
            addCriterion("servlet_point like", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointNotLike(String value) {
            addCriterion("servlet_point not like", value, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointIn(List<String> values) {
            addCriterion("servlet_point in", values, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointNotIn(List<String> values) {
            addCriterion("servlet_point not in", values, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointBetween(String value1, String value2) {
            addCriterion("servlet_point between", value1, value2, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andServletPointNotBetween(String value1, String value2) {
            addCriterion("servlet_point not between", value1, value2, "servletPoint");
            return (Criteria) this;
        }

        public Criteria andPortIsNull() {
            addCriterion("port is null");
            return (Criteria) this;
        }

        public Criteria andPortIsNotNull() {
            addCriterion("port is not null");
            return (Criteria) this;
        }

        public Criteria andPortEqualTo(Integer value) {
            addCriterion("port =", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotEqualTo(Integer value) {
            addCriterion("port <>", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThan(Integer value) {
            addCriterion("port >", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThanOrEqualTo(Integer value) {
            addCriterion("port >=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThan(Integer value) {
            addCriterion("port <", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThanOrEqualTo(Integer value) {
            addCriterion("port <=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortIn(List<Integer> values) {
            addCriterion("port in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotIn(List<Integer> values) {
            addCriterion("port not in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortBetween(Integer value1, Integer value2) {
            addCriterion("port between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotBetween(Integer value1, Integer value2) {
            addCriterion("port not between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andDbFileUriIsNull() {
            addCriterion("db_file_uri is null");
            return (Criteria) this;
        }

        public Criteria andDbFileUriIsNotNull() {
            addCriterion("db_file_uri is not null");
            return (Criteria) this;
        }

        public Criteria andDbFileUriEqualTo(String value) {
            addCriterion("db_file_uri =", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriNotEqualTo(String value) {
            addCriterion("db_file_uri <>", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriGreaterThan(String value) {
            addCriterion("db_file_uri >", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriGreaterThanOrEqualTo(String value) {
            addCriterion("db_file_uri >=", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriLessThan(String value) {
            addCriterion("db_file_uri <", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriLessThanOrEqualTo(String value) {
            addCriterion("db_file_uri <=", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriLike(String value) {
            addCriterion("db_file_uri like", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriNotLike(String value) {
            addCriterion("db_file_uri not like", value, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriIn(List<String> values) {
            addCriterion("db_file_uri in", values, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriNotIn(List<String> values) {
            addCriterion("db_file_uri not in", values, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriBetween(String value1, String value2) {
            addCriterion("db_file_uri between", value1, value2, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andDbFileUriNotBetween(String value1, String value2) {
            addCriterion("db_file_uri not between", value1, value2, "dbFileUri");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbIsNull() {
            addCriterion("is_upload_to_db is null");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbIsNotNull() {
            addCriterion("is_upload_to_db is not null");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbEqualTo(Boolean value) {
            addCriterion("is_upload_to_db =", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbNotEqualTo(Boolean value) {
            addCriterion("is_upload_to_db <>", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbGreaterThan(Boolean value) {
            addCriterion("is_upload_to_db >", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_upload_to_db >=", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbLessThan(Boolean value) {
            addCriterion("is_upload_to_db <", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbLessThanOrEqualTo(Boolean value) {
            addCriterion("is_upload_to_db <=", value, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbIn(List<Boolean> values) {
            addCriterion("is_upload_to_db in", values, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbNotIn(List<Boolean> values) {
            addCriterion("is_upload_to_db not in", values, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbBetween(Boolean value1, Boolean value2) {
            addCriterion("is_upload_to_db between", value1, value2, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andIsUploadToDbNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_upload_to_db not between", value1, value2, "isUploadToDb");
            return (Criteria) this;
        }

        public Criteria andDefImgIsNull() {
            addCriterion("def_img is null");
            return (Criteria) this;
        }

        public Criteria andDefImgIsNotNull() {
            addCriterion("def_img is not null");
            return (Criteria) this;
        }

        public Criteria andDefImgEqualTo(String value) {
            addCriterion("def_img =", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgNotEqualTo(String value) {
            addCriterion("def_img <>", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgGreaterThan(String value) {
            addCriterion("def_img >", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgGreaterThanOrEqualTo(String value) {
            addCriterion("def_img >=", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgLessThan(String value) {
            addCriterion("def_img <", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgLessThanOrEqualTo(String value) {
            addCriterion("def_img <=", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgLike(String value) {
            addCriterion("def_img like", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgNotLike(String value) {
            addCriterion("def_img not like", value, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgIn(List<String> values) {
            addCriterion("def_img in", values, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgNotIn(List<String> values) {
            addCriterion("def_img not in", values, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgBetween(String value1, String value2) {
            addCriterion("def_img between", value1, value2, "defImg");
            return (Criteria) this;
        }

        public Criteria andDefImgNotBetween(String value1, String value2) {
            addCriterion("def_img not between", value1, value2, "defImg");
            return (Criteria) this;
        }

        public Criteria andLoginUrlIsNull() {
            addCriterion("login_url is null");
            return (Criteria) this;
        }

        public Criteria andLoginUrlIsNotNull() {
            addCriterion("login_url is not null");
            return (Criteria) this;
        }

        public Criteria andLoginUrlEqualTo(String value) {
            addCriterion("login_url =", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlNotEqualTo(String value) {
            addCriterion("login_url <>", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlGreaterThan(String value) {
            addCriterion("login_url >", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlGreaterThanOrEqualTo(String value) {
            addCriterion("login_url >=", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlLessThan(String value) {
            addCriterion("login_url <", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlLessThanOrEqualTo(String value) {
            addCriterion("login_url <=", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlLike(String value) {
            addCriterion("login_url like", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlNotLike(String value) {
            addCriterion("login_url not like", value, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlIn(List<String> values) {
            addCriterion("login_url in", values, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlNotIn(List<String> values) {
            addCriterion("login_url not in", values, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlBetween(String value1, String value2) {
            addCriterion("login_url between", value1, value2, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andLoginUrlNotBetween(String value1, String value2) {
            addCriterion("login_url not between", value1, value2, "loginUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlIsNull() {
            addCriterion("process_url is null");
            return (Criteria) this;
        }

        public Criteria andProcessUrlIsNotNull() {
            addCriterion("process_url is not null");
            return (Criteria) this;
        }

        public Criteria andProcessUrlEqualTo(String value) {
            addCriterion("process_url =", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlNotEqualTo(String value) {
            addCriterion("process_url <>", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlGreaterThan(String value) {
            addCriterion("process_url >", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlGreaterThanOrEqualTo(String value) {
            addCriterion("process_url >=", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlLessThan(String value) {
            addCriterion("process_url <", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlLessThanOrEqualTo(String value) {
            addCriterion("process_url <=", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlLike(String value) {
            addCriterion("process_url like", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlNotLike(String value) {
            addCriterion("process_url not like", value, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlIn(List<String> values) {
            addCriterion("process_url in", values, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlNotIn(List<String> values) {
            addCriterion("process_url not in", values, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlBetween(String value1, String value2) {
            addCriterion("process_url between", value1, value2, "processUrl");
            return (Criteria) this;
        }

        public Criteria andProcessUrlNotBetween(String value1, String value2) {
            addCriterion("process_url not between", value1, value2, "processUrl");
            return (Criteria) this;
        }

        public Criteria andMarkOnIsNull() {
            addCriterion("mark_on is null");
            return (Criteria) this;
        }

        public Criteria andMarkOnIsNotNull() {
            addCriterion("mark_on is not null");
            return (Criteria) this;
        }

        public Criteria andMarkOnEqualTo(Boolean value) {
            addCriterion("mark_on =", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnNotEqualTo(Boolean value) {
            addCriterion("mark_on <>", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnGreaterThan(Boolean value) {
            addCriterion("mark_on >", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnGreaterThanOrEqualTo(Boolean value) {
            addCriterion("mark_on >=", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnLessThan(Boolean value) {
            addCriterion("mark_on <", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnLessThanOrEqualTo(Boolean value) {
            addCriterion("mark_on <=", value, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnIn(List<Boolean> values) {
            addCriterion("mark_on in", values, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnNotIn(List<Boolean> values) {
            addCriterion("mark_on not in", values, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnBetween(Boolean value1, Boolean value2) {
            addCriterion("mark_on between", value1, value2, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkOnNotBetween(Boolean value1, Boolean value2) {
            addCriterion("mark_on not between", value1, value2, "markOn");
            return (Criteria) this;
        }

        public Criteria andMarkWidthIsNull() {
            addCriterion("mark_width is null");
            return (Criteria) this;
        }

        public Criteria andMarkWidthIsNotNull() {
            addCriterion("mark_width is not null");
            return (Criteria) this;
        }

        public Criteria andMarkWidthEqualTo(Integer value) {
            addCriterion("mark_width =", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthNotEqualTo(Integer value) {
            addCriterion("mark_width <>", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthGreaterThan(Integer value) {
            addCriterion("mark_width >", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_width >=", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthLessThan(Integer value) {
            addCriterion("mark_width <", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthLessThanOrEqualTo(Integer value) {
            addCriterion("mark_width <=", value, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthIn(List<Integer> values) {
            addCriterion("mark_width in", values, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthNotIn(List<Integer> values) {
            addCriterion("mark_width not in", values, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthBetween(Integer value1, Integer value2) {
            addCriterion("mark_width between", value1, value2, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkWidthNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_width not between", value1, value2, "markWidth");
            return (Criteria) this;
        }

        public Criteria andMarkHeightIsNull() {
            addCriterion("mark_height is null");
            return (Criteria) this;
        }

        public Criteria andMarkHeightIsNotNull() {
            addCriterion("mark_height is not null");
            return (Criteria) this;
        }

        public Criteria andMarkHeightEqualTo(Integer value) {
            addCriterion("mark_height =", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightNotEqualTo(Integer value) {
            addCriterion("mark_height <>", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightGreaterThan(Integer value) {
            addCriterion("mark_height >", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_height >=", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightLessThan(Integer value) {
            addCriterion("mark_height <", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightLessThanOrEqualTo(Integer value) {
            addCriterion("mark_height <=", value, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightIn(List<Integer> values) {
            addCriterion("mark_height in", values, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightNotIn(List<Integer> values) {
            addCriterion("mark_height not in", values, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightBetween(Integer value1, Integer value2) {
            addCriterion("mark_height between", value1, value2, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkHeightNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_height not between", value1, value2, "markHeight");
            return (Criteria) this;
        }

        public Criteria andMarkImageIsNull() {
            addCriterion("mark_image is null");
            return (Criteria) this;
        }

        public Criteria andMarkImageIsNotNull() {
            addCriterion("mark_image is not null");
            return (Criteria) this;
        }

        public Criteria andMarkImageEqualTo(String value) {
            addCriterion("mark_image =", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageNotEqualTo(String value) {
            addCriterion("mark_image <>", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageGreaterThan(String value) {
            addCriterion("mark_image >", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageGreaterThanOrEqualTo(String value) {
            addCriterion("mark_image >=", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageLessThan(String value) {
            addCriterion("mark_image <", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageLessThanOrEqualTo(String value) {
            addCriterion("mark_image <=", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageLike(String value) {
            addCriterion("mark_image like", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageNotLike(String value) {
            addCriterion("mark_image not like", value, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageIn(List<String> values) {
            addCriterion("mark_image in", values, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageNotIn(List<String> values) {
            addCriterion("mark_image not in", values, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageBetween(String value1, String value2) {
            addCriterion("mark_image between", value1, value2, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkImageNotBetween(String value1, String value2) {
            addCriterion("mark_image not between", value1, value2, "markImage");
            return (Criteria) this;
        }

        public Criteria andMarkContentIsNull() {
            addCriterion("mark_content is null");
            return (Criteria) this;
        }

        public Criteria andMarkContentIsNotNull() {
            addCriterion("mark_content is not null");
            return (Criteria) this;
        }

        public Criteria andMarkContentEqualTo(String value) {
            addCriterion("mark_content =", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentNotEqualTo(String value) {
            addCriterion("mark_content <>", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentGreaterThan(String value) {
            addCriterion("mark_content >", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentGreaterThanOrEqualTo(String value) {
            addCriterion("mark_content >=", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentLessThan(String value) {
            addCriterion("mark_content <", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentLessThanOrEqualTo(String value) {
            addCriterion("mark_content <=", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentLike(String value) {
            addCriterion("mark_content like", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentNotLike(String value) {
            addCriterion("mark_content not like", value, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentIn(List<String> values) {
            addCriterion("mark_content in", values, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentNotIn(List<String> values) {
            addCriterion("mark_content not in", values, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentBetween(String value1, String value2) {
            addCriterion("mark_content between", value1, value2, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkContentNotBetween(String value1, String value2) {
            addCriterion("mark_content not between", value1, value2, "markContent");
            return (Criteria) this;
        }

        public Criteria andMarkSizeIsNull() {
            addCriterion("mark_size is null");
            return (Criteria) this;
        }

        public Criteria andMarkSizeIsNotNull() {
            addCriterion("mark_size is not null");
            return (Criteria) this;
        }

        public Criteria andMarkSizeEqualTo(Integer value) {
            addCriterion("mark_size =", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeNotEqualTo(Integer value) {
            addCriterion("mark_size <>", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeGreaterThan(Integer value) {
            addCriterion("mark_size >", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_size >=", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeLessThan(Integer value) {
            addCriterion("mark_size <", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeLessThanOrEqualTo(Integer value) {
            addCriterion("mark_size <=", value, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeIn(List<Integer> values) {
            addCriterion("mark_size in", values, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeNotIn(List<Integer> values) {
            addCriterion("mark_size not in", values, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeBetween(Integer value1, Integer value2) {
            addCriterion("mark_size between", value1, value2, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkSizeNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_size not between", value1, value2, "markSize");
            return (Criteria) this;
        }

        public Criteria andMarkColorIsNull() {
            addCriterion("mark_color is null");
            return (Criteria) this;
        }

        public Criteria andMarkColorIsNotNull() {
            addCriterion("mark_color is not null");
            return (Criteria) this;
        }

        public Criteria andMarkColorEqualTo(String value) {
            addCriterion("mark_color =", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorNotEqualTo(String value) {
            addCriterion("mark_color <>", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorGreaterThan(String value) {
            addCriterion("mark_color >", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorGreaterThanOrEqualTo(String value) {
            addCriterion("mark_color >=", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorLessThan(String value) {
            addCriterion("mark_color <", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorLessThanOrEqualTo(String value) {
            addCriterion("mark_color <=", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorLike(String value) {
            addCriterion("mark_color like", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorNotLike(String value) {
            addCriterion("mark_color not like", value, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorIn(List<String> values) {
            addCriterion("mark_color in", values, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorNotIn(List<String> values) {
            addCriterion("mark_color not in", values, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorBetween(String value1, String value2) {
            addCriterion("mark_color between", value1, value2, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkColorNotBetween(String value1, String value2) {
            addCriterion("mark_color not between", value1, value2, "markColor");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaIsNull() {
            addCriterion("mark_alpha is null");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaIsNotNull() {
            addCriterion("mark_alpha is not null");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaEqualTo(Integer value) {
            addCriterion("mark_alpha =", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaNotEqualTo(Integer value) {
            addCriterion("mark_alpha <>", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaGreaterThan(Integer value) {
            addCriterion("mark_alpha >", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_alpha >=", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaLessThan(Integer value) {
            addCriterion("mark_alpha <", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaLessThanOrEqualTo(Integer value) {
            addCriterion("mark_alpha <=", value, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaIn(List<Integer> values) {
            addCriterion("mark_alpha in", values, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaNotIn(List<Integer> values) {
            addCriterion("mark_alpha not in", values, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaBetween(Integer value1, Integer value2) {
            addCriterion("mark_alpha between", value1, value2, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkAlphaNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_alpha not between", value1, value2, "markAlpha");
            return (Criteria) this;
        }

        public Criteria andMarkPositionIsNull() {
            addCriterion("mark_position is null");
            return (Criteria) this;
        }

        public Criteria andMarkPositionIsNotNull() {
            addCriterion("mark_position is not null");
            return (Criteria) this;
        }

        public Criteria andMarkPositionEqualTo(Integer value) {
            addCriterion("mark_position =", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionNotEqualTo(Integer value) {
            addCriterion("mark_position <>", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionGreaterThan(Integer value) {
            addCriterion("mark_position >", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_position >=", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionLessThan(Integer value) {
            addCriterion("mark_position <", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionLessThanOrEqualTo(Integer value) {
            addCriterion("mark_position <=", value, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionIn(List<Integer> values) {
            addCriterion("mark_position in", values, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionNotIn(List<Integer> values) {
            addCriterion("mark_position not in", values, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionBetween(Integer value1, Integer value2) {
            addCriterion("mark_position between", value1, value2, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkPositionNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_position not between", value1, value2, "markPosition");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXIsNull() {
            addCriterion("mark_offset_x is null");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXIsNotNull() {
            addCriterion("mark_offset_x is not null");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXEqualTo(Integer value) {
            addCriterion("mark_offset_x =", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXNotEqualTo(Integer value) {
            addCriterion("mark_offset_x <>", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXGreaterThan(Integer value) {
            addCriterion("mark_offset_x >", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_offset_x >=", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXLessThan(Integer value) {
            addCriterion("mark_offset_x <", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXLessThanOrEqualTo(Integer value) {
            addCriterion("mark_offset_x <=", value, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXIn(List<Integer> values) {
            addCriterion("mark_offset_x in", values, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXNotIn(List<Integer> values) {
            addCriterion("mark_offset_x not in", values, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXBetween(Integer value1, Integer value2) {
            addCriterion("mark_offset_x between", value1, value2, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetXNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_offset_x not between", value1, value2, "markOffsetX");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYIsNull() {
            addCriterion("mark_offset_y is null");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYIsNotNull() {
            addCriterion("mark_offset_y is not null");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYEqualTo(Integer value) {
            addCriterion("mark_offset_y =", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYNotEqualTo(Integer value) {
            addCriterion("mark_offset_y <>", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYGreaterThan(Integer value) {
            addCriterion("mark_offset_y >", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYGreaterThanOrEqualTo(Integer value) {
            addCriterion("mark_offset_y >=", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYLessThan(Integer value) {
            addCriterion("mark_offset_y <", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYLessThanOrEqualTo(Integer value) {
            addCriterion("mark_offset_y <=", value, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYIn(List<Integer> values) {
            addCriterion("mark_offset_y in", values, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYNotIn(List<Integer> values) {
            addCriterion("mark_offset_y not in", values, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYBetween(Integer value1, Integer value2) {
            addCriterion("mark_offset_y between", value1, value2, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andMarkOffsetYNotBetween(Integer value1, Integer value2) {
            addCriterion("mark_offset_y not between", value1, value2, "markOffsetY");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeIsNull() {
            addCriterion("count_clear_time is null");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeIsNotNull() {
            addCriterion("count_clear_time is not null");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeEqualTo(Date value) {
            addCriterionForJDBCDate("count_clear_time =", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("count_clear_time <>", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("count_clear_time >", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("count_clear_time >=", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeLessThan(Date value) {
            addCriterionForJDBCDate("count_clear_time <", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("count_clear_time <=", value, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeIn(List<Date> values) {
            addCriterionForJDBCDate("count_clear_time in", values, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("count_clear_time not in", values, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("count_clear_time between", value1, value2, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountClearTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("count_clear_time not between", value1, value2, "countClearTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeIsNull() {
            addCriterion("count_copy_time is null");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeIsNotNull() {
            addCriterion("count_copy_time is not null");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeEqualTo(Date value) {
            addCriterion("count_copy_time =", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeNotEqualTo(Date value) {
            addCriterion("count_copy_time <>", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeGreaterThan(Date value) {
            addCriterion("count_copy_time >", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("count_copy_time >=", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeLessThan(Date value) {
            addCriterion("count_copy_time <", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeLessThanOrEqualTo(Date value) {
            addCriterion("count_copy_time <=", value, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeIn(List<Date> values) {
            addCriterion("count_copy_time in", values, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeNotIn(List<Date> values) {
            addCriterion("count_copy_time not in", values, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeBetween(Date value1, Date value2) {
            addCriterion("count_copy_time between", value1, value2, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andCountCopyTimeNotBetween(Date value1, Date value2) {
            addCriterion("count_copy_time not between", value1, value2, "countCopyTime");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeIsNull() {
            addCriterion("download_code is null");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeIsNotNull() {
            addCriterion("download_code is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeEqualTo(String value) {
            addCriterion("download_code =", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeNotEqualTo(String value) {
            addCriterion("download_code <>", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeGreaterThan(String value) {
            addCriterion("download_code >", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeGreaterThanOrEqualTo(String value) {
            addCriterion("download_code >=", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeLessThan(String value) {
            addCriterion("download_code <", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeLessThanOrEqualTo(String value) {
            addCriterion("download_code <=", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeLike(String value) {
            addCriterion("download_code like", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeNotLike(String value) {
            addCriterion("download_code not like", value, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeIn(List<String> values) {
            addCriterion("download_code in", values, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeNotIn(List<String> values) {
            addCriterion("download_code not in", values, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeBetween(String value1, String value2) {
            addCriterion("download_code between", value1, value2, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadCodeNotBetween(String value1, String value2) {
            addCriterion("download_code not between", value1, value2, "downloadCode");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeIsNull() {
            addCriterion("download_time is null");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeIsNotNull() {
            addCriterion("download_time is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeEqualTo(Integer value) {
            addCriterion("download_time =", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeNotEqualTo(Integer value) {
            addCriterion("download_time <>", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeGreaterThan(Integer value) {
            addCriterion("download_time >", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("download_time >=", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeLessThan(Integer value) {
            addCriterion("download_time <", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeLessThanOrEqualTo(Integer value) {
            addCriterion("download_time <=", value, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeIn(List<Integer> values) {
            addCriterion("download_time in", values, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeNotIn(List<Integer> values) {
            addCriterion("download_time not in", values, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeBetween(Integer value1, Integer value2) {
            addCriterion("download_time between", value1, value2, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andDownloadTimeNotBetween(Integer value1, Integer value2) {
            addCriterion("download_time not between", value1, value2, "downloadTime");
            return (Criteria) this;
        }

        public Criteria andEmailHostIsNull() {
            addCriterion("email_host is null");
            return (Criteria) this;
        }

        public Criteria andEmailHostIsNotNull() {
            addCriterion("email_host is not null");
            return (Criteria) this;
        }

        public Criteria andEmailHostEqualTo(String value) {
            addCriterion("email_host =", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostNotEqualTo(String value) {
            addCriterion("email_host <>", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostGreaterThan(String value) {
            addCriterion("email_host >", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostGreaterThanOrEqualTo(String value) {
            addCriterion("email_host >=", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostLessThan(String value) {
            addCriterion("email_host <", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostLessThanOrEqualTo(String value) {
            addCriterion("email_host <=", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostLike(String value) {
            addCriterion("email_host like", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostNotLike(String value) {
            addCriterion("email_host not like", value, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostIn(List<String> values) {
            addCriterion("email_host in", values, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostNotIn(List<String> values) {
            addCriterion("email_host not in", values, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostBetween(String value1, String value2) {
            addCriterion("email_host between", value1, value2, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailHostNotBetween(String value1, String value2) {
            addCriterion("email_host not between", value1, value2, "emailHost");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingIsNull() {
            addCriterion("email_encoding is null");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingIsNotNull() {
            addCriterion("email_encoding is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingEqualTo(String value) {
            addCriterion("email_encoding =", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingNotEqualTo(String value) {
            addCriterion("email_encoding <>", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingGreaterThan(String value) {
            addCriterion("email_encoding >", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingGreaterThanOrEqualTo(String value) {
            addCriterion("email_encoding >=", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingLessThan(String value) {
            addCriterion("email_encoding <", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingLessThanOrEqualTo(String value) {
            addCriterion("email_encoding <=", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingLike(String value) {
            addCriterion("email_encoding like", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingNotLike(String value) {
            addCriterion("email_encoding not like", value, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingIn(List<String> values) {
            addCriterion("email_encoding in", values, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingNotIn(List<String> values) {
            addCriterion("email_encoding not in", values, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingBetween(String value1, String value2) {
            addCriterion("email_encoding between", value1, value2, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailEncodingNotBetween(String value1, String value2) {
            addCriterion("email_encoding not between", value1, value2, "emailEncoding");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameIsNull() {
            addCriterion("email_username is null");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameIsNotNull() {
            addCriterion("email_username is not null");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameEqualTo(String value) {
            addCriterion("email_username =", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameNotEqualTo(String value) {
            addCriterion("email_username <>", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameGreaterThan(String value) {
            addCriterion("email_username >", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("email_username >=", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameLessThan(String value) {
            addCriterion("email_username <", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameLessThanOrEqualTo(String value) {
            addCriterion("email_username <=", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameLike(String value) {
            addCriterion("email_username like", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameNotLike(String value) {
            addCriterion("email_username not like", value, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameIn(List<String> values) {
            addCriterion("email_username in", values, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameNotIn(List<String> values) {
            addCriterion("email_username not in", values, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameBetween(String value1, String value2) {
            addCriterion("email_username between", value1, value2, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailUsernameNotBetween(String value1, String value2) {
            addCriterion("email_username not between", value1, value2, "emailUsername");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordIsNull() {
            addCriterion("email_password is null");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordIsNotNull() {
            addCriterion("email_password is not null");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordEqualTo(String value) {
            addCriterion("email_password =", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordNotEqualTo(String value) {
            addCriterion("email_password <>", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordGreaterThan(String value) {
            addCriterion("email_password >", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("email_password >=", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordLessThan(String value) {
            addCriterion("email_password <", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordLessThanOrEqualTo(String value) {
            addCriterion("email_password <=", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordLike(String value) {
            addCriterion("email_password like", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordNotLike(String value) {
            addCriterion("email_password not like", value, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordIn(List<String> values) {
            addCriterion("email_password in", values, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordNotIn(List<String> values) {
            addCriterion("email_password not in", values, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordBetween(String value1, String value2) {
            addCriterion("email_password between", value1, value2, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPasswordNotBetween(String value1, String value2) {
            addCriterion("email_password not between", value1, value2, "emailPassword");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalIsNull() {
            addCriterion("email_personal is null");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalIsNotNull() {
            addCriterion("email_personal is not null");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalEqualTo(String value) {
            addCriterion("email_personal =", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalNotEqualTo(String value) {
            addCriterion("email_personal <>", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalGreaterThan(String value) {
            addCriterion("email_personal >", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalGreaterThanOrEqualTo(String value) {
            addCriterion("email_personal >=", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalLessThan(String value) {
            addCriterion("email_personal <", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalLessThanOrEqualTo(String value) {
            addCriterion("email_personal <=", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalLike(String value) {
            addCriterion("email_personal like", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalNotLike(String value) {
            addCriterion("email_personal not like", value, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalIn(List<String> values) {
            addCriterion("email_personal in", values, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalNotIn(List<String> values) {
            addCriterion("email_personal not in", values, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalBetween(String value1, String value2) {
            addCriterion("email_personal between", value1, value2, "emailPersonal");
            return (Criteria) this;
        }

        public Criteria andEmailPersonalNotBetween(String value1, String value2) {
            addCriterion("email_personal not between", value1, value2, "emailPersonal");
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