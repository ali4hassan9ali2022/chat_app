import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = "ChatView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Chat"),
            ),
            Image.asset(
              "assets/images/scholar.png",
              height: 60,
            ),
          ],
        ),
      ),
      
    );
  }
}
