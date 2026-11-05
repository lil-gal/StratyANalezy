import 'package:flutter/material.dart';
//import 'package:footer/footer.dart';
//import 'package:footer/footer_view.dart';

import 'package:nalezy/widget/chat_row.dart';
import 'package:nalezy/widget/footer.dart';

import 'package:nalezy/themes/main_theme.dart';

class ChatsPage extends StatefulWidget {
  final String title;
  
  const ChatsPage({super.key, required this.title});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

List<Map<String, dynamic>> chatRooms = [
  {
    "chatName": "John Doe",
    "lastMessage": "Hey, how are you doing?",
    "timestamp": "10:30 AM",
    "avatarImage": 'assets/default_pfp.png',
  },

  {
    "chatName": "Jane Smith",
    "lastMessage": "See you tomorrow!",
    "timestamp": "9:15 AM",
    "avatarImage": 'assets/default_pfp.png',
  },

  {
    "chatName": "Patrick Jane",
    "lastMessage": "I know what you did last summer.",
    "timestamp": "11:47 PM",
    "avatarImage": 'assets/default_pfp.png',
  },
];


class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },

                child: Icon(Icons.arrow_back, color: AppTheme.iconColorSecondary),
              ),
        title: Text(widget.title),
        backgroundColor: AppTheme.normal,
      ),
      body: ListView.builder(
              itemCount: chatRooms.length,
              itemBuilder: (context, index) {
                final room = chatRooms[index];
                return ChatRow (
                  chatName: room["chatName"],
                  lastMessage: room["lastMessage"],
                  timestamp: room["timestamp"],
                  avatarImage: room["avatarImage"],
                );
              }
            ),
            bottomNavigationBar: Footer(),
      

    );
  }
}