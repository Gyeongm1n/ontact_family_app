import 'package:flutter/material.dart';

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
              Container(
                height: 130,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ((MediaQuery.of(context).size.width - 40) / 2) - 5,
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: ((MediaQuery.of(context).size.width - 40) / 2) - 5,
                    margin: EdgeInsets.only(left: 5, bottom: 10),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ((MediaQuery.of(context).size.width - 40) / 2) - 5,
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: ((MediaQuery.of(context).size.width - 40) / 2) - 5,
                    margin: EdgeInsets.only(left: 5, bottom: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
