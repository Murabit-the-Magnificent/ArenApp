import 'package:arenapp/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ChatPageDesign extends StatefulWidget {
  const ChatPageDesign({Key? key}) : super(key: key);

  @override
  _ChatPageDesignState createState() => _ChatPageDesignState();
}

class _ChatPageDesignState extends State<ChatPageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MessageGroup(),
        ]
      ),

    );
  }
}

class MessageGroup extends StatelessWidget {
  const MessageGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ChatPage.id);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('GroupName',style: TextStyle(fontFamily: 'Dongle-Regular',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                Text('Last Message Sender: Last Message...',style: TextStyle(color: Colors.white70),),
                Text('Last Message Sent Time',style: TextStyle(color: Colors.white70),textAlign: TextAlign.right,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
