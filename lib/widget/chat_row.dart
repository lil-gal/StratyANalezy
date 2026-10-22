import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';



class ChatRow extends StatefulWidget {
  final String chatName;
  final String lastMessage;
  final String timestamp;
  final String? avatarImage;

  const ChatRow({
    Key? key,
    required this.chatName,
    required this.lastMessage,
    required this.timestamp,
    this.avatarImage,
  }) : super(key: key);


  @override
  _ChatRowState createState() => _ChatRowState();
}

class _ChatRowState extends State<ChatRow> {

  String get chatName => widget.chatName;
  String get lastMessage => widget.lastMessage;
  String get timestamp => widget.timestamp;
  String? get avatarImage => widget.avatarImage;


  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: ListTile(
        leading: CircleAvatar(
                backgroundImage: avatarImage != null
                    ? AssetImage(avatarImage!)
                    : const AssetImage('assets/default_pfp.png'),
                radius: 25,
              ),
        title: Text(
          chatName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.textDisabled),
        ),
        subtitle: Text(
          lastMessage,
          style: const TextStyle(color: AppTheme.gray, fontSize: 14),
        ),
        trailing: Container(
                width: 110,
                child: Row(
                  mainAxisAlignment: isHovered ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                  children: [
                    isHovered ?  IconButton(
                      icon: Icon(Icons.delete),
                      iconSize: 16,
                      onPressed: () {
                        // Handle delete action
                      },
                    ) : const SizedBox.shrink(),
                    Text(
                      timestamp,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
        onTap: () {
          Navigator.popAndPushNamed(context, '/chat');
        },
      ),
      
    );

  }

  void _onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}


/*

ListTile(
      leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(avatarImage != null ? avatarImage! : 'assets/default_pfp.png'),
        ),
      title: Text(chatName),
      subtitle: Text(lastMessage),
      trailing: Container(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.delete, size: 16),
              Text(timestamp),
            ],
        ),),
      onTap: () {
        // Handle chat row tap
      },
    );

*/
