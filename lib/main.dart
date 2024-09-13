import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/profile_page.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: name,
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    darkTheme: Theme.of(context).copyWith(
      platform: TargetPlatform.android,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      canvasColor: backgroundColor,
      textTheme: GoogleFonts.latoTextTheme(),
    ),
    builder: (context, child) => ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
          child: child!
    ),
    home: const ProfilePage(),
  );
}
