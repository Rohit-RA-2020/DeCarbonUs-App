import 'package:decarbonus/models/fade_animation.dart';
import 'package:decarbonus/providers/provider.dart';
import 'package:decarbonus/utils/responses_calculate.dart';
import 'package:decarbonus/widgets/responses_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../models/questions_model.dart';

class Questions extends ConsumerStatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionsState();
}

class _QuestionsState extends ConsumerState<Questions> {
  int questionIndex = 0;
  late int? selectedOption = 100;

  var responses = <String, int?>{
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    "4": null,
    "5": null,
    "6": null,
    "7": null,
    "8": null,
  };

  @override
  Widget build(BuildContext context) {
    return ref.watch(connectionProvider) == false
        ? Scaffold(
            body: Center(
              child: Lottie.asset('assets/anim/nointernet.json'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  heroTag: 'previous',
                  backgroundColor: Colors.white,
                  onPressed: questionIndex < 1
                      ? null
                      : () {
                          if (questionIndex > 0) {
                            setState(() {
                              questionIndex--;
                              selectedOption = null;
                            });
                          } else {
                            null;
                          }
                        },
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  label: const Text('Previous',
                      style: TextStyle(color: Colors.black)),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                ),
                questionIndex != questionsList.length - 1
                    ? FloatingActionButton.extended(
                        heroTag: 'next',
                        backgroundColor: Colors.black,
                        onPressed: () {
                          if (questionIndex < questionsList.length - 1) {
                            setState(() {
                              questionIndex++;
                              selectedOption = null;
                            });
                          }
                        },
                        shape: const StadiumBorder(
                            side: BorderSide(color: Colors.black, width: 3)),
                        label: const Text('Next',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    : Consumer(builder: (context, ref, child) {
                        return FloatingActionButton.extended(
                          backgroundColor: const Color(0xFF1DBF73),
                          onPressed: () async {
                            ref.watch(isLoading.notifier).state = true;
                            showModalBottomSheet(
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (_) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: const ResponsesBottomSheet(),
                              ),
                            );
                            calculateFootprint(responses, ref, context);
                          },
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.green, width: 3)),
                          label: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        );
                      }),
              ],
            ),
            body: SafeArea(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                          .headlineSmall
                          ?.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
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
                          itemCount:
                              questionsList[questionIndex]['options'].length,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: selectedOption == index
                                  ? const Color(0xFF1DBF73)
                                  : Colors.transparent,
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
                                  responses.addAll(
                                      {questionIndex.toString(): index});
                                });
                              },
                              title: Text(
                                questionsList[questionIndex]['options'][index],
                                style: selectedOption == index
                                    ? const TextStyle(color: Colors.white)
                                    : const TextStyle(color: Colors.black),
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
