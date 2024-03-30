import 'package:flutter/material.dart';
import 'package:one_side_chat/config/theme/app_theme.dart';
import 'package:one_side_chat/presentation/providers/chat_provider.dart';
import 'package:one_side_chat/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider() ),],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme(selectedColor:2).theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
