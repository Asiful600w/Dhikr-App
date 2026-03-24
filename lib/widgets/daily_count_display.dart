import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../core/app_colors.dart';

class DailyCountDisplay extends StatelessWidget {
  final int dailyCount;

  const DailyCountDisplay({super.key, required this.dailyCount});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final formattedDaily = formatter.format(dailyCount);

    return Column(
      children: [
        Center(
          child: Text(
            formattedDaily,
            style: GoogleFonts.inter(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            'TOTAL RECITATIONS TODAY',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.gold.withAlpha(179),
              letterSpacing: 2.5,
            ),
          ),
        ),
      ],
    );
  }
}
