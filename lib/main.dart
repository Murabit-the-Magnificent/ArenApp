import 'package:arenapp/data/updates.dart';
import 'package:arenapp/pages/chat_page.dart';
import 'package:arenapp/pages/contacts.dart';
import 'package:arenapp/pages/settings_page.dart';
import 'package:arenapp/pages/square.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:arenapp/pages/welcome_page.dart';
import 'package:arenapp/pages/login_page.dart';
import 'package:arenapp/pages/registration_page.dart';
import 'package:arenapp/pages/home_page.dart';
import 'package:arenapp/pages/onboarding_page.dart';
import 'pages/call_page.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          OnboardingPageState.id:(context) => const OnboardingPageState(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          ChatPage.id: (context) => const ChatPage(),
          CallPage.id: (context) => const CallPage(),
          SettingsPage.id: (context) => const SettingsPage(),
          ContactsPage.id: (context) => const ContactsPage(),
          UpdatePage.id: (context) => const UpdatePage(),
          SquarePage.fromGallery:(context) => SquarePage(isGallery: true),
          SquarePage.fromCamera:(context) => SquarePage(isGallery: false)
        }
    );
  }

}