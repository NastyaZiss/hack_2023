import 'package:axenix_mov/screen/analitical_screen.dart';
import 'package:axenix_mov/screen/home_screen.dart';
import 'package:axenix_mov/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axenix Mov',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          color: Colors.white,

          elevation: 2,
          titleTextStyle: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
        textTheme: TextTheme(
          button: GoogleFonts.inter(),
          headline5: GoogleFonts.inter(
              textStyle: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // '/': (context) => SplashFuturePage(),
        '/home': (context) => HomeScreen(),
        '/a': (context) => Analitical(),
      },
    );
  }
}
