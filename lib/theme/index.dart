import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banipay_comercial/theme/colors.dart' as colors;

import 'colors.dart';

ThemeData globalTheme() {
  TextTheme _globalTextTheme() {
    return GoogleFonts.titilliumWebTextTheme();
  }

  return ThemeData(
      textTheme: _globalTextTheme(),
      primaryColor: colors.royalPurple,
      backgroundColor: Colors.grey[100],
      dividerColor: Colors.transparent,
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: royalPurple), ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
      colorScheme: ColorScheme(

          primary: colors.accentMagenta,
          primaryVariant: colors.royalPurple,
          secondary: accentMagenta,
          secondaryVariant: colors.coolCyan,
          surface: Colors.white,
          background: Colors.grey[100]!,
          error: Colors.redAccent[400]!,
          onPrimary: Colors.white,
          onSecondary: colors.royalPurple,
          onSurface: Colors.white,
          onBackground: Colors.black,
          onError: Colors.black,
          brightness: Brightness.light),
  );
}
