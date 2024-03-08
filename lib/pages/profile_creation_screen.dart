import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:ment_her_app/components/button_component.dart";
import "package:ment_her_app/components/textfield_component2.dart";
import "package:ment_her_app/components/signup_page_progress_indicator.dart";
import "package:ment_her_app/pages/skill_selection_screen.dart";
import "package:ment_her_app/resources/colors.dart";

class ProfileCreationScreen extends StatelessWidget {
  ProfileCreationScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SignupPageProgessIndicator(fillColor: greenColor),
                      SignupPageProgessIndicator(
                          fillColor: Color.fromARGB(255, 223, 220, 220)),
                      SignupPageProgessIndicator(
                          fillColor: Color.fromARGB(255, 223, 220, 220)),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Welcome User!",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 35,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Let's build your profile together 👋",
                    style: TextStyle(
                        fontFamily: "PoppinsRegular",
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Stack(children: [
                      const CircleAvatar(
                        radius: 65,
                        backgroundImage:
                            AssetImage("assets\\images\\profile_yellow.jpg"),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(Icons.camera_alt_rounded,
                              color: greenColor),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Full name",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PoppinsRegular",
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextFieldComponent2(
                    controller: usernameController,
                    hintText: "John Watson",
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Phone number",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PoppinsRegular",
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextFieldComponent2(
                    controller: phonenumberController,
                    hintText: "+91 8422349510",
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SkillSelectionScreen()));
                      },
                      child: const ButtonComponent(text: "Next"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
