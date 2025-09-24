import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final textController = TextEditingController();
    final outputlineborder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30.0),
    );
    final inputdecoration = InputDecoration(
      enabledBorder: outputlineborder,
      focusedBorder: outputlineborder,
      hintText: 'Type your message',
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final text = textController.value.text;
          if (text.isEmpty) {
            print('no message to send');
            return;
          } else {
            print('send message as $text using button');
            textController.clear();
          }
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputdecoration,
      onFieldSubmitted: (value) {
        print('submited value $value using keyboard');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
