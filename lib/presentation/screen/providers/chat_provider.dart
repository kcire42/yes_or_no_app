import 'package:flutter/material.dart';
import 'package:yes_or_no/config/helpers/get_yes_no_answer.dart';
import 'package:yes_or_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hello there!', fromWho: FromWho.me),
    Message(text: 'How are you?', fromWho: FromWho.me),
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getanswer();
    messageList.insert(0, herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.insert(0, newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }
}
