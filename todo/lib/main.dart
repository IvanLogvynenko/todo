import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/task/provider/task_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          textTheme: GoogleFonts.narnoorTextTheme(),
        ),
        home: Home(),
      ),
    );
  }
}
