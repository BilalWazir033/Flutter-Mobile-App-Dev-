
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

// Provider model
class CounterModel extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}

// Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 08',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}

// Part B: setState
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 08 - State Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Provider Demo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProviderScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text(
              '$count',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text('Increase Counter'),
            ),

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text('Application Setting'),
              subtitle: Text(
                isActive ? 'Active' : 'Inactive',
              ),
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  count = 0;
                  isActive = false;
                });
              },
              child: const Text('Reset'),
            ),

            const SizedBox(height: 25),

            const Text('Tap the arrow above for Provider Demo'),
          ],
        ),
      ),
    );
  }
}

// Part C: Provider demonstration
class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demonstration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProviderCounter(),
            const SizedBox(height: 15),
            const ProviderSummary(),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().increase();
              },
              child: const Text('Increase'),
            ),

            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().reset();
              },
              child: const Text('Reset Provider'),
            ),
          ],
        ),
      ),
    );
  }
}

// First widget
class ProviderCounter extends StatelessWidget {
  const ProviderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, model, child) {
        return Text(
          'Counter: ${model.count}',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

// Second widget
class ProviderSummary extends StatelessWidget {
  const ProviderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, model, child) {
        return Text(
          'Shared Count: ${model.count}',
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}
