int state = 0; // State variable to keep track of which page is shown
Book book = new Book();
ArrayList<Book> bookList = new ArrayList<Book>();



void setup() {
  size(1000, 1000);
  book.addBooksToList();
  book.display(10, 50);
}


void draw() {
  background(255);

  if (state == 0) {
    showHomePage();  // Show the home page
  } else if (state == 1) {
    showBorrowReturnPage();
  }
}


public void showHomePage() {

  fill(0);
  textSize(40);
  text("Welcome to Alissa's Library system", 100, 100);

  book.loopThroughBooks();
  //Drawing our two buttons
  book.drawsBorrowButtons();
}

//Checking for every button there is a mousepressed method to switch functions in the program
void mousePressed() {
  if (state == 1) {
    for (int i = 0; i < bookList.size(); i++) {
      int buttonX = 600;  // X position of the buttons
      int buttonY = 180 + i * 180;  // Y position of the buttons (spaced out by 180 for each book)
      int returnButtonX = 720;  
      int buttonWidth = 100;
      int buttonHeight = 50;

      // Check if the mouse click is within the button's boundaries
      if (mouseX > buttonX && mouseX < buttonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight) {
        // Borrow the book
        println("You borrowed: " + bookList.get(i).title);
        bookList.get(i).isAvailable = false;
      }
       // Check if the mouse click is within the "Return" button's boundaries
        if (mouseX > returnButtonX && mouseX < returnButtonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight) {
          // Return the book if it is borrowed
          if (!bookList.get(i).isAvailable) {
            println("You returned: " + bookList.get(i).title);
            bookList.get(i).isAvailable = true;  // Marks the book as returned when clicked on button
          } else {
            println("Book is already available: " + bookList.get(i).title);
          }
        }
      }
    }
  

  if (state == 0) {
    if (mouseX > 100 && mouseX < 100 + 180 && mouseY > 900 && mouseY < 900 + 80) {
      state = 1;  // Switch to the borrow/return page
    }
  }
}

public void showBorrowReturnPage() {

  book.borrowBook();
}
