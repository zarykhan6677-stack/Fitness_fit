import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  void signup() async {
    setState(() => loading = true);
    final result = await AuthService.signup(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (result != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful! Please login.')),
      );
      Navigator.pop(context); // Back to LoginPage
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Vibrant gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF416C),
                  Color(0xFF833AB4),
                  Color(0xFFFD1D1D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Abstract circles/waves
          Positioned(
            top: -50,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Circular image
                    ClipOval(
                      child: Image.asset(
                        'assets/image1.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF833AB4),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: loading ? null : signup,
                      loading: loading,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF416C), Color(0xFFFFC837)],
                      ),
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: Color(0xFF833AB4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
