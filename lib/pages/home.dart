import 'package:flutter/material.dart';

import 'package:nalezy/widget/footer.dart';
import 'package:nalezy/widget/lost_items.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: LostItems()
            )
          ]
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
