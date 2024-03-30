import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_side_chat/domain/entities/message.dart';
import 'package:one_side_chat/presentation/providers/chat_provider.dart';
import 'package:one_side_chat/presentation/widgets/chat/message_field_box.dart';
import 'package:one_side_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:one_side_chat/presentation/widgets/chat/bot_message.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: colors.primary,
          flexibleSpace:
           Column(
            children: [
              const SizedBox(
                height: 17,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://preview.redd.it/emma-myers-photoshoot-v0-dwc1759qktha1.jpg?width=640&crop=smart&auto=webp&s=79f317d7e8a147409a17c7bb455956c0452abb7e'),
                        radius: 45,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text('ChatBot',style: GoogleFonts.overpass(textStyle: TextStyle(fontSize: 28, color: colors.background ))),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
  const _ChatView({super.key});



  @override
  Widget build(BuildContext context) {


    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
        child:
        Column(
          children: [
            Expanded(
                child:ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                  return (message.fromWho==FromWho.bot)?BotMessageBubble(message: message,):MyMessageBubble(message: message,);
                },)
            ),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),),
          ],
        )
    );
  }
}
