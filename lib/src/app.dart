import 'package:flutter/material.dart';
import 'views/auth/login_page.dart';
import 'views/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FitnessFitApp extends StatelessWidget {
  const FitnessFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitnessFit',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E90FF),
        scaffoldBackgroundColor: const Color(0xFFF7FBFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E90FF),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B6B),
          ),
        ),
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return const HomePage();
        }
        return const LoginPage();
      },
    );
  }
}
