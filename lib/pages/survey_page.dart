import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';


class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.topCenter,
            child: FutureBuilder<Task?> (
              future: getSampleTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  final task = snapshot.data!;
                  return SurveyKit(
                    onResult: (SurveyResult result) {
                      //print(result.results[0].results.first.result);
                      for (int i = 1; i < result.results.length-1; i++) {
                        print(result.results[i].results.first.result.value.toString());
                      }
                      Navigator.pop(context);
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'cancel': 'Cancel',
                      //'next': 'Next',
                    },
                    themeData: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.cyan,
                      ).copyWith(
                        onPrimary: Colors.white,
                      ),
                      primaryColor: Colors.cyan,
                      backgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                        color: Colors.white,
                        iconTheme: IconThemeData(
                          color: Colors.cyan,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.cyan,
                          //backgroundColor: Colors.blue,
                        ),
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.cyan,
                      ),
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.cyan,
                        selectionColor: Colors.cyan,
                        selectionHandleColor: Colors.cyan,
                      ),
                      cupertinoOverrideTheme: CupertinoThemeData(
                        primaryColor: Colors.cyan,
                      ),
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(150.0, 60.0),
                          ),
                          side: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return BorderSide(
                                  color: Colors.grey,
                                );
                              }
                              return BorderSide(
                                color: Colors.cyan,
                              );
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                  color: Colors.grey,
                                );
                              }
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                color: Colors.cyan,
                                fontSize: 20.0,
                              );
                            },
                          ),
                        ),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.cyan,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      textTheme: TextTheme(
                        headline2: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          letterSpacing: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                        headline5: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        bodyText2: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle1: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: '진단 검사',
          text: '',
          buttonText: '시작',
        ),
        QuestionStep(
          title: '',
          text: '1. 우울감',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: '2. 불안감',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: '3. 외로움',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: '4. 활동 어려움',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: '5. 식사 어려움',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: '6. 수면 어려움',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '문제없음', value: '1'),
              TextChoice(text: '조금', value: '2'),
              TextChoice(text: '보통', value: '3'),
              TextChoice(text: '많이', value: '4'),
              TextChoice(text: '문제심각', value: '5'),
            ],
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: '완료',
          title: '완료',
          buttonText: '완료',
        ),
      ],
    );

    return Future.value(task);
  }


}