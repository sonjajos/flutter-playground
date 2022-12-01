import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/screens/home.dart';
import 'package:my_first_flutter_app/screens/profile.dart';

import '../utilities/routes.dart';

class AuthenticatedNavigator extends StatelessWidget {
  const AuthenticatedNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Flutter App",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          caption: TextStyle(
            color: Colors.white,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        homeScreen: (context) => const HomeScreen(),
        profileScreen: (context) => const ProfileScreen(),
      },
    );
  }
}
