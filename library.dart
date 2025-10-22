class Author {
  final String name;
  const Author(this.name);
}

class Book {
  final String title;
  final Author author;
  bool isAvailable;

  Book (this.title, this.author, [this.isAvailable = true]);

  String get status => isAvailable? 'Available' : 'Borrowed';
}

class Library{
  final List<Book> _books = [];
  void addBook(Book book) => _books.add(book);

  List<Book> FindAvailableBookByAuthor(Author author) {
    return _books.where((book)=>
      book.author == author && book.isAvailable).toList();
  }
}