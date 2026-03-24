import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../providers/dhikr_provider.dart';

class DhikrButton extends ConsumerWidget {
  const DhikrButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCount = ref.watch(currentCountProvider);

    return Center(
      child: GestureDetector(
        onTap: () {
          ref.read(currentCountProvider.notifier).increment();
          ref.read(dailyCountProvider.notifier).increment();
        },
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.buttonBackground,
            border: Border.all(color: AppColors.gold.withAlpha(77), width: 1.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withAlpha(13),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'سُبْحَانَ اللَّهِ',
                style: GoogleFonts.amiri(
                  fontSize: 48,
                  color: AppColors.gold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'SUBHANALLAH',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'GLORY BE TO ALLAH',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white38,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '$currentCount',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
