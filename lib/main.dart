import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/name_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Palet warna utama
    const Color olive = Color(0xFF8EA664); // 🌿 hijau olive
    const Color lightGreen = Color(0xFFC6D4AC); // 🍃 hijau muda
    const Color darkOlive = Color(0xFF5E6548); // 🌾 hijau gelap
    const Color softWhite = Color(0xFFF3F1ED); // ☁️ putih keabu
    const Color beige = Color(0xFFB5A793); // 🪵 krem coklat

    final ThemeData theme = ThemeData(
      primaryColor: olive,
      scaffoldBackgroundColor: lightGreen,
      colorScheme: ColorScheme.light(
        primary: olive,
        secondary: beige,
        surface: softWhite,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkOlive,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: olive,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: darkOlive,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: darkOlive),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: olive,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Kuis',
      theme: theme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        NameScreen.routeName: (_) => const NameScreen(),
        QuizScreen.routeName: (_) => const QuizScreen(),
        ResultScreen.routeName: (_) => const ResultScreen(),
      },
    );
  }
}
