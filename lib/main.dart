import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_me_app/constants/constants.dart';
import 'package:talk_with_me_app/providers/chat_provider.dart';
import 'package:talk_with_me_app/providers/models_provider.dart';
import 'package:talk_with_me_app/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: cardColor),
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          fontFamily: "Mulish",
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
