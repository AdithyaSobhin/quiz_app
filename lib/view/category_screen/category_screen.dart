import 'package:flutter/material.dart';

import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/view/quiz_screen/quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 200, 253),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Liya",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let's make this day productive",
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            child: Image.network(
                "https://static.vecteezy.com/system/resources/previews/014/194/215/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg"),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 50),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(
                                categoryData: Dummydb.Questions[index]
                                    ["questions"],
                              )),
                    );
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          //monu changes
                          Dummydb.Questions[index]["category"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                        top: -40,
                        right: -5,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(Dummydb.Questions[index]["url"]),
                            ),
                          ),
                        ))
                  ]),
                );
              },
              itemCount: Dummydb.Questions.length,
            ),
          )
        ],
      ),
    );
  }
}
