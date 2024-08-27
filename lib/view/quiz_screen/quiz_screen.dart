// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:quiz_app/dummydb.dart';
// import 'package:quiz_app/view/quiz_screen/widgets/options_card.dart';
// import 'package:quiz_app/view/result_screen/result_screen.dart';

// class QuizScreen extends StatefulWidget {
//   QuizScreen({super.key, required this.categoryData});
//   final Map<String, dynamic> categoryData;
//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int questionIndex = 0;
//   int? selectedAnswerIndex;
//   int rightAnsCount = 0;
//   late Timer _timer;
//   int _secondsRemaining = 15;
//   late Map<String, dynamic> currentQuestion;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//     currentQuestion = widget.categoryData["questions"][questionIndex];
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var questions = widget.categoryData["questions"];
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 245, 200, 253),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 245, 200, 253),
//         centerTitle: true,
//         title: CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.purple,
//           child: Text(
//             _secondsRemaining.toString(),
//             style: TextStyle(color: Colors.black, fontSize: 18),
//           ),
//         ),
//         actions: [
//           Text(
//             "${questionIndex + 1}/${Dummydb.Questions.length}",
//             style: TextStyle(color: Colors.black),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             children: [
//               //to build the questions section
//               _buildQuestionSection(),
//               SizedBox(
//                 height: 20,
//               ),
//               //to build the options section
//               Column(
//                 children: List.generate(
//                   4,
//                   (index) => OptionsCard(
//                     borderColor: _getColor(index),
//                     questionIndex: questionIndex,
//                     optionIndex: index,
//                     onOptionsTap: () {
//                       if (selectedAnswerIndex == null) {
//                         selectedAnswerIndex = index;

//                         if (selectedAnswerIndex ==
//                             Dummydb.Questions[questionIndex]["questions"]
//                                 ["answer"]) {
//                           rightAnsCount++;
//                           print("right answer:${rightAnsCount}");
//                         }
//                         _timer.cancel();
//                         setState(() {});
//                       }
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),

//       bottomNavigationBar: selectedAnswerIndex != null
//           ? _buildNextButton(context)
//           : null, //to build the next button section
//     );
//   }

//   InkWell _buildNextButton(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         moveToNextQuestion();
//         selectedAnswerIndex = null;
//         if (questionIndex < Dummydb.Questions.length - 1) {
//           setState(() {
//             questionIndex++;
//           });
//         } else {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultScreen(
//                   rightAnswerCount: rightAnsCount,
//                 ),
//               ));
//         }
//       },
//       child: Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         decoration: BoxDecoration(
//             color: Colors.purple, borderRadius: BorderRadius.circular(10)),
//         height: 60,
//         child: Text(
//           "Next",
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Expanded _buildQuestionSection() {
//     return Expanded(
//       child: Stack(children: [
//         Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Colors.purple, borderRadius: BorderRadius.circular(10)),
//           child: SingleChildScrollView(
//             child: Text(
//               textAlign: TextAlign.justify,
//               // widget.categoryData[questionIndex]["question"]
//               '${currentQuestion["question"]}',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         selectedAnswerIndex == Dummydb.Questions[questionIndex]["answer"]
//             ? Lottie.asset("assets/images/popup.json")
//             : SizedBox()
//       ]),
//     );
//   }

//   Color _getColor(int index) {
//     if (selectedAnswerIndex != null) {
//       if (index == Dummydb.Questions[questionIndex]["answer"]) {
//         return Colors.green;
//       }
//       if (selectedAnswerIndex == Dummydb.Questions[questionIndex]["answer"] &&
//           selectedAnswerIndex == index) {
//         return Colors.green;
//       } else {
//         if (selectedAnswerIndex != Dummydb.Questions[questionIndex]["answer"] &&
//             selectedAnswerIndex == index) {
//           return Colors.red;
//         }
//       }
//     }

//     return Colors.grey;
//   }

//   //timer function

//   void startTimer() {
//     _secondsRemaining = 15;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsRemaining > 0) {
//           _secondsRemaining--;
//         } else {
//           moveToNextQuestion();
//         }
//       });
//     });
//   }

//   void moveToNextQuestion() {
//     _timer.cancel();
//     selectedAnswerIndex = null;
//     if (questionIndex < Dummydb.Questions.length - 1) {
//       setState(() {
//         questionIndex++;
//       });
//       startTimer();
//     } else {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultScreen(rightAnswerCount: rightAnsCount),
//           ));
//     }
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/view/quiz_screen/widgets/options_card.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Map<String, dynamic> categoryData;
  final int categoryIndex;

  QuizScreen(
      {super.key, required this.categoryData, required this.categoryIndex});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int? selectedAnswerIndex;
  int rightAnsCount = 0;
  late Timer _timer;
  int _secondsRemaining = 15;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var questions = widget.categoryData["questions"];
    var currentQuestion = questions[questionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 200, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 200, 253),
        centerTitle: true,
        title: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.purple,
          child: Text(
            _secondsRemaining.toString(),
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "${questionIndex + 1}/${questions.length}",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _buildQuestionSection(currentQuestion),
              SizedBox(height: 20),
              Column(
                children: List.generate(
                  currentQuestion["options"].length,
                  (index) => OptionsCard(
                    categoryIndex: widget.categoryIndex,
                    borderColor: _getColor(index, currentQuestion),
                    questionIndex: questionIndex,
                    optionIndex: index,
                    onOptionsTap: () =>
                        _handleOptionTap(index, currentQuestion),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          selectedAnswerIndex != null ? _buildNextButton() : null,
    );
  }

  Expanded _buildQuestionSection(Map<String, dynamic> currentQuestion) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Text(
                textAlign: TextAlign.justify,
                '${currentQuestion["question"]}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          if (selectedAnswerIndex == currentQuestion["answer"])
            Lottie.asset("assets/images/popup.json"),
        ],
      ),
    );
  }

  Color _getColor(int index, Map<String, dynamic> currentQuestion) {
    if (selectedAnswerIndex != null) {
      if (index == currentQuestion["answer"]) {
        return Colors.green;
      }
      if (selectedAnswerIndex == index) {
        return Colors.red;
      }
    }
    return Colors.grey;
  }

  void _handleOptionTap(int index, Map<String, dynamic> currentQuestion) {
    if (selectedAnswerIndex == null) {
      setState(() {
        selectedAnswerIndex = index;
        if (selectedAnswerIndex == currentQuestion["answer"]) {
          rightAnsCount++;
        }
        _timer.cancel();
      });
    }
  }

  InkWell _buildNextButton() {
    return InkWell(
      onTap: () {
        if (questionIndex < widget.categoryData["questions"].length - 1) {
          setState(() {
            questionIndex++;
            selectedAnswerIndex = null;
            startTimer();
          });
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  rightAnswerCount: rightAnsCount,
                  totalQuestions: widget.categoryData["questions"].length,
                ),
              ));
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: Text(
          "Next",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  void startTimer() {
    _secondsRemaining = 15;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          moveToNextQuestion();
        }
      });
    });
  }

  void moveToNextQuestion() {
    _timer.cancel();
    if (questionIndex < widget.categoryData["questions"].length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
        startTimer();
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              rightAnswerCount: rightAnsCount,
              totalQuestions: widget.categoryData["questions"].length,
            ),
          ));
    }
  }
}
