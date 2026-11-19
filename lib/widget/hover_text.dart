import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';


class HoverText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color hoverColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextDecoration? hoverDecoration;
  final bool hoverDecorationEnabled;
  final Function()? onTap;

  const HoverText({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.decoration = TextDecoration.none,
    this.hoverDecoration = TextDecoration.none,
    this.hoverDecorationEnabled = false,
    this.hoverColor = AppTheme.hoverAlt,
    this.textAlign = TextAlign.left,
  });

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onTap?.call();
        },
        child: Text(
          widget.text,
          textAlign: widget.textAlign,
          style: widget.style?.copyWith(
                color: isHovered ? widget.hoverColor : AppTheme.normal,
                decoration: widget.hoverDecorationEnabled ? (isHovered ? widget.hoverDecoration : widget.decoration) : widget.decoration,
                decorationColor: isHovered ? widget.hoverColor : AppTheme.normal,
              ) ??
              TextStyle(
                color: isHovered ? widget.hoverColor : AppTheme.normal,
                decoration: widget.hoverDecorationEnabled ? (isHovered ? widget.hoverDecoration : widget.decoration) : widget.decoration,
                decorationColor: isHovered ? widget.hoverColor : AppTheme.normal,
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