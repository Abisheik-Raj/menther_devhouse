// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:ment_her_app/components/button_component.dart";
import "package:ment_her_app/components/textfield_component.dart";
import "package:ment_her_app/resources/colors.dart";
import "package:ment_her_app/services/auth_service.dart";
import "package:provider/provider.dart";

class LoginScreen extends StatelessWidget {
  void Function()? changeScreen;
  LoginScreen({super.key, required this.changeScreen});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      "Log In",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 35,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Please, log in to your account,",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Text(
                      "It takes less than a minute.",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: greyColor),
                    ),
                    const SizedBox(height: 50),
                    TextFieldComponent(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontFamily: "PoppinsRegular",
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        try {
                          Provider.of<AuthService>(context, listen: false)
                              .login(emailController.text,
                                  passwordController.text);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const ButtonComponent(
                        text: "Log In",
                      ),
                    ),
                    const SizedBox(height: 200),
                    Center(
                      child: GestureDetector(
                        onTap: changeScreen,
                        child: const Column(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "PoppinsSemiBold",
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
