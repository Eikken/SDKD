package com.sdkd.common;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Criterion {
	public static enum CriterionType {
		EQUAL, LIKE, COMPARE, NOT_LIKE
	}

	public static enum CompareType {
		GT, GTE, LT, LTE, EQ, NE
	}
	
	private CriterionType criterionType;
	private String tableName;
	private String field;
	private Object value;
	private String groupOp;

	public static String convertToSql(List<Criterion> criteria) {
		String criteriaString = "";
		StringBuilder sb = new StringBuilder();
		String andor = criteria.get(0).getGroupOp();
		for (Criterion criterion : criteria) {
			String prefix = criterion.getFieldPrefix();
			switch (criterion.getCriterionType()) {
			case EQUAL:
				sb.append(prefix + criterion.getField() + "=? " + andor + " ");
				break;
			case LIKE:
				sb.append(prefix + criterion.getField() + " like ? " + andor + " ");
				break;

			case NOT_LIKE:
				sb.append(prefix + criterion.getField() + " not like ? " + andor + " ");
				break;
			case COMPARE:
				CompareType compareType = ((CompareCriterion) criterion).getCompareType();
				switch (compareType) {
				case EQ:
					sb.append(prefix + criterion.getField() + "=? " + andor + " ");
					break;
				case NE:
					sb.append(prefix + criterion.getField() + "<>? " + andor + " ");
					break;
				case GT:
					sb.append(prefix + criterion.getField() + ">? " + andor + " ");
					break;
				case GTE:
					sb.append(prefix + criterion.getField() + ">=? " + andor + " ");
					break;
				case LT:
					sb.append(prefix + criterion.getField() + "<? " + andor + " ");
					break;
				case LTE:
					sb.append(prefix + criterion.getField() + "<=? " + andor + " ");
					break;
				}
				break;
			}
		}
		int i = -1;
		if ((i = sb.lastIndexOf(" AND ")) != -1 || (i = sb.lastIndexOf(" OR ")) != -1) {
			criteriaString = sb.substring(0, i);
		}
		return criteriaString;
	}

	public static List<Object> getCriteriaValues(List<Criterion> criteria) {
		List<Object> criteriaValues = criteria.isEmpty() ? Collections.emptyList() : new ArrayList<Object>();
		for (Criterion criterion : criteria) {
			criteriaValues.add(criterion.getValue());
		}
		return criteriaValues;
	}

	public CriterionType getCriterionType() {
		return criterionType;
	}

	public void setCriterionType(CriterionType criterionType) {
		this.criterionType = criterionType;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getGroupOp() {
		return groupOp;
	}

	public void setGroupOp(String groupOp) {
		this.groupOp = groupOp;
	}

	public static Criterion getCompareCriterion(CompareType compareType,
			String field, Object value, String tableName,String groupOp) {
		CompareCriterion compareCriterion = new CompareCriterion();
		compareCriterion.setCriterionType(CriterionType.COMPARE);
		compareCriterion.setCompareType(compareType);
		compareCriterion.setField(field);
		compareCriterion.setValue(value);
		compareCriterion.setTableName(tableName);
		compareCriterion.setGroupOp(groupOp);
		return compareCriterion;
	}

	public static Criterion getLikeCriterion(String field, Object value,
			String tableName,String groupOp) {
		LikeCriterion likeCriterion = new LikeCriterion();
		likeCriterion.setCriterionType(CriterionType.LIKE);
		likeCriterion.setField(field);
		likeCriterion.setValue(value);
		likeCriterion.setTableName(tableName);
		likeCriterion.setGroupOp(groupOp);
		return likeCriterion;
	}

	public static Criterion getNotLikeCriterion(String field, Object value,
			String tableName,String groupOp) {
		NotLikeCriterion notLikeCriterion = new NotLikeCriterion();
		notLikeCriterion.setCriterionType(CriterionType.NOT_LIKE);
		notLikeCriterion.setField(field);
		notLikeCriterion.setValue(value);
		notLikeCriterion.setTableName(tableName);
		notLikeCriterion.setGroupOp(groupOp);
		return notLikeCriterion;
	}

	public static Criterion getEqualCriterion(String field, Object value, String tableName,String groupOp) {
		EqualCriterion equalCriterion = new EqualCriterion();
		equalCriterion.setCriterionType(CriterionType.EQUAL);
		equalCriterion.setField(field);
		equalCriterion.setValue(value);
		equalCriterion.setTableName(tableName);
		equalCriterion.setGroupOp(groupOp);
		return equalCriterion;
	}

	public static class LikeCriterion extends Criterion {
	}

	public static class NotLikeCriterion extends Criterion {
	}

	public static class EqualCriterion extends Criterion {
	}

	public static class CompareCriterion extends Criterion {
		private CompareType compareType;

		public CompareType getCompareType() {
			return compareType;
		}

		public void setCompareType(CompareType compareType) {
			this.compareType = compareType;
		}
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getFieldPrefix() {
		return (tableName == null || tableName.length() == 0) ? "" : tableName + ".";
	}
}