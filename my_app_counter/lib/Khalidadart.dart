class Student {
  final String name;
  final int rollNo;
  final int semester;

  final List<int> _marks = [];

  Student(this.name, this.rollNo, this.semester);

  void introduce() {
    print('$rollNo - $name - Semester $semester');
  }

  void addMark(int mark) {
    if (mark >= 0 && mark <= 100) {
      _marks.add(mark);
    } else {
      print('Invalid mark');
    }
  }

  double get average {
    if (_marks.isEmpty) {
      return 0;
    }

    int total = 0;

    for (int mark in _marks) {
      total += mark;
    }

    return total / _marks.length;
  }
}

class Person {
  final String name;

  Person(this.name);

  String describe() {
    return 'Person: $name';
  }
}

class StudentPerson extends Person {
  final int rollNo;

  StudentPerson(super.name, this.rollNo);

  @override
  String describe() {
    return 'Student: $name, Roll No: $rollNo';
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

mixin Loggable {
  void logAction(String message) {
    print('Log: $message');
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

Future<String> loadRecord() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Library record loaded';
}

void main() async {
  print('--- Student Class ---');

  Student student1 = Student('Khalida', 101, 5);
  Student student2 = Student('Malala', 102, 5);

  student1.introduce();
  student2.introduce();

  print('\n--- Encapsulation ---');

  student1.addMark(85);
  student1.addMark(90);
  student1.addMark(78);

  print('${student1.name} average: ${student1.average}');

  print('\n--- Inheritance ---');

  StudentPerson student3 = StudentPerson('Khalida', 101);
  print(student3.describe());

  print('\n--- Abstraction and Polymorphism ---');

  List<Printable> printableItems = [
    Book('Clean Code', 'Robert Martin'),
    Member('Khalida', 101),
  ];

  for (Printable item in printableItems) {
    print(item.summary());
  }

  print('\n--- Mixin ---');

  LibraryMember libraryMember = LibraryMember('Khalida', 101);
  libraryMember.borrowBook(Book('Dart Programming', 'Dart Team'));

  print('\n--- Async/Await ---');

  print('Loading library record...');

  String result = await loadRecord();

  print(result);

  print('\n--- Library Mini Project ---');

  Library library = Library();

  Book book1 = Book('Clean Code', 'Robert Martin');
  Book book2 = Book('Dart Programming', 'Dart Team');
  Book book3 = Book('Flutter Development', 'Google');

  Member member1 = Member('Khalida', 101);
  Member member2 = Member('Malala', 102);

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.addMember(member1);
  library.addMember(member2);

  print('\nBorrowing Books');

  library.borrowBook(member1, book1);
  library.borrowBook(member2, book1);
  library.borrowBook(member2, book2);

  print('\nReturning Book');

  library.returnBook(member1, book1);

  library.showStatus();
}

