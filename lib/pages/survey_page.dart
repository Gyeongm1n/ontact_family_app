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
            alignment: Alignment.center,
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                            (route) => false,
                      );
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'cancel': 'Cancel',
                      'next': 'Next',
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
                            ),
                          ),
                        ),
                      ),
                      textTheme: TextTheme(
                        headline2: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                        headline5: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                        bodyText2: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        subtitle1: TextStyle(
                          fontSize: 18.0,
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
          title: '시작',
          text: '시작',
          buttonText: '시작',
        ),
        QuestionStep(
          title: '1번',
          text: '매사에 흥미나 즐거움이 거의 없다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '2번',
          text: '기분이 가라앉거나 우울하거나 희망이 없다고 느낀다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '3번',
          text: '잠들기 어렵거나 자주 깬다. 혹은 잠을 너무 많이 잔다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '4번',
          text: '피곤하다고 느끼거나 기운이 거의 없다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '5번',
          text: '식욕이 줄었다. 혹은 너무 많이 먹는다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '6번',
          text: '내 자신이 실패자로 여겨지거나 자신과 가족을 실망시켰다고 느낀다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '7번',
          text: '신문을 읽거나 TV를 보는 것과 같은 일상적인 일에 집중하기 어렵다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '8번',
          text: '다른 사람들이 눈치 첼 정도로 평소보다 말과 행동이 느리다. 혹은 너무 안절부절 못해서 가만히 앉아 있을 수 없다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
            ],
          ),
        ),
        QuestionStep(
          title: '9번',
          text: '차라리 죽는 것이 낫겠다고 생각하거나, 어떻게든 자해를 하려고 생각한다.',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: '전혀없음', value: '1'),
              TextChoice(text: '며칠동안', value: '2'),
              TextChoice(text: '1주일 이상', value: '3'),
              TextChoice(text: '거의 매일', value: '4'),
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