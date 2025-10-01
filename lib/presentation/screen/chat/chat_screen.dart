import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/domain/entities/message.dart';
import 'package:yes_or_no/presentation/screen/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/screen/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_no/presentation/screen/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_no/presentation/screen/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.redd.it/fcnh4ty49i791.png',
            ),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              //child: Container(color: const Color.fromARGB(255, 98, 167, 224)),
              child: ListView.builder(
                reverse: true,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.her)
                      ? HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
