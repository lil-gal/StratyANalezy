import 'package:flutter/material.dart';
import 'package:nalezy/themes/main_theme.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onHover;
  final Matrix4? transformHover;

  const OnHoverButton({
    Key? key,
    hoverColor = AppTheme.hover,
    this.transformHover,
    required this.child,
    this.onHover,
  }) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
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
        child: widget.child,
      ),
    );
  }

  void _onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}