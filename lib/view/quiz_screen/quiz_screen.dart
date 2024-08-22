import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/view/quiz_screen/widgets/options_card.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int? selectedAnswerIndex;
  int rightAnsCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Text(
            "${questionIndex + 1}/${Dummydb.Questions.length}",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              //to build the questions section
              _buildQuestionSection(),
              SizedBox(
                height: 20,
              ),
              //to build the options section
              Column(
                children: List.generate(
                  4,
                  (index) => OptionsCard(
                    borderColor: _getColor(index),
                    questionIndex: questionIndex,
                    optionIndex: index,
                    onOptionsTap: () {
                      if (selectedAnswerIndex == null) {
                        selectedAnswerIndex = index;

                        if (selectedAnswerIndex ==
                            Dummydb.Questions[questionIndex]["answer"]) {
                          rightAnsCount++;
                          print("right answer:${rightAnsCount}");
                        }
                        setState(() {});
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: selectedAnswerIndex != null
          ? _buildNextButton(context)
          : null, //to build the next button section
    );
  }

  InkWell _buildNextButton(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedAnswerIndex = null;
        if (questionIndex < Dummydb.Questions.length - 1) {
          setState(() {
            questionIndex++;
          });
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text("Thanks"),
          //   backgroundColor: Colors.red,
          // ));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  rightAnswerCount: rightAnsCount,
                ),
              ));
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: Text(
          "Next",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Expanded _buildQuestionSection() {
    return Expanded(
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Text(
              textAlign: TextAlign.justify,
              Dummydb.Questions[questionIndex]["question"],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        selectedAnswerIndex == Dummydb.Questions[questionIndex]["answer"]
            ? Lottie.asset("assets/images/popup.json")
            : SizedBox()
      ]),
    );
  }

  Color _getColor(int index) {
    if (selectedAnswerIndex != null) {
      if (index == Dummydb.Questions[questionIndex]["answer"]) {
        return Colors.green;
      }
      if (selectedAnswerIndex == Dummydb.Questions[questionIndex]["answer"] &&
          selectedAnswerIndex == index) {
        return Colors.green;
      } else {
        if (selectedAnswerIndex != Dummydb.Questions[questionIndex]["answer"] &&
            selectedAnswerIndex == index) {
          return Colors.red;
        }
      }
    }

    return Colors.grey;
  }
}
