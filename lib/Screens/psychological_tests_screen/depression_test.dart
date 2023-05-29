
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../screens/screens_wrapper/screens_wrapper.dart';
import '../sessions_screen_for_normal_users/therapists_list_screen.dart';


class DepressionTest extends StatefulWidget {
  @override
  _DepressionTestState createState() => _DepressionTestState();
}

class _DepressionTestState extends State<DepressionTest> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Little interest or pleasure in doing things?',
      'answers': [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    },
    {
      'question': 'Feeling down, depressed, or hopeless?',
      'answers': [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    },
    {
      'question': 'Trouble falling or staying asleep, or sleeping too much?',
      'answers': [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    },
    {
      'question': 'Feeling tired or having little energy?',
      'answers': [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    },
    {
      'question': 'Poor appetite or overeating?',
      'answers': [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    },
  ];

  final List<int> _answers = [-1, -1, -1, -1, -1];

  void _submitAnswer(int answer) {
    setState(() {
      _answers[_currentIndex] = answer;
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        // Show advice
        int score = _answers.reduce((a, b) => a + b);
        String advice = '';
        if (score <= 4) {
          advice = 'You may be experiencing mild to no depression.';
        } else if (score <= 9) {
          advice = 'You may be experiencing moderate depression.';
        } else {
          advice =
              'You may be experiencing severe depression. Please seek help.';
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Your test result',
                  style: TextStyle(color: mainPurple),
                ),

                content: Text(
                  advice,
                  style: const TextStyle(color: Colors.black),
                ),
                actions: [

                  Center(
                    child: TextButton(
                      child: const Text('Thank you', style: TextStyle(color: mainPurple, fontWeight: FontWeight.w500), ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ScreensWrapper()),
                        );

                      },
                    ),
                  ),

                  Center(
                    child: TextButton(
                      child: const Text('Consult a professional',  style: TextStyle(color: mainPurple, fontWeight: FontWeight.w500),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  TherapistListScreen()),
                        );
                      },
                    ),
                  ),
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainWhite,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainWhite,
          leading: BackButton(color: mainPurple, onPressed: () => Navigator.pop(context),),
          title: const Text('Depression Test', style: TextStyle(color: mainPurple),),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _questions[_currentIndex]['question'],
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 16.0),

                          ...List.generate(
                            _questions[_currentIndex]['answers'].length,
                            (index) => RadioListTile(
                              title: Text(
                                _questions[_currentIndex]['answers'][index],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              value: index,
                              groupValue: _answers[_currentIndex],
                              onChanged: (value) => _submitAnswer(value!),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
