import 'package:flutter/material.dart';

Widget buildList(List<String> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(items[index]),
      );
    },
  );
}