
import 'package:flutter/material.dart';
//import 'package:footer/footer.dart';
//import 'package:footer/footer_view.dart';

import 'package:nalezy/widget/chat_message.dart';

import 'package:nalezy/themes/main_theme.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});
  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {

  final TextEditingController messageTextController = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  /*String formatTimeStamp(DateTime timestamp) {
    return DateFormat('MMM-d-yy hh:mm a').format(timestamp);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.normal,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Padding (
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },

                child: Icon(Icons.arrow_back, color: AppTheme.iconColorSecondary),
              ),
              SizedBox(width: 8,),
              CircleAvatar(
                backgroundImage:  AssetImage('assets/default_pfp.png'),
                radius: 25,
              ),
              SizedBox(width: 12,),
              Text("Nazov Nalezu", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index){
            final message = messages[index];
            final isSender = message["sender"] == false;

            return Align(
              alignment: isSender
              ? Alignment.centerRight
              : Alignment.centerLeft,

              child: ChatMessage(
                isSender: isSender, 
                message: message["message"], 
                sent: true, 
                dateSent: Text(message['dateSent'], 
                    style: TextStyle(
                      color: AppTheme.slightlyGray,
                      fontSize: 8,
                      )),
              )
            );
          }
        ),
              
      ),
      bottomSheet: Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 6, horizontal: 12),
        color: AppTheme.normal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Send message ...",
                          filled: true,
                          fillColor: AppTheme.inputFieldBg,
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppTheme.normal)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppTheme.active)
                          ),
                        ),
                        controller: messageTextController,
                        maxLines: 4,
                        minLines: 1,
                      ),
                    ),
                ),
                SizedBox(width: 6,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: AppTheme.normal,
                      child: Icon(Icons.send, color: AppTheme.iconColorDefault, size: 32,),
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
      

    );

  }

  void sendMessage (){
    if (messageTextController.text.isNotEmpty){
      setState(() {
        messages.add({
          'message' : messageTextController.text.trim(),
          'sender' : false,
          'dateSent' : DateTime.now().toString()
        });
      });

      messageTextController.clear();
    }
  }
  
}