import 'package:chat_app/Views/login_view.dart';
import 'package:chat_app/Views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        LoginView.id: (context)=> const LoginView(),
        RegisterView.id: (context)=> const RegisterView(),
      },
      initialRoute: LoginView.id,
    );
  }
}