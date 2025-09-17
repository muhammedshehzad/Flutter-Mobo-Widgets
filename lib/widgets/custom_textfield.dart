import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final bool isDark;
  final bool showBorder;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    required this.validator,
    this.isDark = false,
    this.showBorder = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontFamily: GoogleFonts.manrope(fontWeight: FontWeight.w400).fontFamily,
            color: isDark ? Colors.white70 : Color(0xff7F7F7F),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: TextStyle(
            fontFamily: GoogleFonts.manrope(fontWeight: FontWeight.w600).fontFamily,
            color: isDark ? Colors.white70 : Color(0xff000000),
          ),
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            prefixText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: showBorder ? _getBorderColor(context) : Colors.transparent,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: showBorder ? AppTheme.primaryColor : Colors.transparent,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.primaryColor,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: isDark ? const Color(0xFF2A2A2A) : Color(0xffF8FAFB),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Color _getBorderColor(BuildContext context) {
    return isDark ? Colors.grey[700]! : Colors.grey[400]!;
  }
}