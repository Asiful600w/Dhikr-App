# Dhikr App

## 📱 Project Overview
Dhikr App is a modern, responsive Flutter application designed to help users track their daily and session-based Dhikr (recitations). It provides an elegant, distraction-free interface with glassmorphism aesthetics, a prominent interactive counting button, and a visual progress footer indicating how close the user is to concluding their current recitation session.

## 🚀 Setup Instructions
To run this project, make sure you have [Flutter](https://docs.flutter.dev/get-started/install) installed on your machine.
1. Clone the repository and navigate to the project root directory:
   ```bash
   cd dhikr_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## 📁 Folder/Project Structure
The codebase follows a modular, feature-first approach to keep files small, readable, and highly reusable. 

```
lib/
├── core/                  # Core abstractions like constants and theme configurations
│   └── app_colors.dart    # Centralized color palette used throughout the app
├── providers/             # State management files containing Riverpod Providers and Notifiers
│   └── dhikr_provider.dart # Contains all logic handling session counting, goals, and daily records
├── screens/               # Main UI Views
│   └── dhikr_screen.dart  # The primary full-screen widget that composes all smaller widget parts together
├── widgets/               # Reusable, standalone UI components
│   ├── app_header.dart          # The top navigation bar and title
│   ├── daily_count_display.dart # The widget responsible for showing "TOTAL RECITATIONS"
│   ├── dhikr_button.dart        # The large central interactive button that the user taps to increment
│   ├── global_count_badge.dart  # The live global count indicator
│   ├── progress_footer.dart     # The bottom section displaying fraction completed and a progress bar
│   └── voice_toggle_button.dart # A standalone UI toggle
└── main.dart              # Application entry point tying SharedPreferences and Riverpod together
```

## 🧠 State Management (Riverpod)
Flutter Riverpod (`flutter_riverpod`) was used due to its testability, compile-time safety, and ease of scaling.
- **`sharedPreferencesProvider`**: Injects a `SharedPreferences` instance globally, abstracting away asynchronous startup logic and allowing instantaneous synchronous synchronous access everywhere else in the UI.
- **`DailyCountNotifier`**: Maintains and caches the total number of recitations performed today. It automatically detects date changes (checking current date against `last_date` kept in preferences) seamlessly on the first tap of a new day, handling transitions to Midnight beautifully and resetting its state to `0` or `1`.
- **`CurrentCountNotifier`**: Manages the local scope of the current session. It continually increments on tap but interacts gracefully with `sessionGoalProvider`.
- **`percentCompleteProvider`**: Computes the ratio of current counts versus the session goal dynamically, preventing state bloat and keeping derived UI logic separated from pure data classes.

## 🤔 Assumptions Made
- The daily recitation counter strictly restarts at standard midnight (`00:00`) according to local device time rather than a custom/prayer-time threshold.
- While the session progress indicator visually stops and caps its text fraction (e.g., `33/33`) upon hitting the user's session goal to indicate completion, the underlying count inside the main circular interaction button continues to operate normally if the user wants to voluntarily overachieve for that session.
- The `SharedPreferences` dependency is fully initialized before the first `runApp` build completes, making the interface completely sync and skipping loading screens.

## ✨ Improvements & Creative Changes
Beyond replicating a functional reference UI, Several additions were seamlessly woven into the app:
1. **Glassmorphism/Glow Aesthetics**: The main `DhikrButton` leverages `BoxShadow` layering to provide an immersive, ethereal glow representing spiritual focus, moving away from flat or generic shadows.
2. **Infinite Resilience**: The counting system does not rely on active app lifecycle (resuming/suspending) hooks to know when the day changes. Instead, it inspects the date dynamically on each tap transaction, meaning the date will reset properly even if the app was left open idly overnight.
3. **Responsive UI**: Through the use of `Column`, `Spacer(flex: 2)`, and `LayoutBuilder` dynamically resolving `constraints.maxWidth` mathematically for the progress bar, the `DhikrScreen` fits proportionally on smaller 4-inch screens up to large tablets without bottom-overflow errors.
4. **Widget Granularity**: Avoiding a massive monolithic `Build` method inside `dhikr_screen`, every atomic part of the UI (such as headers, badges, footers) was isolated into independent `StatelessWidget` and `ConsumerWidget` blocks to severely reduce nested code and make isolating issues significantly easier.
