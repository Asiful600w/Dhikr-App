import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class VoiceToggleButton extends StatelessWidget {
  const VoiceToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.voiceButtonBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gold.withAlpha(77), width: 1.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.swap_horiz, color: AppColors.gold, size: 18),
            const SizedBox(width: 8),
            Text(
              'CHANGE TO VOICE',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.gold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
