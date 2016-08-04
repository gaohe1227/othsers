package com.doadway.dwcms.core.content.pojo;

import java.util.ArrayList;
import java.util.List;

public class ContentCountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ContentCountExample() {
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

        public Criteria andViewsIsNull() {
            addCriterion("views is null");
            return (Criteria) this;
        }

        public Criteria andViewsIsNotNull() {
            addCriterion("views is not null");
            return (Criteria) this;
        }

        public Criteria andViewsEqualTo(Integer value) {
            addCriterion("views =", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsNotEqualTo(Integer value) {
            addCriterion("views <>", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsGreaterThan(Integer value) {
            addCriterion("views >", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsGreaterThanOrEqualTo(Integer value) {
            addCriterion("views >=", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsLessThan(Integer value) {
            addCriterion("views <", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsLessThanOrEqualTo(Integer value) {
            addCriterion("views <=", value, "views");
            return (Criteria) this;
        }

        public Criteria andViewsIn(List<Integer> values) {
            addCriterion("views in", values, "views");
            return (Criteria) this;
        }

        public Criteria andViewsNotIn(List<Integer> values) {
            addCriterion("views not in", values, "views");
            return (Criteria) this;
        }

        public Criteria andViewsBetween(Integer value1, Integer value2) {
            addCriterion("views between", value1, value2, "views");
            return (Criteria) this;
        }

        public Criteria andViewsNotBetween(Integer value1, Integer value2) {
            addCriterion("views not between", value1, value2, "views");
            return (Criteria) this;
        }

        public Criteria andViewsMonthIsNull() {
            addCriterion("views_month is null");
            return (Criteria) this;
        }

        public Criteria andViewsMonthIsNotNull() {
            addCriterion("views_month is not null");
            return (Criteria) this;
        }

        public Criteria andViewsMonthEqualTo(Integer value) {
            addCriterion("views_month =", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthNotEqualTo(Integer value) {
            addCriterion("views_month <>", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthGreaterThan(Integer value) {
            addCriterion("views_month >", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthGreaterThanOrEqualTo(Integer value) {
            addCriterion("views_month >=", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthLessThan(Integer value) {
            addCriterion("views_month <", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthLessThanOrEqualTo(Integer value) {
            addCriterion("views_month <=", value, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthIn(List<Integer> values) {
            addCriterion("views_month in", values, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthNotIn(List<Integer> values) {
            addCriterion("views_month not in", values, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthBetween(Integer value1, Integer value2) {
            addCriterion("views_month between", value1, value2, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsMonthNotBetween(Integer value1, Integer value2) {
            addCriterion("views_month not between", value1, value2, "viewsMonth");
            return (Criteria) this;
        }

        public Criteria andViewsWeekIsNull() {
            addCriterion("views_week is null");
            return (Criteria) this;
        }

        public Criteria andViewsWeekIsNotNull() {
            addCriterion("views_week is not null");
            return (Criteria) this;
        }

        public Criteria andViewsWeekEqualTo(Integer value) {
            addCriterion("views_week =", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekNotEqualTo(Integer value) {
            addCriterion("views_week <>", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekGreaterThan(Integer value) {
            addCriterion("views_week >", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekGreaterThanOrEqualTo(Integer value) {
            addCriterion("views_week >=", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekLessThan(Integer value) {
            addCriterion("views_week <", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekLessThanOrEqualTo(Integer value) {
            addCriterion("views_week <=", value, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekIn(List<Integer> values) {
            addCriterion("views_week in", values, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekNotIn(List<Integer> values) {
            addCriterion("views_week not in", values, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekBetween(Integer value1, Integer value2) {
            addCriterion("views_week between", value1, value2, "viewsWeek");
            return (Criteria) this;
        }

        public Criteria andViewsWeekNotBetween(Integer value1, Integer value2) {
            addCriterion("views_week not between", value1, value2, "viewsWeek");
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

        public Criteria andCommentsIsNull() {
            addCriterion("comments is null");
            return (Criteria) this;
        }

        public Criteria andCommentsIsNotNull() {
            addCriterion("comments is not null");
            return (Criteria) this;
        }

        public Criteria andCommentsEqualTo(Integer value) {
            addCriterion("comments =", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsNotEqualTo(Integer value) {
            addCriterion("comments <>", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsGreaterThan(Integer value) {
            addCriterion("comments >", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsGreaterThanOrEqualTo(Integer value) {
            addCriterion("comments >=", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsLessThan(Integer value) {
            addCriterion("comments <", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsLessThanOrEqualTo(Integer value) {
            addCriterion("comments <=", value, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsIn(List<Integer> values) {
            addCriterion("comments in", values, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsNotIn(List<Integer> values) {
            addCriterion("comments not in", values, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsBetween(Integer value1, Integer value2) {
            addCriterion("comments between", value1, value2, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsNotBetween(Integer value1, Integer value2) {
            addCriterion("comments not between", value1, value2, "comments");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthIsNull() {
            addCriterion("comments_month is null");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthIsNotNull() {
            addCriterion("comments_month is not null");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthEqualTo(Integer value) {
            addCriterion("comments_month =", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthNotEqualTo(Integer value) {
            addCriterion("comments_month <>", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthGreaterThan(Integer value) {
            addCriterion("comments_month >", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthGreaterThanOrEqualTo(Integer value) {
            addCriterion("comments_month >=", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthLessThan(Integer value) {
            addCriterion("comments_month <", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthLessThanOrEqualTo(Integer value) {
            addCriterion("comments_month <=", value, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthIn(List<Integer> values) {
            addCriterion("comments_month in", values, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthNotIn(List<Integer> values) {
            addCriterion("comments_month not in", values, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthBetween(Integer value1, Integer value2) {
            addCriterion("comments_month between", value1, value2, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsMonthNotBetween(Integer value1, Integer value2) {
            addCriterion("comments_month not between", value1, value2, "commentsMonth");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekIsNull() {
            addCriterion("comments_week is null");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekIsNotNull() {
            addCriterion("comments_week is not null");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekEqualTo(Short value) {
            addCriterion("comments_week =", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekNotEqualTo(Short value) {
            addCriterion("comments_week <>", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekGreaterThan(Short value) {
            addCriterion("comments_week >", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekGreaterThanOrEqualTo(Short value) {
            addCriterion("comments_week >=", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekLessThan(Short value) {
            addCriterion("comments_week <", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekLessThanOrEqualTo(Short value) {
            addCriterion("comments_week <=", value, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekIn(List<Short> values) {
            addCriterion("comments_week in", values, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekNotIn(List<Short> values) {
            addCriterion("comments_week not in", values, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekBetween(Short value1, Short value2) {
            addCriterion("comments_week between", value1, value2, "commentsWeek");
            return (Criteria) this;
        }

        public Criteria andCommentsWeekNotBetween(Short value1, Short value2) {
            addCriterion("comments_week not between", value1, value2, "commentsWeek");
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

        public Criteria andDownloadsIsNull() {
            addCriterion("downloads is null");
            return (Criteria) this;
        }

        public Criteria andDownloadsIsNotNull() {
            addCriterion("downloads is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadsEqualTo(Integer value) {
            addCriterion("downloads =", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsNotEqualTo(Integer value) {
            addCriterion("downloads <>", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsGreaterThan(Integer value) {
            addCriterion("downloads >", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsGreaterThanOrEqualTo(Integer value) {
            addCriterion("downloads >=", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsLessThan(Integer value) {
            addCriterion("downloads <", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsLessThanOrEqualTo(Integer value) {
            addCriterion("downloads <=", value, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsIn(List<Integer> values) {
            addCriterion("downloads in", values, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsNotIn(List<Integer> values) {
            addCriterion("downloads not in", values, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsBetween(Integer value1, Integer value2) {
            addCriterion("downloads between", value1, value2, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsNotBetween(Integer value1, Integer value2) {
            addCriterion("downloads not between", value1, value2, "downloads");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthIsNull() {
            addCriterion("downloads_month is null");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthIsNotNull() {
            addCriterion("downloads_month is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthEqualTo(Integer value) {
            addCriterion("downloads_month =", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthNotEqualTo(Integer value) {
            addCriterion("downloads_month <>", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthGreaterThan(Integer value) {
            addCriterion("downloads_month >", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthGreaterThanOrEqualTo(Integer value) {
            addCriterion("downloads_month >=", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthLessThan(Integer value) {
            addCriterion("downloads_month <", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthLessThanOrEqualTo(Integer value) {
            addCriterion("downloads_month <=", value, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthIn(List<Integer> values) {
            addCriterion("downloads_month in", values, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthNotIn(List<Integer> values) {
            addCriterion("downloads_month not in", values, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthBetween(Integer value1, Integer value2) {
            addCriterion("downloads_month between", value1, value2, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsMonthNotBetween(Integer value1, Integer value2) {
            addCriterion("downloads_month not between", value1, value2, "downloadsMonth");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekIsNull() {
            addCriterion("downloads_week is null");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekIsNotNull() {
            addCriterion("downloads_week is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekEqualTo(Short value) {
            addCriterion("downloads_week =", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekNotEqualTo(Short value) {
            addCriterion("downloads_week <>", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekGreaterThan(Short value) {
            addCriterion("downloads_week >", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekGreaterThanOrEqualTo(Short value) {
            addCriterion("downloads_week >=", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekLessThan(Short value) {
            addCriterion("downloads_week <", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekLessThanOrEqualTo(Short value) {
            addCriterion("downloads_week <=", value, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekIn(List<Short> values) {
            addCriterion("downloads_week in", values, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekNotIn(List<Short> values) {
            addCriterion("downloads_week not in", values, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekBetween(Short value1, Short value2) {
            addCriterion("downloads_week between", value1, value2, "downloadsWeek");
            return (Criteria) this;
        }

        public Criteria andDownloadsWeekNotBetween(Short value1, Short value2) {
            addCriterion("downloads_week not between", value1, value2, "downloadsWeek");
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

        public Criteria andUpsIsNull() {
            addCriterion("ups is null");
            return (Criteria) this;
        }

        public Criteria andUpsIsNotNull() {
            addCriterion("ups is not null");
            return (Criteria) this;
        }

        public Criteria andUpsEqualTo(Integer value) {
            addCriterion("ups =", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsNotEqualTo(Integer value) {
            addCriterion("ups <>", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsGreaterThan(Integer value) {
            addCriterion("ups >", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsGreaterThanOrEqualTo(Integer value) {
            addCriterion("ups >=", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsLessThan(Integer value) {
            addCriterion("ups <", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsLessThanOrEqualTo(Integer value) {
            addCriterion("ups <=", value, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsIn(List<Integer> values) {
            addCriterion("ups in", values, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsNotIn(List<Integer> values) {
            addCriterion("ups not in", values, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsBetween(Integer value1, Integer value2) {
            addCriterion("ups between", value1, value2, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsNotBetween(Integer value1, Integer value2) {
            addCriterion("ups not between", value1, value2, "ups");
            return (Criteria) this;
        }

        public Criteria andUpsMonthIsNull() {
            addCriterion("ups_month is null");
            return (Criteria) this;
        }

        public Criteria andUpsMonthIsNotNull() {
            addCriterion("ups_month is not null");
            return (Criteria) this;
        }

        public Criteria andUpsMonthEqualTo(Integer value) {
            addCriterion("ups_month =", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthNotEqualTo(Integer value) {
            addCriterion("ups_month <>", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthGreaterThan(Integer value) {
            addCriterion("ups_month >", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthGreaterThanOrEqualTo(Integer value) {
            addCriterion("ups_month >=", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthLessThan(Integer value) {
            addCriterion("ups_month <", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthLessThanOrEqualTo(Integer value) {
            addCriterion("ups_month <=", value, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthIn(List<Integer> values) {
            addCriterion("ups_month in", values, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthNotIn(List<Integer> values) {
            addCriterion("ups_month not in", values, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthBetween(Integer value1, Integer value2) {
            addCriterion("ups_month between", value1, value2, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsMonthNotBetween(Integer value1, Integer value2) {
            addCriterion("ups_month not between", value1, value2, "upsMonth");
            return (Criteria) this;
        }

        public Criteria andUpsWeekIsNull() {
            addCriterion("ups_week is null");
            return (Criteria) this;
        }

        public Criteria andUpsWeekIsNotNull() {
            addCriterion("ups_week is not null");
            return (Criteria) this;
        }

        public Criteria andUpsWeekEqualTo(Short value) {
            addCriterion("ups_week =", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekNotEqualTo(Short value) {
            addCriterion("ups_week <>", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekGreaterThan(Short value) {
            addCriterion("ups_week >", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekGreaterThanOrEqualTo(Short value) {
            addCriterion("ups_week >=", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekLessThan(Short value) {
            addCriterion("ups_week <", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekLessThanOrEqualTo(Short value) {
            addCriterion("ups_week <=", value, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekIn(List<Short> values) {
            addCriterion("ups_week in", values, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekNotIn(List<Short> values) {
            addCriterion("ups_week not in", values, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekBetween(Short value1, Short value2) {
            addCriterion("ups_week between", value1, value2, "upsWeek");
            return (Criteria) this;
        }

        public Criteria andUpsWeekNotBetween(Short value1, Short value2) {
            addCriterion("ups_week not between", value1, value2, "upsWeek");
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

        public Criteria andDownsIsNull() {
            addCriterion("downs is null");
            return (Criteria) this;
        }

        public Criteria andDownsIsNotNull() {
            addCriterion("downs is not null");
            return (Criteria) this;
        }

        public Criteria andDownsEqualTo(Integer value) {
            addCriterion("downs =", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsNotEqualTo(Integer value) {
            addCriterion("downs <>", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsGreaterThan(Integer value) {
            addCriterion("downs >", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsGreaterThanOrEqualTo(Integer value) {
            addCriterion("downs >=", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsLessThan(Integer value) {
            addCriterion("downs <", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsLessThanOrEqualTo(Integer value) {
            addCriterion("downs <=", value, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsIn(List<Integer> values) {
            addCriterion("downs in", values, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsNotIn(List<Integer> values) {
            addCriterion("downs not in", values, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsBetween(Integer value1, Integer value2) {
            addCriterion("downs between", value1, value2, "downs");
            return (Criteria) this;
        }

        public Criteria andDownsNotBetween(Integer value1, Integer value2) {
            addCriterion("downs not between", value1, value2, "downs");
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