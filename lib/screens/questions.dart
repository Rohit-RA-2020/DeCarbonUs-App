// ignore_for_file: avoid_print
import 'package:decarbonus/models/fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/questions_model.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int questionIndex = 0;
  late int? selectedOption = 100;

  var responses = <String, int>{};
  // final CollectionReference _collectionReference =
  //     FirebaseFirestore.instance.collection('users');
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20.0),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          questionIndex != 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    if (questionIndex > 0) {
                      setState(() {
                        questionIndex--;
                        selectedOption = null;
                      });
                    }
                  },
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  label: const Text('Previous',
                      style: TextStyle(color: Colors.black)),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                )
              : Container(),
          questionIndex != questionsList.length - 1
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    if (questionIndex < questionsList.length - 1) {
                      setState(() {
                        questionIndex++;
                        selectedOption = null;
                      });
                    }
                  },
                  label: const Text('Next'),
                  icon: const Icon(Icons.arrow_forward),
                )
              : FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF1DBF73),
                  onPressed: () async {},
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.green, width: 3)),
                  label: const Text('Submit'),
                  icon: const Icon(Icons.check),
                ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              FadeAnimation(
                delay: 1,
                fadeDirection: FadeDirection.bottom,
                child: Text(
                  '${questionIndex + 1}/${questionsList.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                questionsList[questionIndex]['question'],
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  questionsList[questionIndex]['icon'],
                  height: 220,
                  width: 220,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListView.builder(
                    itemCount: questionsList[questionIndex]['options'].length,
                    itemBuilder: (context, index) => FadeAnimation(
                      delay: 1 + index / 5,
                      fadeDirection: FadeDirection.right,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: selectedOption == index
                              ? const Color(0xFF1DBF73)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              selectedOption = index;
                              responses
                                  .addAll({questionIndex.toString(): index});
                            });
                          },
                          title: Text(
                              questionsList[questionIndex]['options'][index]),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
