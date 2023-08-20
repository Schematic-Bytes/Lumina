import 'package:flutter/material.dart';
import 'package:lumina/requests/client.dart';
import 'package:lumina/routes/home.dart';
import 'package:provider/provider.dart';

class LuminaApp extends StatelessWidget {
  const LuminaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Client(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
