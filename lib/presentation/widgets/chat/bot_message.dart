import 'package:flutter/material.dart';
import 'package:one_side_chat/domain/entities/message.dart';

class BotMessageBubble extends StatelessWidget {
  final Message message;
  const BotMessageBubble({super.key,required this.message});
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(color: colors.primary, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text,style: TextStyle(color: colors.background),),
          ),
        ),
        const SizedBox(height: 10,),

        _ImageBubble(message.imageURL ?? 'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif',),

        const SizedBox(height: 10,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageURL;
  const _ImageBubble(this.imageURL);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageURL!,
        height: size.height*0.3,
        width: size.width*0.7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress==null) return child;

          return SizedBox(
            height: size.height*0.3,
            width: size.width*0.7,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Su mensaje está cargando'),
            ),
          );
        },
      ),

    );
  }
}
