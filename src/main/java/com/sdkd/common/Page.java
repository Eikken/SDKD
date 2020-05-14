package com.sdkd.common;

public class Page {
	private Integer rows = 0;
	private Integer pageSize = 0;
	private Integer total = 0;
	private Integer records = 0;
	private Integer page = 0;

	private Object data;

	private String sord;
	private String sidx;
	//操作方式，包括增删改查
	private String oper;
	
	// (1)添加和查询有关的成员变量search、searchField、searchString、searchOper
	private boolean search;
	private String searchField;
	private String searchString;
	private String searchOper;
	
	//(1)添加filters成员变量  
    private String filters;  
    //AND OR 操作
    private String groupOp;
    
    private Integer weight = 1;

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
    public static String getOrderColumn;
	public static String getOrderRule;
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	public boolean getSearch() {
		return search;
	}
	public void setSearch(boolean search) {
		this.search = search;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	public String getSearchOper() {
		return searchOper;
	}
	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}
	public String getFilters() {
		return filters;
	}
	public void setFilters(String filters) {
		this.filters = filters;
	}
	public String getGroupOp() {
		return groupOp;
	}
	public void setGroupOp(String groupOp) {
		this.groupOp = groupOp;
	}
	public void setWeight(Integer weight){
		this.weight = weight;
	}

	public Integer getWeight() {
		return weight;
	}
}
