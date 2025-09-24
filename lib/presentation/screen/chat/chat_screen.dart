import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              //child: Container(color: const Color.fromARGB(255, 98, 167, 224)),
              child: ListView.builder(
                reverse: true,
                itemCount: 101,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const MyMessageBubble()
                      : const HerMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
