class Book {

  private String title;
  private String author;
  private int published;
  private boolean isAvailable = true;


  public void addBooksToList() {

    Book book1 = new Book("The housemaid", "Freida Mcfadden", 2022);
    Book book2 = new Book("To kill a mockingbird", "Harper Lee", 1960);
    Book book3 = new Book("The Silent Patient", "Alex Michaelides", 2019);
    Book book4 = new Book("TVerity", "Colleen Hoover", 2018);


    bookList.add(book1);
    bookList.add(book2);
    bookList.add(book3);
    bookList.add(book4);
  }

  public Book() {
  }

  public Book(String title, String author, int published) {
    this.title = title;
    this.author = author;
    this.published = published;
  }


  public void borrowBook() {
    fill(0);
    textSize(40);
    text("Borrow or Return Books", 100, 100);
    drawBorrowAndReturnButtons();
  }


  // Display each book and draw buttons with a numerical label
  public void drawBorrowAndReturnButtons() {
    int x = 100;
    int y = 180;

    for (int i = 0; i < bookList.size(); i++) {
      // Display the book
      bookList.get(i).display(x, y);

      // Draw the borrow button next to each book
      fill(0, 102, 204);
      rect(x + 500, y, 100, 50); 
      fill(255);
      textSize(20);
      text("Borrow", x + 520, y + 30);
      
      // Draw the "Return" button next to each borrow button
      fill(204, 102, 0);
      rect(x + 620, y, 100, 50); 
      fill(255);
      text("Return", x + 640, y + 30);

      // Increment Y position for the next book and button
      y += 180;
    }
  }
  






    public void loopThroughBooks() {

      int x = 100;  // X position to start drawing the text
      int y = 180;  // Y position to start drawing the text

      //Displaying our booklist for our user
      for (int i = 0; i < bookList.size(); i++) {
        bookList.get(i).display(x, y);
        y += 180;
       
      }
    }
    void display(int x, int y) {
      textSize(30);
      fill(0);
      text("Title: " + title, x, y);
      text("Author: " + author, x, y + 40);
      text("Year: " + published, x, y + 75);
      text("Available: " + (isAvailable ? "Yes" : "No"), x, y + 110);
      // Draw a separator line
      line(x, y + 120, x + 500, y + 120);
    }



    public String toString() {

      return "Title: " + this.title + " by " +this.author + " published in" + this.published;
    }

    public void drawsBorrowButtons() {

      fill(0, 102, 204);
      rect(100, 900, 300, 80); // Draw the button

      //The text on the button
      fill(255);
      textSize(28);
      text("Borrow/Return Books", 120, 950);
    }
    

  }
