package com.doadway.dwcms.core.content.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContentExample() {
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

        public Criteria andSortDateIsNull() {
            addCriterion("sort_date is null");
            return (Criteria) this;
        }

        public Criteria andSortDateIsNotNull() {
            addCriterion("sort_date is not null");
            return (Criteria) this;
        }

        public Criteria andSortDateEqualTo(Date value) {
            addCriterion("sort_date =", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateNotEqualTo(Date value) {
            addCriterion("sort_date <>", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateGreaterThan(Date value) {
            addCriterion("sort_date >", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateGreaterThanOrEqualTo(Date value) {
            addCriterion("sort_date >=", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateLessThan(Date value) {
            addCriterion("sort_date <", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateLessThanOrEqualTo(Date value) {
            addCriterion("sort_date <=", value, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateIn(List<Date> values) {
            addCriterion("sort_date in", values, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateNotIn(List<Date> values) {
            addCriterion("sort_date not in", values, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateBetween(Date value1, Date value2) {
            addCriterion("sort_date between", value1, value2, "sortDate");
            return (Criteria) this;
        }

        public Criteria andSortDateNotBetween(Date value1, Date value2) {
            addCriterion("sort_date not between", value1, value2, "sortDate");
            return (Criteria) this;
        }

        public Criteria andTopLevelIsNull() {
            addCriterion("top_level is null");
            return (Criteria) this;
        }

        public Criteria andTopLevelIsNotNull() {
            addCriterion("top_level is not null");
            return (Criteria) this;
        }

        public Criteria andTopLevelEqualTo(Byte value) {
            addCriterion("top_level =", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelNotEqualTo(Byte value) {
            addCriterion("top_level <>", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelGreaterThan(Byte value) {
            addCriterion("top_level >", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelGreaterThanOrEqualTo(Byte value) {
            addCriterion("top_level >=", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelLessThan(Byte value) {
            addCriterion("top_level <", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelLessThanOrEqualTo(Byte value) {
            addCriterion("top_level <=", value, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelIn(List<Byte> values) {
            addCriterion("top_level in", values, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelNotIn(List<Byte> values) {
            addCriterion("top_level not in", values, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelBetween(Byte value1, Byte value2) {
            addCriterion("top_level between", value1, value2, "topLevel");
            return (Criteria) this;
        }

        public Criteria andTopLevelNotBetween(Byte value1, Byte value2) {
            addCriterion("top_level not between", value1, value2, "topLevel");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIsNull() {
            addCriterion("has_title_img is null");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIsNotNull() {
            addCriterion("has_title_img is not null");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgEqualTo(Boolean value) {
            addCriterion("has_title_img =", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotEqualTo(Boolean value) {
            addCriterion("has_title_img <>", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgGreaterThan(Boolean value) {
            addCriterion("has_title_img >", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgGreaterThanOrEqualTo(Boolean value) {
            addCriterion("has_title_img >=", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgLessThan(Boolean value) {
            addCriterion("has_title_img <", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgLessThanOrEqualTo(Boolean value) {
            addCriterion("has_title_img <=", value, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgIn(List<Boolean> values) {
            addCriterion("has_title_img in", values, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotIn(List<Boolean> values) {
            addCriterion("has_title_img not in", values, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgBetween(Boolean value1, Boolean value2) {
            addCriterion("has_title_img between", value1, value2, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andHasTitleImgNotBetween(Boolean value1, Boolean value2) {
            addCriterion("has_title_img not between", value1, value2, "hasTitleImg");
            return (Criteria) this;
        }

        public Criteria andIsRecommendIsNull() {
            addCriterion("is_recommend is null");
            return (Criteria) this;
        }

        public Criteria andIsRecommendIsNotNull() {
            addCriterion("is_recommend is not null");
            return (Criteria) this;
        }

        public Criteria andIsRecommendEqualTo(Boolean value) {
            addCriterion("is_recommend =", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendNotEqualTo(Boolean value) {
            addCriterion("is_recommend <>", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendGreaterThan(Boolean value) {
            addCriterion("is_recommend >", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_recommend >=", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendLessThan(Boolean value) {
            addCriterion("is_recommend <", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendLessThanOrEqualTo(Boolean value) {
            addCriterion("is_recommend <=", value, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendIn(List<Boolean> values) {
            addCriterion("is_recommend in", values, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendNotIn(List<Boolean> values) {
            addCriterion("is_recommend not in", values, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendBetween(Boolean value1, Boolean value2) {
            addCriterion("is_recommend between", value1, value2, "isRecommend");
            return (Criteria) this;
        }

        public Criteria andIsRecommendNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_recommend not between", value1, value2, "isRecommend");
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

        public Criteria andStatusEqualTo(Byte value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Byte value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Byte value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Byte value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Byte value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Byte value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Byte> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Byte> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Byte value1, Byte value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Byte value1, Byte value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andViewsDayIsNull() {
            addCriterion("views_day is null");
            return (Criteria) this;
        }

        public Criteria andViewsDayIsNotNull() {
            addCriterion("views_day is not null");
            return (Criteria) this;
        }

        public Criteria andViewsDayEqualTo(Integer value) {
            addCriterion("views_day =", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayNotEqualTo(Integer value) {
            addCriterion("views_day <>", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayGreaterThan(Integer value) {
            addCriterion("views_day >", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayGreaterThanOrEqualTo(Integer value) {
            addCriterion("views_day >=", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayLessThan(Integer value) {
            addCriterion("views_day <", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayLessThanOrEqualTo(Integer value) {
            addCriterion("views_day <=", value, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayIn(List<Integer> values) {
            addCriterion("views_day in", values, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayNotIn(List<Integer> values) {
            addCriterion("views_day not in", values, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayBetween(Integer value1, Integer value2) {
            addCriterion("views_day between", value1, value2, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andViewsDayNotBetween(Integer value1, Integer value2) {
            addCriterion("views_day not between", value1, value2, "viewsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayIsNull() {
            addCriterion("comments_day is null");
            return (Criteria) this;
        }

        public Criteria andCommentsDayIsNotNull() {
            addCriterion("comments_day is not null");
            return (Criteria) this;
        }

        public Criteria andCommentsDayEqualTo(Short value) {
            addCriterion("comments_day =", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayNotEqualTo(Short value) {
            addCriterion("comments_day <>", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayGreaterThan(Short value) {
            addCriterion("comments_day >", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayGreaterThanOrEqualTo(Short value) {
            addCriterion("comments_day >=", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayLessThan(Short value) {
            addCriterion("comments_day <", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayLessThanOrEqualTo(Short value) {
            addCriterion("comments_day <=", value, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayIn(List<Short> values) {
            addCriterion("comments_day in", values, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayNotIn(List<Short> values) {
            addCriterion("comments_day not in", values, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayBetween(Short value1, Short value2) {
            addCriterion("comments_day between", value1, value2, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andCommentsDayNotBetween(Short value1, Short value2) {
            addCriterion("comments_day not between", value1, value2, "commentsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayIsNull() {
            addCriterion("downloads_day is null");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayIsNotNull() {
            addCriterion("downloads_day is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayEqualTo(Short value) {
            addCriterion("downloads_day =", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayNotEqualTo(Short value) {
            addCriterion("downloads_day <>", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayGreaterThan(Short value) {
            addCriterion("downloads_day >", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayGreaterThanOrEqualTo(Short value) {
            addCriterion("downloads_day >=", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayLessThan(Short value) {
            addCriterion("downloads_day <", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayLessThanOrEqualTo(Short value) {
            addCriterion("downloads_day <=", value, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayIn(List<Short> values) {
            addCriterion("downloads_day in", values, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayNotIn(List<Short> values) {
            addCriterion("downloads_day not in", values, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayBetween(Short value1, Short value2) {
            addCriterion("downloads_day between", value1, value2, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andDownloadsDayNotBetween(Short value1, Short value2) {
            addCriterion("downloads_day not between", value1, value2, "downloadsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayIsNull() {
            addCriterion("ups_day is null");
            return (Criteria) this;
        }

        public Criteria andUpsDayIsNotNull() {
            addCriterion("ups_day is not null");
            return (Criteria) this;
        }

        public Criteria andUpsDayEqualTo(Short value) {
            addCriterion("ups_day =", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayNotEqualTo(Short value) {
            addCriterion("ups_day <>", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayGreaterThan(Short value) {
            addCriterion("ups_day >", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayGreaterThanOrEqualTo(Short value) {
            addCriterion("ups_day >=", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayLessThan(Short value) {
            addCriterion("ups_day <", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayLessThanOrEqualTo(Short value) {
            addCriterion("ups_day <=", value, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayIn(List<Short> values) {
            addCriterion("ups_day in", values, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayNotIn(List<Short> values) {
            addCriterion("ups_day not in", values, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayBetween(Short value1, Short value2) {
            addCriterion("ups_day between", value1, value2, "upsDay");
            return (Criteria) this;
        }

        public Criteria andUpsDayNotBetween(Short value1, Short value2) {
            addCriterion("ups_day not between", value1, value2, "upsDay");
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