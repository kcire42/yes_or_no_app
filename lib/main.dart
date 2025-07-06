import 'package:flutter/material.dart';
//import 'package:yes_or_no/presentation/screen/yes_no/yes_or_no_screen.dart';
import 'package:yes_or_no/presentation/screen/chat/chat_screen.dart';
import 'package:yes_or_no/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yes or No',
      theme: AppTheme(2, 0).themeData(),
      home: const ChatScreen(),
    );
  }
}
