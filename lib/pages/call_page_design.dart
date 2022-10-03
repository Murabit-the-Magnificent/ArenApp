import 'package:arenapp/components/rounded_button.dart';
import 'package:arenapp/pages/call_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CallPageDesign extends StatefulWidget {
  const CallPageDesign({Key? key}) : super(key: key);

  @override
  _CallPageDesignState createState() => _CallPageDesignState();
}

class _CallPageDesignState extends State<CallPageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/jsons/video_conference.json'),
        RoundedButton(colour: Colors.red.shade900, buttonTitle: 'Konferansa Katıl', onPressed: (){
          Navigator.pushNamed(context, CallPage.id);
        }
            ),
          ],
        ),
      ),
    );
  }
}
