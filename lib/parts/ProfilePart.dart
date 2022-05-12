import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ontact_family_app/services/shared_service.dart';

class ProfilePart extends StatefulWidget {
  const ProfilePart({Key? key}) : super(key: key);

  @override
  State<ProfilePart> createState() => _ProfilePartState();
}

class _ProfilePartState extends State<ProfilePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 130,
      margin: EdgeInsets.only(bottom: 20, left: 5, right: 5, top: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://picsum.photos/300/300.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:  MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '이준석',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.man,
                        size: 15.0,
                      ),
                      Text(
                        '24',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Text('173cm / 62kg'),
                  Text('일일 평균 : 7,864 걸음'),
                ],
              )
            ],
          ),
          // IconButton(
          //   alignment: Alignment.topRight,
          //   icon: Icon(Icons.settings),
          //   iconSize: 25.0,
          //   onPressed: (){
          //     SharedService.logout(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
