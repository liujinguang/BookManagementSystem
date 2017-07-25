package com.runwit.books.model;

public class Title {
	public Title() {
		super();
	}

	public Title(String isbn, String title, int editionNumber, String copyright, int publisherId, String imageFile,
			float price) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.editionNumber = editionNumber;
		this.copyright = copyright;
		this.publisherId = publisherId;
		this.imageFile = imageFile;
		this.price = price;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getEditionNumber() {
		return editionNumber;
	}

	public void setEditionNumber(int editionNumber) {
		this.editionNumber = editionNumber;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	public int getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	public int[] getAuthorIds() {
		return authorIds;
	}

	public void setAuthorIds(int[] authorIds) {
		this.authorIds = authorIds;
	}

	private String isbn;
	private String title;
	private int editionNumber;
	private String copyright;
	private int publisherId;
	private String imageFile;
	private float price;
	private String publisherName;
	private int[] authorIds;
}
