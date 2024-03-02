import 'package:student_management/screens/auth/login_screen.dart';
import 'package:student_management/screens/auth/signup_screen.dart';
import 'package:student_management/widgets/input_field.dart';
import 'package:flutter/material.dart';
class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
