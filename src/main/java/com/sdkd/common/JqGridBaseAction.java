package com.sdkd.common;

/**
 * @author Young
 * @date 2020/4/30 19:25
 * @see com.sdkd.common
 */

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.aop.TargetSource;
import org.springframework.aop.framework.Advised;
import org.springframework.aop.target.SingletonTargetSource;
import org.springframework.web.context.ContextLoader;

import com.sdkd.common.Criterion.CompareType;
public class JqGridBaseAction<T> {
    private static final long serialVersionUID = -6665165581107324487L;

    protected List<T> results = Collections.emptyList();
    protected String sql = null;
    protected List<?> values = null;
    protected int from = 0;
    protected Object target =null;
    protected int length;
    protected int resSize;
    public Object getTargetClass(String beanName){
        target = ContextLoader.getCurrentWebApplicationContext().getBean(beanName);
        if(target instanceof Advised){//���� @Transactionalע���ʵ������Ҫ�����ַ�ʽȡ����Ӧ����
            Advised advised = (Advised) target;
            SingletonTargetSource singTarget = null;
            TargetSource ts = advised.getTargetSource();
            if(ts instanceof SingletonTargetSource){
                singTarget = (SingletonTargetSource) ts;
                target = singTarget.getTarget();
            }
        }
        return target;
    }
    @SuppressWarnings("unchecked")
    public void refreshGridModel(Page page,Class<?> currentClass) {
        try {
            //�������
            System.out.println("***********************************�������*****************************");
            Page.getOrderColumn = page.getSidx();
            Page.getOrderRule = page.getSord();

            List<Criterion> criteriaList = new ArrayList<Criterion>();
            // (3)���searchֵΪtrue��������ǲ�ѯ����
            if (page.getSearch()) {
                criteriaList = new ArrayList<Criterion>();
                // (2)��Filterת��ΪCriterion�б��������ܵ�Criterion�б�
                if(page.getFilters() != null && page.getFilters().length()>0) {
                    criteriaList.addAll(this.generateSearchCriteriaFromFilters(page.getFilters()));
                }
                // (3)��searchField��searchString��searchOperת��ΪCriterion���������ܵ�Criterion�б�
                Criterion criterion = this.generateSearchCriterion(page.getSearchField(), page.getSearchString(), page.getSearchOper(),page.getGroupOp());
                if(criterion != null) {
                    criteriaList.add(criterion);
                }
            }

            String className = currentClass.getSimpleName();
            System.out.println("currentClass: " + className);
            String temp = className.substring(0,1);
            String beanName = className.replaceFirst(temp, temp.toLowerCase());
            Object target = getTargetClass(beanName);
            Method getResultSize = currentClass.getMethod("getResultSize", new Class[]{String.class,List.class});
            Method listResults = currentClass.getMethod("listResults", new Class[]{String.class,List.class,Integer.class,Integer.class, String.class, String.class});


            if(page.getPageSize() > 0){
                from = page.getRows() * ( page.getPageSize() - 1);
            }
            length = page.getRows();

            if (criteriaList.size() != 0) {
                sql = Criterion.convertToSql(criteriaList);
                values = Criterion.getCriteriaValues(criteriaList);
            }
            resSize = (Integer)getResultSize.invoke(target,sql,values);
            page.setRecords(resSize);
            if (page.getRows().intValue()==-1) {
                System.out.println("if_orderColumn: " + Page.getOrderColumn + " Rule: " + Page.getOrderRule);
                results = (List<T>)listResults.invoke(target,sql,values,from, page.getRecords(), Page.getOrderColumn, Page.getOrderRule);
                page.setTotal(1);
            }else{
                System.out.println("else_orderColumn: " + Page.getOrderColumn + " Rule: " + Page.getOrderRule);
                results = (List<T>)listResults.invoke(target,sql,values,from, length, Page.getOrderColumn, Page.getOrderRule);
                page.setTotal((int) Math.ceil((double) page.getRecords() / (double) page.getRows())) ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // (6)ͨ��searchField��searchString��searchOper������������Criterion�ķ���
    public Criterion generateSearchCriterion(String searchField, String searchString, String searchOper, String groupOp) {
        Criterion criterion = null;
        // (7)���searchField��searchString��searchOper����Ϊnull����searchString��Ϊ���ַ���ʱ���򴴽�Criterion
        if (searchField != null && searchString != null & searchString.length() > 0 && searchOper != null) {
            if ("eq".equals(searchOper)) {
                criterion = Criterion.getEqualCriterion(searchField,searchString, null,groupOp);
            } else if ("ne".equals(searchOper)) {
                criterion = Criterion.getCompareCriterion(CompareType.NE,searchField, searchString, null,groupOp);
            } else if ("lt".equals(searchOper)) {
                criterion = Criterion.getCompareCriterion(CompareType.LT,searchField, searchString, null,groupOp);
            } else if ("le".equals(searchOper)) {
                criterion = Criterion.getCompareCriterion(CompareType.LTE,searchField, searchString, null,groupOp);
            } else if ("gt".equals(searchOper)) {
                criterion = Criterion.getCompareCriterion(CompareType.GT,searchField, searchString, null,groupOp);
            } else if ("ge".equals(searchOper)) {
                criterion = Criterion.getCompareCriterion(CompareType.GTE,searchField, searchString, null,groupOp);
            } else if ("bw".equals(searchOper)) {
                criterion = Criterion.getLikeCriterion(searchField,searchString + "%", null,groupOp);
            } else if ("bn".equals(searchOper)) {
                criterion = Criterion.getNotLikeCriterion(searchField,searchString + "%", null,groupOp);
            } else if ("ew".equals(searchOper)) {
                criterion = Criterion.getLikeCriterion(searchField, "%"+ searchString, null,groupOp);
            } else if ("en".equals(searchOper)) {
                criterion = Criterion.getNotLikeCriterion(searchField, "%"+ searchString, null,groupOp);
            } else if ("cn".equals(searchOper)) {
                criterion = Criterion.getLikeCriterion(searchField, "%"+ searchString + "%", null,groupOp);
            } else if ("nc".equals(searchOper)) {
                criterion = Criterion.getNotLikeCriterion(searchField, "%"+ searchString + "%", null,groupOp);
            }
        }
        return criterion;
    }

    public List<Criterion> generateSearchCriteriaFromFilters(String filters) {
        List<Criterion> criteria = new ArrayList<Criterion>();
        JSONObject jsonObject = JSONObject.fromObject(filters);
        String groupOp = jsonObject.getString("groupOp");
        JSONArray rules = jsonObject.getJSONArray("rules");
        for (Object obj : rules) {
            JSONObject rule = (JSONObject) obj;
            String field = rule.getString("field");
            String op = rule.getString("op");
            String data = rule.getString("data");
            Criterion criterion = this.generateSearchCriterion(field, data, op,groupOp);
            if (criterion != null) {
                criteria.add(criterion);
            }
        }
        return criteria;
    }

}
