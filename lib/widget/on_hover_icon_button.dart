import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';


class HoverIconButton extends StatefulWidget {
  final Icon icon;
  final double turns;
  final bool hasHoverColor;
  final Function()? onPressed;

  const HoverIconButton(
    {
      Key? key,
      required this.icon,
      required this.onPressed,
      this.turns = 0.0,
      this.hasHoverColor = true,
    }
  ) : super(key: key);
  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIconButton> {
  bool isHovered = false;
  Color get hoverColor  => widget.hasHoverColor ? AppTheme.iconColorDefault : AppTheme.hover;
  

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 200),
        turns: isHovered ? widget.turns : 0,
        child: IconButton(
          icon: widget.icon,
          color: isHovered ? hoverColor : AppTheme.normal,
          hoverColor: widget.hasHoverColor ? AppTheme.hover : Colors.transparent,
          onPressed: widget.onPressed,
          splashColor: Colors.transparent, // Remove splash color
          highlightColor: Colors.transparent, // Remove highlight color
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