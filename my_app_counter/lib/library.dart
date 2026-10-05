mixin Loggable {
  void logAction(String message) {
    print('Log: $message');
  }
}

abstract class Printable {
  String summary();
}

class Book implements Printable {
  final String title;
  final String author;
  bool _isBorrowed = false;

  Book(this.title, this.author);

  bool get isBorrowed => _isBorrowed;

  void borrow() {
    _isBorrowed = true;
  }

  void returnBook() {
    _isBorrowed = false;
  }

  @override
  String summary() {
    return '$title by $author';
  }
}

class Member implements Printable {
  final String name;
  final int memberId;

  Member(this.name, this.memberId);

  @override
  String summary() {
    return 'Member: $name, ID: $memberId';
  }
}

class LibraryMember extends Member with Loggable {
  LibraryMember(super.name, super.memberId);

  void borrowBook(Book book) {
    logAction('$name is trying to borrow ${book.title}');
  }
}

class Library with Loggable {
  final List<Book> books = [];
  final List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
  }

  void addMember(Member member) {
    members.add(member);
  }

  void borrowBook(Member member, Book book) {
    if (book.isBorrowed) {
      print('${book.title} is already borrowed');
    } else {
      book.borrow();
      print('${member.name} borrowed ${book.title}');
      logAction('Book borrowed');
    }
  }

  void returnBook(Member member, Book book) {
    if (!book.isBorrowed) {
      print('${book.title} is already available');
    } else {
      book.returnBook();
      print('${member.name} returned ${book.title}');
      logAction('Book returned');
    }
  }

  void showStatus() {
    print('\nLibrary Status');

    for (Book book in books) {
      String status = book.isBorrowed ? 'Borrowed' : 'Available';
      print('${book.title} - $status');
    }
  }
}

void main() {
  Library library = Library();

  Book book1 = Book('Clean Code', 'Robert Martin');
  Book book2 = Book('Dart Programming', 'Dart Team');
  Book book3 = Book('Flutter Development', 'Google');

  Member member1 = Member('Bilal', 101);
  Member member2 = Member('Ahmad', 102);

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.addMember(member1);
  library.addMember(member2);

  print('Borrowing Books');

  library.borrowBook(member1, book1);
  library.borrowBook(member2, book1);
  library.borrowBook(member2, book2);

  print('\nReturning Book');

  library.returnBook(member1, book1);

  library.showStatus();
}