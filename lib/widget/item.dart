import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';


import 'package:nalezy/widget/on_hover_icon_button.dart';
class Item extends StatefulWidget {
  final String itemName;
  final String itemLocation;
  final String itemDateFound;
  final String itemDescription;

  final Image? itemImage;

  const Item({
    super.key,
    required this.itemName,
    required this.itemLocation,
    required this.itemDateFound,
    required this.itemDescription,
    this.itemImage,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isHovered = false;


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
      child: GestureDetector(
        onTap: () {
          print('Item tapped: ${widget.itemName}');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: isHovered ? AppTheme.hover2 : Colors.transparent, // Change background color on hover
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/default_pfp.png'),
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.itemName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_pin, size: 12),
                        SizedBox(width: 4,),
                        Text(
                            widget.itemLocation,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                            )
                          ),
                        const SizedBox(width: 64),
                        Text(
                            widget.itemDateFound,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 10,
                            )
                          ),
                        SizedBox(width: 4,),
                        Icon(Icons.date_range, size: 12),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.itemDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                      )
                    ),
                    //const SizedBox(height: 10,),
                    
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 8,),
                width: 16,
                height: 100,
                child: HoverIconButton(
                  icon: Icon(Icons.reply, size: 16,),
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  hasHoverColor: false,
                  onPressed: () {
                    // Handle reply button press
                  },
                ),
              )
            ],
          ),
        ),
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
OutlinedButton(
                  onPressed: (){

                  },

                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(20, 20),
                    maximumSize: Size(90, 80),
                  ),
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reply",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Icon(Icons.reply, size: 10,)
                    ]
                  ),

                )
*/