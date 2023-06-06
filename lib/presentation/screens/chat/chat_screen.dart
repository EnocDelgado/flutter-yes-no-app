import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/friend_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child:  CircleAvatar(
            backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/4/374/png-clipart-miles-morales-ultimate-spider-man-ultimate-collection-venom-iron-man-sai-comics-superhero.png"),
          ),
        ),
        title:  const Text("Bruno"),
        centerTitle: false,
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ( index % 2 == 0 )
                  ? const FriendMessageBubble()
                  : const MyMessageBubble();
                }
                )),
            // Chat Box
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}