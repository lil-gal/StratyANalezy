import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // add intl to pubspec.yaml

class DateTimeFormField extends StatefulWidget {
  const DateTimeFormField({
    super.key,
    this.label = 'Date & time',
    this.initialValue,
    this.onChanged,
    this.validator,
  });

  final String label;
  final DateTime? initialValue;
  final ValueChanged<DateTime>? onChanged;
  final String? Function(DateTime?)? validator;

  @override
  State<DateTimeFormField> createState() => _DateTimeFormFieldState();
}

class _DateTimeFormFieldState extends State<DateTimeFormField> {
  final _controller = TextEditingController();
  final _format = DateFormat('dd MMM yyyy, HH:mm');
  DateTime? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
    if (_selected != null) _controller.text = _format.format(_selected!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final now = DateTime.now();
    final initial = _selected ?? now;

    // 1) Pick the date (shows as a floating dialog)
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: "Zadajte dátum",
      confirmText: "Potvrdiť",
      cancelText: "Zrušiť"
    );
    if (date == null || !mounted) return;

    // 2) Pick the time (also a floating dialog)
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      helpText: "Zadajte čas",
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!
      ),
      confirmText: "Potvrdiť",
      cancelText: "Zrušiť"
    );
    if (time == null) return;

    final result = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      _selected = result;
      _controller.text = _format.format(result);
    });
    widget.onChanged?.call(result);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _pickDateTime,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: _pickDateTime,
        ),
      ),
      validator: (_) => widget.validator != null
          ? widget.validator!(_selected)
          : (_selected == null ? 'Zadajte dátum a čas' : null),
    );
  }
}