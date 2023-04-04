import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';



class Question{
  String question;
  List <Answer> answers;

  Question({
     required this.question,
     required this.answers
  });
}

class Answer{
  String text;
  bool isSelected;
  Answer({
    required this.text,
     this.isSelected = false,
  });
}

Question sampleQuestion1 = Question(question: 'Little interest or pleasure in doing things?', answers: answers);

List <Answer> answers = [
  Answer(text: 'Not at all',),
  Answer(text: 'Several days',),
  Answer(text: 'More than half the days',),
  Answer(text: 'Nearly every day',),
];

class QuestionCard extends StatefulWidget {
  final Question question;
  final int selectedAnswer;

  QuestionCard({
    required this.question,
    required this.selectedAnswer,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Widget build(BuildContext context) {
    return Container(
      color: lightLavender,
      margin: const EdgeInsets.all(2),
      child: Card(
        color: lightOrange,

        clipBehavior: Clip.hardEdge,
        shadowColor: mainPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

        ),


          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(


              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Row(
                      children: [

                        const SizedBox(height: 8.0),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),

                            Text(
                              '${widget.question.question} ',
                              style: const TextStyle(color: navyBlue, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),


                            ListView.builder(
                              itemCount: widget.question.answers.length,
                              itemBuilder: (context, index) {
                                return SwitchListTile(
                                  // 2.
                                  title: Text(widget.question.answers[index].text),
                                  // 3.
                                  value: widget.question.answers[index].isSelected,
                                  // 4.
                                  onChanged: (bool value) {
                                    setState(() {
                                      widget.question.answers[index].isSelected = value;
                                    });
                                  },
                                );


                                //   ListTile(
                                //   leading:
                                //
                                //
                                //   title: Text('Item ${question.answers[index]}'),
                                // );
                              },
                            ),

                          ],
                        ),

                        const SizedBox(width: 40),
                      ],
                    ),
                    //   SizedBox(height: 40,),



                  ],
                ),

              ),
            ),
          ),
        ),
      );



  }
}