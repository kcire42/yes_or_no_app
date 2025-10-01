import 'package:flutter/material.dart';
import 'package:yes_or_no/presentation/screen/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

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
            debugPrint('message is empty, not sending');
            return;
          } else {
            debugPrint('send message as $text using button');
            onValue(text);
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
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
