import 'package:flutter/material.dart';
//import 'package:footer/footer.dart';
//import 'package:footer/footer_view.dart';

import 'package:nalezy/widget/chat_row.dart';
import 'package:nalezy/widget/footer.dart';

import 'package:nalezy/themes/main_theme.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key, required this.title});
  final String title;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}


class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        backgroundColor: AppTheme.normal,
      ),
      body: ListView(
              children: [
                ChatRow(
                  chatName: "John Doe",
                  lastMessage: "Hey, how are you doing?",
                  timestamp: "10:30 AM",
                  avatarImage: 'assets/default_pfp.png',
                ),
                ChatRow(
                  chatName: "Jane Smith",
                  lastMessage: "See you tomorrow!",
                  timestamp: "9:15 AM",
                  avatarImage: 'assets/default_pfp.png',
                ),
                ChatRow(
                  chatName: "Patrick Jane",
                  lastMessage: "I know what you did last summer.",
                  timestamp: "11:47 PM",
                  avatarImage: 'assets/default_pfp.png',
                ),
              ]
            ),
            bottomNavigationBar: Footer(),
      

    );

  }
}