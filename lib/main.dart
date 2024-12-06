import 'package:cook/Forghet%20Password.dart';
import 'package:cook/Meal%20Cart.dart';
import 'package:cook/Meal%20Details.dart';
import 'package:cook/Meal%20Listing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MealCartPage()//ForgotPasswordScreen(),
    );
  }
}

