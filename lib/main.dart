import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:role_based_login_app/firebase_options.dart';
import 'package:role_based_login_app/screens/login_screen.dart';
import 'package:role_based_login_app/screens/register_screen.dart';
import 'package:role_based_login_app/screens/admin_home.dart';
import 'package:role_based_login_app/screens/reset_password_screen.dart';
import 'package:role_based_login_app/screens/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Role Based Login',
  theme: ThemeData(useMaterial3: true),
  initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/user',
  routes: {
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(), 
    '/admin': (context) => const AdminHome(),
   '/userHome': (context) => const UserHome(),
   '/reset': (context) => const ResetPasswordScreen(),


  },
);

  }
}
