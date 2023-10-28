import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shirt/theme.dart';
import 'package:shirt/ui/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final defaultTextTheme = GoogleFonts.quicksand(color: Colors.black);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              toolbarHeight: 84,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  minimumSize: const MaterialStatePropertyAll(Size(150, 50)),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.white))),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
              bodySmall: defaultTextTheme.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
              bodyMedium: defaultTextTheme.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
              titleLarge: defaultTextTheme.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w700),
              titleSmall: defaultTextTheme.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
              titleMedium: defaultTextTheme.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700)),
          colorScheme: const ColorScheme.light(
              primary: LightThemeColors.primaryColor,
              secondary: LightThemeColors.secondaryColor)),
      home: const HomeScreen(),
    );
  }
}
