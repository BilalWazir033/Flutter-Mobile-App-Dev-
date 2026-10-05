Future<String> loadRecord() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Library record loaded';
}

void main() async {
  print('Loading library record...');

  String result = await loadRecord();

  print(result);
}