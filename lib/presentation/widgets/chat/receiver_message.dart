import 'package:flutter/material.dart';

class ReceiverMessageBubble extends StatelessWidget {
  const ReceiverMessageBubble({super.key});

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
            child: Text('Lorem Ipsum',style: TextStyle(color: colors.background),),
          ),
        ),
        const SizedBox(height: 10,),

        const _ImageBubble(),

        const SizedBox(height: 10,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/no/24-159febcfd655625c38c147b65e5be565.gif',
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
