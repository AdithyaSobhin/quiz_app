import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    super.key,
    required this.categoryIndex,
    required this.questionIndex,
    required this.optionIndex,
    this.onOptionsTap,
    required this.borderColor,
  });

  final int categoryIndex;
  final int questionIndex;
  final int optionIndex;
  final void Function()? onOptionsTap;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final categoryData = Dummydb.Questions[categoryIndex];
    final questions = categoryData["questions"];
    final question = questions[questionIndex];
    final options = question["options"];
    final optionText = options[optionIndex];

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onOptionsTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 4, color: borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                optionText,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 9,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: const Color.fromARGB(255, 218, 140, 232),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
