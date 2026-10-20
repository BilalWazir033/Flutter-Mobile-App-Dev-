
import 'package:flutter/material.dart';

const Color teal = Color(0xFF00695C);
const Color orange = Color(0xFFF2994A);
const Color cream = Color(0xFFFFF8EF);
const Color ink = Color(0xFF263238);

class Course {
  final String code;
  final String title;
  final String instructor;
  final int creditHours;
  final String description;

  const Course({
    required this.code,
    required this.title,
    required this.instructor,
    required this.creditHours,
    required this.description,
  });
}

const List<Course> courses = [
  Course(
    code: 'CS-321',
    title: 'Data Mining',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Discover patterns in data using mining and analysis techniques.',
  ),
  Course(
    code: 'CS-322',
    title: 'Operating Systems',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Explore processes, memory management, and operating system design.',
  ),
  Course(
    code: 'CS-323',
    title: 'Computer Graphics',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Study visual computing, transformations, and graphics rendering.',
  ),
  Course(
    code: 'CS-324',
    title: 'Information Security',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Learn security principles, threats, and protection techniques.',
  ),
  Course(
    code: 'CS-325',
    title: 'Cloud Computing',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Understand cloud services, virtualization, and distributed systems.',
  ),
  Course(
    code: 'CS-326',
    title: 'Human Computer Interaction',
    instructor: 'Computer Science Faculty',
    creditHours: 3,
    description: 'Learn usability principles and user-centered interface design.',
  ),
];

class CourseCatalogApp extends StatelessWidget {
  const CourseCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Courses',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: teal,
          primary: teal,
          secondary: orange,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: teal,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFECE4D9)),
          ),
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  void showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Campus Courses',
      applicationVersion: '1.0',
      children: const [
        Text('A sample course browsing and registration application.'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => showAbout(context),
            icon: const Icon(Icons.help_outline),
            tooltip: 'About',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 175,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: teal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.account_balance, color: orange, size: 42),
                  SizedBox(height: 10),
                  Text(
                    'Learning Hub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Explore your next subject',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined, color: teal),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: teal),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                showAbout(context);
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.auto_stories, color: orange, size: 34),
                    SizedBox(height: 12),
                    Text(
                      'Build Your Knowledge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Browse subjects and choose your next learning goal.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Course Directory',
                      style: TextStyle(
                        color: ink,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${courses.length} subjects',
                      style: const TextStyle(color: teal),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isWide
                    ? GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 370,
                          mainAxisExtent: 180,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: courses.length,
                        itemBuilder: (context, index) =>
                            CourseTile(course: courses[index]),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: courses.length,
                        itemBuilder: (context, index) =>
                            CourseTile(course: courses[index]),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final Course course;

  const CourseTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => DetailsScreen(course: course),
            ),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 16, 105, 16),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE8D2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      color: teal,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.code,
                          style: const TextStyle(
                            color: teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ink,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course.instructor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE8D2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${course.creditHours} Credit Hours',
                  style: const TextStyle(
                    color: teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 12,
              bottom: 12,
              child: Icon(Icons.arrow_forward_ios, color: orange, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Course course;

  const DetailsScreen({super.key, required this.course});

  Future<void> openRegistration(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(
        builder: (_) => RegistrationScreen(course: course),
      ),
    );

    if (!context.mounted) return;

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
          backgroundColor: teal,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void showActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Choose an Action',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: teal,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.app_registration, color: teal),
                title: const Text('Register for course'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  openRegistration(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.description_outlined, color: orange),
                title: const Text('Read description'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  showDialog<void>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Text(course.title),
                      content: Text(course.description),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Overview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: teal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.school_outlined,
                size: 75,
                color: orange,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              course.code,
              style: const TextStyle(
                color: teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              course.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ink,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DetailRow(
                      icon: Icons.person_outline,
                      label: 'Instructor',
                      value: course.instructor,
                    ),
                    const Divider(height: 24),
                    DetailRow(
                      icon: Icons.schedule,
                      label: 'Credit Hours',
                      value: '${course.creditHours}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'About This Course',
              style: TextStyle(
                color: ink,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              course.description,
              style: const TextStyle(height: 1.6, color: Colors.blueGrey),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () => openRegistration(context),
                icon: const Icon(Icons.how_to_reg),
                label: const Text('Register Now'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: teal,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () => showActions(context),
                icon: const Icon(Icons.more_horiz),
                label: const Text('More Options'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: teal),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: ink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  final Course course;

  const RegistrationScreen({super.key, required this.course});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _rollController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _rollController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.how_to_reg, color: teal, size: 36),
        title: const Text('Confirm Enrollment'),
        content: Text(
          'Register ${_nameController.text.trim()} for '
          '${widget.course.title}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final result =
        'Registration successful: ${_nameController.text.trim()}, '
        'Roll No. ${_rollController.text.trim()}, '
        'Course ${widget.course.code}.';

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Enrollment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE8D2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.assignment_ind_outlined,
                      color: teal,
                      size: 36,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Student Details',
                      style: TextStyle(
                        color: ink,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${widget.course.code} - ${widget.course.title}',
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                'Complete the form below',
                style: TextStyle(
                  color: ink,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter student name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _rollController,
                decoration: const InputDecoration(
                  labelText: 'Roll Number',
                  hintText: 'Enter university roll number',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your roll number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: submitForm,
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Submit Registration'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
