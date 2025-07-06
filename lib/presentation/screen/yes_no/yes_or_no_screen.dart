import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_or_no/config/theme/app_theme.dart';

class YesOrNoScreen extends StatefulWidget {
  const YesOrNoScreen({super.key});

  @override
  State<YesOrNoScreen> createState() => _YesOrNoScreenState();
}

class _YesOrNoScreenState extends State<YesOrNoScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes or No',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(2, isDarkMode ? 1 : 0).themeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yes or No'),
          centerTitle: true,
          actions: [
            CupertinoSwitch(
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do you want to continue?',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('Yes')),
                  const SizedBox(width: 10),
                  FilledButton(onPressed: () {}, child: const Text('No')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
