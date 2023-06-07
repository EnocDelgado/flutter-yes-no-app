import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hey Bruno, Have you been finihed homework?', fromWho: FromWho.me),
    Message(text: 'No', fromWho: FromWho.friend)
  ];

  Future<void> sendMessage(String text) async {
    // Validation
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    // add new message to list
    messageList.add(newMessage);

    // validation
    if (text.endsWith('?')) {
      await theirReplay();
    }

    // its like setState(() {}) || Notify to all listen these changes
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> theirReplay() async {
    final friendMessage = await getYesNoAnswer.getAnswer();
    messageList.add(friendMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // Optical senation that message is proccessing
    await Future.delayed(const Duration(microseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, // maximun scroller view
        duration: const Duration(milliseconds: 300), // time to init movement
        curve: Curves.easeOut);
  }
}
