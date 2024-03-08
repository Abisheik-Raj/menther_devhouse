// ignore_for_file: avoid_unnecessary_containers, must_be_immutable
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:ment_her_app/components/button_component.dart";
import "package:ment_her_app/components/textfield_component.dart";
import "package:ment_her_app/resources/colors.dart";
import "package:ment_her_app/services/auth_service.dart";
import "package:provider/provider.dart";

class SignupScreen extends StatelessWidget {
  void Function()? changeScreen;
  void Function()? signupDoneConfirmation;
  SignupScreen(
      {super.key,
      required this.changeScreen,
      required this.signupDoneConfirmation});

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
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 35,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Please sign up.",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Text(
                      "Enjoy the app power to the fullest!",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: greyColor),
                    ),
                    const SizedBox(height: 50),
                    TextFieldComponent(
                        hintText: "Email",
                        obscureText: false,
                        controller: emailController),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await Provider.of<AuthService>(context, listen: false)
                              .signup(emailController.text,
                                  passwordController.text);
                          signupDoneConfirmation!();
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const ButtonComponent(
                        text: "Sign Up",
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "By clicking on sign up, you agree to MentHer's",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Text(
                      "Terms and Conditions of Use",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 200),
                    Center(
                      child: GestureDetector(
                        onTap: changeScreen,
                        child: const Column(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Log In",
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
