mixin Loggable {
  void logAction(String message) {
    print('Log: $message');
  }
}

class Member {
  final String name;
  final int memberId;

  Member(this.name, this.memberId);
}

class LibraryMember extends Member with Loggable {
  LibraryMember(super.name, super.memberId);

  void borrowBook(String book) {
    logAction('$name is trying to borrow $book');
  }
}

void main() {
  LibraryMember member = LibraryMember('Bilal', 101);

  member.borrowBook('Dart Programming');
}