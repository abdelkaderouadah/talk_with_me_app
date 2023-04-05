import 'package:flutter/material.dart';
import 'package:talk_with_me_app/constants/constants.dart';
import 'package:talk_with_me_app/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: cardColor),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const ChatScreen(),
    );
  }
}
