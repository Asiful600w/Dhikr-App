import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../providers/dhikr_provider.dart';
import '../widgets/app_header.dart';
import '../widgets/global_count_badge.dart';
import '../widgets/daily_count_display.dart';
import '../widgets/dhikr_button.dart';
import '../widgets/voice_toggle_button.dart';
import '../widgets/progress_footer.dart';

class DhikrScreen extends ConsumerWidget {
  const DhikrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyCount = ref.watch(dailyCountProvider);
    final currentCount = ref.watch(currentCountProvider);
    final sessionGoal = ref.watch(sessionGoalProvider);
    final isGoalCompleted = currentCount >= sessionGoal;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppHeader(),
              const SizedBox(height: 32),
              const GlobalCountBadge(),
              const SizedBox(height: 16),
              DailyCountDisplay(dailyCount: dailyCount),
              const Spacer(flex: 2),
              const DhikrButton(),
              const Spacer(),
              Center(
                child: Text(
                  isGoalCompleted ? 'SESSION GOAL COMPLETED' : 'TAP TO RECITE',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isGoalCompleted ? AppColors.gold : AppColors.white38,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const VoiceToggleButton(),
              const Spacer(flex: 2),
              const ProgressFooter(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
