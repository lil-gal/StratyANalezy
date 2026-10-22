import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onHover;

  const OnHoverButton({
    Key? key,
    hoverColor = Colors.blue,
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

    final hoveredTransform = Matrix4.identity()..scale(1.1)..translate(-2.5, -2.5);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => _onEntered(true),
      onExit: (_) => _onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
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