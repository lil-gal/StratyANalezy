import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

class LostItem extends StatefulWidget{

  final String itemName;
  final String itemLocation;
  final String itemDateFound;
  final String itemDescription;

  final Image? itemImage;

  const LostItem({
    super.key,
    required this.itemName,
    required this.itemLocation,
    required this.itemDateFound,
    required this.itemDescription,
    this.itemImage,
  });

  @override
  State<LostItem> createState() => _LostItemState();
}

class _LostItemState extends State<LostItem>{

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Image(image: AssetImage('assets/default_pfp.png')),
        Column(
          children: [
            Text(
              widget.itemName,
            ),

            SizedBox(height: 8, width: 0,),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.itemLocation,
                ),
                Text(
                  widget.itemDateFound,
                )
              ],
            ),

            SizedBox(height: 8, width: 0,),

            Text(
              widget.itemDescription,
            )
          ],
        )
      ],
    );
  }
}