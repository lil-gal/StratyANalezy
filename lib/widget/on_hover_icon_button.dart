import 'package:flutter/material.dart';



class HoverIconButton extends StatefulWidget {
  final double iconSize;

  const HoverIconButton(
    {
      Key? key,
      required this.iconSize,
    }
  ) : super(key: key);
  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIconButton> {
  bool isHovered = false;
  

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 200),
        turns: isHovered ? 0.25 : 0,
        child: IconButton(
          icon: Icon(Icons.refresh, size: widget.iconSize),
          color: isHovered ? Colors.white : Colors.blue,
          hoverColor: Colors.blue,
          onPressed: () {
            // Handle button press
          }
        )
      ),
    );   
  }

  void _onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}