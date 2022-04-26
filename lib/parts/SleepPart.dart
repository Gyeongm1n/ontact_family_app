import 'package:flutter/material.dart';

class SleepPart extends StatefulWidget {
  const SleepPart({Key? key}) : super(key: key);

  @override
  State<SleepPart> createState() => _SleepPartState();
}

class _SleepPartState extends State<SleepPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: ((MediaQuery.of(context).size.width - 40) / 2) - 13,
      margin: EdgeInsets.only(right: 5, bottom: 10, left: 5),
      height: 180,
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
    );
  }
}
