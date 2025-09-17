import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

class CustomDateSelector extends StatelessWidget {
  final VoidCallback onTap;
  final DateTime paymentDate;
  final bool isDark;
  final bool showBorder;

  const CustomDateSelector({
    required this.onTap,
    required this.paymentDate,
    this.isDark = false,
    this.showBorder = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Date',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope(fontWeight: FontWeight.w400).fontFamily,
              color: isDark ? Colors.white70 : Color(0xff7F7F7F),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2A2A2A) : Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: showBorder
                  ? Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                    )
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  HugeIcons.strokeRoundedCalendar01 as IconData?,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Payment Date: ${DateFormat('MMM dd, yyyy').format(paymentDate)}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.manrope(fontWeight: FontWeight.w600).fontFamily,
                      color: isDark ? Colors.white70 : Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
