import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../providers/dhikr_provider.dart';

class ProgressFooter extends ConsumerWidget {
  const ProgressFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCount = ref.watch(currentCountProvider);
    final sessionGoal = ref.watch(sessionGoalProvider);
    final percentComplete = ref.watch(percentCompleteProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SESSION GOAL',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white38,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${currentCount.clamp(0, sessionGoal)}',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' / $sessionGoal',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${(percentComplete.clamp(0.0, 1.0) * 100).toInt()}% COMPLETE',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.gold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 4,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: AppColors.white12,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Container(
                    height: 4,
                    width:
                        constraints.maxWidth * percentComplete.clamp(0.0, 1.0),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
