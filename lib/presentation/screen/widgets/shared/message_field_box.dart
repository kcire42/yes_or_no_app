import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outputlineborder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30.0),
    );

    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: outputlineborder,
        focusedBorder: outputlineborder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
