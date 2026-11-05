import 'package:flutter/material.dart';

import 'package:nalezy/widget/footer.dart';


import 'package:nalezy/themes/main_theme.dart';

class CreatePostPage extends StatefulWidget{
  //idk?
  final String title;
  
  //constructor ig?
  const CreatePostPage({super.key, required this.title});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(12,0,12,0),
        child:Column(
          children: [
          
            DropdownMenu(
              enableSearch: false,
              requestFocusOnTap: false,

              initialSelection: true,
              
              inputDecorationTheme: const InputDecorationTheme(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.zero,
              ),
              
              width: MediaQuery.of(context).size.width,

              //this influences the dropdown popup
              // menuStyle: MenuStyle(
              //   backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              //   elevation: WidgetStatePropertyAll<double>(0),
              // ),
              textStyle: TextStyle(fontSize: 40),
              
              dropdownMenuEntries: [
                DropdownMenuEntry(value: true, label: "Najdeny objekt"),
                DropdownMenuEntry(value: false, label: "Strateny objekt")
              ],
            ),
            SizedBox(
              width: double.infinity,
              
              
              child: ElevatedButton(
                onPressed: () {},

                
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  )
                ),

                child: Text("Text")
              )
              
            ),
          
          ],
        ),
      ),
      bottomNavigationBar: Footer()
    );
  }
}