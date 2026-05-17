package com.advance_programming.model;

/**
 * BookModel - POJO representing a book in the Nepal Reads catalogue.
 */
public class BookModel {

    private int bookId;
    private String title;
    private String author;
    private String isbn;
    private String genre;
    private String description;
    private double price;
    private int stock;
    private String coverImage;
    private String publishedDate;
    private String createdAt;

    // ── Constructors ────────────────────────────────────────────────────────

    public BookModel() {}

    public BookModel(int bookId, String title, String author, String isbn,
                     String genre, String description, double price, int stock,
                     String coverImage, String publishedDate, String createdAt) {
        this.bookId        = bookId;
        this.title         = title;
        this.author        = author;
        this.isbn          = isbn;
        this.genre         = genre;
        this.description   = description;
        this.price         = price;
        this.stock         = stock;
        this.coverImage    = coverImage;
        this.publishedDate = publishedDate;
        this.createdAt     = createdAt;
    }

    // ── Getters & Setters ────────────────────────────────────────────────────

    public int getBookId()               { return bookId; }
    public void setBookId(int bookId)    { this.bookId = bookId; }

    public String getTitle()                 { return title; }
    public void setTitle(String title)       { this.title = title; }

    public String getAuthor()                { return author; }
    public void setAuthor(String author)     { this.author = author; }

    public String getIsbn()                  { return isbn; }
    public void setIsbn(String isbn)         { this.isbn = isbn; }

    public String getGenre()                 { return genre; }
    public void setGenre(String genre)       { this.genre = genre; }

    public String getDescription()                   { return description; }
    public void setDescription(String description)   { this.description = description; }

    public double getPrice()                 { return price; }
    public void setPrice(double price)       { this.price = price; }

    public int getStock()                    { return stock; }
    public void setStock(int stock)          { this.stock = stock; }

    public String getCoverImage()                    { return coverImage; }
    public void setCoverImage(String coverImage)     { this.coverImage = coverImage; }

    public String getPublishedDate()                         { return publishedDate; }
    public void setPublishedDate(String publishedDate)       { this.publishedDate = publishedDate; }

    public String getCreatedAt()                     { return createdAt; }
    public void setCreatedAt(String createdAt)       { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "BookModel{bookId=" + bookId + ", title='" + title
                + "', author='" + author + "', isbn='" + isbn + "'}";
    }
}
