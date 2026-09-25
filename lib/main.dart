import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/home_screen.dart';

void main() {
  run(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const SunriseCoffeeApp(),
    ),
  );
}

void run(Widget app) {
  runApp(app);
}

class SunriseCoffeeApp extends StatelessWidget {
  const SunriseCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunrise Coffee Co.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFDFBF7),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF4E342E)),
          titleTextStyle: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
