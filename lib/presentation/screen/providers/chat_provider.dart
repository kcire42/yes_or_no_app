import 'package:flutter/material.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hello', fromWho: FromWho.me),
    Message(text: 'How are you?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {}
}
