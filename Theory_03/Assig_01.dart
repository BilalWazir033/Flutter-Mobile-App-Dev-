
void main() {
  // Collection 
  List<Map<String, dynamic>> students = [
    {'name': 'ALI', 'age': 22, 'address': 'PEHAWAR'},
    {'name': 'IMRAN', 'age': 33, 'address': 'BANNU'},
    {'name': 'SANA', 'age': 21, 'address': 'MARDAN'},
    {'name': 'ZAIN', 'age': 24, 'address': 'SWAT'},
    {'name': 'BILAL', 'age': 23, 'address': 'KOHAT'},
    {'name': 'FARHAN', 'age': 25, 'address': 'KARAK'},
    {'name': 'USMAN', 'age': 22, 'address': 'DIR'},
    {'name': 'HAMZA', 'age': 24, 'address': 'CHITRAL'},
    {'name': 'TARIQ', 'age': 26, 'address': 'BUNER'},
    {'name': 'ZAHID', 'age': 23, 'address': 'NOWSHERA'},
  ];


  print('NAME\tAGE\tADDRESS');

  for (var student in students) {
    print(
      '${student['name']}\t'
      '${student['age']}\t'
      '${student['address']}',
    );
  }
}
