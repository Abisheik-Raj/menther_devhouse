// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ment_her_app/components/button_component.dart';
import 'package:ment_her_app/components/signup_page_progress_indicator.dart';
import 'package:ment_her_app/components/skill_chip2.dart';
import 'package:ment_her_app/pages/club_selection_screen.dart';
import 'package:ment_her_app/resources/colors.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  final List<String> gettingStartedList = [];
  final List<String> knowTheBasicsList = [];
  final List<String> builtProjectsList = [];
  final List<String> workExperienceList = [];

  final List<String> selectedSkills = [
    'Python',
    'Flutter',
    'Java',
    'Graphic Design',
    'Illustrator',
    'Photoshop',
    'Canva',
    'Figma'
  ];

  void removeSkillFromSelectedSkills(String skillName) {
    setState(() {
      selectedSkills.remove(skillName);
    });
  }

  bool isDragging = false;

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
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "Drag n' drop your skills!",
                  style: TextStyle(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DragTarget(
                      onAcceptWithDetails: (objectWithData) {
                        setState(() {
                          gettingStartedList
                              .add(objectWithData.data.toString());
                          removeSkillFromSelectedSkills(
                              objectWithData.data.toString());
                        });
                      },
                      builder: (context, candidates, rejects) {
                        return Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(232, 233, 248, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: Color.fromRGBO(161, 171, 247, 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Text(
                                      "GETTING STARTED",
                                      style: TextStyle(
                                        fontFamily: "PoppinsSemiBold",
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: ListView.builder(
                                    itemCount: gettingStartedList.length,
                                    itemBuilder: (context, index) => Text(
                                      gettingStartedList[index],
                                      style: const TextStyle(
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    DragTarget(
                      onAcceptWithDetails: (objectWithData) {
                        setState(() {
                          knowTheBasicsList.add(objectWithData.data.toString());
                          removeSkillFromSelectedSkills(
                              objectWithData.data.toString());
                        });
                      },
                      builder: (context, candidates, rejects) {
                        return Expanded(
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(246, 239, 220, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Color.fromRGBO(247, 223, 164, 1),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "KNOW THE BASICS",
                                        style: TextStyle(
                                          fontFamily: "PoppinsSemiBold",
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ListView.builder(
                                      itemCount: knowTheBasicsList.length,
                                      itemBuilder: (context, index) => Text(
                                        knowTheBasicsList[index],
                                        style: const TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DragTarget(
                      onAcceptWithDetails: (objectWithData) {
                        setState(() {
                          builtProjectsList.add(objectWithData.data.toString());
                          removeSkillFromSelectedSkills(
                              objectWithData.data.toString());
                        });
                      },
                      builder: (context, candidates, rejects) {
                        return Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 219, 249, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: Color.fromRGBO(186, 155, 245, 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "BUILT PROJECTS",
                                      style: TextStyle(
                                        fontFamily: "PoppinsSemiBold",
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: ListView.builder(
                                    itemCount: builtProjectsList.length,
                                    itemBuilder: (context, index) => Text(
                                      builtProjectsList[index],
                                      style: const TextStyle(
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    DragTarget(
                      onAcceptWithDetails: (objectWithData) {
                        setState(() {
                          workExperienceList
                              .add(objectWithData.data.toString());
                          removeSkillFromSelectedSkills(
                              objectWithData.data.toString());
                        });
                      },
                      builder: (context, candidates, rejects) {
                        return Expanded(
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(226, 243, 229, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Color.fromRGBO(180, 233, 183, 1),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "WORK EXPERIENCE",
                                        style: TextStyle(
                                          fontFamily: "PoppinsSemiBold",
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ListView.builder(
                                      itemCount: workExperienceList.length,
                                      itemBuilder: (context, index) => Text(
                                        workExperienceList[index],
                                        style: const TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (selectedSkills.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "🤖 Match skills to your experience level",
                        style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${selectedSkills.length} left",
                        style: const TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                if (selectedSkills.isNotEmpty)
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: List.generate(
                      selectedSkills.length,
                      (index) => Draggable(
                        childWhenDragging: Container(),
                        data: selectedSkills[index],
                        feedback: Text(
                          selectedSkills[index],
                          style: const TextStyle(
                            fontFamily: "PoppinsRegular",
                            fontSize: 15,
                            color: greyColor,
                          ),
                        ),
                        child: SkillChip2(
                          skillName: selectedSkills[index],
                        ),
                      ),
                    ),
                  ),
                if (selectedSkills.isEmpty)
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClubSelectionScreen()));
                      },
                      child: const ButtonComponent(text: "Next"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
