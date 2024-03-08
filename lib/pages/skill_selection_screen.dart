import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:ment_her_app/components/button_component.dart";
import "package:ment_her_app/components/signup_page_progress_indicator.dart";
import "package:ment_her_app/components/skill_chip.dart";
import "package:ment_her_app/pages/drag_and_drop_screen.dart";
import "package:ment_her_app/resources/colors.dart";
import "package:ment_her_app/resources/skill_set.dart";

class SkillSelectionScreen extends StatefulWidget {
  SkillSelectionScreen({super.key});

  @override
  State<SkillSelectionScreen> createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
  var noOfSkillsSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
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
                    const SizedBox(
                      width: 10,
                    ),
                    const SignupPageProgessIndicator(fillColor: greenColor),
                    const SignupPageProgessIndicator(fillColor: greenColor),
                    const SignupPageProgessIndicator(
                        fillColor: Color.fromARGB(255, 223, 220, 220)),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Tell us about your skills",
                  style: TextStyle(
                      fontFamily: "PoppinsSemiBold",
                      fontSize: 35,
                      color: Colors.black),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Which skills are you good at or interested in learning? Pick at least 1️⃣",
                  style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 15,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                      itemCount: skillSet.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              skillSet[index]["title"].toString(),
                              style: const TextStyle(
                                  fontFamily: "PoppinsSemiBold",
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Wrap(
                              spacing: 10,
                              runSpacing: 5,
                              children: List.generate(
                                  skillSet[index]["skills"].length,
                                  (innerindex) => SkillChip(
                                        chipLabel: skillSet[index]["skills"]
                                            [innerindex],
                                        increaseNoOfSkills: () {
                                          setState(() {
                                            if (noOfSkillsSelected != 10) {
                                              noOfSkillsSelected++;
                                            }
                                          });
                                        },
                                        decreaseNoOfSkills: () {
                                          setState(() {
                                            if (noOfSkillsSelected != 0) {
                                              noOfSkillsSelected--;
                                            }
                                          });
                                        },
                                        getNumberOfItems: () =>
                                            noOfSkillsSelected,
                                      )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$noOfSkillsSelected / 10 selected",
                      style: const TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DragAndDropScreen()));
                    },
                    child: const ButtonComponent(text: "Next")),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
