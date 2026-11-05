import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/item.dart';

class ItemsScroll extends StatefulWidget {
  final String title;

  const ItemsScroll({
    required this.title,
    super.key,
  });

  @override
  State<ItemsScroll> createState() => _ItemsScrollState();
}

class _ItemsScrollState extends State<ItemsScroll> {
  List<Map<String, dynamic>> items = [
    {
      "itemName": "Item1",
      "itemLocation": "Bratislava",
      "itemDateFound": "Yesterday",
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    },
    {
      "itemName": "Item2",
      "itemLocation": "Trencin",
      "itemDateFound": "Today",
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    },
    {
      "itemName": "Item3",
      "itemLocation": "Halova 16, Bratislava",
      "itemDateFound": "8. 6. 2026",
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    },
    {
      "itemName": "Item4",
      "itemLocation": "Idk",
      "itemDateFound": "1. 1. 2026",
      "itemDescription": "This is a very beautiful item, it is blue, black and kinda white-ish, it has a picture of someone inside",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(widget.title, 
              textAlign: TextAlign.left, 
              style: TextStyle(
                color: AppTheme.textDisabled, 
                fontWeight: FontWeight.bold, 
                fontSize: 18
                )
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
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
        ),
      ],
    );
  }
}
