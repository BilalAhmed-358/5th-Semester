

import java.util.List;

public class Karams_Publications {

	/**
	 * 
	 */
	public String Location;
	/**
	 * 
	 */
	public List<Book> book;
	/**
	 * 
	 */
	public String BookType;
	/**
	 * Getter of Location
	 */
	public String getLocation() {
	 	 return Location; 
	}
	/**
	 * Setter of Location
	 */
	public void setLocation(String Location) { 
		 this.Location = Location; 
	}
	/**
	 * Getter of book
	 */
	public List<Book> getBook() {
	 	 return book; 
	}
	/**
	 * Setter of book
	 */
	public void setBook(List<Book> book) { 
		 this.book = book; 
	}
	/**
	 * Getter of BookType
	 */
	public String getBookType() {
	 	 return BookType; 
	}
	/**
	 * Setter of BookType
	 */
	public void setBookType(String BookType) { 
		 this.BookType = BookType; 
	} 

}