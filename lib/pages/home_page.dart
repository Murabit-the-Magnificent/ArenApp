import 'package:arenapp/components/navigation_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:arenapp/components/constants.dart';
import 'calendar_page.dart';
import 'call_page_design.dart';
import 'chat_page_design.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationKKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;
  final screens = [
    CalendarPage(),
    ChatPageDesign(),
    CallPageDesign(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.calendar_today,size: 30,color: Colors.white,),
      Icon(Icons.message,size: 30,color: Colors.white,),
      Icon(Icons.call,size: 30,color: Colors.white,),
    ];
    return SafeArea(
      child: ClipRect(
        child: Scaffold(
          drawer: NavigationDrawer(),
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 20.0,
            shadowColor: Colors.black54,
            title: kLabelTextStyle1('ArenApp', Colors.white),
            backgroundColor: kBackgroundColor,
          ),
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            color: Color(0xFF297739),
            animationDuration: Duration(milliseconds: 300),
            items: items,
            index: index,
            onTap:(index) => setState(() =>
            this.index = index),
          ),
        ),
      ),
    );
  }
}

