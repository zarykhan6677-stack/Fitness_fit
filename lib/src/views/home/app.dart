import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gcwuf_hub/src/views/auth/login_page.dart';
import 'package:gcwuf_hub/src/views/home/home_page.dart';

class FitnessFitApp extends StatelessWidget {
  const FitnessFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // 🔑 USER LOGGED IN
          if (snapshot.hasData) {
            return const HomePage();
          }

          // 🔑 USER NOT LOGGED IN
          return const LoginPage();
        },
      ),
    );
  }
}
