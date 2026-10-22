import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/lost_item.dart';

class LostItems extends StatefulWidget {

  const LostItems({
    super.key,
  });

  @override
  State<LostItems> createState() => _LostItems();
}

class _LostItems extends State<LostItems> {
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
        Text("Your Lost Items",textAlign: TextAlign.left, style: TextStyle(color: AppTheme.textDisabled)),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(4),
                child: LostItem(
                  itemName: item["itemName"],
                  itemLocation: item["itemLocation"],
                  itemDateFound: item["itemDateFound"],
                  itemDescription: item["itemDescription"],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
