import 'package:flutter/material.dart';
import 'dart:async';

import 'package:nalezy/themes/main_theme.dart';



import 'package:nalezy/widget/on_hover_icon_button.dart';
class Item extends StatefulWidget {
  final String itemName;
  final String itemLocation;
  final DateTime itemDateFound;
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
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final age = DateTime.now().difference(widget.itemDateFound);
    

    final interval = age.inMinutes < 1
        ? const Duration(seconds: 1)
        : age.inHours > 0 ? Duration(minutes: 1) : Duration(seconds: 0);

    _timer = Timer.periodic(interval, (timer) {
      if (!mounted) return;

      setState(() {});
      
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


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
          child: Column (
            spacing: 2,
            children: [
              IntrinsicHeight ( child: Row( //img + texts
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Image( //img
                    image: const AssetImage('assets/default_pfp.png'),
                    height: 100,
                    width: 100,
                  ),
                  Expanded( //title + desc
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.itemName,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.h3_Style
                        ),

                        Text( //description
                          widget.itemDescription,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.desc_Style
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Row( //place + date
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row( //place
                    children: [
                      Icon(Icons.location_pin, size: 12),
                      SizedBox(width: 4,),
                      Text(
                        widget.itemLocation,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text_Style
                      ),
                    ]
                  ),
                  Row( //date
                        spacing: 4,
                        children: [
                          Text(
                            widget.itemDateFound.timeAgo(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: AppTheme.text_Style
                          ),
                          Icon(Icons.date_range, size: 12),
                        ]
                      ),
                ]
              ),
            ]
          )
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



extension DateTimeExtension on DateTime {
  String timeAgo({
    bool numericDates = true,
    DateTime? reference,
  }) {
    final now = reference ?? DateTime.now();
    final difference = now.difference(this);
    final isFuture = difference.isNegative;
    final duration = difference.abs();

    String format(int value, String unit) {
      return '${isFuture ? 'o' : 'pred'} $value $unit';
              //10   ?           ?                        ago/from now
    }

    // Less than 5 seconds
    if (duration.inSeconds < 5) {
      return 'Teraz';
    }

    // Seconds
    if (duration.inSeconds < 60) {
      return format(duration.inSeconds, 's');
    }

    // Minutes
    if (duration.inMinutes < 60) {
      final minutes = duration.inMinutes;

      if (minutes == 1 && !numericDates) {
        return isFuture ? 'O minútu' : 'Pred minútou';
      }

      return format(minutes, 'min');
    }

    // Hours
    if (duration.inHours < 24) {
      final hours = duration.inHours;

      if (hours == 1 && !numericDates) {
        return isFuture ? 'O hodinu' : 'Pred hodinou';
      }

      return format(hours, 'h');
    }

    // Days
    if (duration.inDays < 7) {
      final days = duration.inDays;

      if (days == 1 && !numericDates) {
        return isFuture ? 'Zajtra' : 'Včera';
      }

      return format(days, 'day');
    }

    // Weeks
    if (duration.inDays < 30) {
      final weeks = (duration.inDays / 7).floor();

      if (weeks == 1 && !numericDates) {
        return isFuture ? 'Budúci týždeň' : 'Minulý týždeň';
      }

      return format(weeks, 't');
    }

    // Months (approximate)
    if (duration.inDays < 365) {
      final months = (duration.inDays / 30).floor();

      if (months == 1 && !numericDates) {
        return isFuture ? 'Budúci mesiac' : 'Minulý mesiac';
      }

      return format(months, 'm');
    }

    // Years (approximate)
    final years = (duration.inDays / 365).floor();

    if (years == 1 && !numericDates) {
      return isFuture ? 'Budúci rok' : 'Minulý rok';
    }

    return format(years, 'r');
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