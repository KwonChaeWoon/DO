package kr.ac.kopo.DO.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 10;
	private float total;
	private int perGroup = 5;

	private int search = 0;
	private String keyword = "";

	private String order;
	private int orderMode; // 0 : DEFAULT, 1 : ASC, 2 : DESC

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getOrderMode() {
		return orderMode;
	}

	public void setOrderMode(int orderMode) {
		this.orderMode = orderMode;
	}

	public int getOffset() {
		return (page - 1) * perPage;
	}

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword.replaceAll(" ", "%");
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public float getTotal() {
		return total;
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();

		int startPage = (page - 1) / perGroup * perGroup + 1;

		for (int index = startPage; index < (startPage + perGroup) && index <= getLast(); index++)
			list.add(index);

		if (list.isEmpty())
			list.add(1);

		return list;
	}

	public int getLast() {
		return (int) Math.ceil(total / perPage);
	}

	public int getPrev() {
		return page <= perPage ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}

	public int getNext() {
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();

		return next < last ? next : last;
	}
	
	public String getQuery() {
		String queryString = "";
		
		queryString += "perPage=" + perPage;
		
		if (search > 0)
			queryString += "&search=" + search + "&keyword=" + keyword;
		
		if(orderMode == 1 || orderMode == 2)
			queryString += "&order=" + order + "&orderMode=" + orderMode;
		
		return queryString;
	}

}