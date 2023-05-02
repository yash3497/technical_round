import 'package:flutter/material.dart';
import 'package:intern_task/screens/registration.dart';
import 'package:intern_task/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateto() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Image.asset("assets/icons/logo.png"),
      ),
    );
  }
}
