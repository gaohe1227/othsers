package com.doadway.dwcms.core.config.pojo;

import java.util.ArrayList;
import java.util.List;

public class SiteExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SiteExample() {
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

        public Criteria andFtpUploadIdIsNull() {
            addCriterion("ftp_upload_id is null");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdIsNotNull() {
            addCriterion("ftp_upload_id is not null");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdEqualTo(Integer value) {
            addCriterion("ftp_upload_id =", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdNotEqualTo(Integer value) {
            addCriterion("ftp_upload_id <>", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdGreaterThan(Integer value) {
            addCriterion("ftp_upload_id >", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ftp_upload_id >=", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdLessThan(Integer value) {
            addCriterion("ftp_upload_id <", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdLessThanOrEqualTo(Integer value) {
            addCriterion("ftp_upload_id <=", value, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdIn(List<Integer> values) {
            addCriterion("ftp_upload_id in", values, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdNotIn(List<Integer> values) {
            addCriterion("ftp_upload_id not in", values, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdBetween(Integer value1, Integer value2) {
            addCriterion("ftp_upload_id between", value1, value2, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andFtpUploadIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ftp_upload_id not between", value1, value2, "ftpUploadId");
            return (Criteria) this;
        }

        public Criteria andDomainIsNull() {
            addCriterion("domain is null");
            return (Criteria) this;
        }

        public Criteria andDomainIsNotNull() {
            addCriterion("domain is not null");
            return (Criteria) this;
        }

        public Criteria andDomainEqualTo(String value) {
            addCriterion("domain =", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainNotEqualTo(String value) {
            addCriterion("domain <>", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainGreaterThan(String value) {
            addCriterion("domain >", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainGreaterThanOrEqualTo(String value) {
            addCriterion("domain >=", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainLessThan(String value) {
            addCriterion("domain <", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainLessThanOrEqualTo(String value) {
            addCriterion("domain <=", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainLike(String value) {
            addCriterion("domain like", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainNotLike(String value) {
            addCriterion("domain not like", value, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainIn(List<String> values) {
            addCriterion("domain in", values, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainNotIn(List<String> values) {
            addCriterion("domain not in", values, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainBetween(String value1, String value2) {
            addCriterion("domain between", value1, value2, "domain");
            return (Criteria) this;
        }

        public Criteria andDomainNotBetween(String value1, String value2) {
            addCriterion("domain not between", value1, value2, "domain");
            return (Criteria) this;
        }

        public Criteria andSitePathIsNull() {
            addCriterion("site_path is null");
            return (Criteria) this;
        }

        public Criteria andSitePathIsNotNull() {
            addCriterion("site_path is not null");
            return (Criteria) this;
        }

        public Criteria andSitePathEqualTo(String value) {
            addCriterion("site_path =", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathNotEqualTo(String value) {
            addCriterion("site_path <>", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathGreaterThan(String value) {
            addCriterion("site_path >", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathGreaterThanOrEqualTo(String value) {
            addCriterion("site_path >=", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathLessThan(String value) {
            addCriterion("site_path <", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathLessThanOrEqualTo(String value) {
            addCriterion("site_path <=", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathLike(String value) {
            addCriterion("site_path like", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathNotLike(String value) {
            addCriterion("site_path not like", value, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathIn(List<String> values) {
            addCriterion("site_path in", values, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathNotIn(List<String> values) {
            addCriterion("site_path not in", values, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathBetween(String value1, String value2) {
            addCriterion("site_path between", value1, value2, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSitePathNotBetween(String value1, String value2) {
            addCriterion("site_path not between", value1, value2, "sitePath");
            return (Criteria) this;
        }

        public Criteria andSiteNameIsNull() {
            addCriterion("site_name is null");
            return (Criteria) this;
        }

        public Criteria andSiteNameIsNotNull() {
            addCriterion("site_name is not null");
            return (Criteria) this;
        }

        public Criteria andSiteNameEqualTo(String value) {
            addCriterion("site_name =", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameNotEqualTo(String value) {
            addCriterion("site_name <>", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameGreaterThan(String value) {
            addCriterion("site_name >", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameGreaterThanOrEqualTo(String value) {
            addCriterion("site_name >=", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameLessThan(String value) {
            addCriterion("site_name <", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameLessThanOrEqualTo(String value) {
            addCriterion("site_name <=", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameLike(String value) {
            addCriterion("site_name like", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameNotLike(String value) {
            addCriterion("site_name not like", value, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameIn(List<String> values) {
            addCriterion("site_name in", values, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameNotIn(List<String> values) {
            addCriterion("site_name not in", values, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameBetween(String value1, String value2) {
            addCriterion("site_name between", value1, value2, "siteName");
            return (Criteria) this;
        }

        public Criteria andSiteNameNotBetween(String value1, String value2) {
            addCriterion("site_name not between", value1, value2, "siteName");
            return (Criteria) this;
        }

        public Criteria andShortNameIsNull() {
            addCriterion("short_name is null");
            return (Criteria) this;
        }

        public Criteria andShortNameIsNotNull() {
            addCriterion("short_name is not null");
            return (Criteria) this;
        }

        public Criteria andShortNameEqualTo(String value) {
            addCriterion("short_name =", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameNotEqualTo(String value) {
            addCriterion("short_name <>", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameGreaterThan(String value) {
            addCriterion("short_name >", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameGreaterThanOrEqualTo(String value) {
            addCriterion("short_name >=", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameLessThan(String value) {
            addCriterion("short_name <", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameLessThanOrEqualTo(String value) {
            addCriterion("short_name <=", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameLike(String value) {
            addCriterion("short_name like", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameNotLike(String value) {
            addCriterion("short_name not like", value, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameIn(List<String> values) {
            addCriterion("short_name in", values, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameNotIn(List<String> values) {
            addCriterion("short_name not in", values, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameBetween(String value1, String value2) {
            addCriterion("short_name between", value1, value2, "shortName");
            return (Criteria) this;
        }

        public Criteria andShortNameNotBetween(String value1, String value2) {
            addCriterion("short_name not between", value1, value2, "shortName");
            return (Criteria) this;
        }

        public Criteria andProtocolIsNull() {
            addCriterion("protocol is null");
            return (Criteria) this;
        }

        public Criteria andProtocolIsNotNull() {
            addCriterion("protocol is not null");
            return (Criteria) this;
        }

        public Criteria andProtocolEqualTo(String value) {
            addCriterion("protocol =", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolNotEqualTo(String value) {
            addCriterion("protocol <>", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolGreaterThan(String value) {
            addCriterion("protocol >", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolGreaterThanOrEqualTo(String value) {
            addCriterion("protocol >=", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolLessThan(String value) {
            addCriterion("protocol <", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolLessThanOrEqualTo(String value) {
            addCriterion("protocol <=", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolLike(String value) {
            addCriterion("protocol like", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolNotLike(String value) {
            addCriterion("protocol not like", value, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolIn(List<String> values) {
            addCriterion("protocol in", values, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolNotIn(List<String> values) {
            addCriterion("protocol not in", values, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolBetween(String value1, String value2) {
            addCriterion("protocol between", value1, value2, "protocol");
            return (Criteria) this;
        }

        public Criteria andProtocolNotBetween(String value1, String value2) {
            addCriterion("protocol not between", value1, value2, "protocol");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixIsNull() {
            addCriterion("dynamic_suffix is null");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixIsNotNull() {
            addCriterion("dynamic_suffix is not null");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixEqualTo(String value) {
            addCriterion("dynamic_suffix =", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixNotEqualTo(String value) {
            addCriterion("dynamic_suffix <>", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixGreaterThan(String value) {
            addCriterion("dynamic_suffix >", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixGreaterThanOrEqualTo(String value) {
            addCriterion("dynamic_suffix >=", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixLessThan(String value) {
            addCriterion("dynamic_suffix <", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixLessThanOrEqualTo(String value) {
            addCriterion("dynamic_suffix <=", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixLike(String value) {
            addCriterion("dynamic_suffix like", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixNotLike(String value) {
            addCriterion("dynamic_suffix not like", value, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixIn(List<String> values) {
            addCriterion("dynamic_suffix in", values, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixNotIn(List<String> values) {
            addCriterion("dynamic_suffix not in", values, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixBetween(String value1, String value2) {
            addCriterion("dynamic_suffix between", value1, value2, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andDynamicSuffixNotBetween(String value1, String value2) {
            addCriterion("dynamic_suffix not between", value1, value2, "dynamicSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixIsNull() {
            addCriterion("static_suffix is null");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixIsNotNull() {
            addCriterion("static_suffix is not null");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixEqualTo(String value) {
            addCriterion("static_suffix =", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixNotEqualTo(String value) {
            addCriterion("static_suffix <>", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixGreaterThan(String value) {
            addCriterion("static_suffix >", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixGreaterThanOrEqualTo(String value) {
            addCriterion("static_suffix >=", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixLessThan(String value) {
            addCriterion("static_suffix <", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixLessThanOrEqualTo(String value) {
            addCriterion("static_suffix <=", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixLike(String value) {
            addCriterion("static_suffix like", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixNotLike(String value) {
            addCriterion("static_suffix not like", value, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixIn(List<String> values) {
            addCriterion("static_suffix in", values, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixNotIn(List<String> values) {
            addCriterion("static_suffix not in", values, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixBetween(String value1, String value2) {
            addCriterion("static_suffix between", value1, value2, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticSuffixNotBetween(String value1, String value2) {
            addCriterion("static_suffix not between", value1, value2, "staticSuffix");
            return (Criteria) this;
        }

        public Criteria andStaticDirIsNull() {
            addCriterion("static_dir is null");
            return (Criteria) this;
        }

        public Criteria andStaticDirIsNotNull() {
            addCriterion("static_dir is not null");
            return (Criteria) this;
        }

        public Criteria andStaticDirEqualTo(String value) {
            addCriterion("static_dir =", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirNotEqualTo(String value) {
            addCriterion("static_dir <>", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirGreaterThan(String value) {
            addCriterion("static_dir >", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirGreaterThanOrEqualTo(String value) {
            addCriterion("static_dir >=", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirLessThan(String value) {
            addCriterion("static_dir <", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirLessThanOrEqualTo(String value) {
            addCriterion("static_dir <=", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirLike(String value) {
            addCriterion("static_dir like", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirNotLike(String value) {
            addCriterion("static_dir not like", value, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirIn(List<String> values) {
            addCriterion("static_dir in", values, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirNotIn(List<String> values) {
            addCriterion("static_dir not in", values, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirBetween(String value1, String value2) {
            addCriterion("static_dir between", value1, value2, "staticDir");
            return (Criteria) this;
        }

        public Criteria andStaticDirNotBetween(String value1, String value2) {
            addCriterion("static_dir not between", value1, value2, "staticDir");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootIsNull() {
            addCriterion("is_index_to_root is null");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootIsNotNull() {
            addCriterion("is_index_to_root is not null");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootEqualTo(String value) {
            addCriterion("is_index_to_root =", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootNotEqualTo(String value) {
            addCriterion("is_index_to_root <>", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootGreaterThan(String value) {
            addCriterion("is_index_to_root >", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootGreaterThanOrEqualTo(String value) {
            addCriterion("is_index_to_root >=", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootLessThan(String value) {
            addCriterion("is_index_to_root <", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootLessThanOrEqualTo(String value) {
            addCriterion("is_index_to_root <=", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootLike(String value) {
            addCriterion("is_index_to_root like", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootNotLike(String value) {
            addCriterion("is_index_to_root not like", value, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootIn(List<String> values) {
            addCriterion("is_index_to_root in", values, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootNotIn(List<String> values) {
            addCriterion("is_index_to_root not in", values, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootBetween(String value1, String value2) {
            addCriterion("is_index_to_root between", value1, value2, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsIndexToRootNotBetween(String value1, String value2) {
            addCriterion("is_index_to_root not between", value1, value2, "isIndexToRoot");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexIsNull() {
            addCriterion("is_static_index is null");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexIsNotNull() {
            addCriterion("is_static_index is not null");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexEqualTo(String value) {
            addCriterion("is_static_index =", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexNotEqualTo(String value) {
            addCriterion("is_static_index <>", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexGreaterThan(String value) {
            addCriterion("is_static_index >", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexGreaterThanOrEqualTo(String value) {
            addCriterion("is_static_index >=", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexLessThan(String value) {
            addCriterion("is_static_index <", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexLessThanOrEqualTo(String value) {
            addCriterion("is_static_index <=", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexLike(String value) {
            addCriterion("is_static_index like", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexNotLike(String value) {
            addCriterion("is_static_index not like", value, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexIn(List<String> values) {
            addCriterion("is_static_index in", values, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexNotIn(List<String> values) {
            addCriterion("is_static_index not in", values, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexBetween(String value1, String value2) {
            addCriterion("is_static_index between", value1, value2, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andIsStaticIndexNotBetween(String value1, String value2) {
            addCriterion("is_static_index not between", value1, value2, "isStaticIndex");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminIsNull() {
            addCriterion("locale_admin is null");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminIsNotNull() {
            addCriterion("locale_admin is not null");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminEqualTo(String value) {
            addCriterion("locale_admin =", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminNotEqualTo(String value) {
            addCriterion("locale_admin <>", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminGreaterThan(String value) {
            addCriterion("locale_admin >", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminGreaterThanOrEqualTo(String value) {
            addCriterion("locale_admin >=", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminLessThan(String value) {
            addCriterion("locale_admin <", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminLessThanOrEqualTo(String value) {
            addCriterion("locale_admin <=", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminLike(String value) {
            addCriterion("locale_admin like", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminNotLike(String value) {
            addCriterion("locale_admin not like", value, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminIn(List<String> values) {
            addCriterion("locale_admin in", values, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminNotIn(List<String> values) {
            addCriterion("locale_admin not in", values, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminBetween(String value1, String value2) {
            addCriterion("locale_admin between", value1, value2, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleAdminNotBetween(String value1, String value2) {
            addCriterion("locale_admin not between", value1, value2, "localeAdmin");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontIsNull() {
            addCriterion("locale_front is null");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontIsNotNull() {
            addCriterion("locale_front is not null");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontEqualTo(String value) {
            addCriterion("locale_front =", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontNotEqualTo(String value) {
            addCriterion("locale_front <>", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontGreaterThan(String value) {
            addCriterion("locale_front >", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontGreaterThanOrEqualTo(String value) {
            addCriterion("locale_front >=", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontLessThan(String value) {
            addCriterion("locale_front <", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontLessThanOrEqualTo(String value) {
            addCriterion("locale_front <=", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontLike(String value) {
            addCriterion("locale_front like", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontNotLike(String value) {
            addCriterion("locale_front not like", value, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontIn(List<String> values) {
            addCriterion("locale_front in", values, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontNotIn(List<String> values) {
            addCriterion("locale_front not in", values, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontBetween(String value1, String value2) {
            addCriterion("locale_front between", value1, value2, "localeFront");
            return (Criteria) this;
        }

        public Criteria andLocaleFrontNotBetween(String value1, String value2) {
            addCriterion("locale_front not between", value1, value2, "localeFront");
            return (Criteria) this;
        }

        public Criteria andTplSolutionIsNull() {
            addCriterion("tpl_solution is null");
            return (Criteria) this;
        }

        public Criteria andTplSolutionIsNotNull() {
            addCriterion("tpl_solution is not null");
            return (Criteria) this;
        }

        public Criteria andTplSolutionEqualTo(String value) {
            addCriterion("tpl_solution =", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionNotEqualTo(String value) {
            addCriterion("tpl_solution <>", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionGreaterThan(String value) {
            addCriterion("tpl_solution >", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_solution >=", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionLessThan(String value) {
            addCriterion("tpl_solution <", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionLessThanOrEqualTo(String value) {
            addCriterion("tpl_solution <=", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionLike(String value) {
            addCriterion("tpl_solution like", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionNotLike(String value) {
            addCriterion("tpl_solution not like", value, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionIn(List<String> values) {
            addCriterion("tpl_solution in", values, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionNotIn(List<String> values) {
            addCriterion("tpl_solution not in", values, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionBetween(String value1, String value2) {
            addCriterion("tpl_solution between", value1, value2, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andTplSolutionNotBetween(String value1, String value2) {
            addCriterion("tpl_solution not between", value1, value2, "tplSolution");
            return (Criteria) this;
        }

        public Criteria andFinalStepIsNull() {
            addCriterion("final_step is null");
            return (Criteria) this;
        }

        public Criteria andFinalStepIsNotNull() {
            addCriterion("final_step is not null");
            return (Criteria) this;
        }

        public Criteria andFinalStepEqualTo(Byte value) {
            addCriterion("final_step =", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotEqualTo(Byte value) {
            addCriterion("final_step <>", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepGreaterThan(Byte value) {
            addCriterion("final_step >", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepGreaterThanOrEqualTo(Byte value) {
            addCriterion("final_step >=", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepLessThan(Byte value) {
            addCriterion("final_step <", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepLessThanOrEqualTo(Byte value) {
            addCriterion("final_step <=", value, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepIn(List<Byte> values) {
            addCriterion("final_step in", values, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotIn(List<Byte> values) {
            addCriterion("final_step not in", values, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepBetween(Byte value1, Byte value2) {
            addCriterion("final_step between", value1, value2, "finalStep");
            return (Criteria) this;
        }

        public Criteria andFinalStepNotBetween(Byte value1, Byte value2) {
            addCriterion("final_step not between", value1, value2, "finalStep");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIsNull() {
            addCriterion("after_check is null");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIsNotNull() {
            addCriterion("after_check is not null");
            return (Criteria) this;
        }

        public Criteria andAfterCheckEqualTo(Byte value) {
            addCriterion("after_check =", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotEqualTo(Byte value) {
            addCriterion("after_check <>", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckGreaterThan(Byte value) {
            addCriterion("after_check >", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckGreaterThanOrEqualTo(Byte value) {
            addCriterion("after_check >=", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckLessThan(Byte value) {
            addCriterion("after_check <", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckLessThanOrEqualTo(Byte value) {
            addCriterion("after_check <=", value, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckIn(List<Byte> values) {
            addCriterion("after_check in", values, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotIn(List<Byte> values) {
            addCriterion("after_check not in", values, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckBetween(Byte value1, Byte value2) {
            addCriterion("after_check between", value1, value2, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andAfterCheckNotBetween(Byte value1, Byte value2) {
            addCriterion("after_check not between", value1, value2, "afterCheck");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathIsNull() {
            addCriterion("is_relative_path is null");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathIsNotNull() {
            addCriterion("is_relative_path is not null");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathEqualTo(String value) {
            addCriterion("is_relative_path =", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathNotEqualTo(String value) {
            addCriterion("is_relative_path <>", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathGreaterThan(String value) {
            addCriterion("is_relative_path >", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathGreaterThanOrEqualTo(String value) {
            addCriterion("is_relative_path >=", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathLessThan(String value) {
            addCriterion("is_relative_path <", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathLessThanOrEqualTo(String value) {
            addCriterion("is_relative_path <=", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathLike(String value) {
            addCriterion("is_relative_path like", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathNotLike(String value) {
            addCriterion("is_relative_path not like", value, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathIn(List<String> values) {
            addCriterion("is_relative_path in", values, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathNotIn(List<String> values) {
            addCriterion("is_relative_path not in", values, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathBetween(String value1, String value2) {
            addCriterion("is_relative_path between", value1, value2, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRelativePathNotBetween(String value1, String value2) {
            addCriterion("is_relative_path not between", value1, value2, "isRelativePath");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnIsNull() {
            addCriterion("is_recycle_on is null");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnIsNotNull() {
            addCriterion("is_recycle_on is not null");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnEqualTo(String value) {
            addCriterion("is_recycle_on =", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnNotEqualTo(String value) {
            addCriterion("is_recycle_on <>", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnGreaterThan(String value) {
            addCriterion("is_recycle_on >", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnGreaterThanOrEqualTo(String value) {
            addCriterion("is_recycle_on >=", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnLessThan(String value) {
            addCriterion("is_recycle_on <", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnLessThanOrEqualTo(String value) {
            addCriterion("is_recycle_on <=", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnLike(String value) {
            addCriterion("is_recycle_on like", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnNotLike(String value) {
            addCriterion("is_recycle_on not like", value, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnIn(List<String> values) {
            addCriterion("is_recycle_on in", values, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnNotIn(List<String> values) {
            addCriterion("is_recycle_on not in", values, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnBetween(String value1, String value2) {
            addCriterion("is_recycle_on between", value1, value2, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andIsRecycleOnNotBetween(String value1, String value2) {
            addCriterion("is_recycle_on not between", value1, value2, "isRecycleOn");
            return (Criteria) this;
        }

        public Criteria andDomainAliasIsNull() {
            addCriterion("domain_alias is null");
            return (Criteria) this;
        }

        public Criteria andDomainAliasIsNotNull() {
            addCriterion("domain_alias is not null");
            return (Criteria) this;
        }

        public Criteria andDomainAliasEqualTo(String value) {
            addCriterion("domain_alias =", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasNotEqualTo(String value) {
            addCriterion("domain_alias <>", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasGreaterThan(String value) {
            addCriterion("domain_alias >", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasGreaterThanOrEqualTo(String value) {
            addCriterion("domain_alias >=", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasLessThan(String value) {
            addCriterion("domain_alias <", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasLessThanOrEqualTo(String value) {
            addCriterion("domain_alias <=", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasLike(String value) {
            addCriterion("domain_alias like", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasNotLike(String value) {
            addCriterion("domain_alias not like", value, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasIn(List<String> values) {
            addCriterion("domain_alias in", values, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasNotIn(List<String> values) {
            addCriterion("domain_alias not in", values, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasBetween(String value1, String value2) {
            addCriterion("domain_alias between", value1, value2, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainAliasNotBetween(String value1, String value2) {
            addCriterion("domain_alias not between", value1, value2, "domainAlias");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectIsNull() {
            addCriterion("domain_redirect is null");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectIsNotNull() {
            addCriterion("domain_redirect is not null");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectEqualTo(String value) {
            addCriterion("domain_redirect =", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectNotEqualTo(String value) {
            addCriterion("domain_redirect <>", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectGreaterThan(String value) {
            addCriterion("domain_redirect >", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectGreaterThanOrEqualTo(String value) {
            addCriterion("domain_redirect >=", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectLessThan(String value) {
            addCriterion("domain_redirect <", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectLessThanOrEqualTo(String value) {
            addCriterion("domain_redirect <=", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectLike(String value) {
            addCriterion("domain_redirect like", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectNotLike(String value) {
            addCriterion("domain_redirect not like", value, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectIn(List<String> values) {
            addCriterion("domain_redirect in", values, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectNotIn(List<String> values) {
            addCriterion("domain_redirect not in", values, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectBetween(String value1, String value2) {
            addCriterion("domain_redirect between", value1, value2, "domainRedirect");
            return (Criteria) this;
        }

        public Criteria andDomainRedirectNotBetween(String value1, String value2) {
            addCriterion("domain_redirect not between", value1, value2, "domainRedirect");
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