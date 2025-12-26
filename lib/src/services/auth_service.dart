import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<String?> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<String?> signup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 🔴 VERY IMPORTANT
      // signup ke baad auto-login band
      await FirebaseAuth.instance.signOut();

      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
