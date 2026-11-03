
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _noteKey = 'private_note';

  Future<void> saveNote(String note) async {
    await _storage.write(
      key: _noteKey,
      value: note,
    );
  }

  Future<String> readNote() async {
    return await _storage.read(key: _noteKey) ?? '';
  }

  Future<void> deleteNote() async {
    await _storage.delete(key: _noteKey);
  }
}
