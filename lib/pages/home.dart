import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/footer.dart';
import 'package:nalezy/widget/items_scroll.dart';

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
      body: DecoratedBox(
          decoration: BoxDecoration(
            color: AppTheme.background,
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: ItemsScroll(title: "Your Lost Items > ")),
                  Expanded(child: ItemsScroll(title: "Your Found Items >")),
                ],
              ),
            )
          ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
