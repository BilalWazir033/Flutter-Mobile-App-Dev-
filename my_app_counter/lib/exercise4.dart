abstract class Printable {
  String summary();
}

class Book implements Printable {
  final String title;
  final String author;

  Book(this.title, this.author);

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

void main() {
  List<Printable> items = [
    Book('Clean Code', 'Robert Martin'),
    Member('Bilal', 101),
  ];

  for (Printable item in items) {
    print(item.summary());
  }
}