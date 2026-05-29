import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/home_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('notesBox');

  await Hive.openBox('foldersBox');

  runApp(const SaiNotesApp());
}

class SaiNotesApp extends StatelessWidget {
  const SaiNotesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(),

      home: const HomePage(),
    );
  }
}