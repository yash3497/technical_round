import 'package:flutter/material.dart';
import 'package:intern_task/screens/login.dart';
import 'package:intern_task/service/api_services.dart';
import 'package:intern_task/utils/colors.dart';
import 'package:intern_task/widgets/custom_btn.dart';

import '../widgets/custom_textbox.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: key,
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                      "Register to Continue",
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
                      hintText: "Name",
                      controller: nameController,
                      obsecureText: false,
                      validate: (p0) {
                        return p0 == null ? "Please Enter a Name" : null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextBox(
                      hintText: "Email",
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
                      height: 30,
                    ),
                    CustomTextBox(
                      hintText: "Re-type Password",
                      controller: confirmPasswordController,
                      obsecureText: true,
                      validate: (p0) {
                        return p0 == null
                            ? "Please Enter a Re-type Password"
                            : passwordController.text ==
                                    confirmPasswordController.text
                                ? null
                                : "Please Use Same Password";
                      },
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    CustomButton(
                      text: "Register",
                      onTap: () {
                        if (key.currentState!.validate()) {
                          Map data = {
                            "firstname": nameController.text,
                            "lastname": nameController.text,
                            "email": emailController.text,
                            "password": passwordController.text,
                            "username": emailController.text,
                          };
                          ApiServices.signupApi(data);
                        }
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "You have an account? Click ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColor.lightgrey,
                              ),
                            ),
                            Text(
                              "Sign in",
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
        ),
      ),
    );
  }
}
