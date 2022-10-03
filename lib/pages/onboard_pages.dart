import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardPages extends StatelessWidget {
  OnboardPages({required this.colour,required this.urlImage, required this.title,required this.subtitle});
  final Color colour;
  final String urlImage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: colour,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.0,),
              Lottie.asset(urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
              ),
              Text(title,style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dongle-Regular',
              ),textAlign: TextAlign.center,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Text(subtitle,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Dongle-Regular'
                ),
                  textAlign: TextAlign.center
                  ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
