
import 'package:flutter/material.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.school),
          ),
        ],
      ),

      // The screen scrolls when its content is taller
      // than the available screen height.
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Part 1: Student profile header
              const StudentHeader(),

              const SizedBox(height: 24),

              // Part 2: Summary cards
              Text(
                'Academic Overview',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.menu_book,
                      label: 'Courses',
                      value: '06',
                      color: Color(0xFFE7EEFF),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.assignment_turned_in,
                      label: 'Completed',
                      value: '04',
                      color: Color(0xFFE4F7EC),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.star_outline,
                      label: 'CGPA',
                      value: '3.85',
                      color: Color(0xFFFFF0D9),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Part 3: About section
              Text(
                'About Me',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 12),

              const AboutCard(),

              const SizedBox(height: 24),

              // Part 4: Courses
              Text(
                'Current Courses',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 12),

              const CourseTile(
                icon: Icons.phone_android,
                title: 'Mobile Application Development',
                subtitle: 'Flutter and Dart',
                color: Color(0xFFE7EEFF),
              ),

              const SizedBox(height: 10),

              const CourseTile(
                icon: Icons.code,
                title: 'Data Structures',
                subtitle: 'Algorithms and problem solving',
                color: Color(0xFFE4F7EC),
              ),

              const SizedBox(height: 10),

              const CourseTile(
                icon: Icons.storage,
                title: 'Database Systems',
                subtitle: 'SQL and database design',
                color: Color(0xFFFFF0D9),
              ),

              const SizedBox(height: 24),

              // Part 5: Two different button types
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'This is a static student profile.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.visibility),
                label: const Text('View Profile'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Student Profile',
                    applicationVersion: '1.0.0',
                    children: const [
                      Text(
                        'A Flutter widget layout lab project.',
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('About App'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable widget 1: Student profile header
class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFFE7EEFF),
              child: Icon(
                Icons.person,
                size: 42,
                color: Color(0xFF2457C5),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hazrat Bilal',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Computer Science Student',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Aspiring SI Engineer',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF2457C5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF2457C5),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text('UET Peshawar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget 2: Academic summary card
class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 14,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF2457C5),
              size: 24,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget 3: About information card
class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello! I am a Computer Science student '
              'at the University of Engineering & '
              'Technology, Peshawar.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 12),

            Text(
              'I am interested in programming,SI, mobile '
              'application development, and learning '
              'new technologies.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget 4: Course information row
class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF2457C5),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 4),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}