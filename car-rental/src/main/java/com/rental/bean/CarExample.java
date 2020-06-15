package com.rental.bean;

import java.util.ArrayList;
import java.util.List;

public class CarExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CarExample() {
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

        public Criteria andCidIsNull() {
            addCriterion("cid is null");
            return (Criteria) this;
        }

        public Criteria andCidIsNotNull() {
            addCriterion("cid is not null");
            return (Criteria) this;
        }

        public Criteria andCidEqualTo(Integer value) {
            addCriterion("cid =", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotEqualTo(Integer value) {
            addCriterion("cid <>", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThan(Integer value) {
            addCriterion("cid >", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThanOrEqualTo(Integer value) {
            addCriterion("cid >=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThan(Integer value) {
            addCriterion("cid <", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThanOrEqualTo(Integer value) {
            addCriterion("cid <=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidIn(List<Integer> values) {
            addCriterion("cid in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotIn(List<Integer> values) {
            addCriterion("cid not in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidBetween(Integer value1, Integer value2) {
            addCriterion("cid between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotBetween(Integer value1, Integer value2) {
            addCriterion("cid not between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCnameIsNull() {
            addCriterion("cname is null");
            return (Criteria) this;
        }

        public Criteria andCnameIsNotNull() {
            addCriterion("cname is not null");
            return (Criteria) this;
        }

        public Criteria andCnameEqualTo(String value) {
            addCriterion("cname =", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameNotEqualTo(String value) {
            addCriterion("cname <>", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameGreaterThan(String value) {
            addCriterion("cname >", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameGreaterThanOrEqualTo(String value) {
            addCriterion("cname >=", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameLessThan(String value) {
            addCriterion("cname <", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameLessThanOrEqualTo(String value) {
            addCriterion("cname <=", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameLike(String value) {
            addCriterion("cname like", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameNotLike(String value) {
            addCriterion("cname not like", value, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameIn(List<String> values) {
            addCriterion("cname in", values, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameNotIn(List<String> values) {
            addCriterion("cname not in", values, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameBetween(String value1, String value2) {
            addCriterion("cname between", value1, value2, "cname");
            return (Criteria) this;
        }

        public Criteria andCnameNotBetween(String value1, String value2) {
            addCriterion("cname not between", value1, value2, "cname");
            return (Criteria) this;
        }

        public Criteria andCrideIsNull() {
            addCriterion("cride is null");
            return (Criteria) this;
        }

        public Criteria andCrideIsNotNull() {
            addCriterion("cride is not null");
            return (Criteria) this;
        }

        public Criteria andCrideEqualTo(Integer value) {
            addCriterion("cride =", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideNotEqualTo(Integer value) {
            addCriterion("cride <>", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideGreaterThan(Integer value) {
            addCriterion("cride >", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideGreaterThanOrEqualTo(Integer value) {
            addCriterion("cride >=", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideLessThan(Integer value) {
            addCriterion("cride <", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideLessThanOrEqualTo(Integer value) {
            addCriterion("cride <=", value, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideIn(List<Integer> values) {
            addCriterion("cride in", values, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideNotIn(List<Integer> values) {
            addCriterion("cride not in", values, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideBetween(Integer value1, Integer value2) {
            addCriterion("cride between", value1, value2, "cride");
            return (Criteria) this;
        }

        public Criteria andCrideNotBetween(Integer value1, Integer value2) {
            addCriterion("cride not between", value1, value2, "cride");
            return (Criteria) this;
        }

        public Criteria andDayrIsNull() {
            addCriterion("dayr is null");
            return (Criteria) this;
        }

        public Criteria andDayrIsNotNull() {
            addCriterion("dayr is not null");
            return (Criteria) this;
        }

        public Criteria andDayrEqualTo(Integer value) {
            addCriterion("dayr =", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrNotEqualTo(Integer value) {
            addCriterion("dayr <>", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrGreaterThan(Integer value) {
            addCriterion("dayr >", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrGreaterThanOrEqualTo(Integer value) {
            addCriterion("dayr >=", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrLessThan(Integer value) {
            addCriterion("dayr <", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrLessThanOrEqualTo(Integer value) {
            addCriterion("dayr <=", value, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrIn(List<Integer> values) {
            addCriterion("dayr in", values, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrNotIn(List<Integer> values) {
            addCriterion("dayr not in", values, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrBetween(Integer value1, Integer value2) {
            addCriterion("dayr between", value1, value2, "dayr");
            return (Criteria) this;
        }

        public Criteria andDayrNotBetween(Integer value1, Integer value2) {
            addCriterion("dayr not between", value1, value2, "dayr");
            return (Criteria) this;
        }

        public Criteria andImgaddIsNull() {
            addCriterion("imgadd is null");
            return (Criteria) this;
        }

        public Criteria andImgaddIsNotNull() {
            addCriterion("imgadd is not null");
            return (Criteria) this;
        }

        public Criteria andImgaddEqualTo(String value) {
            addCriterion("imgadd =", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddNotEqualTo(String value) {
            addCriterion("imgadd <>", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddGreaterThan(String value) {
            addCriterion("imgadd >", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddGreaterThanOrEqualTo(String value) {
            addCriterion("imgadd >=", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddLessThan(String value) {
            addCriterion("imgadd <", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddLessThanOrEqualTo(String value) {
            addCriterion("imgadd <=", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddLike(String value) {
            addCriterion("imgadd like", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddNotLike(String value) {
            addCriterion("imgadd not like", value, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddIn(List<String> values) {
            addCriterion("imgadd in", values, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddNotIn(List<String> values) {
            addCriterion("imgadd not in", values, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddBetween(String value1, String value2) {
            addCriterion("imgadd between", value1, value2, "imgadd");
            return (Criteria) this;
        }

        public Criteria andImgaddNotBetween(String value1, String value2) {
            addCriterion("imgadd not between", value1, value2, "imgadd");
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