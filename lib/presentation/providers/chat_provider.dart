import 'package:flutter/material.dart';
import 'package:one_side_chat/config/helpers/get_yes_no_answer.dart';
import 'package:one_side_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{


  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList=[
    Message(text: 'Hola',fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if (text.trim().isEmpty)return;
    final newMessage = Message(text: text, fromWho:FromWho.me);

    messageList.add(newMessage);

    if(text.endsWith('?'))botReply();
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.extentTotal,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> botReply() async{
    final botMessage = await getYesNoAnswer.getAnswer();

    messageList.add(botMessage);
    notifyListeners();
    moveScrollToBottom();

  }
}