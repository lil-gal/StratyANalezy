import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';


class HoverElevatedButton extends StatefulWidget {
  final Widget child;
  final bool hasHoverColor;
  final Matrix4? transformHover;
  final Function()? onPressed;

  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? padding;

  const HoverElevatedButton(
    {
      Key? key,
      required this.child,
      required this.onPressed,
      this.transformHover,
      this.hasHoverColor = true,
      this.shape,
      this.padding,
    }
  ) : super(key: key);
  @override
  _HoverElevatedButtonState createState() => _HoverElevatedButtonState();
}

class _HoverElevatedButtonState extends State<HoverElevatedButton> {
  bool isHovered = false;  

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = widget.transformHover;
    final transform = isHovered ? hoveredTransform : Matrix4.identity();



    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        color: Colors.transparent, // Set the background color to transparent
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isHovered ? AppTheme.hover : AppTheme.normal,
            padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),  
            shape: widget.shape ?? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: widget.child,
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