import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../presentation/styles_manager.dart';
import '../utils/color.dart';

class BirthdateFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const BirthdateFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<BirthdateFormField> createState() => _BirthdateFormFieldState();
}

class _BirthdateFormFieldState extends State<BirthdateFormField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return TextFormField(
      style: getRegularTextStyle(height*.02,color: grey),
      controller: widget.controller,
      readOnly: true, // Disable text editing
      decoration: InputDecoration(
        fillColor: txtFieldBack,
        filled: true,
        hintText: widget.hintText,
        hintStyle: getRegularTextStyle(height*.02,color: grey),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * .04),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * .04),
          borderSide: BorderSide(color: greyShade1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * .04),
          borderSide: BorderSide(
            color: red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * .04),
          // borderSide: BorderSide(
          //   color: greyShade1,
          // ),
        ),
      ),
    );
  }
}
