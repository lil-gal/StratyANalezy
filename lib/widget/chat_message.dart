import 'package:flutter/material.dart';
import 'package:nalezy/themes/main_theme.dart';



class ChatMessage extends StatefulWidget{

  final bool isSender;
  final String message;
  final Widget dateSent;
  final bool sent;
  final bool delivered = false;
  final bool read = false;

  const ChatMessage({
    super.key,
    required this.isSender,
    required this.message,
    required this.sent,
    required this.dateSent,
  });

  @override
  _ChatMessageState createState() => new _ChatMessageState();
}


class _ChatMessageState extends State<ChatMessage>{

  bool get isSender => widget.isSender;
  String get message => widget.message;
  Widget get dateSent => widget.dateSent;

  bool get sent => widget.sent;
  bool get delivered => widget.sent;
  bool get read => widget.sent;



  Widget build(BuildContext context){

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),

        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .8
        ),
        decoration: BoxDecoration(
          color: isSender ? AppTheme.hover : AppTheme.hoverAlt,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12), 
            bottomLeft: isSender ? Radius.circular(12) : Radius.zero, 
            bottomRight: isSender ? Radius.zero : Radius.circular(12)
          ),
        ),
        child: Column(
          children: [
            Text(
              message,
              textAlign: isSender ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: AppTheme.textDefault, 
                fontSize: 14,
                )  
            ),
            SizedBox(height: 4,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                dateSent,
                SizedBox(width: 4,),
                sent ? Icon(Icons.check, size: 16, color: AppTheme.slightlyGray)
                    : Icon(Icons.timer, size: 16, color: AppTheme.slightlyGray),
              ],
            ),
          ],
        ),

      )
      
      
    );
  }
}