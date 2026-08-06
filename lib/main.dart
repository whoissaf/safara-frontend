import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const SafaraApp());
}

class SafaraApp extends StatelessWidget {
  const SafaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: NeoColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: NeoColors.primary, primary: NeoColors.primary, background: NeoColors.background),
        textTheme: GoogleFonts.rubikTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: NeoColors.surface,
          foregroundColor: NeoColors.text,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.w900, color: NeoColors.text),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: NeoColors.surface,
          selectedItemColor: NeoColors.primary,
          unselectedItemColor: NeoColors.text,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: NeoColors.primary,
            foregroundColor: NeoColors.surface,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md), side: NeoBorders.thickSide),
            textStyle: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ),
        cardTheme: CardTheme(
          color: NeoColors.surface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md), side: NeoBorders.thickSide),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
