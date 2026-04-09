import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'role_selection_screen.dart'; // ✅ Import RoleSelectionScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "icon": Icons.shield_outlined,
      "image": "assets/images/img1.png",
      "title": "Welcome to HealthGuard",
      "subtitle": "Smart Community Health Monitoring System",
      "desc":
          "Protecting rural communities from diseases through early detection, monitoring, and health initiatives.",
      "tags": [
        "Community Protection",
        "Early Detection",
        "Local Health Workers",
      ],
    },
    {
      "icon": Icons.water_drop_outlined,
      "image": "assets/images/img2.png",
      "title": "Water Quality Monitoring",
      "subtitle": "Real-time Water Safety Tracking",
      "desc":
          "Monitor water sources with smart sensors & testing. Get instant alerts about contamination risks.",
      "tags": ["Smart Sensors", "Quality Testing", "Contamination Alerts"],
    },
    {
      "icon": Icons.warning_amber_outlined,
      "image": "assets/images/img3.png",
      "title": "Early Warning System",
      "subtitle": "Prevent Outbreaks Before They Start",
      "desc":
          "Analytics detect patterns to warn about potential outbreaks before they spread.",
      "tags": ["Outbreak Prediction", "Risk Assessment", "Immediate Alerts"],
    },
    {
      "icon": Icons.people_alt_outlined,
      "image": "assets/images/img4.png",
      "title": "Community Network",
      "subtitle": "Stronger Together for Better Health",
      "desc":
          "Connect with health workers & leaders. Share reports, symptoms & coordinate prevention.",
      "tags": ["Health Workers", "Community Reports", "Coordinated Response"],
    },
    {
      "icon": Icons.check_circle_outline,
      "image": "assets/images/img5.png",
      "title": "Protect Your Community",
      "subtitle": "Start Monitoring & Preventing Today",
      "desc":
          "Join communities in the fight against diseases. Build healthier, safer villages.",
      "tags": ["Proven Results", "24/7 Monitoring", "Community Impact"],
    },
  ];

  void goToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RoleSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ✅ Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF0D47A1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          data["icon"],
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          data["image"],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        data["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data["subtitle"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        data["desc"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: (data["tags"] as List<String>)
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white70,
                                    width: 1.2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Skip button
            if (currentIndex != onboardingData.length - 1)
              Positioned(
                top: 40,
                right: 20,
                child: TextButton(
                  onPressed: goToNextScreen, // ✅ Connected
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

            // Bottom Indicator + Get Started
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingData.length,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.white54,
                      activeDotColor: Colors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (currentIndex == onboardingData.length - 1)
                    GestureDetector(
                      onTap: goToNextScreen, // ✅ Connected
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white70, width: 1.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
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
