import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'health_insurance.dart';

class PeopleDashboard extends StatefulWidget {
  const PeopleDashboard({super.key});

  @override
  State<PeopleDashboard> createState() => _PeopleDashboardState();
}

class _PeopleDashboardState extends State<PeopleDashboard> {
  int _currentIndex = 0;

  final List<String> navItems = [
    "Home",
    "My Consultation",
    "My Wellness",
    "Support"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Stylish AppBar
            Container(
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, Jay Bagdane 👋",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87)),
                        Text("Welcome to Smart Health",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: Colors.grey),
                      onPressed: () {})
                ],
              ),
            ),

            // 🔹 Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Health Vitals Banner
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6A82FB), Color(0xFF00C9FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Check your Health Vitals in 60s",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 6),
                          Text(
                              "Just a face scan to know SpO2, heart rate, BP & more",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.white70)),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Face Scan",
                                    style: GoogleFonts.poppins(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward_ios,
                                    size: 14, color: Colors.blueAccent),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // 🔹 Insurance Section
                    sectionTitle("Star Insurance Policies"),
                    gridCards([
                      {"icon": Icons.favorite, "text": "Health Insurance"},
                      {"icon": Icons.shield, "text": "Accident Insurance"},
                      {"icon": Icons.flight_takeoff, "text": "Travel Insurance"},
                      {"icon": Icons.local_hospital, "text": "Out Patient Care"},
                      {"icon": Icons.woman, "text": "Women’s Care"},
                      {"icon": Icons.heart_broken, "text": "Critical Care"},
                    ]),

                    // 🔹 Services
                    sectionTitle("Services Just for You"),
                    gridCards([
                      {"icon": Icons.medical_services, "text": "Doctor"},
                      {"icon": Icons.face, "text": "Face Scan"},
                      {"icon": Icons.assignment, "text": "Health Risk"},
                    ]),

                    // 🔹 Flexi Benefits
                    sectionTitle("Star Flexi Benefits"),
                    gridCards([
                      {"icon": Icons.favorite, "text": "Mamta Women Care"},
                      {"icon": Icons.elderly, "text": "Senior Citizen Care"},
                      {"icon": Icons.fitness_center, "text": "Stay Fit"},
                      {"icon": Icons.computer, "text": "E-Connect"},
                    ]),

                    // 🔹 Water Borne Diseases
                    sectionTitle("Water Borne Diseases"),
                    gridCards([
                      {"icon": Icons.water_drop, "text": "Cholera"},
                      {"icon": Icons.sick, "text": "Typhoid"},
                      {"icon": Icons.bug_report, "text": "Malaria"},
                      {"icon": Icons.warning, "text": "Dengue"},
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔹 Custom Rounded Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1976D2),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.home, "Home", 0),
            navItem(Icons.calendar_today, "Consultation", 1),
            navItem(Icons.favorite, "Wellness", 2),
            navItem(Icons.support_agent, "Support", 3),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
    );
  }

  // 🔹 Grid Cards
  Widget gridCards(List<Map<String, dynamic>> items) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: items.map((item) {
        return GestureDetector(
          onTap: () {
            if (item["text"] == "Health Insurance") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HealthInsuranceScreen(),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3))
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], size: 30, color: Colors.blueAccent),
                const SizedBox(height: 6),
                Text(item["text"],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // 🔹 Custom Nav Item Widget
  Widget navItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: isSelected ? 26 : 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
