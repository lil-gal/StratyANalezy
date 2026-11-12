import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSquare extends StatefulWidget {
  const ImagePickerSquare({super.key, this.onChanged});

  final ValueChanged<XFile?>? onChanged;

  @override
  State<ImagePickerSquare> createState() => _ImagePickerSquareState();
}

class _ImagePickerSquareState extends State<ImagePickerSquare> {
  final _picker = ImagePicker();
  XFile? _file;
  Uint8List? _bytes; // for previewing (works on web + mobile)

  Future<void> _pick() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,     // optional: shrink big photos
      imageQuality: 85,   // optional: compress
    );
    if (picked == null) return; // user cancelled

    final bytes = await picked.readAsBytes();
    setState(() {
      _file = picked;
      _bytes = bytes;
    });
    widget.onChanged?.call(picked);
  }

  void _remove() {
    setState(() {
      _file = null;
      _bytes = null;
    });
    widget.onChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1, // makes it a square
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _pick,
        child: Ink(
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: scheme.outline),
          ),
          child: _bytes == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4,0,0,0),
                      child: Icon(Icons.add_photo_alternate_outlined,
                        size: 44, color: scheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 2),
                    Text('Pridať fotku',
                        style: TextStyle(color: scheme.onSurfaceVariant)),
                  ],
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(_bytes!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton.filled(
                        icon: const Icon(Icons.close),
                        onPressed: _remove,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}