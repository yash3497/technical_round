import 'package:flutter/material.dart';
import 'package:intern_task/screens/registration.dart';
import 'package:intern_task/service/api_services.dart';

import '../utils/colors.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_textbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/icon.png"),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Welcome to Lungo !!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Login to Continue",
                  style: TextStyle(
                    color: AppColor.lightgrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextBox(
                  hintText: "Email Address",
                  controller: emailController,
                  obsecureText: false,
                  validate: (p0) {
                    return p0 == null ? "Please Enter a Email" : null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextBox(
                  hintText: "Password",
                  controller: passwordController,
                  obsecureText: true,
                  validate: (p0) {
                    return p0 == null ? "Please Enter a Password" : null;
                  },
                ),
                const SizedBox(
                  height: 41,
                ),
                CustomButton(
                  text: "Sign in",
                  onTap: () {
                    if (key.currentState!.validate()) {
                      Map data = {
                        "username": emailController.text,
                        "password": passwordController.text,
                      };
                      ApiServices.signinApi(data);
                    }
                  },
                ),
                const SizedBox(
                  height: 31,
                ),
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don’t have account? Click ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.lightgrey,
                          ),
                        ),
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Forget Password? Click ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.lightgrey,
                          ),
                        ),
                        Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
