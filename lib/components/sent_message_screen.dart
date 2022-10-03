import 'package:flutter/material.dart';

class SentMessageScreen extends StatelessWidget {
  final String message;
  final String sender;
  final int dateHour;
  final int dateMinute;
  SentMessageScreen(
      {required this.message, required this.sender, required this.dateHour,required this.dateMinute});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Siz',
                    style: TextStyle(color: Colors.white, fontSize: 10)),
                Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '$dateHour:$dateMinute',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
