
import 'package:flutter/material.dart';

void main() {
  runApp(const AutoCareApp());
}

const Color primaryGreen = Color(0xFF16A36A);
const Color darkGreen = Color(0xFF172B25);
const Color lightGreen = Color(0xFFEAF7F0);
const Color pageBackground = Color(0xFFF7F9F8);
const Color mutedText = Color(0xFF7C8983);

class AutoCareApp extends StatelessWidget {
  const AutoCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoCare',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: pageBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: pageBackground,
          foregroundColor: darkGreen,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: mutedText),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE8EEEA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE8EEEA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primaryGreen, width: 1.5),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ------------------------------------------------------------
// WELCOME SCREEN
// ------------------------------------------------------------

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.directions_car_rounded,
                      color: primaryGreen,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'AutoCare',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.network(
                  'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=1000',
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 280,
                      color: lightGreen,
                      child: const Icon(
                        Icons.directions_car,
                        size: 100,
                        color: primaryGreen,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Take better care\nof your car.',
                style: TextStyle(
                  fontSize: 36,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Keep track of maintenance, service history, '
                'reminders and everything your car needs.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: mutedText,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddCarScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// ADD CAR SCREEN
// ------------------------------------------------------------

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final TextEditingController plateController = TextEditingController();
  final TextEditingController makeController =
      TextEditingController(text: 'Toyota');
  final TextEditingController modelController =
      TextEditingController(text: 'Corolla');
  final TextEditingController mileageController =
      TextEditingController(text: '45000');

  String selectedYear = '2022';
  String selectedFuel = 'Petrol';

  @override
  void dispose() {
    plateController.dispose();
    makeController.dispose();
    modelController.dispose();
    mileageController.dispose();
    super.dispose();
  }

  Widget formLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: darkGreen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your car'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell us about your car',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We will help you keep everything organized.',
              style: TextStyle(color: mutedText, fontSize: 14),
            ),
            const SizedBox(height: 28),
            formLabel('Registration number'),
            TextField(
              controller: plateController,
              decoration: const InputDecoration(
                hintText: 'e.g. ABC 123',
                prefixIcon: Icon(Icons.confirmation_number_outlined),
              ),
            ),
            const SizedBox(height: 18),
            formLabel('Car make'),
            TextField(
              controller: makeController,
              decoration: const InputDecoration(
                hintText: 'e.g. Toyota',
                prefixIcon: Icon(Icons.directions_car_outlined),
              ),
            ),
            const SizedBox(height: 18),
            formLabel('Car model'),
            TextField(
              controller: modelController,
              decoration: const InputDecoration(
                hintText: 'e.g. Corolla',
                prefixIcon: Icon(Icons.car_rental),
              ),
            ),
            const SizedBox(height: 18),
            formLabel('Manufacturing year'),
            DropdownButtonFormField<String>(
              value: selectedYear,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
              items: List.generate(
                27,
                (index) => DropdownMenuItem(
                  value: (2026 - index).toString(),
                  child: Text((2026 - index).toString()),
                ),
              ),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedYear = value);
                }
              },
            ),
            const SizedBox(height: 18),
            formLabel('Fuel type'),
            DropdownButtonFormField<String>(
              value: selectedFuel,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.local_gas_station_outlined),
              ),
              items: ['Petrol', 'Diesel', 'Hybrid', 'Electric']
                  .map(
                    (fuel) => DropdownMenuItem(
                      value: fuel,
                      child: Text(fuel),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedFuel = value);
                }
              },
            ),
            const SizedBox(height: 18),
            formLabel('Current mileage (km)'),
            TextField(
              controller: mileageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'e.g. 45000',
                prefixIcon: Icon(Icons.speed),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainScreen(
                        carName:
                            '${makeController.text} ${modelController.text}',
                        registration: plateController.text.isEmpty
                            ? 'ABC 123'
                            : plateController.text,
                        mileage: mileageController.text.isEmpty
                            ? '45000'
                            : mileageController.text,
                        year: selectedYear,
                        fuel: selectedFuel,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// SERVICE MODEL
// ------------------------------------------------------------

class ServiceRecord {
  final String title;
  final String date;
  final String garage;
  final String cost;

  ServiceRecord({
    required this.title,
    required this.date,
    required this.garage,
    required this.cost,
  });
}

// ------------------------------------------------------------
// MAIN APP AND BOTTOM NAVIGATION
// ------------------------------------------------------------

class MainScreen extends StatefulWidget {
  final String carName;
  final String registration;
  final String mileage;
  final String year;
  final String fuel;

  const MainScreen({
    super.key,
    required this.carName,
    required this.registration,
    required this.mileage,
    required this.year,
    required this.fuel,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<ServiceRecord> services = [
    ServiceRecord(
      title: 'Engine oil change',
      date: 'Oct 15, 2026',
      garage: 'Premium Auto Care',
      cost: 'Rs. 8,500',
    ),
    ServiceRecord(
      title: 'Tire replacement',
      date: 'Sep 02, 2026',
      garage: 'City Motors',
      cost: 'Rs. 22,000',
    ),
  ];

  Future<void> openAddService() async {
    final result = await Navigator.push<ServiceRecord>(
      context,
      MaterialPageRoute(
        builder: (_) => const AddServiceScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        services.insert(0, result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(
        carName: widget.carName,
        registration: widget.registration,
        mileage: widget.mileage,
        year: widget.year,
        fuel: widget.fuel,
        onAddService: openAddService,
        services: services,
      ),
      MaintenanceScreen(
        services: services,
        onAddService: openAddService,
      ),
      const RemindersScreen(),
      const GarageScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: lightGreen,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.build_outlined),
            label: 'Service',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Reminders',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            label: 'Garages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// DASHBOARD SCREEN
// ------------------------------------------------------------

class DashboardScreen extends StatelessWidget {
  final String carName;
  final String registration;
  final String mileage;
  final String year;
  final String fuel;
  final VoidCallback onAddService;
  final List<ServiceRecord> services;

  const DashboardScreen({
    super.key,
    required this.carName,
    required this.registration,
    required this.mileage,
    required this.year,
    required this.fuel,
    required this.onAddService,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Good morning,',
                        style: TextStyle(color: mutedText, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.035),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'MY VEHICLE',
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            color: mutedText,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=1000',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 160,
                          color: lightGreen,
                          child: const Icon(
                            Icons.directions_car,
                            size: 70,
                            color: primaryGreen,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    carName,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$registration  •  $year  •  $fuel',
                    style: const TextStyle(
                      color: mutedText,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFEDF1EE)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Current mileage',
                        style: TextStyle(color: mutedText, fontSize: 13),
                      ),
                      Text(
                        '$mileage km',
                        style: const TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeading(title: 'Vehicle overview'),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OverviewCard(
                    title: 'Car health',
                    value: '92%',
                    subtitle: 'Excellent',
                    icon: Icons.favorite_rounded,
                    iconColor: primaryGreen,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OverviewCard(
                    title: 'Next service',
                    value: '1,200 km',
                    subtitle: 'Remaining',
                    icon: Icons.build_circle_outlined,
                    iconColor: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFE69A27),
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service coming soon',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGreen,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Your next oil change is approaching.',
                          style: TextStyle(
                            color: mutedText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: darkGreen,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeading(title: 'Recent maintenance'),
                TextButton(
                  onPressed: onAddService,
                  child: const Text(
                    'Add new',
                    style: TextStyle(
                      color: primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (services.isEmpty)
              const EmptyState(message: 'No maintenance records yet.')
            else
              ...services.take(2).map(
                    (service) => ServiceListCard(service: service),
                  ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// OVERVIEW CARD
// ------------------------------------------------------------

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 25),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              color: darkGreen,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(
              color: darkGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: mutedText, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// SECTION HEADING
// ------------------------------------------------------------

class SectionHeading extends StatelessWidget {
  final String title;

  const SectionHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: darkGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ------------------------------------------------------------
// MAINTENANCE SCREEN
// ------------------------------------------------------------

class MaintenanceScreen extends StatelessWidget {
  final List<ServiceRecord> services;
  final VoidCallback onAddService;

  const MaintenanceScreen({
    super.key,
    required this.services,
    required this.onAddService,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Maintenance',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                ),
                IconButton.filled(
                  onPressed: onAddService,
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: services.isEmpty
                ? const EmptyState(
                    message: 'Your maintenance history will appear here.',
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const Text(
                        'SERVICE HISTORY',
                        style: TextStyle(
                          color: mutedText,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...services.map(
                        (service) => ServiceListCard(service: service),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// SERVICE LIST CARD
// ------------------------------------------------------------

class ServiceListCard extends StatelessWidget {
  final ServiceRecord service;

  const ServiceListCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.build_outlined,
              color: primaryGreen,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${service.date} • ${service.garage}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: mutedText,
                  ),
                ),
              ],
            ),
          ),
          Text(
            service.cost,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: darkGreen,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// ADD SERVICE SCREEN
// ------------------------------------------------------------

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController garageController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    titleController.dispose();
    garageController.dispose();
    costController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  String formattedDate() {
    return '${selectedDate.day.toString().padLeft(2, '0')}/'
        '${selectedDate.month.toString().padLeft(2, '0')}/'
        '${selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add maintenance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Record a service',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Keep a record of all work done on your car.',
              style: TextStyle(color: mutedText),
            ),
            const SizedBox(height: 28),
            const FieldLabel(text: 'Service type'),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'e.g. Engine oil change',
                prefixIcon: Icon(Icons.build_outlined),
              ),
            ),
            const SizedBox(height: 20),
            const FieldLabel(text: 'Service date'),
            InkWell(
              onTap: selectDate,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE8EEEA)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: mutedText,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      formattedDate(),
                      style: const TextStyle(color: darkGreen),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right, color: mutedText),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FieldLabel(text: 'Garage / Workshop'),
            TextField(
              controller: garageController,
              decoration: const InputDecoration(
                hintText: 'Enter garage name',
                prefixIcon: Icon(Icons.store_outlined),
              ),
            ),
            const SizedBox(height: 20),
            const FieldLabel(text: 'Total cost'),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'e.g. 8500',
                prefixIcon: Icon(Icons.currency_exchange),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter the service type.'),
                      ),
                    );
                    return;
                  }

                  final record = ServiceRecord(
                    title: titleController.text.trim(),
                    date: formattedDate(),
                    garage: garageController.text.trim().isEmpty
                        ? 'Not specified'
                        : garageController.text.trim(),
                    cost: costController.text.trim().isEmpty
                        ? 'Not specified'
                        : 'Rs. ${costController.text.trim()}',
                  );

                  Navigator.pop(context, record);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Save maintenance record',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// FIELD LABEL
// ------------------------------------------------------------

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: darkGreen,
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// REMINDERS SCREEN
// ------------------------------------------------------------

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  Widget reminderCard({
    required String title,
    required String description,
    required String date,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: darkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: mutedText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  date,
                  style: const TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: mutedText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reminders',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Never miss an important car maintenance date.',
              style: TextStyle(color: mutedText),
            ),
            const SizedBox(height: 25),
            reminderCard(
              title: 'Engine oil change',
              description: 'Regular engine maintenance',
              date: 'Due in 1,200 km',
              icon: Icons.oil_barrel_outlined,
              color: Colors.orange,
            ),
            reminderCard(
              title: 'Vehicle inspection',
              description: 'Annual vehicle inspection',
              date: 'Due Dec 20, 2026',
              icon: Icons.fact_check_outlined,
              color: primaryGreen,
            ),
            reminderCard(
              title: 'Car insurance',
              description: 'Renew your insurance policy',
              date: 'Due Jan 15, 2027',
              icon: Icons.shield_outlined,
              color: Colors.blue,
            ),
            reminderCard(
              title: 'Tire inspection',
              description: 'Check tire pressure and condition',
              date: 'Due in 30 days',
              icon: Icons.tire_repair,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// GARAGE SCREEN
// ------------------------------------------------------------

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  Widget garageCard(
    BuildContext context,
    String name,
    String location,
    String rating,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 30,
              color: primaryGreen,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  location,
                  style: const TextStyle(
                    color: mutedText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB547),
                      size: 17,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Rating',
                      style: TextStyle(color: mutedText, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Calling $name is not connected yet.')),
              );
            },
            icon: const Icon(
              Icons.phone_outlined,
              color: primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find a garage',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Discover nearby workshops and car experts.',
              style: TextStyle(color: mutedText),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search garages or services',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune),
                ),
              ),
            ),
            const SizedBox(height: 22),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=1000',
                width: double.infinity,
                height: 145,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 145,
                    color: lightGreen,
                    child: const Center(
                      child: Icon(
                        Icons.car_repair,
                        size: 55,
                        color: primaryGreen,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const SectionHeading(title: 'Recommended garages'),
            const SizedBox(height: 14),
            garageCard(
              context,
              'Premium Auto Care',
              'Main Boulevard • 2.5 km',
              '4.9',
              Icons.car_repair,
            ),
            garageCard(
              context,
              'City Motors Workshop',
              'Model Town • 3.8 km',
              '4.7',
              Icons.build_circle_outlined,
            ),
            garageCard(
              context,
              'Express Car Service',
              'Johar Town • 5.2 km',
              '4.8',
              Icons.handyman_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE SCREEN
// ------------------------------------------------------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget profileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: primaryGreen, size: 21),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: darkGreen,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: mutedText,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    decoration: const BoxDecoration(
                      color: lightGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: primaryGreen,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'John Smith',
                    style: TextStyle(
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'john@example.com',
                    style: TextStyle(color: mutedText),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const SectionHeading(title: 'Account settings'),
            const SizedBox(height: 12),
            profileOption(
              icon: Icons.directions_car_outlined,
              title: 'My vehicles',
              onTap: () {},
            ),
            profileOption(
              icon: Icons.person_outline,
              title: 'Personal information',
              onTap: () {},
            ),
            profileOption(
              icon: Icons.notifications_none,
              title: 'Notification settings',
              onTap: () {},
            ),
            profileOption(
              icon: Icons.lock_outline,
              title: 'Privacy and security',
              onTap: () {},
            ),
            profileOption(
              icon: Icons.help_outline,
              title: 'Help and support',
              onTap: () {},
            ),
            profileOption(
              icon: Icons.info_outline,
              title: 'About AutoCare',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE8EEEA)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// EMPTY STATE
// ------------------------------------------------------------

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.description_outlined,
              color: primaryGreen,
              size: 45,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: mutedText),
            ),
          ],
        ),
      ),
    );
  }
}
