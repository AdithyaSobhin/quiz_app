import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/view/quiz_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.rightAnswerCount});
  final int rightAnswerCount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starCount = 0;
  @override
  void initState() {
    starCount = calPercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        bottom: index == 1 ? 10 : 0, left: 15, right: 15),
                    child: Icon(
                      Icons.star,
                      color: index < starCount ? Colors.amber : Colors.grey,
                      size: index == 1 ? 80 : 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Congratulations",
                style: TextStyle(
                    color: Colors.amber.shade500,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Score",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.rightAnswerCount}/${Dummydb.Questions.length}",
                style: TextStyle(
                    color: Colors.amber.shade500,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(),
                      ));
                },
                child: Container(
                  height: 40,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.replay_circle_filled_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Restart",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int calPercentage() {
    double percentage =
        (widget.rightAnswerCount / Dummydb.Questions.length) * 100;
    print("percentage:$percentage");
    if (percentage >= 80) {
      return 3;
    } else if (percentage >= 50) {
      return 2;
    } else if (percentage >= 30) {
      return 1;
    } else {
      return 0;
    }
  }
}
