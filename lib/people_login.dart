import 'package:flutter/material.dart';
import 'otp_verification_screen.dart'; // OTP Screen import
import 'people_dashboard.dart'; // PeopleDashboard import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool useMobileLogin = true;
  bool agree = false;
  bool obscurePassword = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF42A5F5), Color(0xFF1565C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // 🔹 Glassmorphism Card
          Center(
            child: FadeTransition(
              opacity: _fadeIn,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 🔹 Logo Circle
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3498DB), Color(0xFF27AE60)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.health_and_safety,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 🔹 Title
                      const Text(
                        "Welcome to StayHealth",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // 🔹 Forms
                      if (useMobileLogin) buildMobileForm() else buildPasswordForm(),
                      const SizedBox(height: 20),

                      // 🔹 Terms Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: agree,
                            activeColor: const Color(0xFF27AE60),
                            onChanged: (v) {
                              setState(() {
                                agree = v ?? false;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "I agree to terms & conditions",
                              style: TextStyle(color: Color(0xFF2C3E50)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // 🔹 Continue / Login Button
                      useMobileLogin
                          ? buildContinueButton()
                          : buildLoginButton(),

                      const SizedBox(height: 20),

                      // 🔹 Switch Login
                      InkWell(
                        onTap: () {
                          setState(() {
                            useMobileLogin = !useMobileLogin;
                          });
                        },
                        child: Text(
                          useMobileLogin
                              ? "Login with password"
                              : "Login with mobile no.",
                          style: const TextStyle(
                            color: Color(0xFFE74C3C),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Mobile Login Form
  Widget buildMobileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter mobile no.",
          style: TextStyle(color: Color(0xFF2C3E50)),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone, color: Color(0xFF3498DB)),
            hintText: "+91 Enter mobile number",
            filled: true,
            fillColor: Colors.grey.shade100,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF3498DB)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Sign in to enjoy health benefits",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // 🔹 Username + Password Form
  Widget buildPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter username",
          style: TextStyle(color: Color(0xFF2C3E50)),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person, color: Color(0xFF3498DB)),
            hintText: "Username or email",
            filled: true,
            fillColor: Colors.grey.shade100,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF3498DB)),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Enter password",
          style: TextStyle(color: Color(0xFF2C3E50)),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: passwordController,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, color: Color(0xFF27AE60)),
            hintText: "Password",
            filled: true,
            fillColor: Colors.grey.shade100,
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFFE74C3C),
              ),
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF27AE60)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot password?",
              style: TextStyle(color: Color(0xFFF39C12)),
            ),
          ),
        ),
        const Text(
          "Sign in to enjoy health benefits",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // 🔹 Continue Button for Mobile Login
  Widget buildContinueButton() {
    return GestureDetector(
      onTap: () {
        if (agree) {
          final phone = phoneController.text.trim();
          if (phone.isNotEmpty && phone.length >= 10) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpVerificationScreen(phoneNumber: phone),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Enter a valid mobile number")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please agree to terms & conditions")),
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF3498DB), Color(0xFF27AE60)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Login Button for Password Login
  Widget buildLoginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PeopleDashboard()),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF3498DB), Color(0xFF27AE60)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
