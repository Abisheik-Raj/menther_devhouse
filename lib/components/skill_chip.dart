import "package:flutter/material.dart";
import "package:ment_her_app/resources/colors.dart";

class SkillChip extends StatefulWidget {
  final String chipLabel;
  final Function()? increaseNoOfSkills;
  final Function()? decreaseNoOfSkills;
  final Function()? getNumberOfItems;
  const SkillChip(
      {super.key,
      required this.chipLabel,
      required this.increaseNoOfSkills,
      required this.decreaseNoOfSkills,
      required this.getNumberOfItems});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool chipSelected = false;
  Color chipColor = Colors.white;
  bool showDeleteIcon = false;

  void changeChipStatus() {
    setState(() {
      if (chipSelected == true) {
        widget.decreaseNoOfSkills!();
      } else {
        widget.increaseNoOfSkills!();
      }
      chipSelected = !chipSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget xWidget = const Text(
      "✖",
      style: TextStyle(
          color: Colors.black, fontFamily: "PoppinsBold", fontSize: 12),
    );

    return GestureDetector(
        onTap: () {
          if (chipColor == Colors.white && widget.getNumberOfItems!() < 10) {
            chipColor = greenColor;
            showDeleteIcon = true;
            widget.increaseNoOfSkills!();
          }
          setState(() {});
        },
        child: Chip(
            padding: const EdgeInsets.all(8),
            onDeleted: () {
              if (chipColor == greenColor) {
                chipColor = Colors.white;
                showDeleteIcon = false;
                widget.decreaseNoOfSkills!();
              }
              setState(() {});
            },
            deleteIcon: showDeleteIcon == true ? xWidget : const Text(''),
            backgroundColor: chipColor,
            label: Text(
              widget.chipLabel,
              style: const TextStyle(
                  fontFamily: "PoppinsRegular",
                  fontSize: 15,
                  color: Colors.black),
            )));
  }
}
