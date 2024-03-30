import 'package:flutter/material.dart';
import 'package:one_side_chat/domain/entities/message.dart';
class MyMessageBubble extends StatelessWidget {

 final Message message;
  MyMessageBubble({super.key,required this.message});


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(

      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox( height: 6,),
        Container(
          decoration: BoxDecoration(color: colors.onBackground, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text,style: TextStyle(color: colors.background),),
          ),
        ),
        const SizedBox(height: 6,),
      ],
    );
  }
}

