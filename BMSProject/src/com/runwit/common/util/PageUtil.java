package com.runwit.common.util;

public class PageUtil {
	private int pageSize;
	private int recordCount;
	private int currentPage;

	public PageUtil(int pageSize, int recordCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		setCurrentPage(currentPage);
	}

	public PageUtil(int pageSize, int recordCount) {
		this(pageSize, recordCount, 1);
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		currentPage = currentPage < 1 ? 1 : currentPage;
		currentPage = currentPage > getPageCount() ? getPageCount() : currentPage;

		this.currentPage = currentPage;
	}

	public int getPageCount() {
		int pageCount = recordCount / pageSize;

		if (recordCount % pageSize != 0) {
			pageCount += 1;
		}

		return pageCount;
	}

	public int getNextPage() {
		int nextPage = currentPage + 1;
		if (nextPage > getPageCount()) {
			return getPageCount();
		}

		return nextPage;
	}

	public int getPrevPage() {
		int prePage = currentPage - 1;
		if (prePage < 1) {
			prePage = 1;
		}

		return prePage;
	}

	public int getFromIndex() {
		int fromIndex = (currentPage - 1) * pageSize;

		return fromIndex < 0 ? 0 : fromIndex;
	}

	public int getToIndex() {
		int toIndex = currentPage * pageSize;
		
		return toIndex > recordCount ? recordCount : toIndex;
	}
}
