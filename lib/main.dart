import 'package:chat_app_flutter/providers/theme_provider.dart';
import 'package:chat_app_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProvider.of(context).colors.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
        ),
        drawer: const Drawer(
          child: Center(
            child: Text("To Implement"),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}
