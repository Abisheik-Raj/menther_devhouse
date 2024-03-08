// ignore_for_file: avoid_unnecessary_containers

import "package:flutter/material.dart";
import "package:ment_her_app/components/signup_page_progress_indicator.dart";
import "package:ment_her_app/resources/colors.dart";

class ClubSelectionScreen extends StatelessWidget {
  ClubSelectionScreen({super.key});

  List<String> clubs = [""];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 10),
                const SignupPageProgessIndicator(fillColor: greenColor),
                const SignupPageProgessIndicator(fillColor: greenColor),
                const SignupPageProgessIndicator(fillColor: greenColor),
                const SignupPageProgessIndicator(fillColor: greenColor),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              "Join your favourite clubs",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 35,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Entering a club helps you learn a new skill and meet people with similar interests!",
              style: TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontSize: 15,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    )));
  }
}
