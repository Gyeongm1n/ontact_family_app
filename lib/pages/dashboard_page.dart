import 'package:flutter/material.dart';
import 'package:ontact_family_app/parts/CaloriesPart.dart';
import 'package:ontact_family_app/parts/ExercisePart.dart';
import 'package:ontact_family_app/parts/HeartratePart.dart';
import 'package:ontact_family_app/parts/ProfilePart.dart';
import 'package:ontact_family_app/parts/SleepPart.dart';
import 'package:ontact_family_app/parts/StepPart.dart';

// 구성구성원 한명의 정보를 나타내는 클래스
class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfilePart(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeartratePart(),
                  StepPart(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CaloriesPart(),
                  ExercisePart(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SleepPart(),
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  //color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
