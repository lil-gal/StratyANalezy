import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';


class CustomTextFormField extends StatefulWidget{
  final TextStyle? style;
  final double errorSize;
  final AutovalidateMode autovalidateMode;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final bool obscureText;
  final bool changeVisibility;

  final double height;
  final double fontSize;
  final BorderRadius? borderRadius;

  final FormFieldValidator<String>? validator;
  final ValueNotifier<String?>? externalErrorNotifier; 

  const CustomTextFormField({
    super.key,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.decoration = const InputDecoration(border: OutlineInputBorder(), errorStyle: TextStyle(fontSize: 0)),
    this.errorSize = 12,
    this.fontSize = 12,
    this.style = const TextStyle(fontSize: 12),
    this.controller,
    this.height = 50,
    this.borderRadius,
    this.obscureText = false,
    this.changeVisibility = false,
    this.validator,
    this.externalErrorNotifier,
  });

  @override
  _CustomTextFormFieldState createState()=> _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField>{
  bool _isHovered = false;
  bool _isVisible = false;

  late final ValueNotifier<String?> _errorTextNotifier;

  @override
  void initState() {
    super.initState();
    _errorTextNotifier = widget.externalErrorNotifier ?? ValueNotifier<String?>(null);
  }

  String? _defaultValidationLogic(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  @override
  void dispose() {
    if (widget.externalErrorNotifier == null) {
      _errorTextNotifier.dispose();
    }
    super.dispose();
  }

  void changeVisibility(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
    Widget build(BuildContext context){
      return Column(
        children: [
          SizedBox(
            height: widget.height,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: TextFormField(
                autovalidateMode: widget.autovalidateMode,
                validator: (value) {
                  final result = widget.validator != null
                      ? widget.validator!(value)
                      : _defaultValidationLogic(value);

                  if (result != _errorTextNotifier.value) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => _errorTextNotifier.value = result,
                    );
                  }
                  return result;
                },
                obscureText: widget.changeVisibility? !_isVisible : widget.obscureText,
                cursorColor: AppTheme.active,
                cursorErrorColor: AppTheme.error,
                controller: widget.controller,
                decoration: widget.decoration?.copyWith(
                  suffixIcon: widget.changeVisibility? IconButton(
                    onPressed: (){
                      changeVisibility();
                    }, 
                    icon: _isVisible ? Icon(Icons.visibility_off, size: widget.fontSize + 2) : Icon(Icons.visibility, size: widget.fontSize + 2),
                  ) : null,
                  labelStyle: TextStyle(fontSize: widget.fontSize),
                  hintStyle: TextStyle(fontSize: widget.fontSize),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: _isHovered ? BorderSide(color: AppTheme.hover, width: 2) : BorderSide(color:AppTheme.normal, width: 1.5)
                  ),
                ),
                style: widget.style?.copyWith(
                  fontSize: widget.fontSize,
                ),
              ),
            )
          ),
          ValueListenableBuilder(
          valueListenable: _errorTextNotifier,
          builder: (context, errorText, child) {
            return errorText != null
                ? Row(
                    children: [
                      Icon(
                        Icons.info,
                        size: widget.errorSize,
                        color: AppTheme.error,
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Text(
                        errorText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: AppTheme.error,
                          fontSize: widget.errorSize,
                        ),
                      ),)
                      
                    ],
                  )
                : SizedBox(height: widget.errorSize + 2);
            },
          ),
        ],
      );
    }
}