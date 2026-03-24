import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize sharedPreferencesProvider in main.dart');
});

final sessionGoalProvider = Provider<int>((ref) => 33);

class DailyCountNotifier extends Notifier<int> {
  @override
  int build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final lastDateStr = prefs.getString('last_date');
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (lastDateStr != todayStr) {
      prefs.setInt('daily_count', 0);
      prefs.setString('last_date', todayStr);
      return 0;
    }

    return prefs.getInt('daily_count') ?? 0;
  }

  void increment() {
    final prefs = ref.read(sharedPreferencesProvider);
    final lastDateStr = prefs.getString('last_date');
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (lastDateStr != todayStr) {
      state = 1;
      prefs.setString('last_date', todayStr);
    } else {
      state++;
    }

    prefs.setInt('daily_count', state);
  }
}

final dailyCountProvider = NotifierProvider<DailyCountNotifier, int>(() {
  return DailyCountNotifier();
});

class CurrentCountNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}

final currentCountProvider = NotifierProvider<CurrentCountNotifier, int>(() {
  return CurrentCountNotifier();
});

final percentCompleteProvider = Provider<double>((ref) {
  final current = ref.watch(currentCountProvider);
  final goal = ref.watch(sessionGoalProvider);
  if (goal == 0) return 0.0;
  return current / goal;
});
