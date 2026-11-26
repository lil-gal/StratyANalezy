import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/item.dart';

class ItemsScroll extends StatefulWidget {
  final String title;
  final String redirect;

  const ItemsScroll({
    required this.title,
    required this.redirect,
    super.key,
  });

  @override
  State<ItemsScroll> createState() => _ItemsScrollState();
}

class _ItemsScrollState extends State<ItemsScroll> {

  //delete and replace with fetch up to 2 random(?) items
  List<Map<String, dynamic>> items = [
    {
      "itemName": "Item1",
      "itemLocation": "Bratislava",
      "itemDateFound": DateTime.now(),
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    },{
      "itemName": "Item2",
      "itemLocation": "Bratislava",
      "itemDateFound": DateTime(2026,6,23),
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: AppTheme.normal,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, widget.redirect);
                  },
                  child: Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: AppTheme.textDefault,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppTheme.textDefault,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Item(
                    itemName: item["itemName"],
                    itemLocation: item["itemLocation"],
                    itemDateFound: item["itemDateFound"],
                    itemDescription: item["itemDescription"],
                  );
                },
              ),

              // Gradient overlay
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: IgnorePointer(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: 0.55,
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color.fromARGB(255, 255, 255, 255).withValues(alpha: .0),
                              const Color.fromARGB(255, 255, 255, 255),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
