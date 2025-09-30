import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:yes_or_no/presentation/screen/yes_no/yes_or_no_screen.dart';
import 'package:yes_or_no/presentation/screen/chat/chat_screen.dart';
import 'package:yes_or_no/config/theme/app_theme.dart';
import 'package:yes_or_no/presentation/screen/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/screen/yes_no/yes_or_no_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes or No',
        theme: AppTheme(2, 0).themeData(),
        home: const ChatScreen(),
      ),
    );
  }
}
