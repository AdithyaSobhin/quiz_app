import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.rightAnswerCount});
  final int rightAnswerCount;

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade500,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade500,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade500,
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                "$rightAnswerCount/${Dummydb.Questions.length}",
                style: TextStyle(
                    color: Colors.amber.shade500,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
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
                      "Retry",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
