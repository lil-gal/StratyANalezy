import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nalezy/widget/date_time_form_field.dart';
import 'package:nalezy/widget/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'package:nalezy/widget/footer.dart';

import 'package:nalezy/api.dart' as api;

class CreatePostPage extends StatefulWidget{
  //idk?
  final String title;
  
  //constructor ig?
  const CreatePostPage({super.key, required this.title});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}


class _CreatePostPageState extends State<CreatePostPage> {
  XFile? _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(12,0,12,0),
        child: Form(child:Column(
          spacing: 16,
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

            FractionallySizedBox(
              widthFactor: 0.45,
              child: ImagePickerSquare(
                onChanged: (file) => _image = file, // store it in your form state
              ),
            ),

            SizedBox( // input Name
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Meno objektu'
                ),
              ),


            ),
            SizedBox( // input Desc
              width: double.infinity,
              child: TextField(
                minLines: 2,
                maxLines: 2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Popisok',
                  alignLabelWithHint: true
                ),
              ),


            ),

            SizedBox( // datetime
              width: double.infinity,
              child: DateTimeFormField(
                label: "Dátum a čas",
                initialValue: DateTime.now(),
              )
              
            ),
            SizedBox( // Temporary, replace with map
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TODO map'
                ),
              ),


            ),

            // add map input

            SizedBox( // button
              width: double.infinity,
              
              
              child: ElevatedButton(
                onPressed: () {api.test();},
                
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  )
                ),

                child: Text("Vytvoriť príspevok")
              )
              
            ),
          
          ],
        ),
      )),
      bottomNavigationBar: Footer()
    );
  }
}