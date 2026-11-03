import 'package:flutter/material.dart';
import 'services/secure_storage_service.dart';

class StudentSettings extends StatefulWidget {
  const StudentSettings({super.key});

  @override
  State<StudentSettings> createState() => _StudentSettingsState();
}

class _StudentSettingsState extends State<StudentSettings> {
  final SecureStorageService _storage = SecureStorageService();

  final TextEditingController _noteController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNote();
  }

  Future<void> loadNote() async {
    final note = await _storage.readNote();

    if (!mounted) return;

    setState(() {
      _noteController.text = note;
    });
  }

  Future<void> saveNote() async {
    final note = _noteController.text.trim();

    if (note.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a private note'),
        ),
      );
      return;
    }

    await _storage.saveNote(note);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Private note saved securely!'),
      ),
    );
  }

  Future<void> clearNote() async {
    await _storage.deleteNote();

    if (!mounted) return;

    _noteController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Private note deleted!'),
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.lock,
              size: 70,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'My Private Note',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Enter your private note',
                hintText: 'Write something private...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: saveNote,
              icon: const Icon(Icons.save),
              label: const Text('Save Note'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: clearNote,
              icon: const Icon(Icons.delete),
              label: const Text('Clear Note'),
            ),
          ],
        ),
      ),
    );
  }
}