package com.doadway.dwcms.core.content.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContentExtExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContentExtExample() {
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

        public Criteria andContentIdIsNull() {
            addCriterion("content_id is null");
            return (Criteria) this;
        }

        public Criteria andContentIdIsNotNull() {
            addCriterion("content_id is not null");
            return (Criteria) this;
        }

        public Criteria andContentIdEqualTo(Integer value) {
            addCriterion("content_id =", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotEqualTo(Integer value) {
            addCriterion("content_id <>", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThan(Integer value) {
            addCriterion("content_id >", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("content_id >=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThan(Integer value) {
            addCriterion("content_id <", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThanOrEqualTo(Integer value) {
            addCriterion("content_id <=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdIn(List<Integer> values) {
            addCriterion("content_id in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotIn(List<Integer> values) {
            addCriterion("content_id not in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdBetween(Integer value1, Integer value2) {
            addCriterion("content_id between", value1, value2, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("content_id not between", value1, value2, "contentId");
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

        public Criteria andShortTitleIsNull() {
            addCriterion("short_title is null");
            return (Criteria) this;
        }

        public Criteria andShortTitleIsNotNull() {
            addCriterion("short_title is not null");
            return (Criteria) this;
        }

        public Criteria andShortTitleEqualTo(String value) {
            addCriterion("short_title =", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotEqualTo(String value) {
            addCriterion("short_title <>", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleGreaterThan(String value) {
            addCriterion("short_title >", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleGreaterThanOrEqualTo(String value) {
            addCriterion("short_title >=", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLessThan(String value) {
            addCriterion("short_title <", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLessThanOrEqualTo(String value) {
            addCriterion("short_title <=", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleLike(String value) {
            addCriterion("short_title like", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotLike(String value) {
            addCriterion("short_title not like", value, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleIn(List<String> values) {
            addCriterion("short_title in", values, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotIn(List<String> values) {
            addCriterion("short_title not in", values, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleBetween(String value1, String value2) {
            addCriterion("short_title between", value1, value2, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andShortTitleNotBetween(String value1, String value2) {
            addCriterion("short_title not between", value1, value2, "shortTitle");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNull() {
            addCriterion("author is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNotNull() {
            addCriterion("author is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorEqualTo(String value) {
            addCriterion("author =", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotEqualTo(String value) {
            addCriterion("author <>", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThan(String value) {
            addCriterion("author >", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThanOrEqualTo(String value) {
            addCriterion("author >=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThan(String value) {
            addCriterion("author <", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThanOrEqualTo(String value) {
            addCriterion("author <=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLike(String value) {
            addCriterion("author like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotLike(String value) {
            addCriterion("author not like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorIn(List<String> values) {
            addCriterion("author in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotIn(List<String> values) {
            addCriterion("author not in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorBetween(String value1, String value2) {
            addCriterion("author between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotBetween(String value1, String value2) {
            addCriterion("author not between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andOriginIsNull() {
            addCriterion("origin is null");
            return (Criteria) this;
        }

        public Criteria andOriginIsNotNull() {
            addCriterion("origin is not null");
            return (Criteria) this;
        }

        public Criteria andOriginEqualTo(String value) {
            addCriterion("origin =", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginNotEqualTo(String value) {
            addCriterion("origin <>", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginGreaterThan(String value) {
            addCriterion("origin >", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginGreaterThanOrEqualTo(String value) {
            addCriterion("origin >=", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginLessThan(String value) {
            addCriterion("origin <", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginLessThanOrEqualTo(String value) {
            addCriterion("origin <=", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginLike(String value) {
            addCriterion("origin like", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginNotLike(String value) {
            addCriterion("origin not like", value, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginIn(List<String> values) {
            addCriterion("origin in", values, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginNotIn(List<String> values) {
            addCriterion("origin not in", values, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginBetween(String value1, String value2) {
            addCriterion("origin between", value1, value2, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginNotBetween(String value1, String value2) {
            addCriterion("origin not between", value1, value2, "origin");
            return (Criteria) this;
        }

        public Criteria andOriginUrlIsNull() {
            addCriterion("origin_url is null");
            return (Criteria) this;
        }

        public Criteria andOriginUrlIsNotNull() {
            addCriterion("origin_url is not null");
            return (Criteria) this;
        }

        public Criteria andOriginUrlEqualTo(String value) {
            addCriterion("origin_url =", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlNotEqualTo(String value) {
            addCriterion("origin_url <>", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlGreaterThan(String value) {
            addCriterion("origin_url >", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlGreaterThanOrEqualTo(String value) {
            addCriterion("origin_url >=", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlLessThan(String value) {
            addCriterion("origin_url <", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlLessThanOrEqualTo(String value) {
            addCriterion("origin_url <=", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlLike(String value) {
            addCriterion("origin_url like", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlNotLike(String value) {
            addCriterion("origin_url not like", value, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlIn(List<String> values) {
            addCriterion("origin_url in", values, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlNotIn(List<String> values) {
            addCriterion("origin_url not in", values, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlBetween(String value1, String value2) {
            addCriterion("origin_url between", value1, value2, "originUrl");
            return (Criteria) this;
        }

        public Criteria andOriginUrlNotBetween(String value1, String value2) {
            addCriterion("origin_url not between", value1, value2, "originUrl");
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

        public Criteria andReleaseDateIsNull() {
            addCriterion("release_date is null");
            return (Criteria) this;
        }

        public Criteria andReleaseDateIsNotNull() {
            addCriterion("release_date is not null");
            return (Criteria) this;
        }

        public Criteria andReleaseDateEqualTo(Date value) {
            addCriterion("release_date =", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateNotEqualTo(Date value) {
            addCriterion("release_date <>", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateGreaterThan(Date value) {
            addCriterion("release_date >", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateGreaterThanOrEqualTo(Date value) {
            addCriterion("release_date >=", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateLessThan(Date value) {
            addCriterion("release_date <", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateLessThanOrEqualTo(Date value) {
            addCriterion("release_date <=", value, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateIn(List<Date> values) {
            addCriterion("release_date in", values, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateNotIn(List<Date> values) {
            addCriterion("release_date not in", values, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateBetween(Date value1, Date value2) {
            addCriterion("release_date between", value1, value2, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andReleaseDateNotBetween(Date value1, Date value2) {
            addCriterion("release_date not between", value1, value2, "releaseDate");
            return (Criteria) this;
        }

        public Criteria andMediaPathIsNull() {
            addCriterion("media_path is null");
            return (Criteria) this;
        }

        public Criteria andMediaPathIsNotNull() {
            addCriterion("media_path is not null");
            return (Criteria) this;
        }

        public Criteria andMediaPathEqualTo(String value) {
            addCriterion("media_path =", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathNotEqualTo(String value) {
            addCriterion("media_path <>", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathGreaterThan(String value) {
            addCriterion("media_path >", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathGreaterThanOrEqualTo(String value) {
            addCriterion("media_path >=", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathLessThan(String value) {
            addCriterion("media_path <", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathLessThanOrEqualTo(String value) {
            addCriterion("media_path <=", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathLike(String value) {
            addCriterion("media_path like", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathNotLike(String value) {
            addCriterion("media_path not like", value, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathIn(List<String> values) {
            addCriterion("media_path in", values, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathNotIn(List<String> values) {
            addCriterion("media_path not in", values, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathBetween(String value1, String value2) {
            addCriterion("media_path between", value1, value2, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaPathNotBetween(String value1, String value2) {
            addCriterion("media_path not between", value1, value2, "mediaPath");
            return (Criteria) this;
        }

        public Criteria andMediaTypeIsNull() {
            addCriterion("media_type is null");
            return (Criteria) this;
        }

        public Criteria andMediaTypeIsNotNull() {
            addCriterion("media_type is not null");
            return (Criteria) this;
        }

        public Criteria andMediaTypeEqualTo(String value) {
            addCriterion("media_type =", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeNotEqualTo(String value) {
            addCriterion("media_type <>", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeGreaterThan(String value) {
            addCriterion("media_type >", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeGreaterThanOrEqualTo(String value) {
            addCriterion("media_type >=", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeLessThan(String value) {
            addCriterion("media_type <", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeLessThanOrEqualTo(String value) {
            addCriterion("media_type <=", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeLike(String value) {
            addCriterion("media_type like", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeNotLike(String value) {
            addCriterion("media_type not like", value, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeIn(List<String> values) {
            addCriterion("media_type in", values, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeNotIn(List<String> values) {
            addCriterion("media_type not in", values, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeBetween(String value1, String value2) {
            addCriterion("media_type between", value1, value2, "mediaType");
            return (Criteria) this;
        }

        public Criteria andMediaTypeNotBetween(String value1, String value2) {
            addCriterion("media_type not between", value1, value2, "mediaType");
            return (Criteria) this;
        }

        public Criteria andTitleColorIsNull() {
            addCriterion("title_color is null");
            return (Criteria) this;
        }

        public Criteria andTitleColorIsNotNull() {
            addCriterion("title_color is not null");
            return (Criteria) this;
        }

        public Criteria andTitleColorEqualTo(String value) {
            addCriterion("title_color =", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorNotEqualTo(String value) {
            addCriterion("title_color <>", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorGreaterThan(String value) {
            addCriterion("title_color >", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorGreaterThanOrEqualTo(String value) {
            addCriterion("title_color >=", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorLessThan(String value) {
            addCriterion("title_color <", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorLessThanOrEqualTo(String value) {
            addCriterion("title_color <=", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorLike(String value) {
            addCriterion("title_color like", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorNotLike(String value) {
            addCriterion("title_color not like", value, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorIn(List<String> values) {
            addCriterion("title_color in", values, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorNotIn(List<String> values) {
            addCriterion("title_color not in", values, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorBetween(String value1, String value2) {
            addCriterion("title_color between", value1, value2, "titleColor");
            return (Criteria) this;
        }

        public Criteria andTitleColorNotBetween(String value1, String value2) {
            addCriterion("title_color not between", value1, value2, "titleColor");
            return (Criteria) this;
        }

        public Criteria andIsBoldIsNull() {
            addCriterion("is_bold is null");
            return (Criteria) this;
        }

        public Criteria andIsBoldIsNotNull() {
            addCriterion("is_bold is not null");
            return (Criteria) this;
        }

        public Criteria andIsBoldEqualTo(Boolean value) {
            addCriterion("is_bold =", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldNotEqualTo(Boolean value) {
            addCriterion("is_bold <>", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldGreaterThan(Boolean value) {
            addCriterion("is_bold >", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_bold >=", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldLessThan(Boolean value) {
            addCriterion("is_bold <", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldLessThanOrEqualTo(Boolean value) {
            addCriterion("is_bold <=", value, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldIn(List<Boolean> values) {
            addCriterion("is_bold in", values, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldNotIn(List<Boolean> values) {
            addCriterion("is_bold not in", values, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldBetween(Boolean value1, Boolean value2) {
            addCriterion("is_bold between", value1, value2, "isBold");
            return (Criteria) this;
        }

        public Criteria andIsBoldNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_bold not between", value1, value2, "isBold");
            return (Criteria) this;
        }

        public Criteria andTitleImgIsNull() {
            addCriterion("title_img is null");
            return (Criteria) this;
        }

        public Criteria andTitleImgIsNotNull() {
            addCriterion("title_img is not null");
            return (Criteria) this;
        }

        public Criteria andTitleImgEqualTo(String value) {
            addCriterion("title_img =", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotEqualTo(String value) {
            addCriterion("title_img <>", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgGreaterThan(String value) {
            addCriterion("title_img >", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgGreaterThanOrEqualTo(String value) {
            addCriterion("title_img >=", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLessThan(String value) {
            addCriterion("title_img <", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLessThanOrEqualTo(String value) {
            addCriterion("title_img <=", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgLike(String value) {
            addCriterion("title_img like", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotLike(String value) {
            addCriterion("title_img not like", value, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgIn(List<String> values) {
            addCriterion("title_img in", values, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotIn(List<String> values) {
            addCriterion("title_img not in", values, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgBetween(String value1, String value2) {
            addCriterion("title_img between", value1, value2, "titleImg");
            return (Criteria) this;
        }

        public Criteria andTitleImgNotBetween(String value1, String value2) {
            addCriterion("title_img not between", value1, value2, "titleImg");
            return (Criteria) this;
        }

        public Criteria andContentImgIsNull() {
            addCriterion("content_img is null");
            return (Criteria) this;
        }

        public Criteria andContentImgIsNotNull() {
            addCriterion("content_img is not null");
            return (Criteria) this;
        }

        public Criteria andContentImgEqualTo(String value) {
            addCriterion("content_img =", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotEqualTo(String value) {
            addCriterion("content_img <>", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgGreaterThan(String value) {
            addCriterion("content_img >", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgGreaterThanOrEqualTo(String value) {
            addCriterion("content_img >=", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLessThan(String value) {
            addCriterion("content_img <", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLessThanOrEqualTo(String value) {
            addCriterion("content_img <=", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgLike(String value) {
            addCriterion("content_img like", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotLike(String value) {
            addCriterion("content_img not like", value, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgIn(List<String> values) {
            addCriterion("content_img in", values, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotIn(List<String> values) {
            addCriterion("content_img not in", values, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgBetween(String value1, String value2) {
            addCriterion("content_img between", value1, value2, "contentImg");
            return (Criteria) this;
        }

        public Criteria andContentImgNotBetween(String value1, String value2) {
            addCriterion("content_img not between", value1, value2, "contentImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgIsNull() {
            addCriterion("type_img is null");
            return (Criteria) this;
        }

        public Criteria andTypeImgIsNotNull() {
            addCriterion("type_img is not null");
            return (Criteria) this;
        }

        public Criteria andTypeImgEqualTo(String value) {
            addCriterion("type_img =", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgNotEqualTo(String value) {
            addCriterion("type_img <>", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgGreaterThan(String value) {
            addCriterion("type_img >", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgGreaterThanOrEqualTo(String value) {
            addCriterion("type_img >=", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgLessThan(String value) {
            addCriterion("type_img <", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgLessThanOrEqualTo(String value) {
            addCriterion("type_img <=", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgLike(String value) {
            addCriterion("type_img like", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgNotLike(String value) {
            addCriterion("type_img not like", value, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgIn(List<String> values) {
            addCriterion("type_img in", values, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgNotIn(List<String> values) {
            addCriterion("type_img not in", values, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgBetween(String value1, String value2) {
            addCriterion("type_img between", value1, value2, "typeImg");
            return (Criteria) this;
        }

        public Criteria andTypeImgNotBetween(String value1, String value2) {
            addCriterion("type_img not between", value1, value2, "typeImg");
            return (Criteria) this;
        }

        public Criteria andLinkIsNull() {
            addCriterion("link is null");
            return (Criteria) this;
        }

        public Criteria andLinkIsNotNull() {
            addCriterion("link is not null");
            return (Criteria) this;
        }

        public Criteria andLinkEqualTo(String value) {
            addCriterion("link =", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotEqualTo(String value) {
            addCriterion("link <>", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkGreaterThan(String value) {
            addCriterion("link >", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkGreaterThanOrEqualTo(String value) {
            addCriterion("link >=", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLessThan(String value) {
            addCriterion("link <", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLessThanOrEqualTo(String value) {
            addCriterion("link <=", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkLike(String value) {
            addCriterion("link like", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotLike(String value) {
            addCriterion("link not like", value, "link");
            return (Criteria) this;
        }

        public Criteria andLinkIn(List<String> values) {
            addCriterion("link in", values, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotIn(List<String> values) {
            addCriterion("link not in", values, "link");
            return (Criteria) this;
        }

        public Criteria andLinkBetween(String value1, String value2) {
            addCriterion("link between", value1, value2, "link");
            return (Criteria) this;
        }

        public Criteria andLinkNotBetween(String value1, String value2) {
            addCriterion("link not between", value1, value2, "link");
            return (Criteria) this;
        }

        public Criteria andTplContentIsNull() {
            addCriterion("tpl_content is null");
            return (Criteria) this;
        }

        public Criteria andTplContentIsNotNull() {
            addCriterion("tpl_content is not null");
            return (Criteria) this;
        }

        public Criteria andTplContentEqualTo(String value) {
            addCriterion("tpl_content =", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotEqualTo(String value) {
            addCriterion("tpl_content <>", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentGreaterThan(String value) {
            addCriterion("tpl_content >", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentGreaterThanOrEqualTo(String value) {
            addCriterion("tpl_content >=", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLessThan(String value) {
            addCriterion("tpl_content <", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLessThanOrEqualTo(String value) {
            addCriterion("tpl_content <=", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentLike(String value) {
            addCriterion("tpl_content like", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotLike(String value) {
            addCriterion("tpl_content not like", value, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentIn(List<String> values) {
            addCriterion("tpl_content in", values, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotIn(List<String> values) {
            addCriterion("tpl_content not in", values, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentBetween(String value1, String value2) {
            addCriterion("tpl_content between", value1, value2, "tplContent");
            return (Criteria) this;
        }

        public Criteria andTplContentNotBetween(String value1, String value2) {
            addCriterion("tpl_content not between", value1, value2, "tplContent");
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